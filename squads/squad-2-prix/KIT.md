# Squad 2 · Prix · Kit de démarrage

> Hackathon Champions 4 h, dry run du **lundi 26 octobre 2026, 13 h 30 à 17 h 30** (installation dès 12 h 30).
> À lire avec : `commun/00-par-ou-commencer.md` (le pas à pas), `commun/01-bases-en-5-minutes.md`, et pendant la session `commun/02-spec-kit-x-context-nexus.md`.

## Démarrer en 5 étapes

1. **Avant le 23/10** : cette fiche lue, votre chapeau repéré ci-dessous, et votre façon d'être prêt choisie (`commun/03-prerequis-poste.md`) : **Codespace** (un compte GitHub, rien à installer) ou **installation en une ligne** sur votre poste. Deux postes prêts par squad suffisent.
2. **À 12 h 30** : en Codespace, cliquer sur le lien Codespace de votre squad (`starter-squad-2-prix`, dans la fiche de démarrage), puis `claude auth login` avec le compte Claude fourni sur place (pas à pas : `commun/fiche-demarrage.md`, voie A) . Sur votre poste : relancer le script d'installation avec votre squad (il clone `context-nexus` et `starter-squad-2-prix` dans `~/hackathon/`) :
   - Windows : `$env:SQUAD = "squad-2-prix"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex`
   - macOS : `curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-2-prix`

   puis `claude auth login` avec le compte Claude fourni sur place.
3. **Assembler votre contexte** (déjà fait par le Codespace ou par le script ; à relancer au début de chaque bloc) :
   ```bash
   cd ~/hackathon/starter-squad-2-prix     # dans un Codespace, vous y êtes déjà
   node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --out .context/brief.md
   ```
4. **Vérifier l'agent** : dans `starter-squad-2-prix`, lancer `claude` et demander « Résume .context/brief.md : notre volet, les contrats que nous publions et ceux que nous consommons ». Taper `/speckit` pour voir les commandes.
5. **À 14h05, Discover** : le Context Engineer lit les contrats des autres squads, le Specification Engineer copie `gabarits/business-intent.md` dans `teams/squad-2-prix/intent/` et tient la plume.

## Travailler à quatre

- **Un poste ou Codespace pilote** : celui de l'Orchestrator (SA AEM), affiché sur l'écran de la table. La spec, le plan et le code y vivent.
- **Les autres** lisent le contexte et préparent leurs textes (Business Intent, spec, contrat) sur leur propre poste ou Codespace, puis les **publient** dans le Context Nexus. Profil non technique : demandez à Claude « Publie mes changements dans le Context Nexus ».
- **Le Context Engineer** (Sr Data Eng.) lance `context-assemble` au début de chaque bloc et annonce à la squad ce qui a changé.
- Chaque Codespace est une copie séparée : ce qui n'est pas publié reste invisible pour les autres.

## Votre mission

Construire la **règle de prix** : le plancher et le plafond du supplément selon l'occupation prévue, et définir les **KPI** de l'offre. Votre règle borne ce que vend Offre et ce que débite Paiement ; vos KPI se nourrissent des événements d'achat d'Expérience.

**Ce que vous construisez pendant le dry run** : `GET /v1/pricing/late-checkout/bounds` dans le starter, et le calcul des KPI à partir d'un flux d'événements d'achat (mock tant qu'Expérience n'a pas publié).

## Votre squad et vos chapeaux

| Profil | Chapeau proposé |
|---|---|
| PO | Specification Engineer |
| TL BFF | Decision Guarantor |
| SA AEM | Agentic Workflow Orchestrator |
| Sr Data Eng. | Context Engineer |

Répartition proposée par l'animation ; vous l'ajustez au cadrage (0:00 à 0:30). En fin de session : l'effort estimé de votre chapeau était-il réaliste ?

**Qui porte quoi à chaque gate** : le livrable est porté selon la matrice du TOM V1.0 ; le profil **TL BFF**, Decision Guarantor, signe chaque gate.

| Gate | Livrable porté par |
|---|---|
| G1 | PO |
| G2 | PO, TL BFF, SA AEM (co-owners) |
| G3 | SA AEM (pas de profil dev : écart noté) |
| G4 | Sr Data Eng. (pas de QA : écart noté ; KPI instrumentés au cœur de G4) |
| G5 | Sr Data Eng. (bonus) |
| G6 | PO (bonus) |

## Votre agenda

Squad 2 : décalage de **5 minutes** par rapport à la squad 1.

| Horaire | Relatif | Bloc |
|---|---|---|
| 13h30 – 14h00 | 0:00 – 0:30 | Cadrage commun : accueil, règles, brief Vélora, volets, chapeaux |
| 14h00 – 14h05 | 0:30 – 0:35 | Mise en route décalée : fin des vérifications, `context-assemble`, lecture du contexte |
| 14h05 – 14h35 | 0:35 – 1:05 | **Discover** : lire le contexte des autres squads, besoin à 5 champs, données, priorité |
| 14h35 – 15h20 | 1:05 – 1:50 | **Design** : constitution → spec → plan → tâches → analyze, contrat v1 publié |
| 15h20 – 15h30 | 1:50 – 2:00 | Pause |
| 15h30 – 16h20 | 2:00 – 2:50 | **Develop** : `/speckit-implement` tâche par tâche · ⚡ un contrat d'une autre squad change pendant ce bloc |
| 16h20 – 16h45 | 2:50 – 3:15 | **Deploy** : déploiement, bascule de flag tracée, KPI et événements publiés |
| 16h45 – 16h55 | 3:15 – 3:25 | **Bonus** (10 min) : Deepen (G5) et Drop (G6), version courte, si le temps le permet |
| 16h55 – 17h30 | 3:25 – 4:00 | Débrief commun : préparation de la démo (10'), démos croisées (5'), rétro du TOM (10'), retour pour le 8 h (10') |

| Gate | Créneau de 5 min | Gate keeper |
|---|---|---|
| G1 · Ready to Spec | **14h30** (1:00) | Produit |
| G2 · Ready to Build | **15h15** (1:45) | Tech |
| G3 · Ready to Release | **16h15** (2:45) | Tech |
| G4 · Released and Observable | **16h40** (3:10) | Run |
| G5, G6 · bonus | dans votre fenêtre de 10 min, de 16h45 à 16h55 | data (G5), produit (G6) |

Règles de coupe : G2 pas passée 10 minutes après son créneau → le Develop devient guidé par le coach. G4 pas passée à 16h55 → la squad prépare sa démo.

Avant chaque créneau : gate-check, puis `node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --check` (depuis le dossier du starter). Après chaque gate : fiche de retour (20 secondes).

## Ce que vous publiez, ce que vous consommez

Le Context Nexus est un dépôt partagé : vous lisez tout, vous n'écrivez que dans `teams/squad-2-prix/`.

**Vous publiez** (v0 écrits par l'animation, v1 à publier avant G2) :

| Fichier | Contenu | Lu par |
|---|---|---|
| `teams/squad-2-prix/contracts/regle-prix.md` | Règle de prix (bornes) | Offre, Paiement |
| `teams/squad-2-prix/contracts/kpi.md` | Définition des KPI | Expérience, gate keeper data |

**Vous consommez** (versions épinglées au départ) :

| Fichier | Version épinglée | Squad | Pour |
|---|---|---|---|
| `teams/squad-4-experience/contracts/evenements-achat.md` | 0.1.0 | Expérience | Événements d'achat |
| `teams/squad-1-offre/contracts/offre-api.md` | 0.1.0 | Offre | Éligibilité |

Un écart entre votre contrat et celui d'une autre squad se règle **en allant la voir**, pas en modifiant son fichier. Si vous n'y arrivez pas : gate keeper tech (Convergence Arbitrator).

## Ordre de publication · deux contrats-ancres

Les contrats se consomment en chaîne : Prix, puis Offre, puis Paiement, puis Expérience, avec les KPI de Prix en bout de chaîne. Pour que chaque squad puisse épingler la **version actuelle** des contrats qu'elle utilise avant son G2, deux petits contrats sont publiés **tôt**, avant le reste :

| Jalon | Qui publie | Quoi | Avant |
|---|---|---|---|
| M1 | Prix | `regle-prix` v1 (bornes et prix d'un créneau) | 14h55 |
| M2 | Expérience | `evenements-achat` v1 | 15h05 |

Publiez d'abord une v1 courte et claire ; un ajustement ultérieur passe en 1.1.0, annoncé aux squads qui consomment votre contrat. Les jalons s'affichent sur l'écran commun de la salle.

**Pour vous** : vous portez M1. Publiez `regle-prix` v1 avant 14h55, avant même d'avoir fini plan et tâches. Vos KPI (`kpi.md` v1) s'épinglent ensuite sur M2 et sur `offre-api` v1.

## À lire en premier (Discover)

1. `.context/brief.md`, généré par `context-assemble` : tout ce qui suit y est assemblé.
2. `programme/late-checkout/knowledge/brief.md` et `regles-metier.md` : le brief Vélora et les règles RM-01 à RM-08.
3. Votre contrat v0 : `regle-prix.md`, `kpi.md`.
4. Les contrats v0 que vous consommez (tableau ci-dessus), **en entier**.
5. Vos données fictives (remises sur place).

## Spec Kit, adapté à votre volet

Point de départ pour `/speckit-specify` (à réécrire avec votre Business Intent Spec) :

```
/speckit-specify La règle de prix fixe le plancher et le plafond du supplément de late check-out selon l'occupation prévue de l'hôtel pour la nuit du départ, et les KPI de l'offre sont calculés à partir des événements d'achat et des réservations éligibles.
Source : teams/squad-2-prix/intent/business-intent.md. Critères d'acceptance vérifiables par un test,
chacun rattaché à une règle RM-xx ou à un contract (API-xx, SEC-xx, A11Y-xx, ENG-xx).
```

Questions utiles pour `/speckit-clarify` et pour vos échanges avec les autres squads :

- D'où vient la prévision d'occupation, de quand date-t-elle, et que fait la règle quand elle manque ?
- Avec quels paramètres Offre et Paiement appellent-ils votre règle, et que leur renvoyez-vous quand aucun LCO n'est vendable ?
- Quels seuils de KPI viennent d'une décision humaine (Intent) et lesquels sont de simples suivis ?
- Si la Direction Revenu Annexe change la règle, qui prévenez-vous et comment ?

## Les gates de votre squad

| Gate | Livrable | Où dans le Nexus | Vérifié par gate-check | Jugé par le gate keeper |
|---|---|---|---|---|
| **G1** 14h30 | Business Intent Spec | `teams/squad-2-prix/intent/business-intent.md` | 5 champs complets, contexte daté et sourcé | Critère de succès chiffré, données, priorité avec owner |
| **G2** 15h15 | Solution Design Spec | spec publiée dans `intent/specs/` + contrat v1 dans `contracts/` | Critères évaluables, versions épinglées, contrat d'API valide face aux autres squads | NFR chiffrés, DoR, spec « active » avec owner |
| **G3** 16h15 | Code et Test Specs | code et tests dans le starter, spec `active` (pas `stale`) | Lint, tests, couverture, sécurité, spec mise à jour | Revue nommée, criticité, signature humaine en PCI, plan de flags |
| **G4** 16h40 | Runtime Specs | `operations/runbook.md` + `operations/flags-journal.md` | Flag tracé, observabilité, KPI instrumentés, coût en tokens | Owner d'exploitation, runbook, rollback |
| **G5** bonus | Opportunity Spec | `intent/opportunity.md` | Résultats lus sur 30 jours, coût IA compris | Verdict parmi trois, face à la promesse du G1 |
| **G6** bonus | Retirement Spec | `intent/retirement.md` | Carte des dépendances, chaque ligne avec sa disposition | Utilisateurs impactés, porteur de la communication, decision record |

Un no-go renvoie vers l'étape gardée et nomme le critère qui manque. G5 et G6 : en bonus, version courte, sur matériel fourni.

## Points d'attention pour votre squad

- Votre contrat est consommé par deux squads : toute modification cassante = version majeure, et vous allez les prévenir.
- Les seuils des KPI sont de l'Intent : ils se décident en G1, pas pendant l'implémentation.

## Commandes de survie

```bash
# Assembler le contexte de la squad (début de chaque bloc, et après toute publication annoncée)
# À lancer depuis le dossier du starter (là où l'on lance claude) ; le Nexus est à ../context-nexus
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --out .context/brief.md

# Vérifier avant une gate (code retour 1 = quelque chose est stale)
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --check

# Quand un contrat a changé : marquer ses artefacts stale, puis lire le changement
node ../context-nexus/tools/context-assemble.mjs --squad squad-2-prix --mark-stale
git -C ../context-nexus log -p -3 -- teams/

# Publier
git -C ../context-nexus add teams/squad-2-prix
git -C ../context-nexus commit -m "squad-2-prix: publie <artefact> v<version>"
git -C ../context-nexus pull --rebase
git -C ../context-nexus push
```

## Vos interlocuteurs

| Pour | Qui |
|---|---|
| Votre coach, présent à chacune de vos gates | présenté au cadrage |
| Rythme et règles de coupe | l'animateur principal |
| Agent, Spec Kit, CI, clés, dépôt partagé | le support technique Zenika |
| Conflit de contrat entre squads | gate keeper tech |
| Tokens et coût IA | les greffiers |

Bloqué plus de 5 minutes sur l'outillage : levez la main.
