DROP TABLE IF EXISTS Movies;

CREATE TABLE Movies (
    ID_Movies INT AUTO_INCREMENT NOT NULL,
    Title_Movies VARCHAR(50),
    Actors_Movies VARCHAR(50),
    Directors_Movies VARCHAR(50),
    Duration_Movies TIME,
    Release_Date_Movies DATE,
    PRIMARY KEY (ID_Movies)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Actors;

CREATE TABLE Actors (
    ID_Actors INT AUTO_INCREMENT NOT NULL,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Date_of_Birth DATE,
    PRIMARY KEY (ID_Actors)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Directors;

CREATE TABLE Directors (
    ID_Directors INT AUTO_INCREMENT NOT NULL,
    Last_Name_Directors VARCHAR(50),
    First_Name_Directors VARCHAR(50),
    PRIMARY KEY (ID_Directors)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    ID_Users INT AUTO_INCREMENT NOT NULL,
    Last_Name_Users VARCHAR(50),
    First_Name_Users VARCHAR(50),
    Email_Users VARCHAR(50),
    Password_Users VARCHAR(50),
    Role_Users VARCHAR(50),
    Favorite_Movies_Users VARCHAR(50),
    PRIMARY KEY (ID_Users)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Favorite_Movies;

CREATE TABLE Favorite_Movies (
    ID_Users * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Movies * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_Users, ID_Movies)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Characters;

CREATE TABLE Characters (
    ID_Movies * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Actors * * NOT FOUND * * NOT NULL,
    Role VARCHAR(50),
    PRIMARY KEY (ID_Movies, ID_Actors)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS Movies_Directors;

CREATE TABLE Movies_Directors (
    ID_Movies * * NOT FOUND * * AUTO_INCREMENT NOT NULL,
    ID_Directors * * NOT FOUND * * NOT NULL,
    PRIMARY KEY (ID_Movies, ID_Directors)
) ENGINE = InnoDB;

ALTER TABLE
    Favorite_Movies
ADD
    CONSTRAINT FK_Favorite_Movies_ID_Users FOREIGN KEY (ID_Users) REFERENCES Users (ID_Users);

ALTER TABLE
    Favorite_Movies
ADD
    CONSTRAINT FK_Favorite_Movies_ID_Movies FOREIGN KEY (ID_Movies) REFERENCES Movies (ID_Movies);

ALTER TABLE
    Characters
ADD
    CONSTRAINT FK_Characters_ID_Movies FOREIGN KEY (ID_Movies) REFERENCES Movies (ID_Movies);

ALTER TABLE
    Characters
ADD
    CONSTRAINT FK_Characters_ID_Actors FOREIGN KEY (ID_Actors) REFERENCES Actors (ID_Actors);

ALTER TABLE
    Movies_Directors
ADD
    CONSTRAINT FK_Movies_Directors_ID_Movies FOREIGN KEY (ID_Movies) REFERENCES Movies (ID_Movies);

ALTER TABLE
    Movies_Directors
ADD
    CONSTRAINT FK_Movies_Directors_ID_Directors FOREIGN KEY (ID_Directors) REFERENCES Directors (ID_Directors);