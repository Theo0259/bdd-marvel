-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 07 juil. 2023 à 08:45
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

-- --------------------------------------------------------

--
-- Structure de la table `A_joué_dans`
--

CREATE TABLE `A_joué_dans` (
  `ID_Acteurs_Acteurs` int NOT NULL,
  `ID_Films_Films` int NOT NULL,
  `Role_Acteur_A_joué_dans` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `A_réalisé`
--

CREATE TABLE `A_réalisé` (
  `ID_Réalisateurs_Réalisateurs` int NOT NULL,
  `ID_Films_Films` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `Films_favoris`
--

CREATE TABLE `Films_favoris` (
  `ID_Films_Films` int NOT NULL,
  `ID_Utilisateurs_Utilisateurs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Réalisateurs`
--

CREATE TABLE `Réalisateurs` (
  `ID_Réalisateurs_Réalisateurs` int NOT NULL,
  `Nom_Réalisateurs` varchar(50) DEFAULT NULL,
  `Prénom_Réalisateurs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  MODIFY `ID_Acteurs_Acteurs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `A_joué_dans`
--
ALTER TABLE `A_joué_dans`
  MODIFY `ID_Acteurs_Acteurs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `A_réalisé`
--
ALTER TABLE `A_réalisé`
  MODIFY `ID_Réalisateurs_Réalisateurs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Films`
--
ALTER TABLE `Films`
  MODIFY `ID_Films_Films` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Films_favoris`
--
ALTER TABLE `Films_favoris`
  MODIFY `ID_Films_Films` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Réalisateurs`
--
ALTER TABLE `Réalisateurs`
  MODIFY `ID_Réalisateurs_Réalisateurs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `ID_Utilisateurs_Utilisateurs` int NOT NULL AUTO_INCREMENT;

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
