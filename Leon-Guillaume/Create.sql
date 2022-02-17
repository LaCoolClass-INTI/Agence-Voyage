-- Exercice Agence de voyage  
-- Se familiariser avec Git , Github , SSMS, Markdown
--Se familiariser avec l’environnement SQL SERVER
-- Définir un schéma de base de données
-- Intégrer des contraintes, des vues.
-- Y insérer quelques informations


--1) Création des tables

-- Ajout des tableau Station, Activite, Client, Sejour.  (Léon)

--Creation du tableau Station avec les informations necessaires
Create table STATION (nomStation varchar(20), 
						capacite int not null, 
						lieu varchar(20) not null, 
						region varchar(20), 
						tarif int Default 0, 
						CONSTRAINT cle_station PRIMARY KEY (nomStation), 
						CONSTRAINT cle_lieu_region UNIQUE (lieu, region), 
						CONSTRAINT nom_region CHECK (region IN ('OCEAN INDIEN', 'ANTILLES', 'EUROPE', 'AMERIQUES', 'EXTREME ORIENT'))
						); 

--Aussi faire 'region varchar(20) unique not null' pour avoir la meme chose que Contraint cle_lieu_region Unique (Lieu, region)


--Creation du tableau Activite avec les informations necessaires.
Create table ACTIVITE (nomStation varchar(20), 
						libelle varchar(20), 
						prix int Default 0, 
						PRIMARY KEY (nomStation, libelle), 
						FOREIGN KEY (nomStation) REFERENCES Station
                        ON DELETE CASCADE
						);
-- ON DELETE CASCADE Permet de supprimer l'activité si le nom de la station est surprimé. 

--Creation du tableau Client avec les informations necessaires.
Create table CLIENT (ID int, 
						nom varchar(20) not null, 
						prenom varchar(20), 
						ville varchar(20) not null, 
						région varchar(20), 
						solde int Default 0 not null, 
						PRIMARY KEY (ID)
						);


--Creation du tableau Sejour avec les informations necessaires. 
Create table SEJOUR (ID int, 
						station varchar(20), 
						debut Date, 
						nbPlaces int not null, 
						PRIMARY KEY (debut), 
						FOREIGN KEY (ID) REFERENCES CLIENT, 
						FOREIGN KEY (station) REFERENCES Station
                        ON DELETE CASCADE
						);