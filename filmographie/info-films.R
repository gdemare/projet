library(jsonlite)
library(lubridate)
library(dplyr)

setwd(dir = "C:/Users/moi/Downloads/")
pop = read.csv(file = "films.csv", sep =";")

for( i in 305:nrow(pop) ){
print(i)

moviedb.id = pop$themoviedb_id[i]
key = 'd1bb84ad49074f4558d65865a41387ca'
requeteFilm = paste('https://api.themoviedb.org/3/movie/', moviedb.id,'?api_key=', key, sep = "")
requetePers = paste('https://api.themoviedb.org/3/movie/', moviedb.id, '/credits', '?api_key=', key,  sep = "")


requeteFilm = fromJSON(requeteFilm)
requetePers = fromJSON(requetePers)

###### Film
leFilm = data.frame(
            film_id = requeteFilm$id,
            film_annee = year(requeteFilm$release_date), 
            film_titre = as.character(requeteFilm$original_title), 
            film_note  = requeteFilm$vote_average,
            film_note_nb_votant = requeteFilm$vote_count,
            film_budget = requeteFilm$budget,
            stringsAsFactors = F
          )
filmAjout = leFilm %>%
            anti_join(film, by = c( "film_id"  = "film_id"))
film = film %>% bind_rows(filmAjout)

##### Note
noteAjout = data.frame(
                  note_id =  i,
                  note_valeur = pop$note[i],
                  note_date = as.Date(pop$date_ajout[i], '%d/%m/%y')
                )

note = note %>% bind_rows(noteAjout)

noteFilmAjout = noteAjout %>% transmute( lien_table_id = i, lien_film_id = requeteFilm$id, lien_table = "note")

lien = lien %>% bind_rows(noteFilmAjout)

###### Genres
lesGenres = requeteFilm$genres
genreAjout = lesGenres %>% 
            anti_join(genre, by = c( "id"  = "genre_id")) %>%
            transmute( genre_id = id, genre_libelle = name)
genre = genre %>% bind_rows(genreAjout)

genreFilmAjout = lesGenres %>% 
                  transmute( lien_table_id = id, lien_film_id = requeteFilm$id, lien_table = "genre")

lien = lien %>% bind_rows(genreFilmAjout)

Sys.sleep(1)
}
##### Acteurs
# lesActeurs = requetePers$cast %>% filter(cast_id>4)
# lesActeurs = fromJSON("/person/person id")

##### équipe technique
# requetePers$crew 
# id 
# department = Directing, Writing
