# Contexte

Il y a plus de trois ans. J'ai créé un fichier Excel avec les films que j'ai regardé et je l'ai noté sur une échelle de 5. 

# Enjeux 

Créer une base de données avec les films que j'ai visionné et la base de donnée de the movie database.
Identifier les facteurs qui
Prédire les films suseptibles de me plaire.

# Objectifs

Trouver une corresponance avec mon fichier et la base données de The movie database avec l'API.
Construire un tableau de bord R shiny.
Modèliser la variable note.

### Présentation des tables

film

| champ | type |
|---|---|
| film_id | integer |
| film_annee | integer |
| film_titre | caratère |
| film_note | double | 
| film_note_nb_votant | integer |
| film_budget | integer |

production

| champ | type |
|---|---|
| production_id | integer |
| production_nom | caractère |
| production_date_creation | date |

note

| champ | type |
|---|---|
| note_id | integer |
| note_note | integer |
| note_date | date |

personne 

| champ | type |
|---|---|
| personne_id | integer |
| personne_prenom | caractère |
| personne_nom | caractère |
| personne_date_naissance | date |
| personne_date_deces | date |

genre 

| champ | type |
|---|---|
| genre_id | integer |
| genre_libelle | cractère |
