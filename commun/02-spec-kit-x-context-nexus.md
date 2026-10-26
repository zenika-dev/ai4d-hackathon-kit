# Spec Kit × Context Nexus · le mode opératoire de la squad

> Spec Kit structure **votre** travail (spec → plan → tâches → code).
> Le Context Nexus structure **ce que vous partagez** avec les autres squads (contrats, règles, statuts).
> Ce guide dit, phase par phase, quelle commande lancer, quel fichier lire, quel fichier publier.
> Les chemins `gabarits/…`, `teams/…`, `tools/…` sont relatifs au dépôt `context-nexus/`. Les commandes se lancent **depuis le dossier du starter** : le Nexus est alors à `../context-nexus` (voie A comme voie B).

## Le principe en une image

```
            context-nexus/ (partagé)                         starter-<squad>/ (à vous)
 ┌───────────────────────────────────────────┐       ┌──────────────────────────────────────┐
 │ org/  programme/  teams/<autres-squads>/  │       │ CLAUDE.md  ──@import──► .context/    │
 │        │                                  │ assem-│                         brief.md      │
 │        └── context-assemble ─────────────────ble──►  .specify/memory/constitution.md    │
 │                                           │       │  specs/001-…/spec.md plan.md        │
 │ teams/<votre-squad>/                      │◄──────│              tasks.md contracts/    │
 │   intent/business-intent.md   (G1)        │publier│  src/  tests/  flags.json           │
 │   intent/specs/<id>.md        (G2, G3)    │       └──────────────────────────────────────┘
 │   contracts/<contrat>.md v1   (G2)        │
 │   operations/runbook.md …     (G4)        │
 └───────────────────────────────────────────┘
```

- **On lit** le Nexus via `context-assemble`, qui produit `.context/brief.md` dans votre starter.
- **On travaille** avec Spec Kit dans le starter. Claude Code charge le brief grâce au `CLAUDE.md` fourni.
- **On publie** dans le Nexus ce que les autres doivent connaître : Business Intent, spec, contrat, runbook.

## Votre copilote dans le terminal

| Vous voulez | Tapez |
|---|---|
| Être accueilli, vérifier l'environnement | `/bienvenue` |
| Savoir où en est la squad, ce qui manque avant la gate, la prochaine commande | `/coach` |
| Le même état, sans l'agent | `node ../context-nexus/tools/hackathon-status.mjs` |

L'**écran commun** de la salle montre les gates des quatre squads, le graphe des contrats du Nexus et les jalons communs. Quand un contrat change, c'est là qu'on le voit en premier.

## Mise en route (fin du cadrage, avant 0:30)

> Le pas à pas complet de la première demi-heure est dans `00-par-ou-commencer.md`.

```bash
# depuis le dossier du starter
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad <squad> --out .context/brief.md
specify check
```

> Le `CLAUDE.md` de votre squad (dossier `squads/<squad>/` du kit) doit être à la racine du starter. Sinon, copiez-le.

> Si le starter n'a pas encore été initialisé avec Spec Kit : `specify init --here --integration claude`.

Le **Context Engineer** relance l'assemblage **au début de chaque bloc** et dès que quelqu'un annonce une publication.

## Discover (→ G1) · lire avant d'écrire

1. Lire `.context/brief.md` : règles, brief, règles métier, **contrats v0 des autres squads**.
2. Lire votre propre contrat v0 dans `teams/<squad>/contracts/`.
3. Remplir `teams/<squad>/intent/business-intent.md` avec le gabarit `gabarits/business-intent.md`.
   L'agent peut proposer un brouillon : **les 5 champs sont validés par un humain** (invariante du Nexus : l'Intent est humain).
4. `status: active`, `owner: <prénom du PO ou du pilote du Discover>`, puis publier (voir « Publier » plus bas).

Prompt utile :
```
Lis .context/brief.md. Liste ce que le brief ne dit pas et qui empêche de fixer un critère de succès chiffré
pour notre volet. Pour chaque point, dis quelle donnée ou quelle squad pourrait y répondre.
Ne rédige pas la Business Intent Spec : pose les questions.
```

## Design (→ G2) · de l'intention au contrat v1

| Étape | Commande | Ce que vous donnez à l'agent | Durée indicative |
|---|---|---|---|
| 1 | `/speckit-constitution` | Les sections « system prompt » de `.context/brief.md` (règles org, contracts, conventions) | 5 min |
| 2 | `/speckit-specify` | Votre `business-intent.md` + votre contrat v0 | 10 min |
| 3 | `/speckit-clarify` | Rien : répondez à ses questions. Les réponses qui touchent une autre squad → allez la voir | 5 min |
| 4 | `/speckit-plan` | La stack du starter + les contrats des autres squads épinglés (Specification Engineer et Orchestrator) | 10 min |
| 5 | `/speckit-tasks` | Rien | 3 min |
| 6 | `/speckit-analyze` | Rien : lisez son rapport, corrigez | 5 min |
| 7 | Publier contrat v1 + spec | Voir « Publier » | 7 min |

Prompt pour la constitution :
```
/speckit-constitution Construis la constitution uniquement à partir des règles et contracts de la section
"system prompt" de .context/brief.md. Chaque principe cite l'ID de sa source (ex. SEC-02, API-02, ENG-04).
N'ajoute aucun principe qui n'y figure pas : s'il en manque un, signale-le.
```

Prompt pour la spec :
```
/speckit-specify <contenu de teams/<squad>/intent/business-intent.md>
Contexte : notre contrat v0 est dans .context/brief.md. Les critères d'acceptance doivent être vérifiables
par un test automatique et référencer les règles RM-xx et les contracts (API-xx, SEC-xx…) qu'ils satisfont.
```

Prompt pour le plan :
```
/speckit-plan Stack : celle du starter (TypeScript, tests et CI fournis). Les contrats des autres squads
sont dans .context/brief.md, en versions épinglées : tu les consommes tels quels, tu ne les modifies pas.
Pour chaque champ échangé avec une autre squad, vérifie type, unité et format, et liste les écarts trouvés.
```

**Avant G2**, le Context Engineer vérifie :
- le contrat v1 est publié, `version: 1.0.0`, avec ses `consumes` épinglés sur les versions **actuelles** des autres squads ;
- la spec est publiée dans `teams/<squad>/intent/specs/`, `status: active`, avec un `owner` nommé ;
- `node tools/context-assemble.mjs --squad <squad> --check` passe.
- les deux **contrats-ancres** sont publiés à temps : M1 `regle-prix` v1 avant 14h55, M2 `evenements-achat` v1 avant 15h05 (« Ordre de publication » de votre `KIT.md`).

## Develop (→ G3) · implémenter, et encaisser un changement

1. `/speckit-implement` tâche par tâche. L'Orchestrator garde un œil sur le budget de tokens.
2. Après chaque tâche : tests verts, commit. Les critères d'acceptance ont chacun un test nommé (ENG-04).
3. **Pendant le Develop, un contrat d'une autre squad change** (c'est l'événement scripté de la session, annoncé sur l'écran commun). Le Context Engineer lance :
   ```bash
   git -C ../context-nexus pull
   node ../context-nexus/tools/context-assemble.mjs --squad <squad> --mark-stale --out .context/brief.md
   git -C ../context-nexus log -p -1 -- teams/   # lire CE qui a changé, pas seulement QUE ça a changé
   ```
4. Si vos artefacts passent `stale` :
   ```
   /speckit-clarify Le contrat <chemin> est passé de la version X à Y (voir .context/brief.md).
   Quelles exigences, quels critères d'acceptance et quelles tâches de notre spec sont impactés ?
   ```
   Puis mettez à jour spec → plan → tâches, implémentez, **ré-épinglez** (`consumes: …@Y`), repassez en `active`, publiez.
5. Code qui déclenche un débit : signature humaine nommée (`Signed-off-by:`) avant merge (SEC-02).

## Deploy (→ G4) · rendre observable

- Déployer avec le script du starter, flag **désactivé**.
- Basculer le flag **uniquement** via `npm run flag` : la ligne du journal est la preuve (voir `programme/late-checkout/operations/feature-flags.md`).
- Publier dans `teams/<squad>/operations/` : `runbook.md` (gabarit `gabarits/runtime-spec.md`), `flags-journal.md`.
- Publier vos KPI ou événements instrumentés : c'est ce que les autres squads liront à G5.

## Deepen (→ G5) et Drop (→ G6) · en bonus, si le temps le permet

Fenêtre bonus après G4 : 15 min pour la squad 1, 10 pour la 2, 5 pour la 3, 0 pour la 4. Sinon, G5 et G6 se jouent à l'oral au débrief.

- G5 : lire la télémétrie de 30 jours fournie, remplir `intent/opportunity.md` (gabarit fourni), un verdict parmi trois, **face au critère chiffré de votre G1**.
- G6 : à partir de la carte de dépendances de l'ancien processus, remplir `intent/retirement.md` (gabarit fourni).

## Publier dans le Nexus

```bash
# depuis le dossier du starter ; le Nexus est à ../context-nexus
# 1. copier ou mettre à jour le fichier dans ../context-nexus/teams/<squad>/…
# 2. frontmatter : version incrémentée, last-validated du jour, status, owner, consumes épinglés
git -C ../context-nexus add teams/<squad>
git -C ../context-nexus commit -m "<squad>: publie <artefact> v<version>"
git -C ../context-nexus pull --rebase
git -C ../context-nexus push
```

**Plus simple et plus sûr** : `node ../context-nexus/tools/publish.mjs -m "publie business-intent v1.0.0"`. L'outil montre ce qui part, ne prend que `teams/<squad>/`, et recommence tout seul si quelqu'un publie au même moment (le « push refusé »). Demandez-le aussi à Claude : « Publie mes changements ».

Pour publier une spec Spec Kit, copiez `specs/001-…/spec.md` dans `teams/<squad>/intent/specs/<squad>-001.md`
et ajoutez **en tête** le frontmatter du gabarit `gabarits/frontmatter-spec.md`.

## Ce qui est humain, ce qui est agent

| L'agent peut | Seul un humain peut |
|---|---|
| Proposer un brouillon de Business Intent, de spec, de contrat | Passer un artefact Intent ou Contracts en `active` |
| Détecter un écart entre deux contrats | Décider qui adapte son contrat |
| Implémenter, tester, proposer un runbook | Signer une gate, signer un code de débit (PCI), basculer un flag en production |
| Lire la télémétrie et proposer un verdict | Rendre le verdict G5, décider un retrait G6 |
