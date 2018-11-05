film = data.frame(
  film_id = integer(),
  film_annee = integer(),
  film_titre = character(),
  film_note =	double(),
  film_note_nb_votant =	integer(),
  film_budget = integer(),
  stringsAsFactors = F
)

note = data.frame(
  note_id = integer(),
  note_valeur	= integer(),
  note_date	= as.Date(character())
)

personne = data.frame(
  personne_id	 = integer(),
  personne_prenom	= character(),
  personne_nom = character(),
  personne_annee_naissance	= integer(),
  personne_annee_deces = integer(),
  stringsAsFactors = F  
)

production = data.frame(
  production_id	= integer(),
  production_nom = character(),
  production_annee_creation = integer(),
  stringsAsFactors = F  
)

genre = data.frame(
  genre_id = integer(),
  genre_libelle = character(),
  stringsAsFactors = F
)

lien = data.frame(
  lien_table_id = integer(),
  lien_film_id = integer(),
  lien_table =  character(),
  stringsAsFactors = F
)