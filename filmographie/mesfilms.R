setwd(dir = "C:/Users/moi/Downloads/")
film = read.csv(file = "film.csv", sep =";")

# connection à the movie database
# /discover
# /find
# /search
library(jsonlite)
key = 'd1bb84ad49074f4558d65865a41387ca'
api = paste('https://api.themoviedb.org/3/search/movie/?api_key=', key , "&query=", sep = "")

film$titre = gsub(" ", "+", film$TITRE_ORGINAL)
film$requete = paste(api,film$titre, sep = "")

#recupérer l'id des films
library("lubridate")
film$moviedb.id = NA
for( i in 1:nrow(film) ){
  print(i)
  # rechercher sur the movie db
  requete = film$requete[i]
  resultat = fromJSON(requete)
  
  # ajout de l'id
  if( resultat$total_results!=0 ){
    calendrier = ifelse(resultat$results$release_date == "", "3000-01-01", resultat$results$release_date)
    
    if( resultat$total_results==1 ){  
      film$moviedb.id[i] = resultat$results$id
    }
    else if( sum(year(calendrier)==film$ANNEE[i]) == 1 ){
      num = which( year(calendrier) == film$ANNEE[i] )
      film$moviedb.id[i] = resultat$results$id[num]
    }
  }
  Sys.sleep(0.2)
}

film$titre_db = NA
# recuperer le titre
film$requetefilm = paste('https://api.themoviedb.org/3/movie/', film$moviedb.id,'?api_key=', key, sep = "")
for( i in 1:nrow(film) ){
  print(i)
  if( !is.na(film$moviedb.id[i]) ){
    requete = fromJSON(film$requetefilm[i])
    film$titre_db[i] = requete$title
    Sys.sleep(0.2)
  }
}

# exporter
write.csv(x = film, file = "film_nv.csv", na = "")
