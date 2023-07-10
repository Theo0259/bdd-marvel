-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : lun. 10 juil. 2023 à 13:04
-- Version du serveur : 8.0.29
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marvel`
--

-- --------------------------------------------------------

--
-- Structure de la table `Acteurs`
--

CREATE TABLE `Acteurs` (
  `ID_Acteurs_Acteurs` int NOT NULL,
  `Prénom_Acteurs` varchar(50) DEFAULT NULL,
  `Nom_Acteurs` varchar(50) DEFAULT NULL,
  `Date_de_naissance_Acteurs` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Acteurs`
--

INSERT INTO `Acteurs` (`ID_Acteurs_Acteurs`, `Prénom_Acteurs`, `Nom_Acteurs`, `Date_de_naissance_Acteurs`) VALUES
(1, 'Robert', 'Downey Jr.', '1965-04-04'),
(2, 'Chris', 'Hemsworth', '1983-08-11'),
(3, 'Tom', 'Holland', '1996-06-01'),
(4, 'Chris', 'Pratt', '1979-06-21');

-- --------------------------------------------------------

--
-- Structure de la table `A_joué_dans`
--

CREATE TABLE `A_joué_dans` (
  `ID_Acteurs_Acteurs` int NOT NULL,
  `ID_Films_Films` int NOT NULL,
  `Role_Acteur_A_joué_dans` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `A_joué_dans`
--

INSERT INTO `A_joué_dans` (`ID_Acteurs_Acteurs`, `ID_Films_Films`, `Role_Acteur_A_joué_dans`) VALUES
(1, 1, 'Tony Stark'),
(1, 5, 'Tony Stark'),
(2, 2, 'Thor'),
(3, 3, 'Peter Parker'),
(4, 4, 'Peter Quill');

-- --------------------------------------------------------

--
-- Structure de la table `A_réalisé`
--

CREATE TABLE `A_réalisé` (
  `ID_Réalisateurs_Réalisateurs` int NOT NULL,
  `ID_Films_Films` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `A_réalisé`
--

INSERT INTO `A_réalisé` (`ID_Réalisateurs_Réalisateurs`, `ID_Films_Films`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Films`
--

CREATE TABLE `Films` (
  `ID_Films_Films` int NOT NULL,
  `Titre_Films` varchar(50) DEFAULT NULL,
  `Durée_Films` time DEFAULT NULL,
  `Date_de_sortie_Films` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Films`
--

INSERT INTO `Films` (`ID_Films_Films`, `Titre_Films`, `Durée_Films`, `Date_de_sortie_Films`) VALUES
(1, 'Iron Man', '02:06:00', '2008-05-02'),
(2, 'Thor: Ragnarok', '02:10:00', '2017-11-03'),
(3, 'Spider-Man: Homecoming', '02:13:00', '2017-07-07'),
(4, 'Guardians of the Galaxy', '02:01:00', '2014-08-01'),
(5, 'Avengers: Endgame', '03:01:00', '2019-04-26');

-- --------------------------------------------------------

--
-- Structure de la table `Films_favoris`
--

CREATE TABLE `Films_favoris` (
  `ID_Films_Films` int NOT NULL,
  `ID_Utilisateurs_Utilisateurs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Films_favoris`
--

INSERT INTO `Films_favoris` (`ID_Films_Films`, `ID_Utilisateurs_Utilisateurs`) VALUES
(5, 1),
(1, 2),
(1, 3),
(4, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Réalisateurs`
--

CREATE TABLE `Réalisateurs` (
  `ID_Réalisateurs_Réalisateurs` int NOT NULL,
  `Nom_Réalisateurs` varchar(50) DEFAULT NULL,
  `Prénom_Réalisateurs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Réalisateurs`
--

INSERT INTO `Réalisateurs` (`ID_Réalisateurs_Réalisateurs`, `Nom_Réalisateurs`, `Prénom_Réalisateurs`) VALUES
(1, 'Favreau', 'Jon'),
(2, 'Waititi', 'Taika'),
(3, 'Watts', 'Jon'),
(4, 'Gunn', 'James'),
(5, 'Russo', 'Anthony'),
(6, 'Russo', 'Joe');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `ID_Utilisateurs_Utilisateurs` int NOT NULL,
  `Nom_Utilisateurs` varchar(50) DEFAULT NULL,
  `Prénom_Utilisateurs` varchar(50) DEFAULT NULL,
  `email_Utilisateurs` varchar(50) DEFAULT NULL,
  `Mot_de_passe_Utilisateurs` varchar(50) DEFAULT NULL,
  `Role_Utilisateur_Utilisateurs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`ID_Utilisateurs_Utilisateurs`, `Nom_Utilisateurs`, `Prénom_Utilisateurs`, `email_Utilisateurs`, `Mot_de_passe_Utilisateurs`, `Role_Utilisateur_Utilisateurs`) VALUES
(1, 'DE WULF', 'Théo', 'td@gmail.com', '1234', 'admin'),
(2, 'DELECROIX', 'Alexis', 'da@gmail.com', '12345', 'user'),
(3, 'SERIN', 'Charles', 'sc@gmail.com', '123456', 'user'),
(4, 'FRANCOIS', 'Jean-Pierre', 'fjp@gmail.com', '1234567', 'user'),
(5, 'BOURHAN', 'Dane', 'bd@gmail.com', '12345678', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Acteurs`
--
ALTER TABLE `Acteurs`
  ADD PRIMARY KEY (`ID_Acteurs_Acteurs`);

--
-- Index pour la table `A_joué_dans`
--
ALTER TABLE `A_joué_dans`
  ADD PRIMARY KEY (`ID_Acteurs_Acteurs`,`ID_Films_Films`),
  ADD KEY `FK_A_joué_dans_ID_Films_Films` (`ID_Films_Films`);

--
-- Index pour la table `A_réalisé`
--
ALTER TABLE `A_réalisé`
  ADD PRIMARY KEY (`ID_Réalisateurs_Réalisateurs`,`ID_Films_Films`),
  ADD KEY `FK_A_réalisé_ID_Films_Films` (`ID_Films_Films`);

--
-- Index pour la table `Films`
--
ALTER TABLE `Films`
  ADD PRIMARY KEY (`ID_Films_Films`);

--
-- Index pour la table `Films_favoris`
--
ALTER TABLE `Films_favoris`
  ADD PRIMARY KEY (`ID_Films_Films`,`ID_Utilisateurs_Utilisateurs`),
  ADD KEY `FK_Films_favoris_ID_Utilisateurs_Utilisateurs` (`ID_Utilisateurs_Utilisateurs`);

--
-- Index pour la table `Réalisateurs`
--
ALTER TABLE `Réalisateurs`
  ADD PRIMARY KEY (`ID_Réalisateurs_Réalisateurs`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`ID_Utilisateurs_Utilisateurs`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Acteurs`
--
ALTER TABLE `Acteurs`
  MODIFY `ID_Acteurs_Acteurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `A_joué_dans`
--
ALTER TABLE `A_joué_dans`
  MODIFY `ID_Acteurs_Acteurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `A_réalisé`
--
ALTER TABLE `A_réalisé`
  MODIFY `ID_Réalisateurs_Réalisateurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Films`
--
ALTER TABLE `Films`
  MODIFY `ID_Films_Films` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Films_favoris`
--
ALTER TABLE `Films_favoris`
  MODIFY `ID_Films_Films` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Réalisateurs`
--
ALTER TABLE `Réalisateurs`
  MODIFY `ID_Réalisateurs_Réalisateurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `ID_Utilisateurs_Utilisateurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `A_joué_dans`
--
ALTER TABLE `A_joué_dans`
  ADD CONSTRAINT `FK_A_joué_dans_ID_Acteurs_Acteurs` FOREIGN KEY (`ID_Acteurs_Acteurs`) REFERENCES `Acteurs` (`ID_Acteurs_Acteurs`),
  ADD CONSTRAINT `FK_A_joué_dans_ID_Films_Films` FOREIGN KEY (`ID_Films_Films`) REFERENCES `Films` (`ID_Films_Films`);

--
-- Contraintes pour la table `A_réalisé`
--
ALTER TABLE `A_réalisé`
  ADD CONSTRAINT `FK_A_réalisé_ID_Films_Films` FOREIGN KEY (`ID_Films_Films`) REFERENCES `Films` (`ID_Films_Films`),
  ADD CONSTRAINT `FK_A_réalisé_ID_Réalisateurs_Réalisateurs` FOREIGN KEY (`ID_Réalisateurs_Réalisateurs`) REFERENCES `Réalisateurs` (`ID_Réalisateurs_Réalisateurs`);

--
-- Contraintes pour la table `Films_favoris`
--
ALTER TABLE `Films_favoris`
  ADD CONSTRAINT `FK_Films_favoris_ID_Films_Films` FOREIGN KEY (`ID_Films_Films`) REFERENCES `Films` (`ID_Films_Films`),
  ADD CONSTRAINT `FK_Films_favoris_ID_Utilisateurs_Utilisateurs` FOREIGN KEY (`ID_Utilisateurs_Utilisateurs`) REFERENCES `Utilisateurs` (`ID_Utilisateurs_Utilisateurs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
