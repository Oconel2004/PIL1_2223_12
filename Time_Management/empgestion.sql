-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 30 juin 2023 à 03:02
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `empgestion`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add promotion', 7, 'add_promotion'),
(26, 'Can change promotion', 7, 'change_promotion'),
(27, 'Can delete promotion', 7, 'delete_promotion'),
(28, 'Can view promotion', 7, 'view_promotion'),
(29, 'Can add users', 8, 'add_users'),
(30, 'Can change users', 8, 'change_users'),
(31, 'Can delete users', 8, 'delete_users'),
(32, 'Can view users', 8, 'view_users'),
(33, 'Can add emploidutemps', 9, 'add_emploidutemps'),
(34, 'Can change emploidutemps', 9, 'change_emploidutemps'),
(35, 'Can delete emploidutemps', 9, 'delete_emploidutemps'),
(36, 'Can view emploidutemps', 9, 'view_emploidutemps');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$VX2w060WuZCm8QEbMUOEC8$tocO15xtF/W1vSRwkIVP5dfBGF9DhuEXzYMc5PJAZ/s=', NULL, 1, 'admin', '', '', '', 1, 1, '2023-06-30 02:59:49.249565');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'timemanage', 'promotion'),
(8, 'timemanage', 'users'),
(9, 'timemanage', 'emploidutemps');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-29 15:03:49.671409'),
(2, 'auth', '0001_initial', '2023-06-29 15:03:55.547409'),
(3, 'admin', '0001_initial', '2023-06-29 15:03:56.650408'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-29 15:03:56.727408'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-29 15:03:56.845408'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-06-29 15:03:57.592408'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-06-29 15:03:57.977408'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-06-29 15:03:58.319408'),
(9, 'auth', '0004_alter_user_username_opts', '2023-06-29 15:03:58.364408'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-06-29 15:03:58.786409'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-06-29 15:03:58.864409'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-29 15:03:58.965408'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-06-29 15:03:59.394408'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-29 15:04:00.111409'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-06-29 15:04:00.455406'),
(16, 'auth', '0011_update_proxy_permissions', '2023-06-29 15:04:00.500407'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-29 15:04:00.865408'),
(18, 'sessions', '0001_initial', '2023-06-29 15:04:01.347408'),
(19, 'timemanage', '0001_initial', '2023-06-29 15:04:03.078407');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `timemanage_emploidutemps`
--

DROP TABLE IF EXISTS `timemanage_emploidutemps`;
CREATE TABLE IF NOT EXISTS `timemanage_emploidutemps` (
  `id_emploi` int NOT NULL AUTO_INCREMENT,
  `cours` varchar(100) NOT NULL,
  `salle` varchar(100) NOT NULL,
  `enseignant` varchar(100) NOT NULL,
  `jour_semaine` varchar(20) NOT NULL,
  `heure_debut` varchar(20) NOT NULL,
  `heure_fin` varchar(20) NOT NULL,
  `id_promotion` int NOT NULL,
  PRIMARY KEY (`id_emploi`),
  KEY `timemanage_emploidutemps_id_promotion_98d8c67e` (`id_promotion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `timemanage_emploidutemps`
--

INSERT INTO `timemanage_emploidutemps` (`id_emploi`, `cours`, `salle`, `enseignant`, `jour_semaine`, `heure_debut`, `heure_fin`, `id_promotion`) VALUES
(1, 'Analyse', 'IRAN2', 'Jean Marc', 'Lundi', '7h', '10h', 1);

-- --------------------------------------------------------

--
-- Structure de la table `timemanage_promotion`
--

DROP TABLE IF EXISTS `timemanage_promotion`;
CREATE TABLE IF NOT EXISTS `timemanage_promotion` (
  `id_promotion` int NOT NULL AUTO_INCREMENT,
  `nom_promotion` varchar(25) NOT NULL,
  PRIMARY KEY (`id_promotion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `timemanage_promotion`
--

INSERT INTO `timemanage_promotion` (`id_promotion`, `nom_promotion`) VALUES
(1, 'Licence1'),
(2, 'Licence2'),
(3, 'Licence3');

-- --------------------------------------------------------

--
-- Structure de la table `timemanage_users`
--

DROP TABLE IF EXISTS `timemanage_users`;
CREATE TABLE IF NOT EXISTS `timemanage_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_matricule` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `adresse_email` varchar(255) NOT NULL,
  `filiere` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_promotion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_matricule` (`numero_matricule`),
  KEY `timemanage_users_id_promotion_2e24d43c` (`id_promotion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `timemanage_users`
--

INSERT INTO `timemanage_users` (`id`, `numero_matricule`, `nom`, `prenom`, `adresse_email`, `filiere`, `role`, `username`, `password`, `id_promotion`) VALUES
(2, 'AA01', 'EGBOGBE', 'Oconel', 'oconelegbogbe17@gmail.com', 'Génie Logiciel', 'etudiant', 'Oconel2004', '12345678', 1),
(3, 'Admin001', 'BOKO', 'Jude', 'bokojude@gmail.com', 'DA', 'administration', 'Admin', 'admin123', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `timemanage_emploidutemps`
--
ALTER TABLE `timemanage_emploidutemps`
  ADD CONSTRAINT `timemanage_emploidutemps_ibfk_1` FOREIGN KEY (`id_promotion`) REFERENCES `timemanage_promotion` (`id_promotion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `timemanage_users`
--
ALTER TABLE `timemanage_users`
  ADD CONSTRAINT `timemanage_users_ibfk_1` FOREIGN KEY (`id_promotion`) REFERENCES `timemanage_promotion` (`id_promotion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
