# Bdd Marvel

Stocker et manipuler des données dans une base de données.

![img_html](./img/marvel.jpeg)

## Contexte du projet

J'envisage de faire créer un site où les utilisateurs devront se connecter pour faire différentes opérations de recherches à propos des films, des acteurs/actrices ou des réalisateurs.  
Par contre, seul l'administrateur pourra ajouter, modifier ou supprimer des données. Pour chaque entrée dans la base de données, il y aura la date de création et de modification.

Mais la partie site web n'est pas pour tout de suite 😃

Avant celà, j'ai besoin d'une base de données afin de stocker des données appartenant à l'Univers Cinématographique Marvel.

## Modalités pédagogiques

### Structure de la base de donnée relationnelle

_Les films_  
Un film comporte un titre, un ou plusieurs acteurs, un réalisateur, une durée et l'année de sa sortie.

_Les acteurs, actrices_  
Nom, prénom, rôle et date de naissance.

_Les réalisateurs_  
Nom et prénom.

_Les utilisateurs_  
Nom, prénom, email, mot de passe, rôle et liste des films préférés.

### Les requêtes

Merci de me fournir ce jeu de requêtes pour tester la bdd :

- les titres et dates de sortie des films du plus récent au plus ancien :

```sql
 SELECT Titre_Films, Date_de_Sortie_Films
FROM Films
ORDER BY Date_de_Sortie_Films ASC;
```

- les noms, prénoms et âges des acteurs ou actrices de plus de 30 ans dans l'ordre alphabétique :

```sql
SELECT Prénom_Acteurs, Nom_Acteurs, TIMESTAMPDIFF(YEAR, Date_de_naissance_Acteurs, CURDATE()) AS Age
FROM Acteurs
WHERE TIMESTAMPDIFF(YEAR, Date_de_naissance_Acteurs, CURDATE()) > 30
ORDER BY Nom_Acteurs, Prénom_Acteurs ASC;
```

- la liste des actrices ou acteurs principaux pour un film donné :

```sql
SELECT Acteurs.Prénom_Acteurs, Acteurs.Nom_Acteurs
FROM Acteurs
JOIN A_joué_dans ON Acteurs.ID_Acteurs_Acteurs = A_joué_dans.ID_Acteurs_Acteurs
JOIN Films ON Films.ID_Films_Films = A_joué_dans.ID_Films_Films
WHERE Films.Titre_Films = 'Iron Man'
```

- la liste des films pour une actrice ou un acteur donné :

```sql
SELECT Films.Titre_Films, Acteurs.*
FROM Acteurs
JOIN A_joué_dans ON Acteurs.ID_Acteurs_Acteurs = A_joué_dans.ID_Acteurs_Acteurs
JOIN Films ON Films.ID_Films_Films = A_joué_dans.ID_Films_Films
WHERE Acteurs.Nom_Acteurs = 'Downey Jr.';
```

- ajouter un film :

```sql
INSERT INTO Films (Titre_Films, Durée_Films, Date_de_Sortie_Films)
VALUES ('Captain America: The First Avenger', '02:04:00', '2011-07-22');
```

- ajouter une actrice ou un acteur :

```sql
INSERT INTO Acteurs (Prénom_Acteurs, Nom_Acteurs, Date_de_naissance_Acteurs)
VALUES ('Chris', 'Evans', '1981-06-13');
```

- modifier un film :

```sql
UPDATE Films
SET Titre_Films = 'Iron Man', Durée_Films = '02:06:10', Date_de_Sortie_Films = '2008-05-02'
WHERE ID_Films_Films = 1;
```

- supprimer une actrice ou un acteur :

```sql
DELETE FROM Acteurs
WHERE Prénom_Acteurs = 'Chris' AND Nom_Acteurs = 'Evans';
```

- afficher les 3 derniers acteurs/actrices ajouté(e)s :

```sql
SELECT Prénom_Acteurs, Nom_Acteurs, Date_de_naissance_Acteurs
FROM Acteurs
ORDER BY ID_Acteurs DESC
LIMIT 3;
```

​

### Contraintes

- utiliser AnalyseSi
- MySQL

## Modalités d'évaluation

Vos requêtes seront executées après avoir importé la bdd dans votre image docker.

## Livrables

Un dépôt GitHub contenant dans l'ordre :

- l'environnement docker
- le dictionnaire de données
- MCD
- MPD
- MLD
- un fichier au format _sql_ (incluant quelques données)
- le jeu de requêtes dans le _README.md_

## Deadline

5 jours.

## Ressources

- environnement docker fourni
- [Comprendre les bases de données](https://www.base-de-donnees.com/comprendre-bases-de-donnees/)
- [Modèle Conceptuel des Données](https://www.base-de-donnees.com/mcd/)

## Authors

- [Nicolas Herbez](https://github.com/nicolas-herbez)
