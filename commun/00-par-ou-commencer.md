# Par où commencer · le pas à pas du champion

> Trois moments : **avant** (10 min, d'ici le 23/10), **à l'arrivée** (12 h 30 – 13 h 30), **la première heure** (13 h 30 – 14 h 30).
> Pour être prêt, suivez la **fiche de démarrage** (`fiche-demarrage.md`) : elle contient les liens et les commandes de votre squad.
> Ce document explique la suite : quoi vérifier à l'arrivée, puis comment démarrer la première heure.
> Lisez aussi la fiche de votre squad : `squads/<votre-squad>/KIT.md`.

## Avant · d'ici le vendredi 23/10 (10 minutes)

1. Lire `01-bases-en-5-minutes.md` et la fiche de votre squad : `squads/<votre-squad>/KIT.md`.
2. Rien à faire côté Claude : le **compte Claude** est fourni lundi, sur place, par l'équipe Programme AI4D. Claude Code s'y connecte avec `claude auth login`, sans clé API.
3. Choisir votre voie (détails dans `fiche-demarrage.md` et `03-prerequis-poste.md`) :
   - **Voie A · Codespace** (recommandée, rien à installer) : créez un compte GitHub et envoyez votre identifiant au support. Le jour J, vous cliquerez sur le lien Codespace de votre squad.
   - **Voie B · votre poste** : collez la ligne d'installation de votre squad (PowerShell sous Windows, Terminal sous macOS), sans droits administrateur.
     Le script se termine par un bilan, qui doit être **tout vert**. Une ligne rouge ? Envoyez-le au support **avant** le 23/10, pas le jour J.
4. **Deux postes prêts par squad suffisent** (Orchestrator et Decision Guarantor). Les autres peuvent travailler en binôme.

## À l'arrivée · lundi 26/10, à partir de 12 h 30

À votre table de squad, un seul poste suffit pour les étapes 1 à 3 ; les autres suivent sur leur propre poste.

**Une convention pour tout ce document** : les commandes se lancent **depuis le dossier du starter** de votre squad, là où l'on lance `claude`.
Le contexte partagé est à côté, accessible par `../context-nexus` (dans un Codespace, il est aussi à la racine du projet, dans `context-nexus/`).

**1. Ouvrir votre environnement**

- **Voie A · Codespace** : cliquez sur le lien Codespace de votre squad (`fiche-demarrage.md`, voie A). Comptez environ **2 minutes**, avec deux fenêtres à valider
  (permissions, confiance du dossier). C'est prêt quand le terminal écrit **« Welcome to Codespaces! »** : le dépôt de la squad et le dossier `context-nexus` sont alors là, et le contexte est déjà assemblé.
- **Voie B · votre poste** : relancez **la même ligne** que pour l'installation (elle met tout à jour, clone le contexte partagé et le starter dans `~/hackathon/`, puis assemble le contexte).
  Puis, dans un **nouveau** terminal : `cd ~/hackathon/starter-<votre-squad>`.

> Voie B sans le nom de la squad, ou starter absent ? Relancez de préférence la ligne d'installation avec le nom de votre squad (Windows et macOS). Sinon, clonez à la main (macOS ou Git Bash) :
> ```bash
> mkdir -p ~/hackathon && cd ~/hackathon
> git clone https://github.com/zenika-dev/ai4d-hackathon-context-nexus.git context-nexus
> git clone https://github.com/zenika-dev/starter-<votre-squad>.git starter-<votre-squad>
> cd starter-<votre-squad>
> node ../context-nexus/tools/context-assemble.mjs --squad <votre-squad> --out .context/brief.md
> ```

**2. Connecter Claude Code au compte Claude fourni sur place** : `claude auth login`, puis connexion dans le navigateur. Vérification : `claude auth status --text`.

**3. Vérifier le starter**
```bash
ls CLAUDE.md .context/brief.md        # les deux doivent exister
npm test                              # tests verts (npm install est déjà fait)
specify check
```
Le fichier `.context/brief.md` doit contenir un bloc `task_brief:` avec un identifiant `TB-<squad>-xxxxxxxx`. Pour le régénérer et vérifier les dépendances :
```bash
node ../context-nexus/tools/context-assemble.mjs --squad <votre-squad> --out .context/brief.md
```
Attendu : `✓ Toutes les dépendances épinglées sont à jour.`

> Pas de `CLAUDE.md` ? Copiez celui de `squads/<votre-squad>/CLAUDE.md` du kit à la racine du starter.
> Pas de dossier `.specify/` ? Lancez `specify init --here --integration claude`.

**4. Premier contact avec l'agent**
```bash
claude
```
Puis, dans Claude Code, tapez exactement :
```
Résume en 10 lignes ce que contient .context/brief.md : qui nous sommes, ce que nous devons
construire, quels contrats nous publions, lesquels nous consommons et à quelles versions.
```
Si la réponse cite votre volet et les contrats des autres squads, l'agent voit bien le Context Nexus. Vous êtes prêts.

Plus simple : tapez `/bienvenue`, qui fait ces vérifications pour vous et donne le premier pas. Tapez aussi `/speckit` : les commandes `/speckit-constitution` à `/speckit-implement` doivent apparaître.

## La première heure · 13 h 30 – 14 h 30 (horaires de la squad 1, +5 min par squad)

### 0:00 – 0:30 · Cadrage commun, puis mise en route

- Écouter les règles, le brief Vélora et les volets.
- **Confirmer les chapeaux** de la squad (proposition dans votre `KIT.md`) et les écrire sur le mur de squad.
- Si l'étape « À l'arrivée » n'est pas finie, la terminer maintenant. Le cadrage de 30 minutes prévoit cette marge.

### 0:30 – 1:00 · Discover → G1

| Qui | Fait quoi |
|---|---|
| **Context Engineer** | Relance `context-assemble`, ouvre les contrats v0 des autres squads et lit à voix haute ce qu'ils attendent de vous |
| **Specification Engineer** | Copie le gabarit et tient la plume des 5 champs (voir ci-dessous) |
| **Orchestrator** | Fait travailler l'agent sur les questions ouvertes (prompt ci-dessous) |
| **Decision Guarantor** | Fait trancher le critère de succès chiffré et la priorité, prépare le passage de G1 |

Copier le gabarit de la Business Intent Spec (depuis le dossier du starter) :
```bash
cp ../context-nexus/gabarits/business-intent.md ../context-nexus/teams/<votre-squad>/intent/business-intent.md
```

Prompt de départ (dans Claude Code, depuis le starter) :
```
Lis .context/brief.md. Liste ce que le brief ne dit pas et qui empêche de fixer un critère de succès chiffré
pour notre volet. Pour chaque point, dis quelle donnée ou quelle squad pourrait y répondre.
Ne rédige pas la Business Intent Spec : pose les questions.
```

Avant votre créneau G1, **publiez** la Business Intent Spec (depuis le dossier du starter) :
```bash
# frontmatter du fichier : status: active, owner: <prénom.nom>, last-validated: 2026-10-26
git -C ../context-nexus add teams/<votre-squad>
git -C ../context-nexus commit -m "<votre-squad>: publie business-intent v1.0.0"
git -C ../context-nexus pull --rebase
git -C ../context-nexus push
node ../context-nexus/tools/context-assemble.mjs --squad <votre-squad> --check
```
> Plus simple : demandez-le à Claude, « Publie mes changements dans le Context Nexus. » (phrases prêtes dans `fiche-demarrage.md`, section 3).

### À partir de 1:00 · Design → G2

Enchaîner `/speckit-constitution` → `/speckit-specify` → `/speckit-clarify` → `/speckit-plan` → `/speckit-tasks` → `/speckit-analyze`,
puis publier le contrat v1. Tout est détaillé, avec les prompts, dans `02-spec-kit-x-context-nexus.md`.

## Les trois réflexes pour toute la session

1. **Début de bloc** : `git -C ../context-nexus pull` puis `context-assemble` (Context Engineer).
2. **Avant chaque gate** : gate-check, puis `context-assemble --check`. Code retour 1 = quelque chose est `stale`.
3. **Annonce « un contrat a changé »** : `context-assemble --mark-stale`, lire le diff, mettre à jour, ré-épingler, republier.

Les commandes exactes de votre squad sont dans la section de votre squad de `fiche-demarrage.md`.

## En cas de problème

| Symptôme | Réflexe |
|---|---|
| Codespace : pas de dossier `context-nexus`, ou le terminal est resté vide | Vous avez peut-être rouvert un ancien Codespace : supprimez-le sur [github.com/codespaces](https://github.com/codespaces), puis recréez-le depuis le lien de votre squad |
| Codespace : fenêtre « Faites-vous confiance… » ou « permissions » | Cliquer sur **Approuver le dossier et continuer** et sur **Authorize and continue** (voir la fiche, voie A) |
| `claude` : commande introuvable | Ouvrir un nouveau terminal (bouton + du terminal) et retaper la commande |
| `context-assemble` : « Aucun artefact pour la squad » | Vérifier le nom : `squad-1-offre`, `squad-2-prix`, `squad-3-paiement`, `squad-4-experience` |
| `git push` refusé | `git -C ../context-nexus pull --rebase` puis `git -C ../context-nexus push` (vous n'écrivez que dans votre dossier : pas de conflit attendu) |
| L'agent ignore le contexte | Vérifier que `CLAUDE.md` contient `@.context/brief.md` et que le fichier existe ; relancer `claude` |
| Claude demande de se connecter, ou refuse | `claude auth login` ; toujours bloqué : support (AgentOps). Plan B : poste pilote de la squad |
| Désaccord de contrat avec une autre squad | Aller la voir. Toujours bloqué : gate keeper tech (Convergence Arbitrator) |
| Bloqué plus de 5 minutes | Lever la main |
