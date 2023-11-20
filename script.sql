-- Creation de la base de donnes
CREATE DATABASE brief5;
-- utlisation de la base de donnes 
use brief5;
-- Creation des tables :

-- creation de la table  Utilisateur


CREATE table Utilisateur(
    UserID int PRIMARY key,
    NomUtilisateur VARCHAR(255) NOT NULL,
     Email VARCHAR(255)  NOT NULL
);

-- Table: Projets
CREATE TABLE Projets (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    NomProjet VARCHAR(100) NOT NULL,
    Description TEXT,
    DateDebut DATE,
    DateFin DATE
);


-- Table: Squads
CREATE TABLE Squads (
    SquadID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID INT,
    UserID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projets(ProjectID),
    FOREIGN KEY (UserID) REFERENCES Utilisateur(UserID)
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY
);

-- Table: Subcategories
CREATE TABLE Subcategories (
    SubcategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table: Ressource
CREATE TABLE Ressource (
    ResourceID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT,
    SubcategoryID INT,
    SquadID INT,
    ProjectID INT,

    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SubcategoryID) REFERENCES Subcategories(SubcategoryID),
    FOREIGN KEY (SquadID) REFERENCES Squads(SquadID),
    FOREIGN KEY (ProjectID) REFERENCES Projets(ProjectID)
);

--------------------------------------------------------------------------------------------------------------------
1---- En tant qu'administrateur système, je veux créer de nouveaux utilisateurs dans la base de données pour maintenir une liste actualisée des membres de l'équipe.
INSERT INTO Utilisateur (NomUtilisateur, Email)
VALUES
  ('Abdeljabar Ait Ayoub', 'abdeljabaraitayoub@email.com'),
  ('Abdeljalil El Filaly', 'abdeljalilelfilaly@email.com'),
  ('Abdellah Bardich', 'abdellahbardich@email.com'),
  ('Aicha Ettabet', 'aichaettabet@email.com'),
  ('Anass Ait Ouaguerd', 'anassaitouaguerd@email.com'),
  ('Anass Drissi', 'anassdrissi@email.com'),
  ('Hamza Ezzhar El Idrissi', 'hamzaezzaharidrissi@email.com'),
  ('Khalid Zennouhi', 'khalidzennouhi@email.com'),
  ('Khalid Haiddou', 'khalidhaiddou1@email.com'),
  ('Khalid El Mati', 'khalidelmati@email.com'),
  ('Latifa Chakir', 'latifachakir@email.com'),
  ('Mbarek El Aadraoui', 'mbarekelaadraoui@email.com'),
  ('Mohamed Amine Baih', 'mohamedaminebaih@email.com'),
  ('Mohammed-amine Benmade', 'mohammed-aminebenmade@email.com'),
  ('Nabil El Hakimi', 'nabilelhakimi@email.com'),
  ('Niama El Hrychy', 'niamaelhrychy@email.com'),
  ('Otman Kharbouch', 'otmankharbouch@email.com'),
  ('Oumaima El Baz', 'oumaimaelbaz@email.com'),
  ('Rabia Ait Imghi', 'rabiaaitimghi@email.com'),
  ('Soumaya Ait Lmqaddam', 'soumayaaitlmqaddam@email.com'),
  ('Youness Erbai', 'younesserbai@email.com'),
  ('Zouhair Zerzkhane', 'zouhairzerzkhane@email.com');

-------------------------------------------------------------------------------------------------------------------

2-- En tant que leader de squad, je souhaite créer un nouveau squad,
-- spécifiant le nom et ajoutant des membres à ce squad,pour former rapidement des équipes dédiées à des projets spécifiques.

-- add column 'squad name';

ALTER TABLE Squads
ADD COLUMN NomSquad VARCHAR(255) NOT NULL;

-- inserstion de squads infos 
INSERT INTO Squads (NomSquad,UserID)
VALUES ('alpha', 1),
	('cell13',2),
	('CODEZILLA',3),
	('ProDevs',4),
	('Brogrammers',5);
  
---- creartion d un nouvelle tab sappelle 'SquadMembers'

CREATE TABLE SquadMembers (
    SquadID INT, 
    UserID INT, 
    PRIMARY KEY (SquadID, UserID),
    FOREIGN KEY (SquadID) REFERENCES Squads(SquadID),
    FOREIGN KEY (UserID) REFERENCES utilisateur(UserID)
);

---isersrion des nomnbre of squad 

-- Ajouter des membres au squad alpha

INSERT INTO SquadMembers (SquadID, UserID)
VALUES 
   (1, 18),  -- Oumaima Elbaz
   (1, 2),   -- Abdeljalil El Filaly
   (1, 9),   -- Khalid Haiddou
   (1, 19);  -- Rabia Ait Imghi

-- Ajouter des membres au squad cell13

INSERT INTO SquadMembers (SquadID, UserID)
VALUES 
   (2, 7),   -- Hamza Ezzhar El Idrissi
   (2, 4),   -- Aicha Ettabet
   (2, 3),   -- Abdellah Bardich
   (2, 21);  -- Youness Erbai

-- Ajouter des membres au squad CODEZILLA

INSERT INTO SquadMembers (SquadID, UserID)
VALUES 
   (3, 6),   -- Anass Drissi
   (3, 5),   -- Anass Ait Ouaguerd
   (3, 13),  -- Mohamed Amine Baih
   (3, 14),  -- Mohammed-Amine Benmade
   (3, 11);  -- Latifa Chakir

-- Ajouter des membres au squad ProDevs Sprint

INSERT INTO SquadMembers (SquadID, UserID)
VALUES 
   (4, 15),  -- Nabil El Hakimi
   (4, 16),  -- Niama El Hrychy
   (4, 17),  -- Otman Kharbouch
   (4, 8),   -- Khalid Zennouhi
   (4, 22);  -- Zouhair Zerzkhane

-- Ajouter des membres au squad Brogrammers

INSERT INTO SquadMembers (SquadID, UserID)
VALUES 
   (5, 1),   -- Abdeljabar Ait Ayoub
   (5, 12),  -- Mbarek El Aadraoui
   (5, 10),  -- Khalid El Mati
   (5, 20);  -- Soumaya Ait Lmqaddam

3-- En tant que chef de projet, je veux créer un nouveau projet en fournissant des détails
 --tels que le nom, la description et les dates, pour définir clairement les paramètres de chaque projet.

INSERT INTO Projets (ProjectID, NomProjet, Description, DateDebut, DateFin)
VALUES 
   (1, 'SQL_Projet', 'Des cours de SQL', '2023-11-14', '2023-11-20');

4--En tant que membre de squad, je veux voir la liste des projets pour lesquels mon squad est responsable pour comprendre les projets actuels et suivre les responsabilités.

SELECT Projets.ProjectID, Projets.NomProjet, Projets.Description, Projets.DateDebut, Projets.DateFin
FROM Projets
JOIN Squads ON Projets.ProjectID = Squads.ProjetID
WHERE Squads.SquadID = 1;

5---En tant que responsable des ressources, 
je veux ajouter une nouvelle ressource en spécifiant son nom, 
sa catégorie, sa sous-catégorie et son association éventuelle à un squad ou à un projet,
 pour gérer efficacement les ressources disponibles.

-- ajouter new culumn NomRessource

ALTER TABLE Ressources
ADD COLUMN NomRessource VARCHAR(255);

-- inserstion dans ce culumn ;

INSERT INTO Ressource(NomRessource, CategoryID, SubcategoryID, SquadID, ProjectID)
VALUES ('google', 1, 1, 1, 1);

6-- En tant que développeur Fullstack, je veux pouvoir mettre à jour les détails d'un utilisateur, d'un squad, 
--d'un projet ou d'une ressource existante pour ajuster les informations en fonction des évolutions.


-- Mettre a jour les details de l utilisateur

UPDATE Utilisateur
SET NomUtilisateur = 'oumaima98', Email = 'oumaima98@email.com'
WHERE UserID = 1; 

-- Mettre a jour les details de l sauad

UPDATE Squads
SET NomSquad = 'cell14'
WHERE SquadID = 2;


--- mettre a jour les details de project 

UPDATE Projets
SET NomProjet = 'data project', DateDebut = '2023-01-01', DateFin = '2023-12-31'
WHERE ProjectID = 4;



7-- En tant que responsable des catégories et sous-catégories,je souhaite créer de nouvelles catégories 
--et sous-catégories pour classer les ressources et organiser efficacement la base de données.

--- add culumn  NomCategorie


ALTER TABLE Categories
ADD COLUMN NomCategorie VARCHAR(255);

-- isersion 

INSERT INTO Categories (NomCategorie)
VALUES 
  ('Fitness'),
  ('Dance'),
  ('Music'),
  ('Technology');
  