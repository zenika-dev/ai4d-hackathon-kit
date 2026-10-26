#!/usr/bin/env bash
# Installe les prérequis du Hackathon Champions (macOS) : Git, Node.js 22, Claude Code, uv, Spec Kit.
# Sans droits administrateur (sauf la fenêtre des outils Xcode pour Git), sans Homebrew. Relançable sans risque.
#
#   curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash
#
# Avec le nom de la squad, le script clone aussi les dépôts dans ~/hackathon et assemble le contexte :
#   curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-2-prix
#
# Arguments : <squad> (squad-1-offre, squad-2-prix, squad-3-paiement, squad-4-experience)
#             --verifier (n'installe rien, affiche seulement le bilan)
# Variable : SPEC_KIT_REF=<tag> pour installer une version précise de Spec Kit (défaut : v1.2.3)

set -uo pipefail

SPEC_KIT_REF="${SPEC_KIT_REF:-v1.2.3}"
NODE_MAJOR=22
SPEC_KIT_PYTHON=3.13   # version récente sans paquets précompilés pour toutes les dépendances = compilation
NODE_DIR="$HOME/.local/share/nodejs"
BIN_DIR="$HOME/.local/bin"
CHECK_ONLY=0
SQUAD=""
SQUADS="squad-1-offre squad-2-prix squad-3-paiement squad-4-experience"
WORK_DIR="$HOME/hackathon"
GITHUB_BASE="${GITHUB_BASE:-https://github.com/zenika-dev}"   # surchargeable pour les tests
NEXUS_URL="$GITHUB_BASE/ai4d-hackathon-context-nexus.git"
for arg in "$@"; do
  case "$arg" in
    --verifier) CHECK_ONLY=1 ;;
    *) SQUAD="$arg" ;;
  esac
done

vert()  { printf '\033[32m%s\033[0m\n' "$*"; }
rouge() { printf '\033[31m%s\033[0m\n' "$*"; }
etape() { printf '\n\033[1m▸ %s\033[0m\n' "$*"; }

export PATH="$BIN_DIR:$NODE_DIR/bin:$PATH"

# Ajoute une ligne au fichier de démarrage du shell, une seule fois.
ajouter_au_profil() {
  local ligne="$1"
  for rc in "$HOME/.zshrc" "$HOME/.bash_profile"; do
    [ -f "$rc" ] || [ "$rc" = "$HOME/.zshrc" ] || continue
    grep -qxF "$ligne" "$rc" 2>/dev/null || printf '\n# Hackathon Champions\n%s\n' "$ligne" >> "$rc"
  done
}

node_ok() {
  command -v node >/dev/null 2>&1 || return 1
  local major; major="$(node -p 'process.versions.node.split(".")[0]' 2>/dev/null)" || return 1
  [ "${major:-0}" -ge 20 ]
}

installer_git() {
  etape "Git"
  if xcode-select -p >/dev/null 2>&1 && git --version >/dev/null 2>&1; then
    vert "déjà installé : $(git --version)"; return
  fi
  echo "Une fenêtre macOS va proposer d'installer les « outils de ligne de commande »."
  echo "Cliquez sur « Installer », attendez la fin (5 à 10 min), puis relancez ce script."
  xcode-select --install 2>/dev/null || true
  rouge "Git n'est pas encore installé : relancez le script quand la fenêtre a terminé."
  exit 1
}

installer_node() {
  etape "Node.js $NODE_MAJOR"
  if node_ok; then vert "déjà installé : node $(node --version)"; return; fi
  local arch base fichier tmp
  case "$(uname -m)" in arm64) arch=arm64 ;; *) arch=x64 ;; esac
  base="https://nodejs.org/dist/latest-v${NODE_MAJOR}.x"
  tmp="$(mktemp -d)"
  curl -fsSL "$base/SHASUMS256.txt" -o "$tmp/SHASUMS256.txt" || { rouge "téléchargement impossible ($base)"; return 1; }
  fichier="$(awk -v a="darwin-$arch.tar.gz" '$2 ~ a"$" {print $2; exit}' "$tmp/SHASUMS256.txt")"
  [ -n "$fichier" ] || { rouge "archive Node introuvable pour darwin-$arch"; return 1; }
  echo "téléchargement de $fichier…"
  curl -fsSL "$base/$fichier" -o "$tmp/$fichier" || { rouge "téléchargement impossible"; return 1; }
  (cd "$tmp" && grep " $fichier\$" SHASUMS256.txt | shasum -a 256 -c - >/dev/null) || { rouge "empreinte invalide, installation annulée"; return 1; }
  rm -rf "$NODE_DIR" && mkdir -p "$NODE_DIR"
  tar -xzf "$tmp/$fichier" -C "$NODE_DIR" --strip-components 1
  rm -rf "$tmp"
  ajouter_au_profil 'export PATH="$HOME/.local/share/nodejs/bin:$PATH"'
  vert "installé : node $("$NODE_DIR/bin/node" --version)"
}

installer_claude() {
  etape "Claude Code"
  if command -v claude >/dev/null 2>&1; then vert "déjà installé : $(claude --version 2>/dev/null | head -1)"; return; fi
  curl -fsSL https://claude.ai/install.sh | bash
}

installer_uv() {
  etape "uv"
  if command -v uv >/dev/null 2>&1; then vert "déjà installé : $(uv --version)"; return; fi
  curl -LsSf https://astral.sh/uv/install.sh | env UV_NO_MODIFY_PATH=1 sh
}

installer_speckit() {
  etape "Spec Kit (specify, version $SPEC_KIT_REF)"
  command -v uv >/dev/null 2>&1 || { rouge "uv manquant, Spec Kit ne peut pas être installé"; return 1; }
  uv tool install --force --quiet --python "$SPEC_KIT_PYTHON" specify-cli --from "git+https://github.com/github/spec-kit.git@$SPEC_KIT_REF" \
    && vert "installé"
}

# Clone le dépôt s'il manque, sinon le met à jour. Renvoie 1 si le dépôt n'est pas accessible.
cloner_ou_mettre_a_jour() {
  local url="$1" dir="$2"
  if [ -d "$dir/.git" ]; then
    git -C "$dir" pull --quiet --ff-only && vert "à jour : $dir" || rouge "mise à jour impossible : $dir (modifications locales ?)"
  elif git clone --quiet "$url" "$dir" 2>/dev/null; then
    vert "cloné : $dir"
  else
    return 1
  fi
}

preparer_squad() {
  etape "Dépôts de $SQUAD dans $WORK_DIR"
  local nexus="$WORK_DIR/context-nexus" starter="$WORK_DIR/starter-$SQUAD"
  mkdir -p "$WORK_DIR"
  cloner_ou_mettre_a_jour "$NEXUS_URL" "$nexus" || { rouge "impossible de cloner le contexte partagé ($NEXUS_URL)"; return 1; }
  if ! cloner_ou_mettre_a_jour "$GITHUB_BASE/starter-$SQUAD.git" "$starter"; then
    rouge "le dépôt starter-$SQUAD n'est pas encore disponible : relancez la même commande le jour J"
    starter=""
  fi
  etape "Contexte de $SQUAD"
  if [ -n "$starter" ]; then
    node "$nexus/tools/context-assemble.mjs" --squad "$SQUAD" --out "$starter/.context/brief.md" | tail -2
    if [ -f "$starter/package.json" ]; then
      (cd "$starter" && npm install --silent >/dev/null 2>&1) && vert "dépendances npm installées" || rouge "npm install a échoué dans $starter"
    fi
  else
    node "$nexus/tools/context-assemble.mjs" --squad "$SQUAD" | tail -2
  fi
}

bilan() {
  etape "Bilan"
  local ko=0 ligne
  for outil in git node claude uv specify; do
    if command -v "$outil" >/dev/null 2>&1; then
      case "$outil" in
        specify) ligne="ok" ;;
        claude)  ligne="$(claude --version 2>/dev/null | head -1)" ;;
        *)       ligne="$("$outil" --version 2>/dev/null | head -1)" ;;
      esac
      [ "$outil" = node ] && ! node_ok && { rouge "✗ node   version trop ancienne ($ligne), 20+ requis"; ko=1; continue; }
      vert "✓ $(printf '%-8s' "$outil") $ligne"
    else
      rouge "✗ $(printf '%-8s' "$outil") absent"; ko=1
    fi
  done
  if [ -n "$SQUAD" ]; then
    [ -d "$WORK_DIR/context-nexus/.git" ] && vert "✓ contexte  $WORK_DIR/context-nexus" || { rouge "✗ contexte  non cloné"; ko=1; }
    [ -d "$WORK_DIR/starter-$SQUAD/.git" ] && vert "✓ starter   $WORK_DIR/starter-$SQUAD" || rouge "✗ starter   pas encore disponible (à relancer le jour J)"
  fi
  echo
  if [ "$ko" -eq 0 ]; then
    vert "Tout est prêt. Ouvrez un NOUVEAU terminal, puis suivez la fiche de démarrage."
    if [ -d "$WORK_DIR/starter-$SQUAD/.git" ]; then
      echo "  cd ~/hackathon/starter-$SQUAD && claude auth login && claude"
    fi
  else
    rouge "Il manque quelque chose. Copiez ce bilan et envoyez-le au support du hackathon."
  fi
  return "$ko"
}

if [ "$(uname -s)" != "Darwin" ]; then
  rouge "Ce script est prévu pour macOS. Sous Windows, utilisez installer-prerequis.ps1."
  exit 1
fi

if [ -n "$SQUAD" ] && [[ " $SQUADS " != *" $SQUAD "* ]]; then
  rouge "Squad inconnue : « $SQUAD ». Choisissez parmi : $SQUADS"
  exit 1
fi

if [ "$CHECK_ONLY" -eq 0 ]; then
  mkdir -p "$BIN_DIR"
  ajouter_au_profil 'export PATH="$HOME/.local/bin:$PATH"'
  installer_git
  installer_node
  installer_claude
  installer_uv
  installer_speckit
  if [ -n "$SQUAD" ]; then
    if command -v git >/dev/null && node_ok; then preparer_squad; else rouge "Git ou Node manquant : dépôts non clonés"; fi
  fi
fi
bilan
