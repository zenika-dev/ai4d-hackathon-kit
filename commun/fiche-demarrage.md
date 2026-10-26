# Fiche de démarrage · Hackathon Champions

**Lundi 26 octobre · 13 h 30 – 17 h 30 · installation dès 12 h 30**

## 1. Trouvez votre squad

Toutes les commandes et tous les liens de cette fiche sont **déjà remplis pour chaque squad** : copiez ceux de votre section, sans rien modifier.

| Squad | Volet | Membres | Votre section |
|---|---|---|---|
| **1 · Offre** | API d'éligibilité et de prix | PO, TL, SA iOS, Data analyst | [→ Squad 1 · Offre](#squad-1) |
| **2 · Prix** | Plancher, plafond et KPI | PO, TL BFF, SA AEM, Sr Data Eng. | [→ Squad 2 · Prix](#squad-2) |
| **3 · Paiement** | Encaissement du supplément | PO, TL, SA Android, Scrum Master | [→ Squad 3 · Paiement](#squad-3) |
| **4 · Expérience** | Tuile et carte dans l'app | Designer, SA BFF, SA Web JS, Dev Android | [→ Squad 4 · Expérience](#squad-4) |

## 2. Choisissez votre voie

**Deux postes prêts par squad suffisent.** Cliquez sur le nom de la voie pour aller directement à son pas à pas.

|           | [Voie A · Codespace](#voie-a) ⭐ **recommandée**                     | [Voie B · votre poste](#voie-b)                         |
| --------- | ------------------------------------------------------------------- | ------------------------------------------------------- |
| Pour qui  | **Vous n'êtes pas développeur** (PO, designer, Scrum Master, data…) | Vous êtes à l'aise avec un terminal                     |
| Il faut   | Un navigateur et un compte GitHub (le compte Claude est fourni sur place) | Coller une ligne avant le 23/10 (le compte Claude est fourni sur place) |
| Le jour J | Un lien, quelques clics, prêt en 10 minutes environ                 | La même ligne relancée, puis `claude`                   |

**Pour tout le monde, avant le 23/10 :**
- Créez un compte sur [github.com/signup](https://github.com/signup) si vous n'en avez pas, et envoyez votre **identifiant GitHub** au support.
- Le **compte Claude** est fourni lundi, sur place, par l'équipe Programme AI4D : rien à créer ni à vérifier d'ici là.

<a id="voie-a"></a>

### 2A. Voie A · Codespace, pas à pas (recommandée)

Un Codespace est un ordinateur prêt à l'emploi qui s'ouvre **dans votre navigateur**. Tout y est installé :
l'éditeur (VS Code), l'agent Claude Code, Spec Kit, le dépôt de votre squad et le contexte partagé.

> **Prérequis** : le Codespace ne s'ouvre que si vous êtes **connecté à votre compte GitHub** dans ce navigateur.
> Connectez-vous d'abord sur [github.com](https://github.com), puis revenez ici.

**Votre lien Codespace** (un par squad) :

| Votre squad | Cliquez ici pour ouvrir votre Codespace |
|---|---|
| **1 · Offre** | [Ouvrir le Codespace de la squad 1](https://codespaces.new/zenika-dev/starter-squad-1-offre) |
| **2 · Prix** | [Ouvrir le Codespace de la squad 2](https://codespaces.new/zenika-dev/starter-squad-2-prix) |
| **3 · Paiement** | [Ouvrir le Codespace de la squad 3](https://codespaces.new/zenika-dev/starter-squad-3-paiement) |
| **4 · Expérience** | [Ouvrir le Codespace de la squad 4](https://codespaces.new/zenika-dev/starter-squad-4-experience) |

Vous ne savez pas dans quelle squad vous êtes ? Regardez le tableau de la section 1, ou demandez au support.

1. **Cliquez sur le lien de votre squad**, dans le tableau ci-dessus.
2. La page « Create codespace » s'affiche, avec un cadre de trois réglages : **Branch** (`main`), **Region** et **Machine type**. **Ne changez rien.**
   Aucune clé n'est demandée : vous vous connecterez avec le compte Claude fourni sur place à l'étape 8.
   Cliquez sur le bouton vert **Create codespace**, en bas à droite du cadre.
3. Une page **« This codespace is requesting additional permissions »** s'affiche : GitHub demande l'accès au contexte partagé (`zenika-dev/ai4d-hackathon-context-nexus`), pour que vous puissiez y publier votre travail.
   Cliquez sur le bouton vert **Authorize and continue**. (Évitez « Continue without authorizing » : vous ne pourriez pas publier dans le contexte partagé.)
4. **Patientez 2 à 4 minutes** : un éditeur s'ouvre dans l'onglet.
5. Une fenêtre **« Faites-vous confiance aux auteurs des fichiers de ce dossier ? »** s'affiche au milieu de l'écran (« Do you trust the authors… » si votre navigateur est en anglais).
   Cliquez sur le bouton vert **Approuver le dossier et continuer** : c'est votre dépôt de squad, vous pouvez lui faire confiance. Sans cela, le terminal ne se lance pas.
6. **Patientez environ 2 minutes** : en bas, le terminal affiche l'installation des outils. C'est l'étape la plus longue, c'est normal.
   Ne fermez pas l'onglet et ne tapez rien tant que le terminal n'a pas écrit **« Welcome to Codespaces! »** : c'est ce message qui indique que tout est installé.
7. **Vérifiez vos fichiers** : dans l'explorateur, à gauche, vous voyez le dépôt de votre squad (`src`, `test`, `CLAUDE.md`…) et, **à la racine, le dossier `context-nexus`** (le contexte partagé).
   Vous pouvez y lire et y copier-coller des fichiers. S'il n'apparaît pas, prévenez le support.
8. **Connectez Claude à votre compte** (une seule fois) : dans le terminal en bas, tapez `claude auth login` puis Entrée.
   - Un lien s'affiche : ouvrez-le (Ctrl + clic, ou Cmd + clic sur Mac), connectez-vous avec les identifiants du compte Claude fourni sur place, cliquez sur **Autoriser**.
   - Si la page affiche un **code**, copiez-le, revenez dans le terminal, collez-le, Entrée.
9. **Parlez à l'agent** : icône Claude dans la barre de gauche, ou `claude` dans le terminal (répondez **Oui** à la confiance du dossier). Tapez :
   > /bienvenue

   L'accueil vérifie votre environnement et donne votre premier pas. S'il cite votre volet et les contrats des autres squads, vous êtes prêt. Ensuite, `/coach` répond à « où en est-on et que fait-on ensuite ? ».

**Bon à savoir**
- Onglet fermé ? Votre Codespace vous attend sur [github.com/codespaces](https://github.com/codespaces). Ne recliquez **pas** sur le lien de votre squad : cela en créerait un deuxième, sans votre travail non publié.
- Après 30 minutes sans activité, il se met en veille ; rouvrez-le, il redémarre en quelques secondes, toujours connecté.
- Le Codespace est **personnel** (connecté au compte Claude qui vous a été fourni) : ne le partagez pas.

<a id="voie-b"></a>

### 2B. Voie B · votre poste

La ligne de **votre section** installe Git, Node.js, Claude Code et Spec Kit (sans droits administrateur), clone le contexte partagé
et le dépôt de votre squad dans le dossier `hackathon` de votre profil, assemble le contexte de la squad, puis affiche un bilan.

- **Avant le 23/10** : lancez-la une fois. Le bilan doit être **tout vert**. Une ligne rouge ? Envoyez le bilan au support avant le 23/10.
- **Le jour J, à 12 h 30** : relancez **la même ligne** (elle met tout à jour), puis les trois commandes « Le jour J » de votre section.
- Windows : collez la ligne dans **PowerShell** (menu Démarrer, tapez « PowerShell »). macOS : dans **Terminal** (Cmd + Espace, tapez « Terminal »).

## 3. Travailler avec Claude (les deux voies)

On parle à Claude en français, dans le panneau Claude (ou en tapant `claude` dans le terminal). Il propose ses modifications et attend votre accord.
Les commandes Spec Kit (`/speckit-specify`, `/speckit-clarify`…) se tapent au même endroit.

| Vous voulez | Écrivez à Claude |
|---|---|
| Avoir le contexte à jour | « Récupère les dernières versions du Context Nexus et réassemble notre contexte. » |
| Savoir ce qui a changé | « Qu'est-ce qui a changé dans les contrats des autres squads depuis tout à l'heure ? » |
| Démarrer la Business Intent Spec | « Copie le gabarit business-intent dans le dossier de notre squad et aide-moi à remplir les 5 champs. Pose-moi les questions. » |
| Partager votre travail | « Publie mes changements dans le Context Nexus. » |
| Vérifier avant une gate | « Vérifie que notre squad passe le check de context-assemble. » |

**Règle d'équipe** : chaque poste et chaque Codespace est une copie séparée. Ce qui n'est pas **publié** reste invisible pour les autres.
La spec et le code vivent sur le **poste pilote** de l'Orchestrator, affiché sur l'écran de la table.

Bloqué plus de 5 minutes ? Levez la main.

---

<a id="squad-1"></a>

## Squad 1 · Offre

**API d'éligibilité et de prix** · PO, TL, SA iOS, Data analyst
Poste pilote : **SA iOS** (Orchestrator) · Context Engineer : **Data analyst** · Gates : G1 14h25 · G2 15h10 · G3 16h10 · G4 16h35

| | |
|---|---|
| **Ouvrir mon Codespace** (voie A) | [Ouvrir le Codespace de la squad 1](https://codespaces.new/zenika-dev/starter-squad-1-offre) |
| Ma fiche squad (mission, chapeaux, agenda, gates) | [squads/squad-1-offre/KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-1-offre/KIT.md) |
| Dépôt de la squad | [github.com/zenika-dev/starter-squad-1-offre](https://github.com/zenika-dev/starter-squad-1-offre) |
| Notre dossier dans le contexte partagé | [teams/squad-1-offre](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-1-offre) |

**Voie B · la ligne à coller** (avant le 23/10, puis à nouveau le jour J)

Windows, dans PowerShell :
```powershell
$env:SQUAD = "squad-1-offre"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

macOS, dans Terminal :
```bash
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-1-offre
```

**Voie B · le jour J, après la ligne**

Windows, dans PowerShell :
```powershell
cd $HOME\hackathon\starter-squad-1-offre
claude auth login
claude
```

macOS, dans Terminal :
```bash
cd ~/hackathon/starter-squad-1-offre
claude auth login
claude
```

**Réflexes du Context Engineer (Data analyst)**, à taper dans le dossier de la squad (là où l'on lance `claude`), dans les deux voies.
Ou plus simple : demandez-le à Claude avec les phrases de la section 3.

```bash
# Début de chaque bloc : contexte à jour
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --out .context/brief.md

# Avant chaque gate (code retour 1 = quelque chose est « stale »)
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --check

# Annonce « un contrat a changé »
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --mark-stale --out .context/brief.md
```

---

<a id="squad-2"></a>

## Squad 2 · Prix

**Plancher, plafond et KPI** · PO, TL BFF, SA AEM, Sr Data Eng.
Poste pilote : **SA AEM** (Orchestrator) · Context Engineer : **Sr Data Eng.** · Gates : G1 14h30 · G2 15h15 · G3 16h15 · G4 16h40

| | |
|---|---|
| **Ouvrir mon Codespace** (voie A) | [Ouvrir le Codespace de la squad 2](https://codespaces.new/zenika-dev/starter-squad-2-prix) |
| Ma fiche squad (mission, chapeaux, agenda, gates) | [squads/squad-2-prix/KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-2-prix/KIT.md) |
| Dépôt de la squad | [github.com/zenika-dev/starter-squad-2-prix](https://github.com/zenika-dev/starter-squad-2-prix) |
| Notre dossier dans le contexte partagé | [teams/squad-2-prix](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-2-prix) |

**Voie B · la ligne à coller** (avant le 23/10, puis à nouveau le jour J)

Windows, dans PowerShell :
```powershell
$env:SQUAD = "squad-2-prix"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

macOS, dans Terminal :
```bash
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-2-prix
```

**Voie B · le jour J, après la ligne**

Windows, dans PowerShell :
```powershell
cd $HOME\hackathon\starter-squad-2-prix
claude auth login
claude
```

macOS, dans Terminal :
```bash
cd ~/hackathon/starter-squad-2-prix
claude auth login
claude
```

**Réflexes du Context Engineer (Sr Data Eng.)**, à taper dans le dossier de la squad (là où l'on lance `claude`), dans les deux voies.
Ou plus simple : demandez-le à Claude avec les phrases de la section 3.

```bash
# Début de chaque bloc : contexte à jour
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --out .context/brief.md

# Avant chaque gate (code retour 1 = quelque chose est « stale »)
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --check

# Annonce « un contrat a changé »
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --mark-stale --out .context/brief.md
```

---

<a id="squad-3"></a>

## Squad 3 · Paiement

**Encaissement du supplément** · PO, TL, SA Android, Scrum Master
Poste pilote : **SA Android** (Orchestrator) · Context Engineer : **Scrum Master** · Gates : G1 14h35 · G2 15h20 · G3 16h20 · G4 16h45

| | |
|---|---|
| **Ouvrir mon Codespace** (voie A) | [Ouvrir le Codespace de la squad 3](https://codespaces.new/zenika-dev/starter-squad-3-paiement) |
| Ma fiche squad (mission, chapeaux, agenda, gates) | [squads/squad-3-paiement/KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-3-paiement/KIT.md) |
| Dépôt de la squad | [github.com/zenika-dev/starter-squad-3-paiement](https://github.com/zenika-dev/starter-squad-3-paiement) |
| Notre dossier dans le contexte partagé | [teams/squad-3-paiement](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-3-paiement) |

**Voie B · la ligne à coller** (avant le 23/10, puis à nouveau le jour J)

Windows, dans PowerShell :
```powershell
$env:SQUAD = "squad-3-paiement"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

macOS, dans Terminal :
```bash
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-3-paiement
```

**Voie B · le jour J, après la ligne**

Windows, dans PowerShell :
```powershell
cd $HOME\hackathon\starter-squad-3-paiement
claude auth login
claude
```

macOS, dans Terminal :
```bash
cd ~/hackathon/starter-squad-3-paiement
claude auth login
claude
```

**Réflexes du Context Engineer (Scrum Master)**, à taper dans le dossier de la squad (là où l'on lance `claude`), dans les deux voies.
Ou plus simple : demandez-le à Claude avec les phrases de la section 3.

```bash
# Début de chaque bloc : contexte à jour
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-3-paiement --out .context/brief.md

# Avant chaque gate (code retour 1 = quelque chose est « stale »)
node ../context-nexus/tools/context-assemble.mjs --squad squad-3-paiement --check

# Annonce « un contrat a changé »
node ../context-nexus/tools/context-assemble.mjs --squad squad-3-paiement --mark-stale --out .context/brief.md
```

---

<a id="squad-4"></a>

## Squad 4 · Expérience

**Tuile et carte dans l'app** · Designer, SA BFF, SA Web JS, Dev Android
Poste pilote : **Dev Android** (Orchestrator) · Context Engineer : **SA Web JS** · Gates : G1 14h40 · G2 15h25 · G3 16h25 · G4 16h50

| | |
|---|---|
| **Ouvrir mon Codespace** (voie A) | [Ouvrir le Codespace de la squad 4](https://codespaces.new/zenika-dev/starter-squad-4-experience) |
| Ma fiche squad (mission, chapeaux, agenda, gates) | [squads/squad-4-experience/KIT.md](https://github.com/zenika-dev/ai4d-hackathon-kit/blob/main/squads/squad-4-experience/KIT.md) |
| Dépôt de la squad | [github.com/zenika-dev/starter-squad-4-experience](https://github.com/zenika-dev/starter-squad-4-experience) |
| Notre dossier dans le contexte partagé | [teams/squad-4-experience](https://github.com/zenika-dev/ai4d-hackathon-context-nexus/tree/main/teams/squad-4-experience) |

**Voie B · la ligne à coller** (avant le 23/10, puis à nouveau le jour J)

Windows, dans PowerShell :
```powershell
$env:SQUAD = "squad-4-experience"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex
```

macOS, dans Terminal :
```bash
curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-4-experience
```

**Voie B · le jour J, après la ligne**

Windows, dans PowerShell :
```powershell
cd $HOME\hackathon\starter-squad-4-experience
claude auth login
claude
```

macOS, dans Terminal :
```bash
cd ~/hackathon/starter-squad-4-experience
claude auth login
claude
```

**Réflexes du Context Engineer (SA Web JS)**, à taper dans le dossier de la squad (là où l'on lance `claude`), dans les deux voies.
Ou plus simple : demandez-le à Claude avec les phrases de la section 3.

```bash
# Début de chaque bloc : contexte à jour
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-4-experience --out .context/brief.md

# Avant chaque gate (code retour 1 = quelque chose est « stale »)
node ../context-nexus/tools/context-assemble.mjs --squad squad-4-experience --check

# Annonce « un contrat a changé »
node ../context-nexus/tools/context-assemble.mjs --squad squad-4-experience --mark-stale --out .context/brief.md
```
