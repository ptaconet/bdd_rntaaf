Modèles conceptuels et physiques de la première version de la base de données (BDD) relationnelle de la [Réserve Naturelle des Terres australes françaises](https://reserves-naturelles.org/reserves/terres-australes-francaises/), développée par Paul Taconet entre les années 2013 et 2015.

La base de données a été développée en SQL sous le SGBD PostgreSQL + PostGIS. Une interface de saisie des données a également été développée en PHP+SQL.

**Ce dépot ne contient pas les données**. Il contient les produits suivants : 

- `bdd_modele_conceptuel/` : Modèle conceptuel de la BDD
- `bdd_modele_physique/` : Modèle physique de la BDD (DUMP SQL)
- `bdd_dictionnaire_de_donnees/` : Dictionnaire de données de la BDD
- `bdd_tutoriels_installation/` :  Documentation technique pour installer et manipuler la BDD
- `interface_saisie_donnees/` : Interface de saisie des données (PHP+SQL)
