-- Ajout des tableau Station, Activite, Client, Sejour.

Create table STATION (nomStation varchar(20), 
						capacite int not null, 
						lieu varchar(20) not null, 
						region varchar(20), 
						tarif int Default 0, 
						CONSTRAINT cle_station PRIMARY KEY (nomStation), 
						CONSTRAINT cle_lieu_region UNIQUE (lieu, region), 
						CONSTRAINT nom_region CHECK (region IN ('OCEAN INDIEN', 'ANTILLES', 'EUROPE', 'AMERIQUES', 'EXTREME ORIENT'))
						); 

Create table ACTIVITE (nomStation varchar(20), 
						libelle varchar(20), 
						prix int Default 0, 
						PRIMARY KEY (nomStation, libelle), 
						FOREIGN KEY (nomStation) REFERENCES Station
                        ON DELETE CASCADE
						);
-- ON DELETE CASCADE Permet de supprimer l'activité si le nom de la station est surprimé. 

Create table CLIENT (ID int, 
						nom varchar(20) not null, 
						prenom varchar(20), 
						ville varchar(20) not null, 
						région varchar(20), 
						solde int Default 0 not null, 
						PRIMARY KEY (ID)
						);

Create table SEJOUR (ID int, 
						station varchar(20), 
						debut Date, 
						nbPlaces int not null, 
						PRIMARY KEY (ID, station, debut), 
						FOREIGN KEY (ID) REFERENCES CLIENT, 
						FOREIGN KEY (station) REFERENCES Station
                        ON DELETE CASCADE
						);