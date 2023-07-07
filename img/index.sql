DROP TABLE IF EXISTS Films;

CREATE TABLE Films (
    ID_Films_Films INT AUTO_INCREMENT NOT NULL,
    Titre_Films VARCHAR(50),
    Durée_Films TIME,
    Date_de_sortie_Films DATE,
    PRIMARY KEY (ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Acteurs;

CREATE TABLE Acteurs (
    ID_Acteurs_Acteurs INT AUTO_INCREMENT NOT NULL,
    Prénom_Acteurs VARCHAR(50),
    Nom_Acteurs VARCHAR(50),
    Date_de_naissance_Acteurs DATE,
    PRIMARY KEY (ID_Acteurs_Acteurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Réalisateurs;

CREATE TABLE Réalisateurs (
    ID_Réalisateurs_Réalisateurs INT AUTO_INCREMENT NOT NULL,
    Nom_Réalisateurs VARCHAR(50),
    Prénom_Réalisateurs VARCHAR(50),
    PRIMARY KEY (ID_Réalisateurs_Réalisateurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Utilisateurs;

CREATE TABLE Utilisateurs (
    ID_Utilisateurs_Utilisateurs INT AUTO_INCREMENT NOT NULL,
    Nom_Utilisateurs VARCHAR(50),
    Prénom_Utilisateurs VARCHAR(50),
    email_Utilisateurs VARCHAR(50),
    Mot_de_passe_Utilisateurs VARCHAR(50),
    Role_Utilisateur_Utilisateurs VARCHAR(50),
    PRIMARY KEY (ID_Utilisateurs_Utilisateurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS A_joué_dans;

CREATE TABLE A_joué_dans (
    ID_Acteurs_Acteurs * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Films_Films * * NOT FOUND * * NOT NULL,
    Role_Acteur_A_joué_dans VARCHAR(50),
    PRIMARY KEY (ID_Acteurs_Acteurs, ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS A_réalisé;

CREATE TABLE A_réalisé (
    ID_Réalisateurs_Réalisateurs * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Films_Films * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_Réalisateurs_Réalisateurs, ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Films_favoris;

CREATE TABLE Films_favoris (
    ID_Films_Films * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Utilisateurs_Utilisateurs * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_Films_Films, ID_Utilisateurs_Utilisateurs)
) ENGINE = InnoDB;

ALTER TABLE
    A_joué_dans
ADD
    CONSTRAINT FK_A_joué_dans_ID_Acteurs_Acteurs FOREIGN KEY (ID_Acteurs_Acteurs) REFERENCES Acteurs (ID_Acteurs_Acteurs);

ALTER TABLE
    A_joué_dans
ADD
    CONSTRAINT FK_A_joué_dans_ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    A_réalisé
ADD
    CONSTRAINT FK_A_réalisé_ID_Réalisateurs_Réalisateurs FOREIGN KEY (ID_Réalisateurs_Réalisateurs) REFERENCES Réalisateurs (ID_Réalisateurs_Réalisateurs);

ALTER TABLE
    A_réalisé
ADD
    CONSTRAINT FK_A_réalisé_ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    Films_favoris
ADD
    CONSTRAINT FK_Films_favoris_ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    Films_favoris
ADD
    CONSTRAINT FK_Films_favoris_ID_Utilisateurs_Utilisateurs FOREIGN KEY (ID_Utilisateurs_Utilisateurs) REFERENCES Utilisateurs (ID_Utilisateurs_Utilisateurs);