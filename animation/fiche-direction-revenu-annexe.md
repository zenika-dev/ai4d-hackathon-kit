# Je joue la Direction Revenu Annexe

> Pour le **coach de chaque squad**, qui joue la cliente du projet pendant le Discover.
> **À valider par l'animation** : les chiffres sont fictifs ; ils servent à ce que les quatre squads reçoivent exactement les mêmes réponses.
> Version cherchable : onglet « Direction Revenu » de `animation/fiche-accompagnateur.html`.

## Qui est-elle, et que répond-elle

La Direction Revenu Annexe de Vélora vend tout ce qui n'est pas la nuit d'hôtel (petit-déjeuner, parking… et le late check-out). Elle a écrit le brief. Elle ne répond **qu'à ce qui est sa décision pour ce projet** : son ambition chiffrée, l'horizon de mesure et la priorité.

Tout le reste a une autre source, et c'est ce que le Discover fait apprendre :

| On vous demande… | Vous répondez |
|---|---|
| Un fait, une règle, une décision déjà prise (prix TTC, hôtel complet, prévision d'occupation, remboursement, affichage…) | « C'est dans le Context Nexus : `decisions-deja-prises.md`, les règles métier ou le contrat de la squad concernée. Demandez à Claude de le lire. » |
| Un choix que la squad doit faire (son seuil engagé, l'owner, ce qu'elle ne fait pas, un choix de conception) | « C'est à vous de le décider et de le signer : proposez-moi quelque chose. » |
| Une information que personne n'a | « Je ne l'ai pas : écrivez-le "à confirmer". » |

Ne répondez qu'aux questions posées, annoncez la casquette (« je vous réponds en tant que Direction Revenu Annexe »), ne signez jamais un G1 par gentillesse.

## Les réponses (les seules)

| Si on demande… | Réponse |
|---|---|
| Que voulez-vous, au fond ? | Augmenter le revenu annexe en vendant le late check-out en ligne, après la réservation, sur le site et dans l'app, au lieu de le laisser à la réception au cas par cas. |
| Quel succès visez-vous ? Quel chiffre ? | « Au moins **3,00 €** de revenu LCO par réservation éligible. » |
| Quel taux d'achat (`attach_rate`) ? | « **8 %** des réservations éligibles me conviendraient ; **en dessous de 5 %**, je ne vois pas l'intérêt. » La squad choisit son seuil et le signe. |
| Quel passage de la tuile à l'achat (`tile_to_purchase`) ? | « **Autour de 12 %** me paraît réaliste. » |
| Sur quelle période, quel périmètre ? | **30 jours** après l'activation, sur les **5 hôtels pilotes**. |
| Pourquoi maintenant ? Quelle priorité ? | Le revenu se perd aujourd'hui à la réception, sans trace : c'est la priorité du trimestre. Hors périmètre : les autres services annexes et les autres hôtels. |
| Qui valide ces chiffres ? Qui est owner ? | « Moi pour l'ambition : citez-moi comme source. L'owner de votre intention, c'est un membre de votre squad. » |

## L'événement du Develop (à ne pas annoncer avant l'heure)

Vers 15h50, le coach lit : *« Le plafond du supplément ne sera plus un montant fixe : ce sera un pourcentage du tarif de la nuit de l'hôtel. »* Le contrat `regle-prix` passe en 2.0.0 et un nouveau référentiel apparaît (`tarifs-nuit-pilotes`). Ne donner aucun détail : la squad lit le contrat.
