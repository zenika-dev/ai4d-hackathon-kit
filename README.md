# AI4D · Hackathon Champions · kit de démarrage

> Le kit des quatre squads du hackathon de 4 h (dry run du **lundi 26 octobre 2026, 13 h 30 à 17 h 30**).
> Use case fictif : le late check-out à la carte chez **Vélora Hôtels** (société inventée, données 100 % synthétiques).
> Il initie les participants à **Spec Kit** (Spec-Driven Development) et au **Context Nexus** (contexte partagé entre équipes).

Le contexte partagé que les squads lisent et alimentent est dans un dépôt séparé :
**[Zenika-dev/ai4d-hackathon-context-nexus](https://github.com/Zenika-dev/ai4d-hackathon-context-nexus)**.

## Par où commencer

> **Pressé ?** La [fiche de démarrage](commun/fiche-demarrage.md) tient en une page.
> **Le jour J** : la [page de démarrage](jour-j/demarrage.html) guide chaque participant en six étapes (squad, Codespace, connexion à Claude, `/bienvenue`).

1. **[`commun/00-par-ou-commencer.md`](commun/00-par-ou-commencer.md)** : le pas à pas, d'avant le 23/10 jusqu'à la première heure de la session.
2. La fiche de votre squad : `squads/<votre-squad>/KIT.md`.
3. **[`commun/01-bases-en-5-minutes.md`](commun/01-bases-en-5-minutes.md)** : gates, Spec Kit en 7 commandes, Context Nexus en 4 registres, chapeaux.
4. Pendant la session : **[`commun/02-spec-kit-x-context-nexus.md`](commun/02-spec-kit-x-context-nexus.md)**, le mode opératoire phase par phase.

## Installer les prérequis

**Deux postes prêts par squad suffisent.** Deux options, détaillées dans la [fiche de démarrage](commun/fiche-demarrage.md#2-choisissez-votre-voie).

### Option A · GitHub Codespaces (recommandée, rien à installer)

Pour les profils non techniques : un navigateur et un compte GitHub suffisent. Connectez-vous à GitHub, puis cliquez sur le lien de votre squad.
Le Codespace s'ouvre dans le navigateur avec tout installé : VS Code, Claude Code, Spec Kit, le dépôt de la squad et le dossier `context-nexus` à la racine du projet.

| Squad | Ouvrir le Codespace |
|---|---|
| **1 · Offre** | [starter-squad-1-offre](https://codespaces.new/zenika-dev/starter-squad-1-offre) |
| **2 · Prix** | [starter-squad-2-prix](https://codespaces.new/zenika-dev/starter-squad-2-prix) |
| **3 · Paiement** | [starter-squad-3-paiement](https://codespaces.new/zenika-dev/starter-squad-3-paiement) |
| **4 · Expérience** | [starter-squad-4-experience](https://codespaces.new/zenika-dev/starter-squad-4-experience) |

Comptez environ 2 minutes, jusqu'au message « Welcome to Codespaces! » dans le terminal, puis connectez Claude avec `claude auth login`.
Le pas à pas (fenêtres de permissions et de confiance du dossier) est dans la [fiche de démarrage, voie A](commun/fiche-demarrage.md#voie-a).

### Option B · installation sur votre poste

Sur votre poste, en une ligne, sans droits administrateur. Avec le nom de votre squad, le script installe Git, Node.js 22,
Claude Code, uv et Spec Kit, clone le contexte partagé et le dépôt de la squad dans `hackathon/`, assemble le contexte, puis affiche un bilan :

```powershell
# Windows, dans PowerShell
$env:SQUAD = "squad-2-prix"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

```bash
# macOS, dans Terminal
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-2-prix
```

Remplacez `squad-2-prix` par votre squad. Sans nom de squad, seuls les outils sont installés.

Détails : [`commun/03-prerequis-poste.md`](commun/03-prerequis-poste.md). Le modèle de `.devcontainer/` des starters Codespaces est dans [`installation/devcontainer/`](installation/devcontainer/).

## Contenu

```
commun/
  fiche-demarrage.md                ← liens et commandes de votre squad : voie A (Codespace) ou voie B (votre poste)
  00-par-ou-commencer.md            ← le pas à pas : avant, à l'arrivée (12 h 30), la première heure
  01-bases-en-5-minutes.md          ← l'essentiel à lire avant la session
  02-spec-kit-x-context-nexus.md    ← quelle commande lancer, quel fichier lire, quel fichier publier
  03-prerequis-poste.md             ← 2 postes par squad, Codespace ou installation en une ligne
jour-j/
  demarrage.html                    ← page de démarrage du jour J : squad → Codespace → Claude → /bienvenue
animation/
  ecran-commun.md                   ← animer : écran commun, verdicts de gate, événement scripté
  fiche-direction-revenu-annexe.md  ← réponses de référence de la « Direction Revenu Annexe »
  tester-avant-lundi.md             ← tester seul, puis à deux machines avec deux comptes
installation/
  installer-prerequis.ps1           ← Windows, sans droits admin
  installer-prerequis.sh            ← macOS, sans droits admin
  devcontainer/                     ← .devcontainer/ des starters pour GitHub Codespaces
squads/
  squad-1-offre/       KIT.md  CLAUDE.md
  squad-2-prix/        KIT.md  CLAUDE.md
  squad-3-paiement/    KIT.md  CLAUDE.md
  squad-4-experience/  KIT.md  CLAUDE.md   ← CLAUDE.md : à poser à la racine du starter de la squad
```

## Les quatre squads

| Squad | Volet | Publie | Consomme | G1 · G2 · G3 · G4 |
|---|---|---|---|---|
| [1 · Offre](squads/squad-1-offre/KIT.md) | API d'éligibilité et de prix | `offre-api` | `regle-prix`, `hotels-pilotes` | 14h25 · 15h10 · 16h10 · 16h35 |
| [2 · Prix](squads/squad-2-prix/KIT.md) | Plancher et plafond, KPI | `regle-prix`, `kpi` | `evenements-achat`, `offre-api` | 14h30 · 15h15 · 16h15 · 16h40 |
| [3 · Paiement](squads/squad-3-paiement/KIT.md) | Encaissement du supplément | `paiement-api`, `contraintes-pci` | `offre-api`, `regle-prix`, `security` | 14h35 · 15h20 · 16h20 · 16h45 |
| [4 · Expérience](squads/squad-4-experience/KIT.md) | Tuile et carte dans l'app | `ecrans`, `evenements-achat` | `offre-api`, `paiement-api`, `composants-ui` | 14h40 · 15h25 · 16h25 · 16h50 |

---

Réalisé par Zenika. Vélora Hôtels et toutes les données de ce kit sont fictives.
