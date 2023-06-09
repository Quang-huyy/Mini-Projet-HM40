-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 juin 2022 à 13:49
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `proeducationback`
--

-- --------------------------------------------------------

--
-- Structure de la table `annee_scolaires`
--

CREATE TABLE `annee_scolaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annee_scolaires`
--

INSERT INTO `annee_scolaires` (`id`, `annee`, `date_debut`, `date_fin`, `created_at`, `updated_at`) VALUES
(2, '2021-2022', '2021-09-15', '2022-06-01', '2022-05-22 00:55:19', '2022-05-22 01:34:44'),
(8, '2018-2019', '2018-09-15', '2019-06-24', '2022-05-24 10:09:38', '2022-05-24 10:09:38');

-- --------------------------------------------------------

--
-- Structure de la table `bulletins`
--

CREATE TABLE `bulletins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `eleve_id` bigint(20) UNSIGNED NOT NULL,
  `total` double(8,2) DEFAULT NULL,
  `totalCoef` double(8,2) DEFAULT NULL,
  `moy` double(8,2) DEFAULT NULL,
  `mention` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rang` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `moyAnn` double(8,2) DEFAULT NULL,
  `rangAnn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bulletins`
--

INSERT INTO `bulletins` (`id`, `groupe_id`, `session_id`, `eleve_id`, `total`, `totalCoef`, `moy`, `mention`, `rang`, `created_at`, `updated_at`, `moyAnn`, `rangAnn`) VALUES
(63, 4, 2, 2, 212.18, 15.00, 14.15, 'Mention bien', 1, '2022-06-24 18:56:25', '2022-06-24 18:56:25', NULL, NULL),
(67, 4, 4, 2, 18.00, 15.00, 1.20, NULL, 1, '2022-06-24 20:16:51', '2022-06-24 20:16:51', 5.52, 1);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier_id` bigint(20) UNSIGNED NOT NULL,
  `enseignant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `libelle`, `description`, `fichier_id`, `enseignant_id`, `created_at`, `updated_at`) VALUES
(2, 'laravel', 'laravel 8', 6, 2, '2022-05-30 02:42:49', '2022-05-30 02:42:49'),
(5, 'angular', 'angular 13', 33, 2, '2022-06-24 06:28:20', '2022-06-24 06:28:20');

-- --------------------------------------------------------

--
-- Structure de la table `cours_groupes`
--

CREATE TABLE `cours_groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cours_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours_groupes`
--

INSERT INTO `cours_groupes` (`id`, `cours_id`, `groupe_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, NULL, NULL),
(3, 2, 4, NULL, NULL),
(6, 5, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `eleve_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `seance_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `margeRetard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `disciplines`
--

INSERT INTO `disciplines` (`id`, `session_id`, `eleve_id`, `date`, `seance_id`, `type`, `margeRetard`, `created_at`, `updated_at`) VALUES
(15, 2, 2, '2021-11-01', 7, 'Absent(e)', NULL, '2022-06-01 22:59:58', '2022-06-01 22:59:58'),
(16, 2, 2, '2021-12-03', 26, 'Absent(e)', NULL, '2022-06-02 14:09:50', '2022-06-02 14:09:50'),
(18, 2, 2, '2022-05-31', 7, 'Retard', '12 min', '2022-06-03 12:57:27', '2022-06-03 12:57:27');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE `eleves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNais` date NOT NULL,
  `lieuNais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `img`, `nom`, `prenom`, `sexe`, `dateNais`, `lieuNais`, `nationalite`, `adresse`, `matricule`, `parentt_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1653569146.jpg', 'laarif', 'amal', 'Femme', '2002-07-23', 'sousse', 'tunisienne', '8 rue tanja akouda sousse', 'ProEducation001', 3, 9, '2022-05-26 11:45:46', '2022-05-26 11:45:46'),
(5, 'eleve_1653880805_1653881173.jpg', 'souguir', 'omar', 'Homme', '2010-08-16', 'sousse', 'tunisienne', 'SAHLOUL', 'ProEducation004', 5, 15, '2022-05-30 02:26:14', '2022-05-30 02:26:14'),
(9, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1656055436_1656055506.jpg', 'laarif', 'aya', 'Femme', '2001-03-15', 'sousse', 'tunisienne', '8 rue tanja akouda sousse', 'ProEducation002', 3, 33, '2022-06-24 06:25:06', '2022-06-24 06:25:06');

-- --------------------------------------------------------

--
-- Structure de la table `eleve_groupes`
--

CREATE TABLE `eleve_groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `eleve_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleve_groupes`
--

INSERT INTO `eleve_groupes` (`id`, `eleve_id`, `groupe_id`, `created_at`, `updated_at`) VALUES
(2, 2, 5, NULL, NULL),
(15, 2, 4, NULL, NULL),
(22, 9, 4, NULL, NULL),
(23, 5, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `emplois`
--

CREATE TABLE `emplois` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `emplois`
--

INSERT INTO `emplois` (`id`, `groupe_id`, `created_at`, `updated_at`) VALUES
(3, 4, '2022-05-30 02:36:40', '2022-05-30 02:36:40'),
(8, 2, '2022-06-24 06:25:54', '2022-06-24 06:25:54');

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNais` date NOT NULL,
  `lieuNais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin` int(11) NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateRecrutement` date NOT NULL,
  `salaire` double(8,2) NOT NULL,
  `situation_familiale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbrEnfants` int(11) NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `img`, `nom`, `prenom`, `sexe`, `dateNais`, `lieuNais`, `nationalite`, `adresse`, `cin`, `tel`, `dateRecrutement`, `salaire`, `situation_familiale`, `nbrEnfants`, `matiere_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'enseignant_1653881562.png', 'ladhari', 'ajmi', 'Homme', '1980-05-30', 'sousse', 'tunisienne', 'Akoudaa', 566889, '23456789', '2010-05-21', 1400.00, 'Marié(e)', 2, 5, 16, '2022-05-30 02:32:42', '2022-05-30 02:33:03'),
(3, 'enseignant2_1654143590.jpg', 'Sahli', 'Mohamed', 'Homme', '1970-06-02', 'sousse', 'tunisienne', 'kalaa kebira', 4556787, '23456789', '2000-06-07', 1400.00, 'Marié(e)', 3, 4, 17, '2022-06-02 03:19:50', '2022-06-02 03:19:50'),
(4, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1654143711.jpg', 'khalfalah', 'leila', 'Femme', '1985-06-07', 'sousse', 'tunisienne', 'akouda', 4550987, '1234567', '2010-06-02', 1400.00, 'Marié(e)', 2, 9, 18, '2022-06-02 03:21:52', '2022-06-02 03:21:52'),
(5, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1654178198.jpg', 'mbarki', 'monia', 'Femme', '1960-06-17', 'sousse', 'tunisienne', 'Akouda', 5674368, '3478966', '2016-06-02', 1200.00, 'Marié(e)', 3, 8, 19, '2022-06-02 12:56:38', '2022-06-02 12:56:38'),
(6, 'enseignant2_1654178382.jpg', 'kacem', 'samir', 'Homme', '1970-06-07', 'sousse', 'tunisienne', 'akouda', 1345678, '345787', '2010-06-15', 1200.00, 'Marié(e)', 2, 7, 20, '2022-06-02 12:59:42', '2022-06-02 12:59:42'),
(7, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1654179607.jpg', 'gharbi', 'leila', 'Femme', '1986-05-25', 'sousse', 'tunisienne', 'akouda', 55754, '2345687', '2015-03-12', 1000.00, 'Célibataire', 0, 10, 25, '2022-06-02 13:20:07', '2022-06-02 13:20:07'),
(8, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1654179831.jpg', 'najar', 'sawsen', 'Femme', '1986-06-08', 'sousse', 'tunisienne', 'Akouda', 4567432, '3478966', '2022-06-07', 1200.00, 'Marié(e)', 3, 13, 26, '2022-06-02 13:23:51', '2022-06-02 13:23:51'),
(9, 'enseignant1_1654179917.jpg', 'souguir', 'najeh', 'Homme', '1980-06-09', 'sousse', 'tunisienne', 'akouda', 2134098, '1234567', '2022-06-15', 1200.00, 'Marié(e)', 1, 12, 27, '2022-06-02 13:25:17', '2022-06-02 13:25:17'),
(10, 'depositphotos_122104490-stock-photo-smiing-female-college-student_1654180255.jpg', 'fnayou', 'samira', 'Femme', '1965-06-07', 'sousse', 'tunisienne', 'sousse', 9875, '456789', '2001-06-13', 1200.00, 'Marié(e)', 1, 11, 28, '2022-06-02 13:30:55', '2022-06-02 13:30:55');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_examens`
--

CREATE TABLE `enseignant_examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enseignant_id` bigint(20) UNSIGNED NOT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignant_examens`
--

INSERT INTO `enseignant_examens` (`id`, `enseignant_id`, `examen_id`, `created_at`, `updated_at`) VALUES
(4, 2, 5, NULL, NULL),
(5, 2, 6, NULL, NULL),
(6, 2, 7, NULL, NULL),
(8, 10, 9, NULL, NULL),
(9, 10, 10, NULL, NULL),
(10, 7, 11, NULL, NULL),
(11, 7, 12, NULL, NULL),
(12, 6, 13, NULL, NULL),
(13, 6, 14, NULL, NULL),
(14, 4, 15, NULL, NULL),
(15, 4, 16, NULL, NULL),
(16, 4, 17, NULL, NULL),
(18, 5, 19, NULL, NULL),
(19, 8, 20, NULL, NULL),
(20, 8, 21, NULL, NULL),
(21, 3, 22, NULL, NULL),
(22, 3, 23, NULL, NULL),
(23, 9, 24, NULL, NULL),
(24, 9, 25, NULL, NULL),
(25, 10, 26, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant_groupes`
--

CREATE TABLE `enseignant_groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enseignant_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignant_groupes`
--

INSERT INTO `enseignant_groupes` (`id`, `enseignant_id`, `groupe_id`, `created_at`, `updated_at`) VALUES
(7, 2, 4, NULL, NULL),
(8, 2, 2, NULL, NULL),
(9, 3, 4, NULL, NULL),
(10, 5, 4, NULL, NULL),
(11, 4, 4, NULL, NULL),
(12, 7, 4, NULL, NULL),
(13, 10, 4, NULL, NULL),
(14, 6, 4, NULL, NULL),
(15, 9, 4, NULL, NULL),
(16, 8, 4, NULL, NULL),
(17, 6, 5, NULL, NULL),
(18, 3, 6, NULL, NULL),
(19, 2, 6, NULL, NULL),
(20, 5, 6, NULL, NULL),
(21, 4, 6, NULL, NULL),
(22, 7, 6, NULL, NULL),
(23, 10, 6, NULL, NULL),
(24, 6, 6, NULL, NULL),
(25, 9, 6, NULL, NULL),
(26, 8, 6, NULL, NULL),
(27, 3, 2, NULL, NULL),
(28, 5, 2, NULL, NULL),
(29, 4, 2, NULL, NULL),
(30, 7, 2, NULL, NULL),
(31, 10, 2, NULL, NULL),
(32, 6, 2, NULL, NULL),
(33, 9, 2, NULL, NULL),
(34, 8, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `heure_debut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_fin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `examens`
--

CREATE TABLE `examens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `fichier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coef` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `examens`
--

INSERT INTO `examens` (`id`, `session_id`, `libelle`, `type`, `date`, `fichier_id`, `created_at`, `updated_at`, `coef`) VALUES
(5, 2, 'examen tp', 'TP', '2021-12-02', 9, '2022-06-01 22:20:12', '2022-06-01 22:42:20', 1.00),
(6, 2, 'Devoir de contrôle N1', 'Contrôle', '2021-10-02', 10, '2022-06-01 22:28:06', '2022-06-01 22:28:06', 1.00),
(7, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-12-06', 11, '2022-06-01 22:34:33', '2022-06-01 22:37:23', 2.00),
(9, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-11-02', 13, '2022-06-02 14:05:12', '2022-06-02 14:05:12', 2.00),
(10, 2, 'examen oral', 'Oral', '2021-12-02', 14, '2022-06-02 14:07:32', '2022-06-02 14:07:32', 1.00),
(11, 2, 'examen oral', 'Oral', '2021-11-15', 15, '2022-06-02 14:12:05', '2022-06-02 14:12:05', 1.00),
(12, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-11-03', 16, '2022-06-02 14:13:08', '2022-06-02 14:13:08', 2.00),
(13, 2, 'Devoir de contrôle N1', 'Contrôle', '2021-12-12', 17, '2022-06-02 14:17:40', '2022-06-02 14:17:40', 1.00),
(14, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-12-03', 18, '2022-06-02 14:18:22', '2022-06-02 14:18:22', 2.00),
(15, 2, 'Devoir de contrôle N1', 'Contrôle', '2021-10-03', 19, '2022-06-02 14:26:20', '2022-06-02 14:26:20', 1.00),
(16, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-12-02', 20, '2022-06-02 14:27:44', '2022-06-02 14:27:44', 2.00),
(17, 2, 'examen oral', 'Oral', '2021-12-02', 21, '2022-06-02 14:32:07', '2022-06-02 14:32:07', 1.00),
(19, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-12-02', 23, '2022-06-02 14:34:44', '2022-06-02 14:34:44', 2.00),
(20, 2, 'examen oral', 'Oral', '2021-11-02', 24, '2022-06-02 14:41:43', '2022-06-02 14:41:43', 1.00),
(21, 2, 'examen de synthèse n1', 'Synthèse', '2021-12-05', 25, '2022-06-02 14:42:44', '2022-06-02 14:42:44', 2.00),
(22, 2, 'Devoir de contrôle N1', 'Contrôle', '2021-11-02', 26, '2022-06-02 14:46:08', '2022-06-02 14:46:08', 1.00),
(23, 2, 'Devoir de synthèse N1', 'Synthèse', '2021-12-02', 27, '2022-06-02 14:46:33', '2022-06-02 14:46:33', 2.00),
(24, 2, 'Devoir de contrôle N1', 'Contrôle', '2021-11-02', 28, '2022-06-02 14:49:23', '2022-06-02 14:49:23', 1.00),
(25, 2, 'Devoir de synthese', 'Synthèse', '2021-12-02', 29, '2022-06-02 14:49:46', '2022-06-02 14:49:46', 2.00),
(26, 4, 'devoir synthese', 'Synthèse', '2022-06-30', 34, '2022-06-24 18:31:28', '2022-06-24 18:31:28', 2.00);

-- --------------------------------------------------------

--
-- Structure de la table `examen_groupes`
--

CREATE TABLE `examen_groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `groupe_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `examen_groupes`
--

INSERT INTO `examen_groupes` (`id`, `examen_id`, `groupe_id`, `created_at`, `updated_at`) VALUES
(4, 5, 4, NULL, NULL),
(5, 6, 4, NULL, NULL),
(6, 7, 4, NULL, NULL),
(8, 9, 4, NULL, NULL),
(9, 10, 4, NULL, NULL),
(10, 11, 4, NULL, NULL),
(11, 12, 4, NULL, NULL),
(12, 13, 4, NULL, NULL),
(13, 14, 4, NULL, NULL),
(14, 15, 4, NULL, NULL),
(15, 16, 4, NULL, NULL),
(16, 17, 4, NULL, NULL),
(17, 19, 4, NULL, NULL),
(18, 20, 4, NULL, NULL),
(19, 21, 4, NULL, NULL),
(20, 22, 4, NULL, NULL),
(21, 23, 4, NULL, NULL),
(22, 24, 4, NULL, NULL),
(23, 25, 4, NULL, NULL),
(24, 26, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fichiers`
--

CREATE TABLE `fichiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fichiers`
--

INSERT INTO `fichiers` (`id`, `file`, `path`, `created_at`, `updated_at`) VALUES
(6, 'CompteRenduLaravel_1650202001 (3)_1653615363_1653882169.pdf', 'public/files/CompteRenduLaravel_1650202001 (3)_1653615363_1653882169.pdf', '2022-05-30 02:42:49', '2022-05-30 02:42:49'),
(7, 'séquences_1653882254.pdf', 'public/files/séquences_1653882254.pdf', '2022-05-30 02:44:14', '2022-05-30 02:44:14'),
(9, 'ExcelSheet (11)_1655055607.xlsx', 'public/files/ExcelSheet (11)_1655055607.xlsx', '2022-06-01 22:20:12', '2022-06-12 16:40:07'),
(10, 'Espace-Eleve_1655055444.pdf', 'public/files/Espace-Eleve_1655055444.pdf', '2022-06-01 22:28:06', '2022-06-12 16:37:24'),
(11, 'service groupe_1654126473.pdf', 'public/files/service groupe_1654126473.pdf', '2022-06-01 22:34:33', '2022-06-01 22:34:33'),
(13, 'bac math12021-2022 (3)_1653616104_1654182312.pdf', 'public/files/bac math12021-2022 (3)_1653616104_1654182312.pdf', '2022-06-02 14:05:12', '2022-06-02 14:05:12'),
(14, 'nofile.pdf', 'noPath', '2022-06-02 14:07:32', '2022-06-02 14:07:32'),
(15, 'nofile.pdf', 'noPath', '2022-06-02 14:12:05', '2022-06-02 14:12:05'),
(16, 'AyaLaarif-soa-lsiA3_01_1650679723_1654182788.pdf', 'public/files/AyaLaarif-soa-lsiA3_01_1650679723_1654182788.pdf', '2022-06-02 14:13:08', '2022-06-02 14:13:08'),
(17, 'ExcelSheet (12)_1654183060.xlsx', 'public/files/ExcelSheet (12)_1654183060.xlsx', '2022-06-02 14:17:40', '2022-06-02 14:17:40'),
(18, 'ExcelSheet (12)_1654183102.xlsx', 'public/files/ExcelSheet (12)_1654183102.xlsx', '2022-06-02 14:18:22', '2022-06-02 14:18:22'),
(19, 'CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654183580.pdf', 'public/files/CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654183580.pdf', '2022-06-02 14:26:20', '2022-06-02 14:26:20'),
(20, 'bac math2undefined_1654183664.pdf', 'public/files/bac math2undefined_1654183664.pdf', '2022-06-02 14:27:44', '2022-06-02 14:27:44'),
(21, 'nofile.pdf', 'noPath', '2022-06-02 14:32:07', '2022-06-02 14:32:07'),
(23, 'séquences_1654184084.pdf', 'public/files/séquences_1654184084.pdf', '2022-06-02 14:34:44', '2022-06-02 14:34:44'),
(24, 'nofile.pdf', 'noPath', '2022-06-02 14:41:43', '2022-06-02 14:41:43'),
(25, 'CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184564.pdf', 'public/files/CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184564.pdf', '2022-06-02 14:42:44', '2022-06-02 14:42:44'),
(26, 'CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184768.pdf', 'public/files/CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184768.pdf', '2022-06-02 14:46:08', '2022-06-02 14:46:08'),
(27, 'CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184793.pdf', 'public/files/CompteRenduLaravel_1650202001 (3)_1653615363_1653882169 (1)_1654184793.pdf', '2022-06-02 14:46:33', '2022-06-02 14:46:33'),
(28, 'bac math2undefined_1654184963.pdf', 'public/files/bac math2undefined_1654184963.pdf', '2022-06-02 14:49:23', '2022-06-02 14:49:23'),
(29, 'bac math2undefined_1654184986.pdf', 'public/files/bac math2undefined_1654184986.pdf', '2022-06-02 14:49:46', '2022-06-02 14:49:46'),
(31, 'Compte rendu tp3 ex2_1656052208.pdf', 'public/files/Compte rendu tp3 ex2_1656052208.pdf', '2022-06-24 05:30:08', '2022-06-24 05:30:08'),
(33, 'compte-Rendu-Angular_1656055700.pdf', 'public/files/compte-Rendu-Angular_1656055700.pdf', '2022-06-24 06:28:20', '2022-06-24 06:28:20'),
(34, 'compte-Rendu-Angular_1656050863_1656099088.pdf', 'public/files/compte-Rendu-Angular_1656050863_1656099088.pdf', '2022-06-24 18:31:28', '2022-06-24 18:31:28');

-- --------------------------------------------------------

--
-- Structure de la table `fichier_corrections`
--

CREATE TABLE `fichier_corrections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fichier_id` bigint(20) UNSIGNED NOT NULL,
  `file_correction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_correction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fichier_corrections`
--

INSERT INTO `fichier_corrections` (`id`, `fichier_id`, `file_correction`, `path_correction`, `created_at`, `updated_at`) VALUES
(7, 9, 'ESPACE-PARENT_1655055404.pdf', 'public/files/ESPACE-PARENT_1655055404.pdf', '2022-06-01 22:20:12', '2022-06-12 16:36:45'),
(8, 10, 'ESPACE-PARENT_1655055444.pdf', 'public/files/ESPACE-PARENT_1655055444.pdf', '2022-06-01 22:28:06', '2022-06-12 16:37:24'),
(9, 11, 'noFile.pdf', 'noPath', '2022-06-01 22:34:33', '2022-06-01 22:34:33'),
(11, 13, 'noFile.pdf', 'noPath', '2022-06-02 14:05:12', '2022-06-02 14:05:12'),
(12, 14, 'noFile.pdf', 'noPath', '2022-06-02 14:07:32', '2022-06-02 14:07:32'),
(13, 15, 'noFile.pdf', 'noPath', '2022-06-02 14:12:05', '2022-06-02 14:12:05'),
(14, 16, 'noFile.pdf', 'noPath', '2022-06-02 14:13:08', '2022-06-02 14:13:08'),
(15, 17, 'noFile.pdf', 'noPath', '2022-06-02 14:17:40', '2022-06-02 14:17:40'),
(16, 18, 'noFile.pdf', 'noPath', '2022-06-02 14:18:22', '2022-06-02 14:18:22'),
(17, 19, 'noFile.pdf', 'noPath', '2022-06-02 14:26:20', '2022-06-02 14:26:20'),
(18, 20, 'noFile.pdf', 'noPath', '2022-06-02 14:27:44', '2022-06-02 14:27:44'),
(19, 21, 'noFile.pdf', 'noPath', '2022-06-02 14:32:07', '2022-06-02 14:32:07'),
(21, 23, 'noFile.pdf', 'noPath', '2022-06-02 14:34:44', '2022-06-02 14:34:44'),
(22, 24, 'noFile.pdf', 'noPath', '2022-06-02 14:41:43', '2022-06-02 14:41:43'),
(23, 25, 'noFile.pdf', 'noPath', '2022-06-02 14:42:44', '2022-06-02 14:42:44'),
(24, 26, 'noFile.pdf', 'noPath', '2022-06-02 14:46:08', '2022-06-02 14:46:08'),
(25, 27, 'noFile.pdf', 'noPath', '2022-06-02 14:46:33', '2022-06-02 14:46:33'),
(26, 28, 'noFile.pdf', 'noPath', '2022-06-02 14:49:23', '2022-06-02 14:49:23'),
(27, 29, 'noFile.pdf', 'noPath', '2022-06-02 14:49:46', '2022-06-02 14:49:46'),
(28, 31, 'Résumé-SOA_1650503305 (2)_1656052208.docx', 'public/files/Résumé-SOA_1650503305 (2)_1656052208.docx', '2022-06-24 05:30:08', '2022-06-24 05:30:08'),
(29, 34, 'noFile.pdf', 'noPath', '2022-06-24 18:31:28', '2022-06-24 18:31:28');

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `num` int(11) NOT NULL,
  `annee_id` bigint(20) UNSIGNED NOT NULL,
  `niveau_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`id`, `num`, `annee_id`, `niveau_id`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, '2022-05-24 01:57:20', '2022-05-24 02:09:46'),
(4, 2, 2, 1, '2022-05-25 00:42:25', '2022-05-25 00:42:25'),
(5, 1, 8, 2, '2022-05-26 11:42:06', '2022-05-26 11:42:06'),
(6, 6, 8, 1, '2022-05-29 01:22:26', '2022-05-29 01:22:26'),
(8, 1, 2, 3, '2022-06-01 02:44:21', '2022-06-01 02:44:21'),
(12, 3, 2, 1, '2022-06-24 05:00:33', '2022-06-24 05:00:33');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE `matieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(4, 'math', '2022-05-30 00:16:23', '2022-05-30 00:16:23'),
(5, 'physique', '2022-05-30 00:16:23', '2022-05-30 00:16:23'),
(7, 'Science', '2022-05-30 00:51:38', '2022-05-30 00:51:38'),
(8, 'Arabe', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(9, 'Français', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(10, 'Anglais', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(11, 'Philosophie', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(12, 'Informatique', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(13, 'Italien', '2022-06-02 03:17:06', '2022-06-02 03:17:06'),
(14, 'Sport', '2022-06-02 03:17:06', '2022-06-02 03:17:06');

-- --------------------------------------------------------

--
-- Structure de la table `matiere_niveaux`
--

CREATE TABLE `matiere_niveaux` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `niveau_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coef` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matiere_niveaux`
--

INSERT INTO `matiere_niveaux` (`id`, `matiere_id`, `niveau_id`, `created_at`, `updated_at`, `coef`) VALUES
(9, 4, 1, NULL, NULL, 4.00),
(10, 5, 1, NULL, NULL, 4.00),
(12, 7, 2, NULL, NULL, 4.00),
(16, 8, 1, NULL, NULL, 1.00),
(17, 9, 1, NULL, NULL, 1.00),
(18, 10, 1, NULL, NULL, 1.00),
(19, 11, 1, NULL, NULL, 1.00),
(20, 7, 1, NULL, NULL, 1.00),
(21, 12, 1, NULL, NULL, 1.00),
(22, 13, 1, NULL, NULL, 1.00);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_07_092844_create_annee_scolaires_table', 1),
(6, '2022_03_07_092845_create_session_scolaires_table', 1),
(7, '2022_03_07_092847_create_parentts_table', 1),
(8, '2022_03_07_105218_create_matieres_table', 1),
(9, '2022_03_07_105225_create_niveaux_table', 1),
(10, '2022_03_07_105242_create_salles_table', 1),
(11, '2022_03_07_105759_create_groupes_table', 1),
(12, '2022_03_07_115506_create_eleves_table', 1),
(13, '2022_03_08_090234_create_enseignants_table', 1),
(14, '2022_03_11_094936_create_matiere_niveaux_table', 1),
(15, '2022_03_12_125812_create_enseignant_groupes_table', 1),
(16, '2022_03_28_105330_create_preinsriptions_table', 1),
(17, '2022_04_15_014702_create_fichiers_table', 1),
(18, '2022_04_15_014907_create_fichier_corrections_table', 1),
(19, '2022_04_15_015101_create_cours_table', 1),
(20, '2022_04_15_015337_create_traveaux_table', 1),
(21, '2022_04_15_023519_create_examens_table', 1),
(22, '2022_04_15_023638_create_notes_table', 1),
(23, '2022_04_15_023800_create_cours_groupes_table', 1),
(24, '2022_04_15_023845_create_examen_groupes_table', 1),
(25, '2022_04_15_023918_create_enseignant_examens_table', 1),
(26, '2022_04_28_111423_create_emplois_table', 1),
(27, '2022_05_02_223458_create_seances_table', 1),
(28, '2022_05_17_095418_create_punitions_table', 1),
(29, '2022_05_17_143628_create_disciplines_table', 1),
(30, '2022_05_20_142311_create_eleve_groupes_table', 1),
(31, '2022_05_23_235438_add_libelle_to_traveaux', 2),
(32, '2022_05_26_191456_create_notifications_table', 2),
(33, '2022_05_28_125439_add_column_punition_id_to_punitions', 2),
(34, '2022_05_28_125646_add_discipline_id_to_notifications', 2),
(38, '2022_05_31_104913_create_moy_matieres_table', 4),
(43, '2022_05_28_175854_create_events_table', 5),
(44, '2022_05_30_004152_add_coef_to_matiere_niveaux', 5),
(48, '2022_05_31_102801_create_bulletins_table', 6),
(49, '2022_06_01_164801_add_coef_to_examens', 6),
(50, '2022_06_02_013743_create_moy_matieres_table', 6),
(51, '2022_06_05_042049_add_moy_ann_to_bulletins', 7),
(52, '2022_06_05_042154_add_moy_ann_to_moy_matieres', 7),
(53, '2022_06_06_003611_add_coef_bulletin_to_session_scolaires', 8),
(54, '2022_06_20_165813_add_coef_to_session_scolaires', 9);

-- --------------------------------------------------------

--
-- Structure de la table `moy_matieres`
--

CREATE TABLE `moy_matieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bulletin_id` bigint(20) UNSIGNED NOT NULL,
  `matiere_id` bigint(20) UNSIGNED NOT NULL,
  `coef` double(8,2) NOT NULL,
  `moy` double(8,2) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `moyAnn` double(8,2) DEFAULT NULL,
  `rangAnn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `moy_matieres`
--

INSERT INTO `moy_matieres` (`id`, `bulletin_id`, `matiere_id`, `coef`, `moy`, `rang`, `total`, `created_at`, `updated_at`, `moyAnn`, `rangAnn`) VALUES
(336, 63, 4, 4.00, 12.33, 1, 49.33, NULL, NULL, 0.00, NULL),
(337, 63, 5, 4.00, 16.14, 1, 64.56, NULL, NULL, 0.00, NULL),
(338, 63, 8, 1.00, 10.00, 1, 10.00, NULL, NULL, 0.00, NULL),
(339, 63, 9, 1.00, 12.62, 1, 12.62, NULL, NULL, 0.00, NULL),
(340, 63, 10, 1.00, 15.00, 1, 15.00, NULL, NULL, 0.00, NULL),
(341, 63, 11, 1.00, 13.67, 1, 13.67, NULL, NULL, 0.00, NULL),
(342, 63, 7, 1.00, 13.00, 1, 13.00, NULL, NULL, 0.00, NULL),
(343, 63, 12, 1.00, 14.67, 1, 14.67, NULL, NULL, 0.00, NULL),
(344, 63, 13, 1.00, 19.33, 1, 19.33, NULL, NULL, 0.00, NULL),
(372, 67, 4, 4.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 4.11, 1),
(373, 67, 5, 4.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 5.38, 1),
(374, 67, 8, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 3.33, 1),
(375, 67, 9, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 4.21, 1),
(376, 67, 10, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 5.00, 1),
(377, 67, 11, 1.00, 18.00, 1, 18.00, NULL, '2022-06-24 20:16:51', 16.56, 1),
(378, 67, 7, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 4.33, 1),
(379, 67, 12, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 4.89, 1),
(380, 67, 13, 1.00, 0.00, 1, 0.00, NULL, '2022-06-24 20:16:51', 6.44, 1);

-- --------------------------------------------------------

--
-- Structure de la table `niveaux`
--

CREATE TABLE `niveaux` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveaux`
--

INSERT INTO `niveaux` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'bac math', '2022-05-24 01:24:41', '2022-05-24 01:24:41'),
(2, 'Bac sc', '2022-05-26 11:40:52', '2022-05-26 11:40:52'),
(3, '1ére année secondaire', '2022-06-01 02:43:14', '2022-06-01 02:43:14'),
(4, '2  année secondaire', '2022-06-01 02:43:47', '2022-06-01 02:43:47');

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` double(8,2) NOT NULL,
  `remarque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eleve_id` bigint(20) UNSIGNED NOT NULL,
  `examen_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`id`, `note`, `remarque`, `eleve_id`, `examen_id`, `created_at`, `updated_at`) VALUES
(8, 15.00, 'Bien', 2, 5, '2022-06-01 22:55:07', '2022-06-01 22:55:07'),
(10, 16.25, 'BIEN', 2, 6, '2022-06-01 22:58:18', '2022-06-24 18:47:46'),
(11, 12.50, 'assez bien', 2, 7, '2022-06-01 22:58:56', '2022-06-01 22:58:56'),
(12, 13.00, 'assez bien', 2, 10, '2022-06-02 14:08:19', '2022-06-02 14:08:19'),
(13, 14.00, 'bien', 2, 9, '2022-06-02 14:08:51', '2022-06-02 14:08:51'),
(14, 15.00, 'BIEN', 2, 11, '2022-06-02 14:15:01', '2022-06-02 14:15:01'),
(15, 15.00, 'BIEN', 2, 12, '2022-06-02 14:15:25', '2022-06-02 14:15:25'),
(16, 13.00, 'BIEN', 2, 13, '2022-06-02 14:19:09', '2022-06-02 14:19:09'),
(17, 13.00, 'BIEN', 2, 14, '2022-06-02 14:19:30', '2022-06-02 14:19:30'),
(18, 11.50, 'assez bien', 2, 15, '2022-06-02 14:29:16', '2022-06-02 14:29:16'),
(19, 11.75, 'assez bien', 2, 16, '2022-06-02 14:29:42', '2022-06-02 14:29:42'),
(20, 15.50, 'BIEN', 2, 17, '2022-06-02 14:32:40', '2022-06-02 14:32:40'),
(21, 10.00, 'assez bien', 2, 19, '2022-06-02 14:35:24', '2022-06-02 14:35:24'),
(22, 20.00, 'Bien', 2, 20, '2022-06-02 14:43:24', '2022-06-02 14:43:24'),
(23, 19.00, 'BIEN', 2, 21, '2022-06-02 14:43:48', '2022-06-02 14:43:48'),
(24, 12.50, 'assez bien', 2, 22, '2022-06-02 14:47:23', '2022-06-02 14:47:23'),
(25, 12.25, 'bien', 2, 23, '2022-06-02 14:47:42', '2022-06-02 14:47:42'),
(26, 15.50, 'Bien', 2, 24, '2022-06-02 14:50:35', '2022-06-02 14:50:35'),
(27, 14.25, 'BIEN', 2, 25, '2022-06-02 14:51:05', '2022-06-02 14:51:05'),
(28, 18.00, 'BIEN', 2, 6, '2022-06-24 05:14:29', '2022-06-24 05:14:29'),
(29, 18.00, 'bien', 2, 5, '2022-06-24 05:52:41', '2022-06-24 05:52:41'),
(30, 20.00, 'bien', 2, 5, '2022-06-24 06:28:48', '2022-06-24 06:28:48'),
(31, 15.00, 'BIEN', 2, 6, '2022-06-24 06:30:52', '2022-06-24 06:30:52'),
(32, 18.00, 'Bien', 2, 5, '2022-06-24 06:39:04', '2022-06-24 06:39:04'),
(34, 9.00, 'NULL', 9, 5, '2022-06-24 06:46:48', '2022-06-24 06:46:48'),
(35, 9.00, 'NULL', 5, 5, '2022-06-24 06:46:48', '2022-06-24 06:46:48'),
(36, 18.00, 'bien', 2, 26, '2022-06-24 18:32:11', '2022-06-24 18:32:11');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isOpen` tinyint(1) NOT NULL,
  `parentt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `punition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discipline_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `title`, `isOpen`, `parentt_id`, `created_at`, `updated_at`, `punition_id`, `discipline_id`) VALUES
(19, 'Discipline', 'L\'éléve laarif amal est Absent(e) pour la séance : Lundi 08:00:00', 0, 3, '2022-06-01 22:59:58', '2022-06-01 22:59:58', NULL, 15),
(20, 'Discipline', 'L\'éléve laarif amal est Absent(e) pour la séance : Vendredi 10:00:00', 0, 3, '2022-06-02 14:09:50', '2022-06-02 14:09:50', NULL, 16),
(22, 'Discipline', 'L\'éléve laarif amal est Retard pour la séance : Lundi 08:00:00', 0, 3, '2022-06-03 12:57:27', '2022-06-03 12:57:27', NULL, 18),
(23, 'Punition', 'Pour l\'élève laarif amal', 1, 3, '2022-06-03 13:13:15', '2022-06-23 23:38:04', 10, NULL),
(24, 'Punition', 'Pour l\'élève laarif amal pendant la séance Lundi 08:00:00', 1, 3, '2022-06-03 13:13:38', '2022-06-23 22:28:08', 11, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `parentts`
--

CREATE TABLE `parentts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cin_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomComplet_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomComplet_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fct_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fct_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `parentts`
--

INSERT INTO `parentts` (`id`, `cin_pere`, `cin_mere`, `nomComplet_pere`, `nomComplet_mere`, `tel_pere`, `tel_mere`, `fct_pere`, `fct_mere`, `email_pere`, `email_mere`, `user_id`, `created_at`, `updated_at`) VALUES
(3, '098765', '345678', 'naceur laarif', 'mounira ladhari', '23456789', '98765432', 'comptable', 'prof', 'naceur@gmail.com', 'mounira@gmail.com', 7, '2022-05-25 02:37:19', '2022-05-25 02:37:19'),
(5, '4400', '3200', 'sadok souguir', 'amal souguir', '55678900', '9856743', 'directeur', 'ingenieur', 'sadok@gmail.com', 'amalsouguir@gmail.com', 14, '2022-05-30 02:26:13', '2022-05-30 02:26:13');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-app-token', 'd5f97537789eacc21de6ae30cc3341a782fb4c375a039f2e4273cf65357b7fdf', '[\"role:admin\"]', '2022-05-22 01:34:49', '2022-05-22 00:09:16', '2022-05-22 01:34:49'),
(2, 'App\\Models\\User', 1, 'my-app-token', '1549bf262e9f959f505626533b538520a2a0a8866de8b4da37fdc8f7ba7acf63', '[\"role:admin\"]', '2022-05-23 00:10:00', '2022-05-22 14:29:23', '2022-05-23 00:10:00'),
(3, 'App\\Models\\User', 1, 'my-app-token', 'eba0738f7ba972dbf64e7d62523b62a279bcd262f095a88e175f2ea650d0fb74', '[\"role:admin\"]', '2022-05-24 01:50:21', '2022-05-22 22:24:26', '2022-05-24 01:50:21'),
(4, 'App\\Models\\User', 1, 'my-app-token', '4b78489bfc68d85404314cd0adf43e8bef35d43f4a0a498d637b6d8de47462f1', '[\"role:admin\"]', '2022-05-24 00:04:56', '2022-05-23 19:13:05', '2022-05-24 00:04:56'),
(5, 'App\\Models\\User', 1, 'my-app-token', '6f418ce42694b5a3379b667abf5dcc6018ec93baa2dea7c958045a9fe0a36fc0', '[\"role:admin\"]', NULL, '2022-05-23 19:13:06', '2022-05-23 19:13:06'),
(6, 'App\\Models\\User', 1, 'my-app-token', '46335352e903093ac86fe5ac00af13363a9f2c83312bcd5b7a8744470882f1ff', '[\"role:admin\"]', '2022-05-24 00:22:14', '2022-05-24 00:06:14', '2022-05-24 00:22:14'),
(7, 'App\\Models\\User', 1, 'my-app-token', '189bb8d707c34a6546a8814a266ef9bf6b860d2fe41501bbc6d238100a4fc4f2', '[\"role:admin\"]', '2022-05-24 00:27:59', '2022-05-24 00:22:51', '2022-05-24 00:27:59'),
(8, 'App\\Models\\User', 1, 'my-app-token', '52578421f03229fc1125010c9588b836563e09b2bca19b1927317533d7ed7f42', '[\"role:admin\"]', '2022-05-24 00:32:09', '2022-05-24 00:28:16', '2022-05-24 00:32:09'),
(9, 'App\\Models\\User', 1, 'my-app-token', '3b3a1559a53a62a7490e705239c83e7ed471840863e9cf9520dc972673f5d885', '[\"role:admin\"]', '2022-05-24 00:46:35', '2022-05-24 00:33:11', '2022-05-24 00:46:35'),
(10, 'App\\Models\\User', 1, 'my-app-token', '662a574a62501dcdb54ff8ca4ee3c21395c291ba8d99e85e9e0bc3279ac23e91', '[\"role:admin\"]', '2022-05-24 01:01:32', '2022-05-24 00:46:43', '2022-05-24 01:01:32'),
(11, 'App\\Models\\User', 1, 'my-app-token', 'c2b99ea3c732e9442bbba3ebcaead42be7dfea6e3286e3cdcb0182092ec10f32', '[\"role:admin\"]', '2022-05-24 01:04:05', '2022-05-24 01:02:04', '2022-05-24 01:04:05'),
(12, 'App\\Models\\User', 1, 'my-app-token', '5c244b03d8ab93777713591c2bc5d03225ed24e8d4845c311b294dc9bb0ff2ad', '[\"role:admin\"]', '2022-05-24 02:51:02', '2022-05-24 01:05:25', '2022-05-24 02:51:02'),
(13, 'App\\Models\\User', 1, 'my-app-token', '1bfefc284d61e04458fb05e18e72927e746d687d6fc36e67710b9d27cd42eb5c', '[\"role:admin\"]', '2022-05-24 12:40:48', '2022-05-24 08:36:47', '2022-05-24 12:40:48'),
(14, 'App\\Models\\User', 1, 'my-app-token', '57bb68c2b3dc1732a8a7a0fd3da7c0d666764dcd6abee1aabe3bc311cd5e78de', '[\"role:admin\"]', '2022-05-25 03:41:11', '2022-05-24 21:22:27', '2022-05-25 03:41:11'),
(15, 'App\\Models\\User', 1, 'my-app-token', '09b899c7b74b02e6da27ccdb6d4cabebc177aea6589f98567e89fb9c074011c2', '[\"role:admin\"]', '2022-05-25 02:54:10', '2022-05-24 23:39:42', '2022-05-25 02:54:10'),
(16, 'App\\Models\\User', 1, 'my-app-token', '5d119cf6803067f85778c38e46fea78d4b7bc84cabc5ddf564eff6e472c96e03', '[\"role:admin\"]', '2022-05-25 08:48:00', '2022-05-25 08:39:52', '2022-05-25 08:48:00'),
(17, 'App\\Models\\User', 1, 'my-app-token', '5c7e792ee7e303863f6fac283cadc11349eec01d824c2e939eef49346bbc893f', '[\"role:admin\"]', '2022-05-25 10:58:42', '2022-05-25 09:47:38', '2022-05-25 10:58:42'),
(18, 'App\\Models\\User', 1, 'my-app-token', 'b76f89bae9007945f841eb9d38ae22281e62e39b736022f68e2ce05ea332a918', '[\"role:admin\"]', '2022-05-26 01:11:32', '2022-05-25 22:36:00', '2022-05-26 01:11:32'),
(19, 'App\\Models\\User', 1, 'my-app-token', 'ccb0e307255b26ba0c263293efa50ab296271ba69cca85fe480b758fc3f0adcc', '[\"role:admin\"]', '2022-05-26 15:41:16', '2022-05-26 10:30:34', '2022-05-26 15:41:16'),
(20, 'App\\Models\\User', 10, 'my-app-token', 'c57df6fd1ccb8e62e83ca3b7c019d70cf098d33e4d263399014ebde1263a0e0e', '[\"role:enseignant\"]', '2022-05-26 15:50:04', '2022-05-26 15:45:44', '2022-05-26 15:50:04'),
(21, 'App\\Models\\User', 10, 'my-app-token', '14db82232b0f389c57333009db967773492bf7c5adbaa7cf5d8768b1fc0417c6', '[\"role:enseignant\"]', '2022-05-27 01:07:10', '2022-05-26 21:39:22', '2022-05-27 01:07:10'),
(22, 'App\\Models\\User', 10, 'my-app-token', 'bddafdd1978bfb4943221975f2a1c7a2e7d20ef5dc32bf7d11a90f3111c1b43e', '[\"role:enseignant\"]', '2022-05-26 23:02:46', '2022-05-26 22:57:49', '2022-05-26 23:02:46'),
(23, 'App\\Models\\User', 1, 'my-app-token', 'd3681de03264dcbab9573e3af675bdb9ecbf032584a43d19a39d07f944a3209d', '[\"role:admin\"]', '2022-05-27 01:07:44', '2022-05-27 01:03:21', '2022-05-27 01:07:44'),
(24, 'App\\Models\\User', 10, 'my-app-token', '60998295ed8dbc7d282e916a5d39121271f89043c818302a89e78c00a8359102', '[\"role:enseignant\"]', '2022-05-27 08:50:44', '2022-05-27 08:43:16', '2022-05-27 08:50:44'),
(25, 'App\\Models\\User', 1, 'my-app-token', '86f6c6004005e7569b95f5d3b7f053e73852ce497b405224100d521dbbc58a67', '[\"role:admin\"]', '2022-05-27 09:23:18', '2022-05-27 08:51:06', '2022-05-27 09:23:18'),
(26, 'App\\Models\\User', 10, 'my-app-token', 'ce4ac6ba82cca83ecbef089ff0e1453f25934fec25525d61f47be1a23c47086e', '[\"role:enseignant\"]', '2022-05-27 09:28:52', '2022-05-27 08:55:42', '2022-05-27 09:28:52'),
(27, 'App\\Models\\User', 10, 'my-app-token', '9c145329147c7102556eac6dc0b61ef9e94fe6c87a8f5e2e197c25bc95f64687', '[\"role:enseignant\"]', '2022-05-27 12:44:42', '2022-05-27 12:12:20', '2022-05-27 12:44:42'),
(28, 'App\\Models\\User', 10, 'my-app-token', '7b4a1fa0954003131c8ccbd80362470dacd3bb03c6abe5c5e5648c56e45dff87', '[\"role:enseignant\"]', '2022-05-28 09:06:04', '2022-05-28 09:06:02', '2022-05-28 09:06:04'),
(29, 'App\\Models\\User', 10, 'my-app-token', 'c149552b2e2bac256172f1c3157986476d2f5a5c58cffa92031c6598a61c9d0e', '[\"role:enseignant\"]', '2022-05-28 11:52:18', '2022-05-28 09:06:03', '2022-05-28 11:52:18'),
(30, 'App\\Models\\User', 1, 'my-app-token', '470471cabba62653089a3076318941ff18842d5588f1baf13e8b18be58e672f5', '[\"role:admin\"]', '2022-05-28 11:52:18', '2022-05-28 11:44:59', '2022-05-28 11:52:18'),
(31, 'App\\Models\\User', 10, 'my-app-token', '102bcdd0dadbb8139aafd48d2b62d2065aef4bfd3d323584d90cf3863f2c0f57', '[\"role:enseignant\"]', '2022-05-28 20:35:01', '2022-05-28 17:47:50', '2022-05-28 20:35:01'),
(32, 'App\\Models\\User', 1, 'my-app-token', 'ea7643301c133d89f253bc8ee235118b058d085a67d7410add7b947dfdf84fb5', '[\"role:admin\"]', '2022-05-28 19:41:25', '2022-05-28 19:24:57', '2022-05-28 19:41:25'),
(33, 'App\\Models\\User', 10, 'my-app-token', 'a6347d15e48141e93ddd821c47e4b6166fe8ba9eff1ec0d02e153f22cfc46440', '[\"role:enseignant\"]', '2022-05-28 21:11:24', '2022-05-28 20:36:49', '2022-05-28 21:11:24'),
(34, 'App\\Models\\User', 10, 'my-app-token', 'e3cea06bae48b5de5f4c70b8abe28479a526390c00e578a9dc9428997e2b387f', '[\"role:enseignant\"]', '2022-05-28 21:07:44', '2022-05-28 20:59:28', '2022-05-28 21:07:44'),
(35, 'App\\Models\\User', 10, 'my-app-token', '1a29073f8be183ede0593c68da0e8d1bff7e17ab22eab52b6814da9b0dca1324', '[\"role:enseignant\"]', '2022-05-28 21:08:34', '2022-05-28 21:08:32', '2022-05-28 21:08:34'),
(36, 'App\\Models\\User', 10, 'my-app-token', '136ebabc090e453060ba25fad267866a5963b9126c05f4200fb7423ce41e8c35', '[\"role:enseignant\"]', '2022-05-28 21:09:17', '2022-05-28 21:09:08', '2022-05-28 21:09:17'),
(37, 'App\\Models\\User', 10, 'my-app-token', 'd64beded3608cf655e01cb35e702d579c25e110d1f657fa0946726c20572e983', '[\"role:enseignant\"]', '2022-05-28 23:31:24', '2022-05-28 21:09:33', '2022-05-28 23:31:24'),
(38, 'App\\Models\\User', 1, 'my-app-token', '384bc0b79fb7f785b831f957c3f6467e5f08f007e4119151c9c7c483af21146b', '[\"role:admin\"]', '2022-05-28 21:13:23', '2022-05-28 21:11:35', '2022-05-28 21:13:23'),
(39, 'App\\Models\\User', 1, 'my-app-token', 'a476843fbdb7a0479c8b35f814cba88a9f886a1415de283cf54579baaa6c7350', '[\"role:admin\"]', '2022-05-28 21:14:21', '2022-05-28 21:14:17', '2022-05-28 21:14:21'),
(40, 'App\\Models\\User', 1, 'my-app-token', 'd5de9eb1852ee30264e590be0f2b3c38e691511ae224dac67c87e545db8d2d06', '[\"role:admin\"]', '2022-05-28 21:16:44', '2022-05-28 21:16:42', '2022-05-28 21:16:44'),
(41, 'App\\Models\\User', 10, 'my-app-token', '80899ce31a71927e5c48aa7293f1c173dddd3e2d31c426f04bc1fe8e1f6cf476', '[\"role:enseignant\"]', '2022-05-28 21:17:03', '2022-05-28 21:16:58', '2022-05-28 21:17:03'),
(42, 'App\\Models\\User', 10, 'my-app-token', '9f9749cbadde29c20c8b381a1710e8d8c53c73cb2998612f719fbebcc221ed01', '[\"role:enseignant\"]', '2022-05-28 21:18:25', '2022-05-28 21:18:14', '2022-05-28 21:18:25'),
(43, 'App\\Models\\User', 1, 'my-app-token', '5a486b7953fe735b7dca2965bf04c5a2696cfdae17a2a1afb8b3483dcc43145c', '[\"role:admin\"]', '2022-05-28 21:18:44', '2022-05-28 21:18:41', '2022-05-28 21:18:44'),
(44, 'App\\Models\\User', 1, 'my-app-token', '255f0ad0c1e23bbd5764e58d0aaca533704d6166038f07e8bdf6fca3e9f4dc17', '[\"role:admin\"]', '2022-05-28 21:19:09', '2022-05-28 21:19:07', '2022-05-28 21:19:09'),
(45, 'App\\Models\\User', 10, 'my-app-token', '97089c07563ff2a520fd5d712db6f4977c32fb48ed925e6df4c314e3fd5e07b4', '[\"role:enseignant\"]', '2022-05-28 21:19:31', '2022-05-28 21:19:30', '2022-05-28 21:19:31'),
(46, 'App\\Models\\User', 1, 'my-app-token', 'd43f1d571bd27aad29024b901c3b5d36e77bd5f029decb87d9df381b0913cb6a', '[\"role:admin\"]', '2022-05-28 21:49:55', '2022-05-28 21:25:06', '2022-05-28 21:49:55'),
(47, 'App\\Models\\User', 1, 'my-app-token', 'd9c35093789fa70eae8e85b16b84f5e514ff082aa48716fd785f1f73399c1e0b', '[\"role:admin\"]', '2022-05-28 23:54:12', '2022-05-28 21:51:17', '2022-05-28 23:54:12'),
(48, 'App\\Models\\User', 1, 'my-app-token', '6427764503af0a7fddd178f4e1f360ec7e3b1a1a855f869f75fb60580bb6b044', '[\"role:admin\"]', '2022-05-29 00:03:11', '2022-05-29 00:01:26', '2022-05-29 00:03:11'),
(49, 'App\\Models\\User', 1, 'my-app-token', 'd0edbb2339589ca5e322bd416b6f82bbcf59dfcd5e5f3b9287e111e1927d263f', '[\"role:admin\"]', '2022-05-29 00:44:56', '2022-05-29 00:44:26', '2022-05-29 00:44:56'),
(50, 'App\\Models\\User', 1, 'my-app-token', 'a09e52beccdeafce4e941e135abfbf8a486023f2a97ffe83aeb76170e20eb84e', '[\"role:admin\"]', '2022-05-29 01:26:38', '2022-05-29 01:08:35', '2022-05-29 01:26:38'),
(51, 'App\\Models\\User', 8, 'my-app-token', '077dac020f620d8e973fca1a4c505913bac673727b8ad3e309efa29d72ace3a8', '[\"role:eleve\"]', '2022-05-29 02:14:54', '2022-05-29 01:28:05', '2022-05-29 02:14:54'),
(52, 'App\\Models\\User', 10, 'my-app-token', '5c28bdc2cc05fb338311f1193e6cb56edaf27256ba22c9b5030a012dbfda7669', '[\"role:enseignant\"]', '2022-05-29 03:51:58', '2022-05-29 01:30:41', '2022-05-29 03:51:58'),
(53, 'App\\Models\\User', 1, 'my-app-token', 'd43d2e2508a147dd3ce00bb22f3e763cbe4154f983238761a5cdb1a31e79681c', '[\"role:admin\"]', '2022-05-29 03:51:58', '2022-05-29 01:30:56', '2022-05-29 03:51:58'),
(54, 'App\\Models\\User', 7, 'my-app-token', '45603713c426658685740c0bc2824e69e35630063898107ab1236529a0f24424', '[\"role:parentt\"]', '2022-05-29 03:57:43', '2022-05-29 01:54:31', '2022-05-29 03:57:43'),
(55, 'App\\Models\\User', 8, 'my-app-token', 'a208919846c4e187c3509e29d5e0a79fdc2830c532d8bd2e9997abf86b24a2d8', '[\"role:eleve\"]', '2022-05-29 03:53:56', '2022-05-29 02:15:55', '2022-05-29 03:53:56'),
(56, 'App\\Models\\User', 9, 'my-app-token', '900315844a24e5a45a3d2fb35fe344ac7b6565aed45d56b55b096a0895532b51', '[\"role:eleve\"]', '2022-05-29 03:56:34', '2022-05-29 03:55:45', '2022-05-29 03:56:34'),
(57, 'App\\Models\\User', 8, 'my-app-token', '809030e19df9156c9f208ded061bb49133d2233fb13f631dbf499a0dc50a010e', '[\"role:eleve\"]', '2022-05-29 03:57:10', '2022-05-29 03:56:57', '2022-05-29 03:57:10'),
(58, 'App\\Models\\User', 1, 'my-app-token', '886ac629cd866e04410d60bda320d634ae2a7e8a4d0c56fafff4ce5b147678a1', '[\"role:admin\"]', '2022-05-29 12:45:45', '2022-05-29 11:07:33', '2022-05-29 12:45:45'),
(59, 'App\\Models\\User', 8, 'my-app-token', '9bc16153dce76eee64e8b2ddfcd9a612477389b4ce1eceb08f22a57b48c12568', '[\"role:eleve\"]', '2022-05-29 12:52:51', '2022-05-29 11:23:44', '2022-05-29 12:52:51'),
(60, 'App\\Models\\User', 8, 'my-app-token', 'b273ae0964f345ff1c502938987f7dd39487b1116ce0b4c0e639508732fbbb6b', '[\"role:eleve\"]', '2022-05-29 12:34:57', '2022-05-29 12:34:04', '2022-05-29 12:34:57'),
(61, 'App\\Models\\User', 1, 'my-app-token', 'acc2e661166045f53c69fb83cd9a84cd0a29a33068bfd6589fcc3a3416d4cfa8', '[\"role:admin\"]', '2022-05-29 15:45:50', '2022-05-29 12:45:56', '2022-05-29 15:45:50'),
(62, 'App\\Models\\User', 1, 'my-app-token', '6d9644c4226c772146b716854fcfee783c8da44e317da5e03b2d8ec617a5aa3d', '[\"role:admin\"]', '2022-05-29 12:52:03', '2022-05-29 12:51:47', '2022-05-29 12:52:03'),
(63, 'App\\Models\\User', 7, 'my-app-token', '44a6c47993d2542bd85fdf596f576e7f8deed1e72643dee569d27f8e30333091', '[\"role:parentt\"]', '2022-05-29 13:06:25', '2022-05-29 12:53:18', '2022-05-29 13:06:25'),
(64, 'App\\Models\\User', 7, 'my-app-token', '6d1932708246575cc2876c18bc54598c27042210c184a4f8a936ea78ba4bb432', '[\"role:parentt\"]', '2022-05-29 16:35:35', '2022-05-29 13:09:07', '2022-05-29 16:35:35'),
(65, 'App\\Models\\User', 10, 'my-app-token', 'a455b4915c082f6ba527e7bafd7cd0b73e4fdd144d14d4bb17d24ce641295f03', '[\"role:enseignant\"]', '2022-05-29 15:21:48', '2022-05-29 15:21:28', '2022-05-29 15:21:48'),
(66, 'App\\Models\\User', 1, 'my-app-token', '3aff448fe911938ba19e0de01176b4b00cbf12ccd3f17deb1d9c05c5aee74422', '[\"role:admin\"]', '2022-05-30 02:08:08', '2022-05-29 15:22:24', '2022-05-30 02:08:08'),
(67, 'App\\Models\\User', 1, 'my-app-token', '844af2dcbd8caebd5129b80b5c406d3c6e2dd777ac9899672ed28eb4797678b0', '[\"role:admin\"]', '2022-05-29 15:48:22', '2022-05-29 15:48:19', '2022-05-29 15:48:22'),
(68, 'App\\Models\\User', 10, 'my-app-token', 'd37622b80477f7a368be7b186d9285d48b6a91c4b1d089444a34025c2a3f2d84', '[\"role:enseignant\"]', '2022-05-29 15:49:08', '2022-05-29 15:49:06', '2022-05-29 15:49:08'),
(69, 'App\\Models\\User', 8, 'my-app-token', '7ceff60ef753edff60a0a567df34b523d1c6d0ec6693b64d62e9ef4858067864', '[\"role:eleve\"]', '2022-05-29 15:49:20', '2022-05-29 15:49:19', '2022-05-29 15:49:20'),
(70, 'App\\Models\\User', 7, 'my-app-token', 'c3f50cb21e4ef47ec20c99b5762c19d1ba4f6b6d19b9df10ea21be564bdf83ab', '[\"role:parentt\"]', '2022-05-29 15:49:44', '2022-05-29 15:49:38', '2022-05-29 15:49:44'),
(71, 'App\\Models\\User', 1, 'my-app-token', 'e598d0a85fb3ea765f5955a2b5d72a24bc70097ef6f34ae45d5bff41c0e0a7bb', '[\"role:admin\"]', '2022-05-29 16:16:29', '2022-05-29 15:49:56', '2022-05-29 16:16:29'),
(72, 'App\\Models\\User', 1, 'my-app-token', '91c09adea6e41cbcf877def76c060d362a8bb3e9f12ad6d1ab6c33040404955f', '[\"role:admin\"]', '2022-05-29 16:48:18', '2022-05-29 16:16:44', '2022-05-29 16:48:18'),
(73, 'App\\Models\\User', 1, 'my-app-token', '03c1aa0f67a3c57e1a86dffc795b5da643e0dc797512517cf25ff3fb554a7b3b', '[\"role:admin\"]', '2022-05-29 19:42:06', '2022-05-29 16:45:25', '2022-05-29 19:42:06'),
(74, 'App\\Models\\User', 1, 'my-app-token', '3f75a749145c7d030eaf1062c1270ae8ea5b52ee39ab9656f058375800c5c8fe', '[\"role:admin\"]', '2022-05-29 16:59:22', '2022-05-29 16:49:32', '2022-05-29 16:59:22'),
(75, 'App\\Models\\User', 10, 'my-app-token', 'c3e43bd4ca9e623cc8654130d468728456fb959c67e893cfe246f00c8beae266', '[\"role:enseignant\"]', '2022-05-30 00:09:29', '2022-05-29 16:50:57', '2022-05-30 00:09:29'),
(76, 'App\\Models\\User', 10, 'my-app-token', '0ae919004b2ad4f0df010ce1ca321566aa3c2b4234da4de7a079e696d43bafc6', '[\"role:enseignant\"]', '2022-05-29 17:04:08', '2022-05-29 16:59:37', '2022-05-29 17:04:08'),
(77, 'App\\Models\\User', 7, 'my-app-token', '7383e5ac08af705a52a641b25f294157bf73e81ed555a9065618a00425129019', '[\"role:parentt\"]', '2022-05-29 18:11:33', '2022-05-29 17:09:52', '2022-05-29 18:11:33'),
(78, 'App\\Models\\User', 1, 'my-app-token', 'c155ff6f27f1d8952f496916807bee0bc1168d27b5bd3168560b7fff76f3f67f', '[\"role:admin\"]', '2022-05-29 22:59:56', '2022-05-29 20:00:10', '2022-05-29 22:59:56'),
(79, 'App\\Models\\User', 10, 'my-app-token', 'f1d73bf5883edc342bc23f32de0a4e7c41ab031a19228a83a4ccc1b3efd19b66', '[\"role:enseignant\"]', '2022-05-29 23:01:33', '2022-05-29 23:00:07', '2022-05-29 23:01:33'),
(80, 'App\\Models\\User', 1, 'my-app-token', '0119057540ef493d8bda35a36b61418d32d4f6ab58a81431c9116adbad421c16', '[\"role:admin\"]', '2022-05-30 02:15:42', '2022-05-29 23:01:42', '2022-05-30 02:15:42'),
(81, 'App\\Models\\User', 10, 'my-app-token', '92e849225538a61a66465cab1313fbcf93a5d1afb292da0bb6988b425bebda27', '[\"role:enseignant\"]', NULL, '2022-05-30 00:09:38', '2022-05-30 00:09:38'),
(82, 'App\\Models\\User', 1, 'my-app-token', '3308b7f5b371e34f43e5261d98b3b68a1f6e07230989cb128cf67490ca5856a8', '[\"role:admin\"]', '2022-05-30 03:06:56', '2022-05-30 02:20:18', '2022-05-30 03:06:56'),
(83, 'App\\Models\\User', 16, 'my-app-token', '4cbac2084eff3b6482446ef0ebec441373531187ce2a4384bd1b4d5ad3cef374', '[\"role:enseignant\"]', '2022-05-30 02:58:31', '2022-05-30 02:41:31', '2022-05-30 02:58:31'),
(84, 'App\\Models\\User', 8, 'my-app-token', '0fb0c63bec87f2939cb615a1cb47eed88a89249afb1a7a493715d3e395745154', '[\"role:eleve\"]', '2022-05-30 02:59:30', '2022-05-30 02:53:24', '2022-05-30 02:59:30'),
(85, 'App\\Models\\User', 7, 'my-app-token', '2bba2fb039c220bb539429471e319bbb4d38687edeeccf8fb95cf0f024c9dfcc', '[\"role:parentt\"]', '2022-05-30 03:06:24', '2022-05-30 03:00:39', '2022-05-30 03:06:24'),
(86, 'App\\Models\\User', 7, 'my-app-token', 'eb61728369183678870815e2d7017455e56bb29133b32f207cc3fb2d8eb9973e', '[\"role:parentt\"]', '2022-05-30 03:08:05', '2022-05-30 03:07:15', '2022-05-30 03:08:05'),
(87, 'App\\Models\\User', 1, 'my-app-token', '4bb21769aba74fcc138985a22958192174ada109a5446d2c7b935ee09b6109ea', '[\"role:admin\"]', '2022-05-30 07:58:06', '2022-05-30 07:42:12', '2022-05-30 07:58:06'),
(88, 'App\\Models\\User', 16, 'my-app-token', '0753785b0bd5349f524700c99fc701299af7e7dcbc0e6dbfd2f05b0f5e358c3c', '[\"role:enseignant\"]', '2022-05-30 07:58:25', '2022-05-30 07:48:01', '2022-05-30 07:58:25'),
(89, 'App\\Models\\User', 1, 'my-app-token', 'b5e72d5989e547ff283f3783f92ab3a86141b866345236b02ef1f305ab723277', '[\"role:admin\"]', '2022-05-30 08:00:42', '2022-05-30 07:58:47', '2022-05-30 08:00:42'),
(90, 'App\\Models\\User', 8, 'my-app-token', '47d66f421d0f86970b251d5344329247ef6138858ef11620cf2cbf8014d65370', '[\"role:eleve\"]', '2022-05-30 08:01:46', '2022-05-30 08:01:28', '2022-05-30 08:01:46'),
(91, 'App\\Models\\User', 7, 'my-app-token', '4778d70b5c8267bb829f7e5e187636328a4c5419c44439825d56b02e200a813f', '[\"role:parentt\"]', '2022-05-30 08:05:02', '2022-05-30 08:02:12', '2022-05-30 08:05:02'),
(92, 'App\\Models\\User', 16, 'my-app-token', '73b4d9742beb9f36db24a6f9b5beb17eb08eac1f49d940fcc8b1e5f5b1e3d632', '[\"role:enseignant\"]', '2022-05-30 08:05:20', '2022-05-30 08:03:40', '2022-05-30 08:05:20'),
(93, 'App\\Models\\User', 1, 'my-app-token', '6e408b8f60eb98b049cb2e578db6efea2ed35089e7c203241563ccdef9cdb2c8', '[\"role:admin\"]', '2022-05-30 08:33:00', '2022-05-30 08:07:12', '2022-05-30 08:33:00'),
(94, 'App\\Models\\User', 16, 'my-app-token', 'a28e7a0e518168d5559d7f8c79bc9246603cd7b059e05919cf2e2faa68aa50af', '[\"role:enseignant\"]', '2022-05-30 08:36:06', '2022-05-30 08:33:14', '2022-05-30 08:36:06'),
(95, 'App\\Models\\User', 7, 'my-app-token', 'b85de0055be21bfacfa6f9426b9e3ebfd4ff461764ec0fb0b392630c4b830cf5', '[\"role:parentt\"]', '2022-05-30 08:34:48', '2022-05-30 08:33:58', '2022-05-30 08:34:48'),
(96, 'App\\Models\\User', 1, 'my-app-token', '7df470d781092b936b95f8a7696d4506a61b0c50ff5e19c1e9c161676d898c8c', '[\"role:admin\"]', '2022-05-30 23:06:14', '2022-05-30 23:06:03', '2022-05-30 23:06:14'),
(97, 'App\\Models\\User', 1, 'my-app-token', '50094a81864c60a9c0890d9eb5452ba12ee472f8c6fe15c58fff8a4dfbfeeb7c', '[\"role:admin\"]', '2022-05-30 23:39:08', '2022-05-30 23:06:51', '2022-05-30 23:39:08'),
(98, 'App\\Models\\User', 1, 'my-app-token', '2c74d9912e3fb95399490a298ae11c346d59bd730a96d21832f5ff2eeb3512e1', '[\"role:admin\"]', '2022-05-31 12:10:22', '2022-05-31 09:26:07', '2022-05-31 12:10:22'),
(99, 'App\\Models\\User', 1, 'my-app-token', 'c642ac9ad7516295ce7a50b7395943eeb24b6aa56c2b5c4eb0fd43a88f6725e5', '[\"role:admin\"]', '2022-05-31 20:59:35', '2022-05-31 20:59:20', '2022-05-31 20:59:35'),
(100, 'App\\Models\\User', 1, 'my-app-token', '78cb4e2d6d19bb7ef1156d524d0abd5d18041f18564840d7578bf6a19474a26c', '[\"role:admin\"]', '2022-05-31 23:24:52', '2022-05-31 23:23:43', '2022-05-31 23:24:52'),
(101, 'App\\Models\\User', 1, 'my-app-token', '96fb22e3ba32d8dfd2fcd15b6f3f7e253d883585889f65b4dd7ed1d93f250afa', '[\"role:admin\"]', '2022-06-01 02:59:02', '2022-05-31 23:38:31', '2022-06-01 02:59:02'),
(102, 'App\\Models\\User', 16, 'my-app-token', '8412e4eda8c4fc3ecfba016b978b6d385b17d33cc4db7b2ecefea439c1bb9fa2', '[\"role:enseignant\"]', '2022-06-01 01:14:38', '2022-06-01 01:09:55', '2022-06-01 01:14:38'),
(103, 'App\\Models\\User', 1, 'my-app-token', '7b88c49a3003d7a1d646e71a069e8c16fc00ecf0207f5bde3f7d91c38aea1b4c', '[\"role:admin\"]', '2022-06-01 16:20:41', '2022-06-01 12:11:10', '2022-06-01 16:20:41'),
(104, 'App\\Models\\User', 16, 'my-app-token', '73fe2788960d468a8ae7d6c1d7b956b0ffe9ff02d57298d9045384c5ddb9d341', '[\"role:enseignant\"]', '2022-06-01 17:39:23', '2022-06-01 12:26:13', '2022-06-01 17:39:23'),
(105, 'App\\Models\\User', 1, 'my-app-token', '0ec52607fc77b2bd311492e90081c6aae0b5b02c88a7f75c5212aa62518d3616', '[\"role:admin\"]', '2022-06-02 03:23:05', '2022-06-01 20:50:48', '2022-06-02 03:23:05'),
(106, 'App\\Models\\User', 16, 'my-app-token', '60441ccad4e7f7026b0ee68790bc2ff90b425030a710bf5763b3a3c04dbdcd62', '[\"role:enseignant\"]', '2022-06-02 03:01:11', '2022-06-01 20:52:35', '2022-06-02 03:01:11'),
(107, 'App\\Models\\User', 1, 'my-app-token', 'ec39fde5d448bd6b400773a9a4024fe7b4f1e84db29d94b4bf9defd4dfee170c', '[\"role:admin\"]', '2022-06-05 01:57:25', '2022-06-01 23:42:13', '2022-06-05 01:57:25'),
(108, 'App\\Models\\User', 1, 'my-app-token', '5e1a9b323a3022ac6e17c4084b53e6b45a8f86b88489adeb343c0b01eed97361', '[\"role:admin\"]', '2022-06-02 16:12:12', '2022-06-02 12:46:34', '2022-06-02 16:12:12'),
(109, 'App\\Models\\User', 28, 'my-app-token', '452d50258e2312840de2ef8a9f279e6b52463beab3b9d5fc5e1630c2a6f679f7', '[\"role:enseignant\"]', '2022-06-02 14:10:27', '2022-06-02 13:57:58', '2022-06-02 14:10:27'),
(110, 'App\\Models\\User', 25, 'my-app-token', 'b24428525e05227c826f8ba74e009cf0447f48bf0e2862bc8abbbc19fea6b54a', '[\"role:enseignant\"]', '2022-06-02 14:15:59', '2022-06-02 14:11:06', '2022-06-02 14:15:59'),
(111, 'App\\Models\\User', 20, 'my-app-token', '1cede9c951e92ba756178147f499c21be38589f6b4f3887f6ca0245cb9412313', '[\"role:enseignant\"]', '2022-06-02 14:19:44', '2022-06-02 14:16:49', '2022-06-02 14:19:44'),
(112, 'App\\Models\\User', 18, 'my-app-token', '23408ff344989ca21d43672f5caaab9f01264734ac02a264eef823e201566bd0', '[\"role:enseignant\"]', '2022-06-02 14:32:46', '2022-06-02 14:20:05', '2022-06-02 14:32:46'),
(113, 'App\\Models\\User', 19, 'my-app-token', 'e253b45af27ad3d204c50553bc34bb85e2ceda5d067c476a67a237915dad5751', '[\"role:enseignant\"]', '2022-06-02 14:35:36', '2022-06-02 14:33:05', '2022-06-02 14:35:36'),
(114, 'App\\Models\\User', 9, 'my-app-token', '98f4852113bfcee5e8d2c48fde5aef53c1de9082272d2baccfc1419bcc54d588', '[\"role:eleve\"]', '2022-06-02 16:54:23', '2022-06-02 14:36:24', '2022-06-02 16:54:23'),
(115, 'App\\Models\\User', 26, 'my-app-token', '52d0bd43b0838172adb4f30d4394248e4bce5fa761270fa85dcf0458c57cfa34', '[\"role:enseignant\"]', '2022-06-02 14:44:08', '2022-06-02 14:40:56', '2022-06-02 14:44:08'),
(116, 'App\\Models\\User', 17, 'my-app-token', 'd95d1245af2099dacf53556412b7d8b7355390a34b9d1b3ec26e0704c9c6a8fe', '[\"role:enseignant\"]', '2022-06-02 14:47:59', '2022-06-02 14:45:16', '2022-06-02 14:47:59'),
(117, 'App\\Models\\User', 27, 'my-app-token', 'aa1f2b2769459e6a7d5ce6818e222628c59f7eb3279a705b235b8511900e4c7a', '[\"role:enseignant\"]', '2022-06-02 14:51:11', '2022-06-02 14:48:15', '2022-06-02 14:51:11'),
(118, 'App\\Models\\User', 28, 'my-app-token', '50ae201690e0de00681ee770ee79b4e984f984f03ef73cb0a4aff762c3c60ae0', '[\"role:enseignant\"]', '2022-06-02 16:54:23', '2022-06-02 14:55:31', '2022-06-02 16:54:23'),
(119, 'App\\Models\\User', 1, 'my-app-token', 'd66f067e6791b0b9ff8656838c15014900d2a8e34c1c5d4df7c7fd0a81536263', '[\"role:admin\"]', '2022-06-03 00:26:07', '2022-06-02 20:16:12', '2022-06-03 00:26:07'),
(120, 'App\\Models\\User', 1, 'my-app-token', '665ae7f84ee8693818ad43e7e90a42428e8b6ad31f85cc2b3292585b271f416e', '[\"role:admin\"]', '2022-06-03 00:26:07', '2022-06-03 00:08:46', '2022-06-03 00:26:07'),
(121, 'App\\Models\\User', 1, 'my-app-token', '8a797eaccbb840cd7fbfb1ad32340215ca523a74eda5762e259a818be80f89d4', '[\"role:admin\"]', '2022-06-03 08:37:59', '2022-06-03 08:35:46', '2022-06-03 08:37:59'),
(122, 'App\\Models\\User', 1, 'my-app-token', '3fe8f2bbf074a517669fe282584ad35b3fd5eaf7daf478d325e61c136b57f70d', '[\"role:admin\"]', '2022-06-03 10:55:23', '2022-06-03 08:44:01', '2022-06-03 10:55:23'),
(123, 'App\\Models\\User', 8, 'my-app-token', '52db52a42d08dbf144c0a8fe6f9a04eccb1433b465320d87fccc1114735b1592', '[\"role:eleve\"]', '2022-06-03 09:13:08', '2022-06-03 09:13:02', '2022-06-03 09:13:08'),
(124, 'App\\Models\\User', 9, 'my-app-token', 'd857fcd209a2b2295cee95eae6686aeb1ceff3ef4e54b7eb0a95d29a31c111a6', '[\"role:eleve\"]', '2022-06-03 10:46:27', '2022-06-03 09:13:19', '2022-06-03 10:46:27'),
(125, 'App\\Models\\User', 1, 'my-app-token', '81e0b003a8b2aca4768904c7b4b08728f224e1a101ca4e0ce7b6835c8771b0bb', '[\"role:admin\"]', '2022-06-03 17:03:56', '2022-06-03 12:30:56', '2022-06-03 17:03:56'),
(126, 'App\\Models\\User', 16, 'my-app-token', '8121539454c74051ab56d673241be81955e8252bd7c2cb4429c17b22163202e2', '[\"role:enseignant\"]', '2022-06-03 17:02:20', '2022-06-03 12:54:07', '2022-06-03 17:02:20'),
(127, 'App\\Models\\User', 1, 'my-app-token', '67ec37d1342053f6637fdf9eeec72d30a241b8139c9f08102122148f926e06cc', '[\"role:admin\"]', '2022-06-03 17:02:20', '2022-06-03 13:15:39', '2022-06-03 17:02:20'),
(128, 'App\\Models\\User', 1, 'my-app-token', '472a5ba8cccda2fb19e30021b57e4af21bdf13794fdcd72c43b9f90b22834e9b', '[\"role:admin\"]', '2022-06-04 14:33:27', '2022-06-04 12:59:02', '2022-06-04 14:33:27'),
(129, 'App\\Models\\User', 9, 'my-app-token', 'b6bde090b85ca9a173ea10ce2bacaf9f25c60bb4d6d73fa18e601d3a367e8e5a', '[\"role:eleve\"]', '2022-06-04 14:32:16', '2022-06-04 14:21:57', '2022-06-04 14:32:16'),
(130, 'App\\Models\\User', 1, 'my-app-token', '9bb718060fd18d7f7ffdc023388ad289f668798c64c3957345feef15fecb09c3', '[\"role:admin\"]', '2022-06-04 17:27:09', '2022-06-04 14:50:55', '2022-06-04 17:27:09'),
(131, 'App\\Models\\User', 1, 'my-app-token', '05930319823b682161c8d21ed7b4ce26a82aab5b4c8355640e5e6bba73c77f55', '[\"role:admin\"]', '2022-06-04 16:01:10', '2022-06-04 15:06:03', '2022-06-04 16:01:10'),
(132, 'App\\Models\\User', 9, 'my-app-token', '85d60297d404f05299fad55af698947cfc28a477f986b211787242c26e89954e', '[\"role:eleve\"]', '2022-06-04 15:46:41', '2022-06-04 15:46:00', '2022-06-04 15:46:41'),
(133, 'App\\Models\\User', 7, 'my-app-token', '550bdd8278d55d62e16b3ddd049f4b543f8f4d89161bd949f927ab1d1f904ab9', '[\"role:parentt\"]', '2022-06-04 17:42:11', '2022-06-04 15:47:16', '2022-06-04 17:42:11'),
(134, 'App\\Models\\User', 1, 'my-app-token', 'd696b3c83ae1e12b4ecf07b8d230a3062b4dacd0167917de3c91016245612644', '[\"role:admin\"]', '2022-06-05 04:09:26', '2022-06-04 19:40:35', '2022-06-05 04:09:26'),
(135, 'App\\Models\\User', 1, 'my-app-token', 'e3d84950176a4d376806abb02ee1027743ab13ac5484a9864c2da93bdc2296a5', '[\"role:admin\"]', NULL, '2022-06-04 19:40:36', '2022-06-04 19:40:36'),
(136, 'App\\Models\\User', 1, 'my-app-token', '443e32c807255dbfa11e008a86e9e613fd6f933fc1ff47cd16f817bcd00b2c2c', '[\"role:admin\"]', '2022-06-05 23:18:32', '2022-06-05 22:52:32', '2022-06-05 23:18:32'),
(137, 'App\\Models\\User', 1, 'my-app-token', '6808d4853a168db53c83bee99203c7dcc498b4123e5b002c73b0ebfdc90ded5b', '[\"role:admin\"]', '2022-06-07 01:45:51', '2022-06-06 14:38:41', '2022-06-07 01:45:51'),
(138, 'App\\Models\\User', 16, 'my-app-token', '0b1bd2de4255c6025ef9e705d4b59b3cea8ee8783df7947db13a0b253bb3e7c6', '[\"role:enseignant\"]', '2022-06-06 18:21:10', '2022-06-06 18:20:46', '2022-06-06 18:21:10'),
(139, 'App\\Models\\User', 1, 'my-app-token', 'bf063bb4c3d454aea7d392195129cf6158e80446f042f0559329503afee3a62b', '[\"role:admin\"]', '2022-06-07 23:43:49', '2022-06-07 20:22:01', '2022-06-07 23:43:49'),
(140, 'App\\Models\\User', 9, 'my-app-token', 'a64c33f6fb0714b0217c3d8fa276c17c21780007684f7d4bbcdf7a13756d36b4', '[\"role:eleve\"]', '2022-06-07 23:01:11', '2022-06-07 20:22:33', '2022-06-07 23:01:11'),
(141, 'App\\Models\\User', 1, 'my-app-token', 'f748f418e4f2367ce5dc71ad4c36bd5384496bd37056a52fe4a93827daecba57', '[\"role:admin\"]', '2022-06-09 03:21:17', '2022-06-08 14:54:43', '2022-06-09 03:21:17'),
(142, 'App\\Models\\User', 16, 'my-app-token', 'df7a711865fe8cde05f889e42661e8a4abbabac727ff94c1622cb263fade2ceb', '[\"role:enseignant\"]', '2022-06-09 00:37:24', '2022-06-08 19:26:58', '2022-06-09 00:37:24'),
(143, 'App\\Models\\User', 9, 'my-app-token', 'cb2a3f0c20cdfb869d859a8089edd16a3d657aabb3dcf9197fb9c1e55db6dca4', '[\"role:eleve\"]', '2022-06-09 03:42:11', '2022-06-09 02:30:05', '2022-06-09 03:42:11'),
(144, 'App\\Models\\User', 7, 'my-app-token', 'e1641eb6a927cbdcf45af75f02ca7f94e95664260cc8146896512a13c02ba7f0', '[\"role:parentt\"]', '2022-06-09 03:45:25', '2022-06-09 03:44:00', '2022-06-09 03:45:25'),
(145, 'App\\Models\\User', 1, 'my-app-token', 'b961dd572f8cbb825a1052a7d9215fcd46a9e18675a4d048801425da09f5c31f', '[\"role:admin\"]', '2022-06-09 09:49:02', '2022-06-09 09:15:29', '2022-06-09 09:49:02'),
(146, 'App\\Models\\User', 9, 'my-app-token', 'e4c80fd312b11cab036bb03432a1b84b050cef57c3c6faa600b8e27cc288899d', '[\"role:eleve\"]', '2022-06-09 09:56:33', '2022-06-09 09:55:08', '2022-06-09 09:56:33'),
(147, 'App\\Models\\User', 1, 'my-app-token', 'aef436c607e0e3c8c98aca41881b0044de82aca2054efd2c9a595fb4489d26b9', '[\"role:admin\"]', '2022-06-09 12:29:14', '2022-06-09 09:56:47', '2022-06-09 12:29:14'),
(148, 'App\\Models\\User', 1, 'my-app-token', 'ab8586879b9b59390360baf63191dba089580e0d4abf164372a3bec7ed3a3552', '[\"role:admin\"]', '2022-06-09 16:33:30', '2022-06-09 15:11:30', '2022-06-09 16:33:30'),
(149, 'App\\Models\\User', 7, 'my-app-token', '1869dc714cc2f98576507ef7456b0ba3b9df83e0b5a3b7105218853228e81fe6', '[\"role:parentt\"]', '2022-06-09 17:38:40', '2022-06-09 16:16:48', '2022-06-09 17:38:40'),
(150, 'App\\Models\\User', 16, 'my-app-token', '8bc70eeb0c4bb27d68dc60e7dc5365ca9c9aaa84a2f6f9b3b5e512cab6c2f68f', '[\"role:enseignant\"]', '2022-06-09 17:27:09', '2022-06-09 16:32:15', '2022-06-09 17:27:09'),
(151, 'App\\Models\\User', 9, 'my-app-token', '55039ea19a4d6a50bb46c4699d7ef05629533dd1a8b282fb8beca36f689e3834', '[\"role:eleve\"]', '2022-06-09 17:13:01', '2022-06-09 17:12:07', '2022-06-09 17:13:01'),
(152, 'App\\Models\\User', 1, 'my-app-token', '71d6a90d1c9511ade8434378c3834c5f15097424b9fc76b7b394e19c5c4c470c', '[\"role:admin\"]', '2022-06-09 23:22:00', '2022-06-09 20:55:11', '2022-06-09 23:22:00'),
(153, 'App\\Models\\User', 1, 'my-app-token', '3c44c716546bcd89c6682e008ffc738179577621b1b1596ccc74b7f2f5704825', '[\"role:admin\"]', NULL, '2022-06-09 20:55:12', '2022-06-09 20:55:12'),
(154, 'App\\Models\\User', 16, 'my-app-token', '2ab0c90a757334c42b0eeb87ac1d9cd5c5bcf8fadbd89b838f39801ffd2afe44', '[\"role:enseignant\"]', '2022-06-09 23:24:23', '2022-06-09 22:43:41', '2022-06-09 23:24:23'),
(155, 'App\\Models\\User', 1, 'my-app-token', 'd5d795829df91b0f1d90fe3d547b7e3ae488d15300a3c0958beec7f0a44858d2', '[\"role:admin\"]', '2022-06-10 14:13:59', '2022-06-10 13:20:12', '2022-06-10 14:13:59'),
(156, 'App\\Models\\User', 1, 'my-app-token', '358aa733c16558cedddeb99a1cc660908c1f703e9e4a448c03bd3cb55e2088e5', '[\"role:admin\"]', '2022-06-10 21:26:47', '2022-06-10 20:44:43', '2022-06-10 21:26:47'),
(157, 'App\\Models\\User', 1, 'my-app-token', '79ac72d61c7b3264ec0110a63aff391d25bc7452b5868bc71a8e4231778bd98e', '[\"role:admin\"]', '2022-06-11 12:24:56', '2022-06-11 12:24:54', '2022-06-11 12:24:56'),
(158, 'App\\Models\\User', 16, 'my-app-token', '97227b499080785fbe239ee964cfd8759ddc8cde8d7e6692980eb740e441db46', '[\"role:enseignant\"]', '2022-06-11 12:34:12', '2022-06-11 12:34:10', '2022-06-11 12:34:12'),
(159, 'App\\Models\\User', 9, 'my-app-token', '3a53823b8a5afa9f25d7e9340665ea726f911fcb33b9bbeec5562ece56bbd5ed', '[\"role:eleve\"]', '2022-06-11 12:45:02', '2022-06-11 12:45:00', '2022-06-11 12:45:02'),
(160, 'App\\Models\\User', 7, 'my-app-token', '71bb3b7185b897f01eb8a9eca5a8efc858197b5ce6b9a1c8fe12c1e3411ad1d4', '[\"role:parentt\"]', '2022-06-11 16:33:24', '2022-06-11 12:45:31', '2022-06-11 16:33:24'),
(161, 'App\\Models\\User', 1, 'my-app-token', '2577f075df5747f7f6a7d545d5733d67991ba2b9e78c0dcbba02dd4115f399be', '[\"role:admin\"]', '2022-06-12 13:07:56', '2022-06-12 12:55:43', '2022-06-12 13:07:56'),
(162, 'App\\Models\\User', 16, 'my-app-token', '49155633cdb8999e201886727974a426d9973c0ddbf09768290455960e603a59', '[\"role:enseignant\"]', '2022-06-12 16:40:10', '2022-06-12 13:03:07', '2022-06-12 16:40:10'),
(163, 'App\\Models\\User', 1, 'my-app-token', '3eff0b56e1e19dbd2d1743e61f13559abfb170a10704f782350baa95c7f52fb9', '[\"role:admin\"]', '2022-06-13 14:03:05', '2022-06-13 13:22:48', '2022-06-13 14:03:05'),
(164, 'App\\Models\\User', 16, 'my-app-token', 'aa5a624c3e1888bc6d3bc60974c3f6d9e6a4c8e96d28e0a5c8aaa3c5e773728f', '[\"role:enseignant\"]', '2022-06-13 13:50:15', '2022-06-13 13:38:14', '2022-06-13 13:50:15'),
(165, 'App\\Models\\User', 9, 'my-app-token', '832ac072bb8b749f13fb1a81110263e0d28c01405b3daff7f2c27af20278861e', '[\"role:eleve\"]', '2022-06-13 14:05:33', '2022-06-13 13:50:53', '2022-06-13 14:05:33'),
(166, 'App\\Models\\User', 16, 'my-app-token', '47858d08beb0f721373b4d33796af8f09e7002d613825528a4373641c1f24a4d', '[\"role:enseignant\"]', '2022-06-13 14:04:49', '2022-06-13 13:53:18', '2022-06-13 14:04:49'),
(167, 'App\\Models\\User', 7, 'my-app-token', '873c2b01f204b129c506bb3fe0bc2630519189420bb0326a63537ac25927337c', '[\"role:parentt\"]', '2022-06-13 14:10:30', '2022-06-13 13:56:55', '2022-06-13 14:10:30'),
(168, 'App\\Models\\User', 1, 'my-app-token', '43a165545f1d922c03ace08ddba4f8a01f52fcafdc771c5f98061e70bea160fe', '[\"role:admin\"]', '2022-06-13 23:16:06', '2022-06-13 23:13:35', '2022-06-13 23:16:06'),
(169, 'App\\Models\\User', 1, 'my-app-token', 'f480e070361baca3b9dae962210756d8a113ea3c126eaeda160ba2d3b1a3a8be', '[\"role:admin\"]', '2022-06-14 17:01:13', '2022-06-14 16:16:20', '2022-06-14 17:01:13'),
(170, 'App\\Models\\User', 1, 'my-app-token', 'f85dfd6af0e3cc4c2c606a1f59473e918b64b015aea80be8d8b73be7d09f42ee', '[\"role:admin\"]', '2022-06-15 12:35:45', '2022-06-15 09:18:17', '2022-06-15 12:35:45'),
(171, 'App\\Models\\User', 16, 'my-app-token', '330aa5cfcb230cc0c7c637991cd31c4a0a13d984ab6f9dac9aef5744159558dd', '[\"role:enseignant\"]', '2022-06-15 13:06:23', '2022-06-15 12:50:10', '2022-06-15 13:06:23'),
(172, 'App\\Models\\User', 7, 'my-app-token', '82a022102d11a9e4e7ecdc86abc83706a729c0cabbfa18a09dff542f332c1555', '[\"role:parentt\"]', '2022-06-16 02:41:13', '2022-06-15 14:33:11', '2022-06-16 02:41:13'),
(173, 'App\\Models\\User', 9, 'my-app-token', '32783a4de15f04eaa72a8b00c0e9ba76c7699347a4a16341e153795f1a2d31ba', '[\"role:eleve\"]', '2022-06-20 14:06:24', '2022-06-20 12:40:50', '2022-06-20 14:06:24'),
(174, 'App\\Models\\User', 1, 'my-app-token', '360473a6c31b0a77869a767594c3d5d71d97d56542fdf3fa33ae68d0367971ad', '[\"role:admin\"]', '2022-06-21 01:20:10', '2022-06-21 01:11:30', '2022-06-21 01:20:10'),
(175, 'App\\Models\\User', 1, 'my-app-token', '9f5df734635c4fdd83f6f7e68f4382eb278ddaec1706dc33892953c67be09124', '[\"role:admin\"]', '2022-06-21 13:17:30', '2022-06-21 10:45:24', '2022-06-21 13:17:30'),
(176, 'App\\Models\\User', 1, 'my-app-token', '46230ae55ccc39f34d7e07874b3ff90cd2ea56ca446aaa0c666835679fd2a0bc', '[\"role:admin\"]', '2022-06-22 02:22:47', '2022-06-21 22:00:12', '2022-06-22 02:22:47'),
(177, 'App\\Models\\User', 1, 'my-app-token', 'd2fdc1d0329365b2f31417ab0d0e71644ee7d0796faf23a22dc78d6fe730f924', '[\"role:admin\"]', '2022-06-22 14:05:49', '2022-06-22 10:49:34', '2022-06-22 14:05:49'),
(178, 'App\\Models\\User', 1, 'my-app-token', '7a452e34b610bdb72c29258ac583f0149de008648fe3537907548e4b52c5d799', '[\"role:admin\"]', '2022-06-23 23:46:56', '2022-06-23 22:11:04', '2022-06-23 23:46:56'),
(179, 'App\\Models\\User', 16, 'my-app-token', 'c696b2a80093102dabf01a2758544f5489c551bbed738617123c8c1a5a5706c2', '[\"role:enseignant\"]', '2022-06-23 23:46:56', '2022-06-23 22:25:35', '2022-06-23 23:46:56'),
(180, 'App\\Models\\User', 7, 'my-app-token', '8c5abb8df6e697bb081414b052d8d27c594dbc17728cf9abd16ec8da9b49f12a', '[\"role:parentt\"]', '2022-06-23 23:41:14', '2022-06-23 22:27:59', '2022-06-23 23:41:14'),
(181, 'App\\Models\\User', 1, 'my-app-token', 'e04d9d13ae26c5a62b3a9392b3b5c07611d8bac582ce3e2a49f82a52b94ed7c2', '[\"role:admin\"]', '2022-06-23 23:46:54', '2022-06-23 23:42:14', '2022-06-23 23:46:54'),
(182, 'App\\Models\\User', 16, 'my-app-token', 'f502be1d0639766f03d3e15c4a5b86c582071babfed5c42997b32d341e62164f', '[\"role:enseignant\"]', '2022-06-23 23:47:17', '2022-06-23 23:47:15', '2022-06-23 23:47:17'),
(183, 'App\\Models\\User', 1, 'my-app-token', '76eba6fa0e3e8f25fe7bd6bb59779986e8504a319ed09500685ef164dfcb36da', '[\"role:admin\"]', '2022-06-24 04:23:19', '2022-06-24 04:12:39', '2022-06-24 04:23:19'),
(184, 'App\\Models\\User', 1, 'my-app-token', 'b3cb0c1c6b939b08adea0b8ef47aaecddf8ff555a2384ce499cc9adcdd4ca74c', '[\"role:admin\"]', '2022-06-24 04:28:30', '2022-06-24 04:12:53', '2022-06-24 04:28:30'),
(185, 'App\\Models\\User', 1, 'my-app-token', 'ab955ee814d6f935cb669df39230baf13d588830c8fdeebd512743aff39f4bee', '[\"role:admin\"]', '2022-06-24 04:37:36', '2022-06-24 04:29:39', '2022-06-24 04:37:36'),
(186, 'App\\Models\\User', 1, 'my-app-token', '9e8990bca6e78a33b08240ea73f6793d48c25733aae3cee502edda559b65a9fb', '[\"role:admin\"]', '2022-06-24 04:54:19', '2022-06-24 04:38:21', '2022-06-24 04:54:19'),
(187, 'App\\Models\\User', 1, 'my-app-token', '01c7e7f17b6a71ec4108cf51219f6699b5aadf23154c9cb2235ba43227998503', '[\"role:admin\"]', '2022-06-24 04:39:12', '2022-06-24 04:38:37', '2022-06-24 04:39:12'),
(188, 'App\\Models\\User', 1, 'my-app-token', 'e62a15575d64920455c6d2f0fd6d5919e7ea9e12c6105b5ff81136cf47951e0f', '[\"role:admin\"]', '2022-06-24 05:03:39', '2022-06-24 04:45:53', '2022-06-24 05:03:39'),
(189, 'App\\Models\\User', 16, 'my-app-token', 'b7a2a5ccbf044c752639280ab84483825fe6a2e29f949538b1d618d74285be20', '[\"role:enseignant\"]', '2022-06-24 05:30:49', '2022-06-24 05:03:55', '2022-06-24 05:30:49'),
(190, 'App\\Models\\User', 1, 'my-app-token', '399a8573c334440e8a48d36894b6578f48f58f892ccb8fd12558934629be20ca', '[\"role:admin\"]', '2022-06-24 05:22:54', '2022-06-24 05:21:27', '2022-06-24 05:22:54'),
(191, 'App\\Models\\User', 9, 'my-app-token', '0f27ac0d2e98bb3ca55f7a0c1514eb4e50d767f47a9a3d8de6ff5a25f2f20032', '[\"role:eleve\"]', '2022-06-24 05:24:30', '2022-06-24 05:23:32', '2022-06-24 05:24:30'),
(192, 'App\\Models\\User', 1, 'my-app-token', '409c7f81c86cf4213b244011545279cec5f1b4924c5444bb914ff4880ac984db', '[\"role:admin\"]', '2022-06-24 05:37:53', '2022-06-24 05:35:30', '2022-06-24 05:37:53'),
(193, 'App\\Models\\User', 1, 'my-app-token', 'a379ebf4aa70eb68822885deb4a49c2bca7c3a8c074583ad01bc07d9efc08da5', '[\"role:admin\"]', NULL, '2022-06-24 05:35:30', '2022-06-24 05:35:30'),
(194, 'App\\Models\\User', 1, 'my-app-token', '344220c8fe7003aae08669ccc7d297a43b80f77a8a0ef6f39cb043f469182cc2', '[\"role:admin\"]', '2022-06-24 05:39:55', '2022-06-24 05:39:44', '2022-06-24 05:39:55'),
(195, 'App\\Models\\User', 1, 'my-app-token', 'e787f8f70ee29938d4d7217ace81a205a22b9baee0a8a4d9196e431f00b6e276', '[\"role:admin\"]', '2022-06-24 05:51:22', '2022-06-24 05:46:29', '2022-06-24 05:51:22'),
(196, 'App\\Models\\User', 16, 'my-app-token', 'f2ad90c67e734c77ae778e366a309bdd0ca11efc6468a9d5c1cfa9a6af77686f', '[\"role:enseignant\"]', '2022-06-24 05:52:49', '2022-06-24 05:51:33', '2022-06-24 05:52:49'),
(197, 'App\\Models\\User', 1, 'my-app-token', 'f0bcba292d84a576ee34c917648b5f3139dc799ddef693b5ec82a6a84c8b2e35', '[\"role:admin\"]', '2022-06-24 05:56:32', '2022-06-24 05:55:51', '2022-06-24 05:56:32'),
(198, 'App\\Models\\User', 16, 'my-app-token', 'ae084c593b321590bb0f392a56e175479d9afe5bfd3d717e7659334ed9a6a197', '[\"role:enseignant\"]', '2022-06-24 05:57:31', '2022-06-24 05:56:45', '2022-06-24 05:57:31'),
(199, 'App\\Models\\User', 1, 'my-app-token', '5d5b89526b9a274ca98dcf8b1865f30bdeb448b041fc6f1ebc51f3f0c7f326ab', '[\"role:admin\"]', '2022-06-24 05:59:05', '2022-06-24 05:58:43', '2022-06-24 05:59:05'),
(200, 'App\\Models\\User', 16, 'my-app-token', 'add69bc1e379c2f070099efa9e5dd04309cb9b19265a79fb541dfc259503a068', '[\"role:enseignant\"]', '2022-06-24 05:59:27', '2022-06-24 05:59:16', '2022-06-24 05:59:27'),
(201, 'App\\Models\\User', 1, 'my-app-token', 'da396880633459ac52e6e25e9b9e115fdb25d8236a11d4ea34531087947ceeec', '[\"role:admin\"]', '2022-06-24 06:11:12', '2022-06-24 06:03:36', '2022-06-24 06:11:12'),
(202, 'App\\Models\\User', 16, 'my-app-token', '99c75712b12fee0e1aae66fb2be325f0f824de398acca64f31e9840827c292fb', '[\"role:enseignant\"]', '2022-06-24 06:19:39', '2022-06-24 06:11:39', '2022-06-24 06:19:39'),
(203, 'App\\Models\\User', 1, 'my-app-token', 'd4acec52a9a9e193788f286f02c694909d7314da000c9f21b335780fa5373e02', '[\"role:admin\"]', '2022-06-24 06:21:58', '2022-06-24 06:21:21', '2022-06-24 06:21:58'),
(204, 'App\\Models\\User', 1, 'my-app-token', 'be5a553b787f603ed13137fbbdec0945d52f0410b65bd5fe146592365f21cc05', '[\"role:admin\"]', '2022-06-24 06:27:24', '2022-06-24 06:24:05', '2022-06-24 06:27:24'),
(205, 'App\\Models\\User', 16, 'my-app-token', '96122926e910a9f7317defee92a78ef4b8090d22251e50c263a632d55f0d83d7', '[\"role:enseignant\"]', '2022-06-24 06:46:56', '2022-06-24 06:27:39', '2022-06-24 06:46:56'),
(206, 'App\\Models\\User', 1, 'my-app-token', '705fd96290295a1fda471c89fface21332cdc058073fc7742be1a78ce9c42102', '[\"role:admin\"]', '2022-06-24 06:45:30', '2022-06-24 06:31:40', '2022-06-24 06:45:30'),
(207, 'App\\Models\\User', 1, 'my-app-token', '5eebd6084f60492a2305b5a6e35802c171ca2a15c45c1839e95bdb4dd50937d7', '[\"role:admin\"]', '2022-06-24 20:18:59', '2022-06-24 15:21:48', '2022-06-24 20:18:59'),
(208, 'App\\Models\\User', 1, 'my-app-token', '104d2088ba03e9f2097ea917b70baf4fde486f170f2dfae743daba6d50705dab', '[\"role:admin\"]', '2022-06-24 19:56:12', '2022-06-24 15:26:39', '2022-06-24 19:56:12'),
(209, 'App\\Models\\User', 16, 'my-app-token', '633fd994037c6fc4147fed5f6418b1cf77cc97d2be0180e911545d19e0ba881e', '[\"role:enseignant\"]', '2022-06-24 18:29:53', '2022-06-24 18:29:52', '2022-06-24 18:29:53'),
(210, 'App\\Models\\User', 28, 'my-app-token', 'ac407532d74fac876641d46eef0210baa0eafaecfed5a38b2dce7194a6cc9f8c', '[\"role:enseignant\"]', '2022-06-24 18:33:07', '2022-06-24 18:30:38', '2022-06-24 18:33:07'),
(211, 'App\\Models\\User', 9, 'my-app-token', 'eb447f11535c69c98e5298ad1991cafa6811d8bb003b76d844bc18d6e5481148', '[\"role:eleve\"]', '2022-06-24 18:43:16', '2022-06-24 18:43:08', '2022-06-24 18:43:16'),
(212, 'App\\Models\\User', 16, 'my-app-token', '4eee6fde7bd4ba2f54c1e48421f86ceaafd249725f49c1e3a8d686d48e1fe7a4', '[\"role:enseignant\"]', '2022-06-24 18:47:46', '2022-06-24 18:45:17', '2022-06-24 18:47:46');

-- --------------------------------------------------------

--
-- Structure de la table `preinsriptions`
--

CREATE TABLE `preinsriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateNais` date NOT NULL,
  `lieuNais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomComplet_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomComplet_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fct_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fct_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_mere` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `annee_id` bigint(20) UNSIGNED NOT NULL,
  `niveau_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `punitions`
--

CREATE TABLE `punitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `seance_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `enseignant_id` bigint(20) UNSIGNED NOT NULL,
  `eleve_id` bigint(20) UNSIGNED NOT NULL,
  `valider` tinyint(1) NOT NULL,
  `dateDebut` date DEFAULT NULL,
  `nbrJours` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `punitions`
--

INSERT INTO `punitions` (`id`, `session_id`, `seance_id`, `type`, `description`, `date`, `enseignant_id`, `eleve_id`, `valider`, `dateDebut`, `nbrJours`, `created_at`, `updated_at`) VALUES
(10, 2, NULL, 'Avertissement', 'hjbhjjj', '2022-06-02', 2, 2, 1, NULL, NULL, '2022-06-03 13:13:15', '2022-06-03 13:13:15'),
(11, 2, 7, 'Exclusion hors de la classe', 'bhjb', '2022-06-03', 2, 2, 1, NULL, NULL, '2022-06-03 13:13:38', '2022-06-03 13:13:38'),
(12, 2, NULL, 'Exclusion temporaire', 'hhhhh', '2022-06-07', 2, 2, 0, NULL, NULL, '2022-06-03 13:14:26', '2022-06-03 13:14:26'),
(13, 2, NULL, 'Exclusion définitive', 'hhhhhhhh', '2022-06-01', 2, 2, 0, NULL, NULL, '2022-06-03 13:14:54', '2022-06-03 13:14:54');

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

CREATE TABLE `salles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`id`, `nom`, `num`, `type`, `created_at`, `updated_at`) VALUES
(1, 'salle tp physique', 1, 'Salle de TP', '2022-05-24 02:00:37', '2022-05-24 02:00:37'),
(4, 'salle math', 14, 'Salle de Cours', '2022-06-02 13:41:12', '2022-06-02 13:41:12'),
(5, 'salle arabe', 11, 'Salle de Cours', '2022-06-02 13:41:33', '2022-06-02 13:41:33'),
(6, 'salle science', 13, 'Salle de Cours', '2022-06-02 13:41:51', '2022-06-02 13:41:51'),
(10, 'salle italien 15', 15, 'Salle de Cours', '2022-06-02 13:43:20', '2022-06-02 13:43:20'),
(11, 'salle francais', 16, 'Salle de Cours', '2022-06-02 13:43:40', '2022-06-02 13:43:40'),
(12, 'salle anglais', 17, 'Salle de Cours', '2022-06-02 13:44:23', '2022-06-02 13:44:23'),
(13, 'salle informatique', 8, 'Salle de TP', '2022-06-02 13:44:59', '2022-06-02 13:44:59'),
(14, 'salle phylo', 5, 'Salle de Cours', '2022-06-02 13:45:31', '2022-06-02 13:45:31');

-- --------------------------------------------------------

--
-- Structure de la table `seances`
--

CREATE TABLE `seances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heure` time NOT NULL,
  `jour` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enseignant_id` bigint(20) UNSIGNED NOT NULL,
  `salle_id` bigint(20) UNSIGNED NOT NULL,
  `emploi_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `seances`
--

INSERT INTO `seances` (`id`, `heure`, `jour`, `enseignant_id`, `salle_id`, `emploi_id`, `created_at`, `updated_at`) VALUES
(7, '08:00:00', 'Lundi', 2, 1, 3, '2022-05-30 02:36:40', '2022-05-30 02:36:40'),
(8, '09:00:00', 'Lundi', 2, 1, 3, '2022-05-30 02:36:40', '2022-05-30 02:36:40'),
(9, '10:00:00', 'Mercredi', 2, 1, 3, '2022-05-30 02:36:40', '2022-05-30 02:36:40'),
(10, '14:00:00', 'Mercredi', 2, 1, 3, '2022-05-30 02:36:40', '2022-05-30 02:36:40'),
(15, '10:00:00', 'Lundi', 5, 5, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(16, '11:00:00', 'Lundi', 7, 12, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(17, '08:00:00', 'Mardi', 3, 4, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(18, '09:00:00', 'Mardi', 3, 4, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(19, '14:00:00', 'Mardi', 2, 1, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(20, '15:00:00', 'Mardi', 6, 6, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(21, '16:00:00', 'Mardi', 6, 6, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(22, '08:00:00', 'Mercredi', 3, 4, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(23, '10:00:00', 'Jeudi', 9, 13, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(24, '11:00:00', 'Jeudi', 6, 6, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(25, '09:00:00', 'Vendredi', 4, 11, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(26, '10:00:00', 'Vendredi', 10, 14, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(27, '16:00:00', 'Vendredi', 6, 6, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(28, '08:00:00', 'Samedi', 8, 10, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(29, '09:00:00', 'Samedi', 9, 13, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(30, '14:00:00', 'Samedi', 9, 13, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(31, '15:00:00', 'Samedi', 9, 13, 3, '2022-06-02 13:55:12', '2022-06-02 13:55:12'),
(42, '08:00:00', 'Mercredi', 6, 6, 8, '2022-06-24 06:25:54', '2022-06-24 06:25:54'),
(43, '08:00:00', 'Jeudi', 2, 1, 8, '2022-06-24 06:26:20', '2022-06-24 06:26:20');

-- --------------------------------------------------------

--
-- Structure de la table `session_scolaires`
--

CREATE TABLE `session_scolaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annee_id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coef` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session_scolaires`
--

INSERT INTO `session_scolaires` (`id`, `annee_id`, `nom`, `date_debut`, `date_fin`, `created_at`, `updated_at`, `coef`) VALUES
(2, 2, 'le premier semestre', '2021-09-15', '2021-12-25', '2022-05-25 00:35:13', '2022-06-21 01:14:09', 1.00),
(4, 2, 'Le deuxième semestre', '2022-01-01', '2022-06-01', '2022-06-05 03:13:21', '2022-06-21 01:15:09', 2.00);

-- --------------------------------------------------------

--
-- Structure de la table `traveaux`
--

CREATE TABLE `traveaux` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier_id` bigint(20) UNSIGNED NOT NULL,
  `cours_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traveaux`
--

INSERT INTO `traveaux` (`id`, `type`, `fichier_id`, `cours_id`, `created_at`, `updated_at`, `libelle`) VALUES
(3, 'TD', 31, 2, '2022-06-24 05:30:08', '2022-06-24 05:30:08', 'td laravel');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','enseignant','parentt','eleve') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$Y0dBknFildrC2Ox4lfs3fuIs3gAXc5OjJJ9.cqQzxJQFFGuGM8rVy', 'admin', NULL, '2022-05-22 00:09:02', '2022-05-22 00:09:02'),
(7, 'parentlaarif', 'parentlaarif@gmail.com', NULL, '$2y$10$uRVV1qnxwmYToNxKoXKIw.Ad.wE2sHhLLyAOPmpaVnPo3Thg5Uf3C', 'parentt', NULL, '2022-05-25 02:37:19', '2022-05-25 02:37:19'),
(9, 'amal', 'amal@gmail.com', NULL, '$2y$10$x/eUIMwi/PhkRdeL5uYRL.lOYbngiohAetfKkq4pjJs1xYfn97w.6', 'eleve', NULL, '2022-05-26 11:45:46', '2022-05-26 11:45:46'),
(14, 'parentsouguir', 'parentsouguir@gmail.com', NULL, '$2y$10$d/2MbAJnYn4NdwceqBzMCeYxWsLXgLy4K2OR6npvZ4Ja6uasXnY72', 'parentt', NULL, '2022-05-30 02:26:13', '2022-05-30 02:26:13'),
(15, 'omar', 'omar@gmail.com', NULL, '$2y$10$nTbfO/52QzrKM2QfLBxo1O4dRGsNrbu6Nrkf5fFmIfgpIX2v3J5TG', 'eleve', NULL, '2022-05-30 02:26:14', '2022-05-30 02:26:14'),
(16, 'ajmi', 'ajmi@gmail.com', NULL, '$2y$10$/3EbvNq2514IW5z950VS5uHvCaLKIE53y4PJ8/2B4H62goh8w0Eui', 'enseignant', NULL, '2022-05-30 02:32:42', '2022-05-30 02:32:42'),
(17, 'SahliMohamed', 'Sahli@gmail.com', NULL, '$2y$10$4XM73qlgQnuL0byQ1WsyI.q04NMAZSZKzJXzwsYJ1Mc8MR9IrZYpu', 'enseignant', NULL, '2022-06-02 03:19:50', '2022-06-02 03:19:50'),
(18, 'LeilaKhalfalah', 'leila@gmail.com', NULL, '$2y$10$o8qdESjw3/sxH0tju30O2.0CkTpRk.xo8vU4w2pS6JHpLgb9yyjf.', 'enseignant', NULL, '2022-06-02 03:21:52', '2022-06-02 03:21:52'),
(19, 'MbarkiMonia', 'mbarki@gmail.com', NULL, '$2y$10$n3XowhYIGqkMjZmkZPXKrOeyOYzS2zzB/9/qkShen3XS/W4hxbVoe', 'enseignant', NULL, '2022-06-02 12:56:38', '2022-06-02 12:56:38'),
(20, 'KacemSamir', 'samir@gmail.com', NULL, '$2y$10$DtprbYBefHIT2duDPj..Z.bextudKuenq8Bt00t6oJi8Hxvrp2Npm', 'enseignant', NULL, '2022-06-02 12:59:42', '2022-06-02 12:59:42'),
(25, 'LeilaGharbi', 'leilaGharbi@gmail.com', NULL, '$2y$10$M3MUjBnV3p.vVmPLZw4PTu939orjun/0/lNRWT.N9pF04/F9VMGjW', 'enseignant', NULL, '2022-06-02 13:20:07', '2022-06-02 13:20:07'),
(26, 'NajarSawsen', 'sawsen@gmail.com', NULL, '$2y$10$ALIsc5l684oTqXcUKb36tO4iXWZEb/yg00IKIOAbVHI6IUP2zfHHW', 'enseignant', NULL, '2022-06-02 13:23:51', '2022-06-02 13:23:51'),
(27, 'najehsouguir', 'najeh@gmail.com', NULL, '$2y$10$M.9clGZfP1d51KbCn.0uZOVWIley4/cSZpuXWLLc4.oEgpPEKOeOm', 'enseignant', NULL, '2022-06-02 13:25:17', '2022-06-02 13:25:17'),
(28, 'samira', 'samira@gmail.com', NULL, '$2y$10$wrofo/JIaOFf1Jp7pb4/VeZZZnjH0p4ElNWpuF.rCz8mzAZ8EXPX6', 'enseignant', NULL, '2022-06-02 13:30:55', '2022-06-02 13:30:55'),
(33, 'aya', 'larrifaya@gmail.com', NULL, '$2y$10$9gyUtmEW8F577PUDaHJcjeocdUkUk/H1eq.f/UAGnVnPxypfwxwia', 'eleve', NULL, '2022-06-24 06:25:06', '2022-06-24 06:25:06');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annee_scolaires`
--
ALTER TABLE `annee_scolaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bulletins`
--
ALTER TABLE `bulletins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulletins_groupe_id_foreign` (`groupe_id`),
  ADD KEY `bulletins_session_id_foreign` (`session_id`),
  ADD KEY `bulletins_eleve_id_foreign` (`eleve_id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_fichier_id_foreign` (`fichier_id`),
  ADD KEY `cours_enseignant_id_foreign` (`enseignant_id`);

--
-- Index pour la table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_groupes_cours_id_foreign` (`cours_id`),
  ADD KEY `cours_groupes_groupe_id_foreign` (`groupe_id`);

--
-- Index pour la table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disciplines_session_id_foreign` (`session_id`),
  ADD KEY `disciplines_eleve_id_foreign` (`eleve_id`),
  ADD KEY `disciplines_seance_id_foreign` (`seance_id`);

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eleves_matricule_unique` (`matricule`),
  ADD KEY `eleves_parentt_id_foreign` (`parentt_id`),
  ADD KEY `eleves_user_id_foreign` (`user_id`);

--
-- Index pour la table `eleve_groupes`
--
ALTER TABLE `eleve_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eleve_groupes_eleve_id_foreign` (`eleve_id`),
  ADD KEY `eleve_groupes_groupe_id_foreign` (`groupe_id`);

--
-- Index pour la table `emplois`
--
ALTER TABLE `emplois`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emplois_groupe_id_foreign` (`groupe_id`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enseignants_cin_unique` (`cin`),
  ADD KEY `enseignants_matiere_id_foreign` (`matiere_id`),
  ADD KEY `enseignants_user_id_foreign` (`user_id`);

--
-- Index pour la table `enseignant_examens`
--
ALTER TABLE `enseignant_examens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enseignant_examens_enseignant_id_foreign` (`enseignant_id`),
  ADD KEY `enseignant_examens_examen_id_foreign` (`examen_id`);

--
-- Index pour la table `enseignant_groupes`
--
ALTER TABLE `enseignant_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enseignant_groupes_enseignant_id_foreign` (`enseignant_id`),
  ADD KEY `enseignant_groupes_groupe_id_foreign` (`groupe_id`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `examens`
--
ALTER TABLE `examens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examens_session_id_foreign` (`session_id`),
  ADD KEY `examens_fichier_id_foreign` (`fichier_id`);

--
-- Index pour la table `examen_groupes`
--
ALTER TABLE `examen_groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen_groupes_examen_id_foreign` (`examen_id`),
  ADD KEY `examen_groupes_groupe_id_foreign` (`groupe_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fichiers`
--
ALTER TABLE `fichiers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichier_corrections`
--
ALTER TABLE `fichier_corrections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fichier_corrections_fichier_id_foreign` (`fichier_id`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupes_annee_id_foreign` (`annee_id`),
  ADD KEY `groupes_niveau_id_foreign` (`niveau_id`);

--
-- Index pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere_niveaux`
--
ALTER TABLE `matiere_niveaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matiere_niveaux_matiere_id_foreign` (`matiere_id`),
  ADD KEY `matiere_niveaux_niveau_id_foreign` (`niveau_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `moy_matieres`
--
ALTER TABLE `moy_matieres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moy_matieres_bulletin_id_foreign` (`bulletin_id`),
  ADD KEY `moy_matieres_matiere_id_foreign` (`matiere_id`);

--
-- Index pour la table `niveaux`
--
ALTER TABLE `niveaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_eleve_id_foreign` (`eleve_id`),
  ADD KEY `notes_examen_id_foreign` (`examen_id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_parentt_id_foreign` (`parentt_id`),
  ADD KEY `notifications_punition_id_foreign` (`punition_id`),
  ADD KEY `notifications_discipline_id_foreign` (`discipline_id`);

--
-- Index pour la table `parentts`
--
ALTER TABLE `parentts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentts_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `preinsriptions`
--
ALTER TABLE `preinsriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preinsriptions_cin_pere_unique` (`cin_pere`),
  ADD UNIQUE KEY `preinsriptions_cin_mere_unique` (`cin_mere`),
  ADD UNIQUE KEY `preinsriptions_email_pere_unique` (`email_pere`),
  ADD UNIQUE KEY `preinsriptions_email_mere_unique` (`email_mere`),
  ADD KEY `preinsriptions_annee_id_foreign` (`annee_id`),
  ADD KEY `preinsriptions_niveau_id_foreign` (`niveau_id`);

--
-- Index pour la table `punitions`
--
ALTER TABLE `punitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `punitions_session_id_foreign` (`session_id`),
  ADD KEY `punitions_seance_id_foreign` (`seance_id`),
  ADD KEY `punitions_enseignant_id_foreign` (`enseignant_id`),
  ADD KEY `punitions_eleve_id_foreign` (`eleve_id`);

--
-- Index pour la table `salles`
--
ALTER TABLE `salles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salles_num_unique` (`num`);

--
-- Index pour la table `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seances_enseignant_id_foreign` (`enseignant_id`),
  ADD KEY `seances_salle_id_foreign` (`salle_id`),
  ADD KEY `seances_emploi_id_foreign` (`emploi_id`);

--
-- Index pour la table `session_scolaires`
--
ALTER TABLE `session_scolaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_scolaires_annee_id_foreign` (`annee_id`);

--
-- Index pour la table `traveaux`
--
ALTER TABLE `traveaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `traveaux_fichier_id_foreign` (`fichier_id`),
  ADD KEY `traveaux_cours_id_foreign` (`cours_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annee_scolaires`
--
ALTER TABLE `annee_scolaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `bulletins`
--
ALTER TABLE `bulletins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `eleve_groupes`
--
ALTER TABLE `eleve_groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `emplois`
--
ALTER TABLE `emplois`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `enseignant_examens`
--
ALTER TABLE `enseignant_examens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `enseignant_groupes`
--
ALTER TABLE `enseignant_groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `examens`
--
ALTER TABLE `examens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `examen_groupes`
--
ALTER TABLE `examen_groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fichiers`
--
ALTER TABLE `fichiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `fichier_corrections`
--
ALTER TABLE `fichier_corrections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `matiere_niveaux`
--
ALTER TABLE `matiere_niveaux`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `moy_matieres`
--
ALTER TABLE `moy_matieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT pour la table `niveaux`
--
ALTER TABLE `niveaux`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `parentts`
--
ALTER TABLE `parentts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `preinsriptions`
--
ALTER TABLE `preinsriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `punitions`
--
ALTER TABLE `punitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `salles`
--
ALTER TABLE `salles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `seances`
--
ALTER TABLE `seances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `session_scolaires`
--
ALTER TABLE `session_scolaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `traveaux`
--
ALTER TABLE `traveaux`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bulletins`
--
ALTER TABLE `bulletins`
  ADD CONSTRAINT `bulletins_eleve_id_foreign` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bulletins_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bulletins_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `session_scolaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cours_fichier_id_foreign` FOREIGN KEY (`fichier_id`) REFERENCES `fichiers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cours_groupes`
--
ALTER TABLE `cours_groupes`
  ADD CONSTRAINT `cours_groupes_cours_id_foreign` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cours_groupes_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `disciplines`
--
ALTER TABLE `disciplines`
  ADD CONSTRAINT `disciplines_eleve_id_foreign` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disciplines_seance_id_foreign` FOREIGN KEY (`seance_id`) REFERENCES `seances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `disciplines_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `session_scolaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_parentt_id_foreign` FOREIGN KEY (`parentt_id`) REFERENCES `parentts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eleves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `eleve_groupes`
--
ALTER TABLE `eleve_groupes`
  ADD CONSTRAINT `eleve_groupes_eleve_id_foreign` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eleve_groupes_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `emplois`
--
ALTER TABLE `emplois`
  ADD CONSTRAINT `emplois_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enseignants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enseignant_examens`
--
ALTER TABLE `enseignant_examens`
  ADD CONSTRAINT `enseignant_examens_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enseignant_examens_examen_id_foreign` FOREIGN KEY (`examen_id`) REFERENCES `examens` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enseignant_groupes`
--
ALTER TABLE `enseignant_groupes`
  ADD CONSTRAINT `enseignant_groupes_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enseignant_groupes_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `examens`
--
ALTER TABLE `examens`
  ADD CONSTRAINT `examens_fichier_id_foreign` FOREIGN KEY (`fichier_id`) REFERENCES `fichiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `examens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `session_scolaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `examen_groupes`
--
ALTER TABLE `examen_groupes`
  ADD CONSTRAINT `examen_groupes_examen_id_foreign` FOREIGN KEY (`examen_id`) REFERENCES `examens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `examen_groupes_groupe_id_foreign` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fichier_corrections`
--
ALTER TABLE `fichier_corrections`
  ADD CONSTRAINT `fichier_corrections_fichier_id_foreign` FOREIGN KEY (`fichier_id`) REFERENCES `fichiers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_annee_id_foreign` FOREIGN KEY (`annee_id`) REFERENCES `annee_scolaires` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groupes_niveau_id_foreign` FOREIGN KEY (`niveau_id`) REFERENCES `niveaux` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `matiere_niveaux`
--
ALTER TABLE `matiere_niveaux`
  ADD CONSTRAINT `matiere_niveaux_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matiere_niveaux_niveau_id_foreign` FOREIGN KEY (`niveau_id`) REFERENCES `niveaux` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `moy_matieres`
--
ALTER TABLE `moy_matieres`
  ADD CONSTRAINT `moy_matieres_bulletin_id_foreign` FOREIGN KEY (`bulletin_id`) REFERENCES `bulletins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `moy_matieres_matiere_id_foreign` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_eleve_id_foreign` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_examen_id_foreign` FOREIGN KEY (`examen_id`) REFERENCES `examens` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_discipline_id_foreign` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_parentt_id_foreign` FOREIGN KEY (`parentt_id`) REFERENCES `parentts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_punition_id_foreign` FOREIGN KEY (`punition_id`) REFERENCES `punitions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `parentts`
--
ALTER TABLE `parentts`
  ADD CONSTRAINT `parentts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `preinsriptions`
--
ALTER TABLE `preinsriptions`
  ADD CONSTRAINT `preinsriptions_annee_id_foreign` FOREIGN KEY (`annee_id`) REFERENCES `annee_scolaires` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `preinsriptions_niveau_id_foreign` FOREIGN KEY (`niveau_id`) REFERENCES `niveaux` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `punitions`
--
ALTER TABLE `punitions`
  ADD CONSTRAINT `punitions_eleve_id_foreign` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `punitions_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `punitions_seance_id_foreign` FOREIGN KEY (`seance_id`) REFERENCES `seances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `punitions_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `session_scolaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_emploi_id_foreign` FOREIGN KEY (`emploi_id`) REFERENCES `emplois` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_enseignant_id_foreign` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seances_salle_id_foreign` FOREIGN KEY (`salle_id`) REFERENCES `salles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `session_scolaires`
--
ALTER TABLE `session_scolaires`
  ADD CONSTRAINT `session_scolaires_annee_id_foreign` FOREIGN KEY (`annee_id`) REFERENCES `annee_scolaires` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `traveaux`
--
ALTER TABLE `traveaux`
  ADD CONSTRAINT `traveaux_cours_id_foreign` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `traveaux_fichier_id_foreign` FOREIGN KEY (`fichier_id`) REFERENCES `fichiers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
