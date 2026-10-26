# Les bases en 5 minutes · Hackathon Champions du 26/10

> À lire avant lundi. Rien à préparer sur le fond : tout le reste s'apprend en faisant.
> Lundi 26 octobre 2026, **13 h 30 à 17 h 30** (installation à partir de 12 h 30).

## 1. Ce qu'on vient faire

Pratiquer le **PDLC** (6 phases, 6 gates) et le **SDD** (Spec-Driven Development, avec Spec Kit et un contexte partagé)
de bout en bout, en 4 h, sur un use case fictif : le **late check-out à la carte chez Vélora Hôtels**.
Quatre squads, quatre volets qui dépendent les uns des autres.

Vous vivez ici le déroulé que vous retrouverez aux hackathons de 8 h (29/10, 03/11, 06/11, 16/11),
**dans votre équipe, comme référents** de ce déroulé.

## 2. Les gates : G1 à G4 pour tous, G5 et G6 en bonus

| Phase | Gate | On sort avec | Keeper |
|---|---|---|---|
| Discover | **G1** Ready to Spec | Business Intent Spec : besoin à 5 champs, critère de succès chiffré | produit |
| Design | **G2** Ready to Build | Spec, plan, tâches, **contrat v1 publié** et aligné avec les autres squads | tech |
| Develop | **G3** Ready to Release | Code, tests, spec à jour (`active`, pas `stale`) | tech |
| Deploy | **G4** Released and Observable | Flag tracé, KPI instrumentés, runbook, rollback | run |
| Deepen | **G5** Opportunity or Retire · *bonus* | Verdict sur 30 jours de télémétrie | data |
| Drop | **G6** Retirement Scoped · *bonus* | Retrait de l'ancien processus cadré | produit |

Une gate, c'est un créneau de 5 minutes avec un gate keeper, en présence de votre coach qui commente à voix haute
le go ou le no-go. Avant le créneau, la squad lance le **gate-check** automatique. Un no-go renvoie vers l'étape et nomme le critère qui manque.

**Pas de piège caché.** Un seul événement est scripté : **un contrat d'une autre squad change pendant le Develop.**

## 3. Spec Kit en 7 commandes

Spec Kit (GitHub) fait passer l'agent de « code d'abord » à « spec d'abord ». Dans Claude Code :

| Commande | Ce qu'elle produit | Chapeau qui tient la plume |
|---|---|---|
| `/speckit-constitution` | Les principes non négociables du projet (`.specify/memory/constitution.md`) | Context Engineer |
| `/speckit-specify` | La spec fonctionnelle : le **quoi** et le **pourquoi**, pas le comment | Specification Engineer |
| `/speckit-clarify` | Les questions que la spec laisse ouvertes, et vos réponses | toute la squad |
| `/speckit-plan` | Le plan technique, le modèle de données, les **contrats d'API** | Specification Engineer + Orchestrator |
| `/speckit-tasks` | La liste ordonnée des tâches, testables une à une | Orchestrator |
| `/speckit-analyze` | La cohérence spec / plan / tâches / constitution | Decision Guarantor relit |
| `/speckit-implement` | Le code, tâche par tâche | l'agent, piloté par l'Orchestrator |

La version installée ajoute deux commandes facultatives : `/speckit-checklist` (grilles de qualité de la spec) et `/speckit-converge` (réaligner spec, plan et code).

Règle d'or : **l'agent rédige, un humain relit et signe**. Une spec que personne n'a relue n'est pas une spec.

## 4. Le Context Nexus en 4 registres

Le Context Nexus est le contexte **partagé** que lisent les humains et les agents. Il est découpé en 4 registres :

| Registre | Question | Exemple dans le dry run |
|---|---|---|
| **Knowledge** | Ce qu'on sait | Brief, glossaire, horaires des hôtels pilotes |
| **Purpose** (dossier `intent/`) | Ce qu'on veut | Votre Business Intent Spec, vos specs Spec Kit |
| **Contracts** | Ce qu'on exige (vérifiable) | Contrats d'API, règle de prix, règles PCI |
| **Process** (dossier `operations/`) | Ce qu'on fait | Runbook, journal de flags |

Trois niveaux hérités : `org/` (Vélora) → `programme/` (late check-out) → `teams/<votre-squad>/`.
Un niveau peut **étendre** son parent, jamais le contredire sans exception déclarée et approuvée.

Chaque fichier a un **statut** : `draft` → `active` → `stale` (une dépendance a changé) → `active` (revalidé).
Et chaque dépendance est **épinglée** : `consumes: [teams/squad-2-prix/contracts/regle-prix.md@0.1.0]`.

Le **Context Assembler** (ici le script `context-assemble`) construit, pour votre tâche, le paquet de contexte
que reçoit l'agent : règles, contrats, specs, contrats des autres squads en version épinglée. Il détecte aussi ce qui est devenu `stale`.

Pendant le dry run, le Nexus est simulé par un dépôt Git partagé. Le Nexus de production démarre le 27/10.

## 5. Les chapeaux

Quatre chapeaux joués en squad, un par champion, répartis au cadrage (0:00 à 0:30) :

| Chapeau | Ce qu'il fait au dry run | Profil proposé |
|---|---|---|
| **Context Engineer** | Lit les contrats des autres squads, publie celui de la squad, tient `context-assemble` et les épinglages à jour | profil data, Scrum Master ou UX |
| **Specification Engineer** | Écrit la spec, le plan et le contrat | PO (le designer en squad 4) |
| **Agentic Workflow Orchestrator** | Règle et lance les agents sur les tâches, surveille le budget de tokens | architecte ou développeur |
| **Decision Guarantor** | Signe chaque gate, tranche les exceptions (dont la signature PCI) | Tech Lead (un architecte en squad 4) |

Quatre autres responsabilités sont jouées par l'animation, pour que vous les voyiez en action :

| Responsabilité | Qui | Quand l'appeler |
|---|---|---|
| Evaluation Engineer | équipe Zenika (support) | grilles et gate-check |
| Convergence Arbitrator | gate keeper tech | conflit de contrat que deux squads n'arrivent pas à régler entre elles |
| AgentOps | le support technique Zenika | agent, Spec Kit, CI, clés, dépôt partagé en panne |
| AI FinOps Lead | les greffiers | ils relèvent les tokens et le coût IA |

## 6. Votre retour : 20 secondes par gate, 2 minutes en fin de session

- **Après une gate** : votre squad, la gate passée, les critères étaient-ils clairs, en partie clairs, flous ? Si flous : lequel (facultatif).
- **En fin de session** : le format (rythme, cadrage, gates de 5 minutes, kit), le TOM (critères, chapeaux, contexte partagé),
  et « saurai-je expliquer ce déroulé à mon équipe au 8 h ? ». Deux lignes libres facultatives.

Rien à rédiger. Lecture par squad, jamais par individu.

## 7. Les 5 règles du jeu

1. On lit le contexte des autres **avant** d'écrire le sien.
2. On n'écrit que dans le dossier de sa squad. Un désaccord sur le contrat d'une autre squad se règle en allant la voir.
3. On publie tôt : un contrat v1 imparfait publié vaut mieux qu'un contrat parfait gardé pour soi.
4. Un contrat va changer pendant le Develop. C'est voulu : c'est le moment où le Nexus montre son intérêt.
5. Bloqué plus de 5 minutes sur l'outillage : on lève la main.
