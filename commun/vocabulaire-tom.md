# Vocabulaire · une seule source, le TOM

> Les termes du kit, de l'agent, de l'écran commun et des guides suivent le **TOM V1.0**. Quand le TOM ne dit rien, le choix fait est écrit ici, avec sa raison. Règle simple : un seul mot pour une même chose.

## Ce qui vient du TOM

| Terme | Sens | Où on le voit |
|---|---|---|
| **Discover, Design, Develop, Deploy, Deepen, Drop** | Les six phases du cycle | KIT.md, écran commun, `/coach` |
| **G1 Ready to Spec · G2 Ready to Build · G3 Ready to Release · G4 Released and Observable · G5 Opportunity or Retire · G6 Retirement Scoped** | Les six gates | idem |
| **Business Intent Spec · Solution Design Spec · Code + Test Specs · Runtime Specs · Opportunity Spec · Retirement Spec** | La spec produite à chaque phase | gabarits |
| **Knowledge · Purpose · Contracts · Process** | Les quatre registres du Context Nexus | page participants, agent, écran |
| **draft → active → stale → deprecated / superseded** | La vie d'une spec | frontmatter, `context-assemble` |
| **Human · AI-assisted · AI-executed · AI-autonomous** | Qui tient le verdict (le pilote est en AI-assisted) | page participants |
| **Decision Context · Decision Directive** | La décision en deux : la mémoire (Knowledge) et la règle (Purpose) | dossiers `decision-contexts/` et `directives/` |
| **Release ≠ Activation** | Déployer et activer sont deux décisions, toutes deux tracées | G4, journal des flags |
| **Context Engineer · Specification Engineer · Agentic Workflow Orchestrator · Decision Guarantor** | Les quatre chapeaux joués en squad | `/bienvenue`, `/coach` |
| **Evaluation Engineer · Convergence Arbitrator · AgentOps · AI FinOps Lead** | Les quatre responsabilités jouées par l'animation | guides d'animation |

Les noms de chapeaux restent ceux du TOM, en anglais : les participants les ont lus sur la page de préparation.

## Ce que le TOM ne définit pas, et le choix retenu

| Terme | Choix | Pourquoi |
|---|---|---|
| **Intent, Clarify, Design, Decompose, Check, Implement, Converge** | Étiquettes des étapes Spec Kit, avec la commande entre parenthèses : Intent (`/speckit-specify`), Clarify (`/speckit-clarify`), Design (`/speckit-plan`), Decompose (`/speckit-tasks`), Check (`/speckit-analyze`), Implement (`/speckit-implement`), Converge (`/speckit-converge`) | La page de préparation les a déjà enseignées aux participants |
| **Constitution** | Étape 0 : les principes du projet, tirés des règles du Nexus | Écrite dans le vocabulaire de la page participants (« Spec Kit, avec sa Constitution ») |
| **Dossiers `intent/` et `operations/`** | Conservés tels quels dans le dépôt. Ils correspondent aux registres **Purpose** et **Process** | Les renommer en pleine préparation casserait des chemins déjà utilisés. Toute interface (agent, écran, guides) dit Purpose et Process |
| **Gate keeper** | Le profil (produit, tech, run ou data) qui rend le verdict d'une gate | Terme de la page de préparation |
| **Squad, volet** | Une équipe de six, et la partie du sujet qu'elle construit (Offre, Prix, Paiement, Expérience) | Termes du hackathon, hors TOM |
| **Contrat-ancre, jalon commun (M1, M2)** | Contrat publié tôt (`regle-prix` v1, `evenements-achat` v1) pour que chaque squad épingle la version actuelle des contrats qu'elle utilise | Évite une vague de `stale` au G2 avant l'événement scripté |
| **Écran commun** | L'écran de la salle : gates, graphe des contrats, jalons | Hors TOM |
| **Coach** | `/coach`, et la personne qui accompagne la squad à ses gates | Les deux se complètent : l'un lit l'état, l'autre commente les verdicts |
