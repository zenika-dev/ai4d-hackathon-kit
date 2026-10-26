# Animer · l'écran commun, les verdicts de gate et l'événement scripté

> Pour l'équipe d'animation. Tout se lance depuis le dépôt `context-nexus` cloné sur le poste d'animation, avec Node 20 ou plus.
> L'écran ne lit que le Context Nexus (Git). Il n'a aucun accès aux postes des squads : il ne remplace pas `npm run gate-check`.

## Avant (dimanche soir ou lundi matin)

1. **Poste prêt** : `git -C ../context-nexus pull` fonctionne, et `git push` aussi (droit d'écriture sur le dépôt partagé). Après une répétition, lancez l'écran une fois avec `--reset` : il efface l'historique des changements de contrat qu'il a gardé.
2. **Lancer l'écran** pour vérifier qu'il s'ouvre : `node tools/nexus-board.mjs --pull 10`, puis http://localhost:4000. Quatre squads, des gates à l'état « à venir », le graphe des contrats à jour.
3. **Répéter l'événement sur une copie**, jamais sur le dépôt partagé :
   ```bash
   git clone <url du Context Nexus> /tmp/nexus-repetition && cd /tmp/nexus-repetition
   node tools/event.mjs apply 01-regle-prix-v2 --nexus . --force      # --force : regle-prix n'est pas encore en v1
   node tools/context-assemble.mjs --all                             # Offre et Paiement apparaissent en RUPTURE
   node tools/event.mjs undo 01-regle-prix-v2 --nexus .
   ```
4. **Relire la carte de l'événement** : `node tools/event.mjs card 01-regle-prix-v2`. Le contrat `regle-prix` est celui de la squad Prix : l'événement ne touche que sa ligne `version`, sa ligne `last-validated` et la fin du fichier, pour limiter tout conflit avec son travail.
5. **Essayer la démo d'ouverture** : `node tools/demo-sans-contexte.mjs --squad squad-3-paiement --run` depuis un starter (quelques milliers de tokens).

## Pendant

| Poste | Commande | Adresse |
|---|---|---|
| Écran de la salle (lecture seule) | `node tools/nexus-board.mjs --pull 10` | http://localhost:4000 (plein écran du navigateur : F11) |
| Gate keepers (verdicts et événement) | `node tools/nexus-board.mjs --pull 10 --keeper --push --port 4001` | http://localhost:4001 |

Les écritures (verdicts, événement) ne sont acceptées que depuis le poste qui a lancé `--keeper`. Si l'écran de la salle est un autre poste, ajoutez `--host 0.0.0.0` à son lancement pour que d'autres machines puissent l'ouvrir en lecture.

**Repères du déroulé** (à ajuster à la répétition) :

| Heure | Geste |
|---|---|
| 13h45 | Démo d'ouverture « sans / avec contexte » : même prompt, deux dossiers (`tools/demo-sans-contexte.mjs`) |
| 14h55 | Jalon M1 : `regle-prix` v1 publiée par Prix. Sinon, aller voir la squad |
| 15h05 | Jalon M2 : `evenements-achat` v1 publiés par Expérience. Sinon, aller voir la squad |
| à chaque créneau | Le gate keeper clique sur la gate de la squad, lit les critères, enregistre GO ou NO-GO avec le critère qui manque |
| environ 15h50 | Événement : bouton « Déclencher » du poste des gate keepers, ou `node tools/event.mjs apply 01-regle-prix-v2 --push`. Le bouton ouvre une confirmation qui sépare ce qui se lit à voix haute de ce qui est pour l'animation. Lire la phrase à voix haute, sans la commenter |
| juste après | Regarder l'écran : le contrat passe en rouge, ses consommateurs en ambre, puis la vague gagne Expérience et les KPI quand Offre republie. Le chrono du réalignement tourne |

## Ce que l'écran affiche, et ce qu'il n'affiche pas

- **Il affiche** : l'avancement des gates (verdicts du journal `operations/gates-journal.md` de chaque squad), les versions et statuts des contrats, les écarts d'épinglage, les jalons communs, les publications récentes, le temps de réalignement après un changement.
- **Il n'affiche pas** : les tests, le lint, la couverture, les spec Kit du starter. Ces critères se vérifient sur le poste de la squad (`npm run gate-check -- G2`) et avec le coach.
- **Un verdict de gate est une décision humaine** : l'écran la trace (qui, quand, motif), il ne la rend jamais à la place du gate keeper.

## Si quelque chose casse

| Symptôme | Réflexe |
|---|---|
| Bandeau « Connexion à l'écran perdue » | Relancer la commande de l'écran. L'historique des changements de contrat est conservé |
| Les squads ne voient pas un verdict | Le poste des gate keepers n'a pas pu publier : `git -C ../context-nexus push`, puis `pull` côté squad |
| Conflit Git sur `regle-prix.md` après l'événement | La squad Prix fait `git pull --rebase` et garde sa version en y ajoutant la section « Changement 2.0.0 » ; sinon, plan B : donner la carte à la squad Prix, qui publie elle-même la v2 |
| Plus de réseau | Le coach lit la carte à la squad Prix, qui publie elle-même la v2 (la règle « on n'écrit que chez soi » reste respectée) |

## Réglages

Horaires, créneaux de gate par squad, jalons communs et prompts de démo : `tools/hackathon.config.json`.

Le fuseau (`timezone`, par défaut `Europe/Paris`) fixe l'heure de tous les outils, quel que soit celui de la machine : un Codespace est en UTC, et sans cela le coach de chaque participant aurait une heure d'écart avec l'agenda.
