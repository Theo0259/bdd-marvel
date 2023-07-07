DROP TABLE IF EXISTS Films;

CREATE TABLE Films (
    ID_Films_Films INT AUTO_INCREMENT NOT NULL,
    Titre_Films VARCHAR(50),
    Dur � e_Films TIME,
    Date_de_sortie_Films DATE,
    PRIMARY KEY (ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Acteurs;

CREATE TABLE Acteurs (
    ID_Acteurs_Acteurs INT AUTO_INCREMENT NOT NULL,
    Pr � nom_Acteurs VARCHAR(50),
    Nom_Acteurs VARCHAR(50),
    Date_de_naissance_Acteurs DATE,
    PRIMARY KEY (ID_Acteurs_Acteurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS R � alisateurs;

CREATE TABLE R � alisateurs (
    ID_R � alisateurs_R � alisateurs INT AUTO_INCREMENT NOT NULL,
    Nom_R � alisateurs VARCHAR(50),
    Pr � nom_R � alisateurs VARCHAR(50),
    PRIMARY KEY (ID_R � alisateurs_R � alisateurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Utilisateurs;

CREATE TABLE Utilisateurs (
    ID_Utilisateurs_Utilisateurs INT AUTO_INCREMENT NOT NULL,
    Nom_Utilisateurs VARCHAR(50),
    Pr � nom_Utilisateurs VARCHAR(50),
    email_Utilisateurs VARCHAR(50),
    Mot_de_passe_Utilisateurs VARCHAR(50),
    Role_Utilisateur_Utilisateurs VARCHAR(50),
    PRIMARY KEY (ID_Utilisateurs_Utilisateurs)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS A_jou � _dans;

CREATE TABLE A_jou � _dans (
    ID_Acteurs_Acteurs * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Films_Films * * NOT FOUND * * NOT NULL,
    Role_Acteur_A_jou � _dans VARCHAR(50),
    PRIMARY KEY (ID_Acteurs_Acteurs, ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS A_r � alis �;

CREATE TABLE A_r � alis � (
    ID_R � alisateurs_R � alisateurs * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Films_Films * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_R � alisateurs_R � alisateurs, ID_Films_Films)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Films_favoris;

CREATE TABLE Films_favoris (
    ID_Films_Films * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Utilisateurs_Utilisateurs * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_Films_Films, ID_Utilisateurs_Utilisateurs)
) ENGINE = InnoDB;

ALTER TABLE
    A_jou � _dans
ADD
    CONSTRAINT FK_A_jou � _dans_ID_Acteurs_Acteurs FOREIGN KEY (ID_Acteurs_Acteurs) REFERENCES Acteurs (ID_Acteurs_Acteurs);

ALTER TABLE
    A_jou � _dans
ADD
    CONSTRAINT FK_A_jou � _dans_ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    A_r � alis �
ADD
    CONSTRAINT FK_A_r � alis � _ID_R � alisateurs_R � alisateurs FOREIGN KEY (ID_R � alisateurs_R � alisateurs) REFERENCES R � alisateurs (ID_R � alisateurs_R � alisateurs);

ALTER TABLE
    A_r � alis �
ADD
    CONSTRAINT FK_A_r � alis � _ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    Films_favoris
ADD
    CONSTRAINT FK_Films_favoris_ID_Films_Films FOREIGN KEY (ID_Films_Films) REFERENCES Films (ID_Films_Films);

ALTER TABLE
    Films_favoris
ADD
    CONSTRAINT FK_Films_favoris_ID_Utilisateurs_Utilisateurs FOREIGN KEY (ID_Utilisateurs_Utilisateurs) REFERENCES Utilisateurs (ID_Utilisateurs_Utilisateurs);