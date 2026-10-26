# Squad 1 · Offre · Kit de démarrage

> Hackathon Champions 4 h, dry run du **lundi 26 octobre 2026, 13 h 30 à 17 h 30** (installation dès 12 h 30).
> À lire avec : `commun/00-par-ou-commencer.md` (le pas à pas), `commun/01-bases-en-5-minutes.md`, et pendant la session `commun/02-spec-kit-x-context-nexus.md`.

## Démarrer en 5 étapes

1. **Avant le 23/10** : cette fiche lue, votre chapeau repéré ci-dessous, et votre façon d'être prêt choisie (`commun/03-prerequis-poste.md`) : **Codespace** (un compte GitHub, rien à installer) ou **installation en une ligne** sur votre poste. Deux postes prêts par squad suffisent.
2. **À 12 h 30** : en Codespace, cliquer sur le lien Codespace de votre squad (`starter-squad-1-offre`, dans la fiche de démarrage), puis `claude auth login` avec le compte Claude fourni sur place (pas à pas : `commun/fiche-demarrage.md`, voie A) . Sur votre poste : relancer le script d'installation avec votre squad (il clone `context-nexus` et `starter-squad-1-offre` dans `~/hackathon/`) :
   - Windows : `$env:SQUAD = "squad-1-offre"; irm https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.ps1 | iex`
   - macOS : `curl -fsSL https://raw.githubusercontent.com/zenika-dev/ai4d-hackathon-kit/main/installation/installer-prerequis.sh | bash -s -- squad-1-offre`

   puis `claude auth login` avec le compte Claude fourni sur place.
3. **Assembler votre contexte** (déjà fait par le Codespace ou par le script ; à relancer au début de chaque bloc) :
   ```bash
   cd ~/hackathon/starter-squad-1-offre     # dans un Codespace, vous y êtes déjà
   node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --out .context/brief.md
   ```
4. **Vérifier l'agent** : dans `starter-squad-1-offre`, lancer `claude` et demander « Résume .context/brief.md : notre volet, les contrats que nous publions et ceux que nous consommons ». Taper `/speckit` pour voir les commandes.
5. **À 14h00, Discover** : le Context Engineer lit les contrats des autres squads, le Specification Engineer copie `gabarits/business-intent.md` dans `teams/squad-1-offre/intent/` et tient la plume.

## Travailler à quatre

- **Un poste ou Codespace pilote** : celui de l'Orchestrator (SA iOS), affiché sur l'écran de la table. La spec, le plan et le code y vivent.
- **Les autres** lisent le contexte et préparent leurs textes (Business Intent, spec, contrat) sur leur propre poste ou Codespace, puis les **publient** dans le Context Nexus. Profil non technique : demandez à Claude « Publie mes changements dans le Context Nexus ».
- **Le Context Engineer** (Data analyst) lance `context-assemble` au début de chaque bloc et annonce à la squad ce qui a changé.
- Chaque Codespace est une copie séparée : ce qui n'est pas publié reste invisible pour les autres.

## Votre mission

Construire l'**API d'offre** : pour une réservation donnée, dire si elle est éligible au late check-out et proposer les créneaux avec leur prix. Vous êtes au centre du graphe : Paiement et Expérience consomment votre contrat, et vous consommez la règle de prix.

**Ce que vous construisez pendant le dry run** : `GET /v1/reservations/{reservationId}/late-checkout-offer` dans le starter, avec un mock de la règle de prix tant que Prix n'a pas publié le sien, et un mock de votre API pour Paiement et Expérience.

## Votre squad et vos chapeaux

| Profil | Chapeau proposé |
|---|---|
| PO | Specification Engineer |
| TL | Decision Guarantor |
| SA iOS | Agentic Workflow Orchestrator |
| Data analyst | Context Engineer |

Répartition proposée par l'animation ; vous l'ajustez au cadrage (0:00 à 0:30). En fin de session : l'effort estimé de votre chapeau était-il réaliste ?

**Qui porte quoi à chaque gate** : le livrable est porté selon la matrice du TOM V1.0 ; le profil **TL**, Decision Guarantor, signe chaque gate.

| Gate | Livrable porté par |
|---|---|
| G1 | PO |
| G2 | PO, TL, SA iOS (co-owners) |
| G3 | SA iOS (pas de profil dev : écart noté) |
| G4 | TL (pas de QA : écart noté) |
| G5 | Data analyst (bonus) |
| G6 | PO (bonus) |

## Votre agenda

Squad 1 : vos horaires servent de référence ; les squads 2, 3 et 4 sont décalées de 5, 10 et 15 minutes.

| Horaire | Relatif | Bloc |
|---|---|---|
| 13h30 – 14h00 | 0:00 – 0:30 | Cadrage commun : accueil, règles, brief Vélora, volets, chapeaux |
| 14h00 – 14h30 | 0:30 – 1:00 | **Discover** : lire le contexte des autres squads, besoin à 5 champs, données, priorité |
| 14h30 – 15h15 | 1:00 – 1:45 | **Design** : constitution → spec → plan → tâches → analyze, contrat v1 publié |
| 15h15 – 15h25 | 1:45 – 1:55 | Pause |
| 15h25 – 16h15 | 1:55 – 2:45 | **Develop** : `/speckit-implement` tâche par tâche · ⚡ un contrat d'une autre squad change pendant ce bloc |
| 16h15 – 16h40 | 2:45 – 3:10 | **Deploy** : déploiement, bascule de flag tracée, KPI et événements publiés |
| 16h40 – 16h55 | 3:10 – 3:25 | **Bonus** (15 min) : Deepen (G5) et Drop (G6), version courte, si le temps le permet |
| 16h55 – 17h30 | 3:25 – 4:00 | Débrief commun : préparation de la démo (10'), démos croisées (5'), rétro du TOM (10'), retour pour le 8 h (10') |

| Gate | Créneau de 5 min | Gate keeper |
|---|---|---|
| G1 · Ready to Spec | **14h25** (0:55) | Produit |
| G2 · Ready to Build | **15h10** (1:40) | Tech |
| G3 · Ready to Release | **16h10** (2:40) | Tech |
| G4 · Released and Observable | **16h35** (3:05) | Run |
| G5, G6 · bonus | dans votre fenêtre de 15 min, de 16h40 à 16h55 | data (G5), produit (G6) |

Règles de coupe : G2 pas passée 10 minutes après son créneau → le Develop devient guidé par le coach. G4 pas passée à 16h55 → la squad prépare sa démo.

Avant chaque créneau : gate-check, puis `node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --check` (depuis le dossier du starter). Après chaque gate : fiche de retour (20 secondes).

## Ce que vous publiez, ce que vous consommez

Le Context Nexus est un dépôt partagé : vous lisez tout, vous n'écrivez que dans `teams/squad-1-offre/`.

**Vous publiez** (v0 écrits par l'animation, v1 à publier avant G2) :

| Fichier | Contenu | Lu par |
|---|---|---|
| `teams/squad-1-offre/contracts/offre-api.md` | Contrat d'API d'offre | Paiement, Expérience, Prix |

**Vous consommez** (versions épinglées au départ) :

| Fichier | Version épinglée | Squad | Pour |
|---|---|---|---|
| `teams/squad-2-prix/contracts/regle-prix.md` | 0.1.0 | Prix | Bornes de prix |
| `programme/late-checkout/knowledge/hotels-pilotes.md` | 1.0.0 | commun | Horaires de départ par hôtel |

Un écart entre votre contrat et celui d'une autre squad se règle **en allant la voir**, pas en modifiant son fichier. Si vous n'y arrivez pas : gate keeper tech (Convergence Arbitrator).

## Ordre de publication · deux contrats-ancres

Les contrats se consomment en chaîne : Prix, puis Offre, puis Paiement, puis Expérience, avec les KPI de Prix en bout de chaîne. Pour que chaque squad puisse épingler la **version actuelle** des contrats qu'elle utilise avant son G2, deux petits contrats sont publiés **tôt**, avant le reste :

| Jalon | Qui publie | Quoi | Avant |
|---|---|---|---|
| M1 | Prix | `regle-prix` v1 (bornes et prix d'un créneau) | 14h55 |
| M2 | Expérience | `evenements-achat` v1 | 15h05 |

Publiez d'abord une v1 courte et claire ; un ajustement ultérieur passe en 1.1.0, annoncé aux squads qui consomment votre contrat. Les jalons s'affichent sur l'écran commun de la salle.

**Pour vous** : vous attendez M1 pour épingler `regle-prix`. Si elle n'est pas publiée à 14h55, allez voir la squad Prix.

## À lire en premier (Discover)

1. `.context/brief.md`, généré par `context-assemble` : tout ce qui suit y est assemblé.
2. `programme/late-checkout/knowledge/brief.md` et `regles-metier.md` : le brief Vélora et les règles RM-01 à RM-08.
3. Votre contrat v0 : `offre-api.md`.
4. Les contrats v0 que vous consommez (tableau ci-dessus), **en entier**.
5. Vos données fictives (remises sur place).

## Spec Kit, adapté à votre volet

Point de départ pour `/speckit-specify` (à réécrire avec votre Business Intent Spec) :

```
/speckit-specify L'API d'offre décide l'éligibilité d'une réservation au late check-out (RM-01 à RM-04) et calcule le prix de chaque créneau à partir des bornes publiées par la squad Prix et des horaires de l'hôtel.
Source : teams/squad-1-offre/intent/business-intent.md. Critères d'acceptance vérifiables par un test,
chacun rattaché à une règle RM-xx ou à un contract (API-xx, SEC-xx, A11Y-xx, ENG-xx).
```

Questions utiles pour `/speckit-clarify` et pour vos échanges avec les autres squads :

- Que répond l'API quand une donnée nécessaire au calcul manque ?
- Quelle heure fait foi pour « la veille 22:00 » : serveur, client ou hôtel ?
- Le prix que vous renvoyez est-il exactement celui que Paiement va débiter et qu'Expérience va afficher ?
- Qu'est-ce qu'Expérience doit pouvoir afficher quand la réservation n'est pas éligible ?

## Les gates de votre squad

| Gate | Livrable | Où dans le Nexus | Vérifié par gate-check | Jugé par le gate keeper |
|---|---|---|---|---|
| **G1** 14h25 | Business Intent Spec | `teams/squad-1-offre/intent/business-intent.md` | 5 champs complets, contexte daté et sourcé | Critère de succès chiffré, données, priorité avec owner |
| **G2** 15h10 | Solution Design Spec | spec publiée dans `intent/specs/` + contrat v1 dans `contracts/` | Critères évaluables, versions épinglées, contrat d'API valide face aux autres squads | NFR chiffrés, DoR, spec « active » avec owner |
| **G3** 16h10 | Code et Test Specs | code et tests dans le starter, spec `active` (pas `stale`) | Lint, tests, couverture, sécurité, spec mise à jour | Revue nommée, criticité, signature humaine en PCI, plan de flags |
| **G4** 16h35 | Runtime Specs | `operations/runbook.md` + `operations/flags-journal.md` | Flag tracé, observabilité, KPI instrumentés, coût en tokens | Owner d'exploitation, runbook, rollback |
| **G5** bonus | Opportunity Spec | `intent/opportunity.md` | Résultats lus sur 30 jours, coût IA compris | Verdict parmi trois, face à la promesse du G1 |
| **G6** bonus | Retirement Spec | `intent/retirement.md` | Carte des dépendances, chaque ligne avec sa disposition | Utilisateurs impactés, porteur de la communication, decision record |

Un no-go renvoie vers l'étape gardée et nomme le critère qui manque. G5 et G6 : en bonus, version courte, sur matériel fourni.

## Points d'attention pour votre squad

- Vous êtes la dépendance de deux squads : publiez votre contrat v1 **et un mock** le plus tôt possible en Design.
- Pas de profil développeur pur : décidez au cadrage qui tient le clavier pendant `/speckit-implement`.

## Commandes de survie

```bash
# Assembler le contexte de la squad (début de chaque bloc, et après toute publication annoncée)
# À lancer depuis le dossier du starter (là où l'on lance claude) ; le Nexus est à ../context-nexus
git -C ../context-nexus pull
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --out .context/brief.md

# Vérifier avant une gate (code retour 1 = quelque chose est stale)
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --check

# Quand un contrat a changé : marquer ses artefacts stale, puis lire le changement
node ../context-nexus/tools/context-assemble.mjs --squad squad-1-offre --mark-stale
git -C ../context-nexus log -p -3 -- teams/

# Publier
git -C ../context-nexus add teams/squad-1-offre
git -C ../context-nexus commit -m "squad-1-offre: publie <artefact> v<version>"
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
