# Importation et remaniement des données


# Etape 1 : Importation des données brutes --------------------------------
snake <- read("data/bandy_exp_data.csv")
# Etape 2 : Description brève des données ---------------------------------
skimr::skim(snake)
# Etape 3 : Nettoyage des données  ----------------------------------------
#Nous avons échantillonné les données car le jeu de données de base était trop volumineux
set.seed(456)
snake200 <- snake[sample(1:nrow(snake),200), ]

#Description brève des données remaniées
skimr::skim(snake200)
# Etape 4 : Ajout des labels et des unités --------------------------------
snake200 <- labelise(snake,
  label = list(
    experiment = "Type d'expérience",
    date = "Date de l'expérience",
    adult_source = "Source de provenance de l'adulte", 
    adult_ID = "Identité de l'adulte", 
    adult_mass_g = "Masse de l'adulte", 
    adult_svl_cm = "Distance museau-cloaque chez l'adulte", 
    adult_sex = "Sexe de l'adulte", 
    hatchling_source = "Source de provenance du jeune", 
    prey_species = "Espèce de la proie", 
    juvenile_ID = "Identité du jeune", 
    juvenile_mass_g = "Masse du jeune", 
    juvenile_svl_cm = "Distance museau-cloaque chez le jeune",
    juvenile_sex = "Sexe du jeune", 
    pattern = "Type de patterne",
    painted = "Peint", 
    pred_attempt = "Tentative de prédation", 
    pred_attempt_bin = "Tentative de prédation (binaire)", 
    time_to_attack_s = "Temps avant l'attaque"
  ),
  units = list(
    adult_mass_g = "g", 
    adult_svl_cm = "cm", 
    juvenile_mass_g = "g", 
    juvenile_svl_cm = "cm", 
    time_to_attack_s = "s"
  ))


# Etape 5 : Sauvegarde locale des données retravaillées -------------------
write$rds(snake200, "data/snake.rds")
