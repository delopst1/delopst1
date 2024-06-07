/*
Created: 07/05/2024
Modified: 27/05/2024
Model: Zastavljalnica
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table lastniki

CREATE TABLE `lastniki`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ime` Char(25) NOT NULL,
  `priimek` Char(25) NOT NULL,
  `gmail` Char(50) NOT NULL,
  `password` Varchar(50) NOT NULL,
  `datum_registracije` Date NOT NULL,
  `kraj_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship1` ON `lastniki` (`kraj_id`)
;

-- Table kraj

CREATE TABLE `kraj`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ime` Char(25) NOT NULL,
  `postna_st` Int NOT NULL,
  `drzava_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship13` ON `kraj` (`drzava_id`)
;

-- Table predmeti

CREATE TABLE `predmeti`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ime` Char(50) NOT NULL,
  `opis` Char(200),
  `cena_nakupa` Int,
  `prodajna_cena` Int NOT NULL,
  `dolg` Int NOT NULL,
  `status` Varchar(20),
  `dostopnost` Char(20) NOT NULL,
  `prodajalec_id` Int,
  `lastnik_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship6` ON `predmeti` (`prodajalec_id`)
;

CREATE INDEX `IX_Relationship10` ON `predmeti` (`lastnik_id`)
;

-- Table prodajalec

CREATE TABLE `prodajalec`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ime` Char(30) NOT NULL,
  `priimek` Char(20) NOT NULL,
  `naziv` Char(25),
  `ocena_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship2` ON `prodajalec` (`ocena_id`)
;

-- Table ocena

CREATE TABLE `ocena`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ocena` Int NOT NULL,
  `komentar` Char(200),
  `lastnik_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship12` ON `ocena` (`lastnik_id`)
;

-- Table ponudbe

CREATE TABLE `ponudbe`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `Cena` Int NOT NULL,
  `datum_ponudbe` Date NOT NULL,
  `predmet_id` Int,
  `lastnik_id` Int,
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship7` ON `ponudbe` (`predmet_id`)
;

CREATE INDEX `IX_Relationship9` ON `ponudbe` (`lastnik_id`)
;

-- Table drzave

CREATE TABLE `drzave`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `ime` Varchar(50) NOT NULL,
  `kratica` Varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `lastniki` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`kraj_id`) REFERENCES `kraj` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `prodajalec` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`ocena_id`) REFERENCES `ocena` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `predmeti` ADD CONSTRAINT `Relationship6` FOREIGN KEY (`prodajalec_id`) REFERENCES `prodajalec` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ponudbe` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`predmet_id`) REFERENCES `predmeti` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ponudbe` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`lastnik_id`) REFERENCES `lastniki` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `predmeti` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`lastnik_id`) REFERENCES `lastniki` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `ocena` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`lastnik_id`) REFERENCES `lastniki` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `kraj` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`drzava_id`) REFERENCES `drzave` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

