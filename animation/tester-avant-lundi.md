# Tester avant lundi · une machine, puis deux

> Pour l'animation. Trois niveaux, du plus rapide au plus proche du jour J. Le niveau 3 est celui qui répond à : « est-ce que ça marche quand deux personnes travaillent en même temps ? »

## Ce qui a déjà été testé (25/10, sur de vrais starters, un dépôt Git partagé simulé et un vrai Codespace)

- **Starters réels** des quatre squads : tests, lint, scan, `gate-check`, `deploy`, `flag`.
- **Un vrai Codespace** (squad Prix, dépôts de répétition) : création en 5 à 6 minutes, Spec Kit `1.2.3`, coach posé automatiquement, publication dans le Nexus avec le jeton du Codespace.
- **L'extension Claude dans VS Code en ligne** : `/bienvenue` et `/coach` apparaissent dans le menu `/`, le style « Pourquoi / À relire / Ensuite » est actif, le hook de début de session s'exécute, un garde-fou bloque l'agent et il l'explique. Les commandes Bash se lancent sans demande de permission (mode Auto).
- **Publications simultanées** de quatre squads dans un même dépôt, événement scripté, réalignement, écran commun et verdicts de gate.
- **Le parcours complet de la squad Prix dans un vrai Codespace**, de Discover à G4 : Intent, constitution, specify, clarify, plan, tasks, analyze, contrats v1, première user story, événement déclenché depuis l'écran commun, réalignement, déploiement, flag, runbook, quatre verdicts enregistrés depuis le navigateur. Les quatre `gate-check` officiels sont verts. Le détail, les défauts trouvés et corrigés et le budget Claude sont dans `livraison/RAPPORT-TEST-CODESPACE.md`.

## Ce qui reste à voir avec vos vrais comptes

1. La connexion avec **les comptes fournis sur place** (le test a utilisé un compte Claude Team). Le flux demande de coller un code dans le terminal : c'est le point où l'on se trompe le plus facilement.
2. Plusieurs Codespaces créés **en même temps** (24 personnes), et le temps réel de création à ce moment-là.
3. Le parcours d'une squad non testée (Paiement, avec la signature du code de débit).
4. Les gates G5 et G6 (bonus), non déroulées, et quatre squads réelles en parallèle (le test en a simulé trois depuis un clone).

## Niveau 1 · une machine, 10 minutes : voir que tout s'allume

Prérequis : Node 22 ou plus, Git. Dans un dossier de travail (par exemple `~/repetition`) :

```bash
git clone https://github.com/zenika-dev/ai4d-hackathon-context-nexus.git context-nexus
git clone https://github.com/zenika-dev/starter-squad-2-prix.git
```

Récupérez la dernière version des outils (une fois les correctifs fusionnés sur GitHub). Tant qu'ils ne le sont pas, copiez le dossier `tools/` du dépôt `ai4d-hackathon-context-nexus-main` par-dessus `context-nexus/tools/`.

```bash
cd starter-squad-2-prix && npm install && npm run context
```

`npm run context` pose aussi le coach dans le starter. Puis :

```bash
claude
```

Répondez **Oui** à la confiance du dossier, puis tapez `/bienvenue`, puis `/coach`. Vous devez voir : l'accueil de la squad Prix, ses horaires de gate, les quatre chapeaux, la prochaine étape avec sa commande à copier.

Pour l'écran commun, dans `context-nexus` :

```bash
node tools/nexus-board.mjs --reset --keeper
```

Ouvrez http://localhost:4000 : quatre squads, le graphe des contrats. Cliquez sur une gate : la boîte de verdict s'ouvre.

## Niveau 2 · un vrai Codespace

À faire une fois les correctifs fusionnés sur GitHub. Ouvrez `jour-j/demarrage.html`, choisissez une squad, suivez les six étapes avec votre compte GitHub et un compte Claude. Notez le temps jusqu'à « Welcome to Codespaces! », les fenêtres rencontrées, et ce qui vous fait hésiter.

## Niveau 3 · deux machines, deux comptes Claude : comme si vous étiez deux

Il faut un dépôt Context Nexus **à part du vrai** : sinon vos essais seraient publiés dans le dépôt partagé du programme. Créez-le une fois, à partir d'une copie du dossier `ai4d-hackathon-context-nexus-main` :

```bash
cp -R ai4d-hackathon-context-nexus-main ~/nexus-repetition && cd ~/nexus-repetition && git init -b main && git add -A && git commit -m "Nexus de répétition"
```

```bash
gh repo create ai4d-nexus-repetition --private --source . --push
```

Sur **chaque machine**, dans un dossier `~/repetition` :

```bash
git clone https://github.com/<votre-compte>/ai4d-nexus-repetition.git context-nexus
```

Répartition :

| | Machine 1 | Machine 2 |
|---|---|---|
| Rôle | Squad **Offre** | Squad **Prix** et animation |
| Starter | `git clone https://github.com/zenika-dev/starter-squad-1-offre.git` | `git clone https://github.com/zenika-dev/starter-squad-2-prix.git` |
| Compte Claude | compte 1 | compte 2 |
| Écran commun | | `node tools/nexus-board.mjs --reset --keeper --push --pull 5` dans `context-nexus` |

Sur chaque machine : `cd starter-… && npm install && npm run context && claude`, puis `/bienvenue`.

**Le scénario** (une demi-heure, le même que celui du jour J en accéléré) :

1. **Discover.** Chaque squad remplit sa Business Intent Spec avec l'aide de Claude et la publie en même temps que l'autre (`/coach` donne la commande de publication). Vérifiez que les deux publications passent, même si l'une doit se rejouer toute seule.
2. **G1.** Sur la machine 2, sur http://localhost:4000, cliquez sur la gate G1 de chaque squad et enregistrez un GO. Sur la machine 1, demandez « Mets à jour le contexte » : `/coach` doit maintenant parler de Design.
3. **Jalon M1.** La squad Prix publie `regle-prix` en v1. Sur la machine 1, après « Mets à jour le contexte », `/coach` doit annoncer qu'un contrat d'une autre squad a changé. L'écran affiche M1 comme fait.
4. **Épinglage.** La squad Offre s'épingle sur `regle-prix` v1 et publie son propre contrat v1.
5. **L'événement.** Une fois Offre et Prix en v1, cliquez sur « Déclencher » sur l'écran de la machine 2. Sur la machine 1 : mise à jour du contexte, puis `/coach`. L'écran doit passer le contrat en rouge, Offre en ambre, avec un chronomètre.
6. **Réalignement.** Offre lit le changement avec Claude, met à jour son contrat, ré-épingle et republie. Le chronomètre s'arrête.

**Ce qu'il faut regarder** : les phrases du coach sont-elles claires pour quelqu'un qui n'a jamais vu le PDLC ? Le style « Pourquoi / À relire / Ensuite » aide-t-il ou alourdit-il ? Combien de temps prend chaque étape (c'est ce qui recale l'agenda) ? Quelle phrase vous a fait hésiter ?

## Si quelque chose ne marche pas

| Symptôme | Réflexe |
|---|---|
| `/bienvenue` n'existe pas | `npm run context` dans le starter, puis relancer `claude` |
| Claude ignore les permissions pré-approuvées | Il faut répondre **Oui** à la confiance du dossier, une fois |
| L'écran affiche des changements de contrat qui n'ont pas eu lieu | Relancer avec `--reset` (il garde l'historique du jour, pas celui d'hier) |
| `npm run lint` échoue sur des fichiers de `context-nexus/` | Le starter n'a pas reçu le correctif d'eslint (`context-nexus` dans `ignores`) : voir `livraison/4-appliquer-aux-starters.sh` |
| Une publication est refusée | `node ../context-nexus/tools/publish.mjs -m "…"` réessaie seul ; en cas de vrai conflit, il s'arrête sans rien casser |
