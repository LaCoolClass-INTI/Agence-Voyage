CREATE TABLE Station (nomStation VARCHAR (30) NOT NULL,
                      capacite   INT NOT NULL,
                      lieu       VARCHAR(30) NOT NULL,
                      region     VARCHAR (30) NOT NULL,
                      tarif      float DEFAULT 0 NOT NULL,
                      CONSTRAINT cle_station PRIMARY KEY (nomStation), 
                      CONSTRAINT cle_lieu_region UNIQUE (lieu, region),
                      CONSTRAINT nom_region
                         CHECK (region IN ('Ocean Indien', 
                                        'Antilles', 'Europe',
                                        'Ameriques', 'Extreme Orient'))
                    );

CREATE TABLE Activite (nomStation   VARCHAR (30) NOT NULL,
                       libelle      VARCHAR(30) NOT NULL,
                       prix         FLOAT DEFAULT 0 NOT NULL,
                       PRIMARY KEY (nomStation, libelle),
                       FOREIGN KEY (nomStation) REFERENCES Station
                         ON DELETE CASCADE
                       );
CREATE TABLE Client (id INT NOT NULL,
                      nom VARCHAR(30) NOT NULL,
                      prenom VARCHAR(30)NOT NULL,
                       ville VARCHAR(30) NOT NULL,
                       region VARCHAR(30) NOT NULL,
                        solde FLOAT DEFAULT 0 NOT NULL,
                         PRIMARY KEY (id)
                   );  

CREATE TABLE Sejour  (idClient INT,
                       station VARCHAR (30),
                       debut1 DATE NOT NULL ,
                       nbPlaces  INT NOT NULL,
                        PRIMARY KEY (idClient),
                        FOREIGN KEY (idClient) REFERENCES Client,
                        FOREIGN KEY (station) REFERENCES Station
                             ON DELETE CASCADE);
							 
INSERT INTO Station (nomStation, capacite, lieu, region, tarif)
values (
'Venusa', 350, 'Guadeloupe', 'Antilles', 1200
);
INSERT INTO Activite (nomStation, libelle, prix)
values (
'Venusa', 'Voile', 150
);
INSERT INTO Activite (nomStation, libelle, prix)
values (
'Venusa' 'Plongee', 120
); 
Insert into Client (id, nom, prenom, ville, region ,solde)
values(
10, 'Fogg', 'Phileas', 'Londres', 'Europe', 12465
);
INSERT INTO Client (id, nom, prenom, ville, region ,solde)
values ( 20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763
);
INSERT INTO Client (id, nom, prenom, ville, region ,solde)
values (30, 'Kerouac',  'Jack', 'New York', 'Ameriques', 9812
); 
INSERT INTO Sejour( idClient, station, debut1, nbPlaces)
values
(20, 'Venusa', '1998-08-03', 4
);

Create view ActivitesModiques as 
select nomStation, prix
From Activite 
Where prix < 140

WITH CHECK OPTION


Create view ActivitesCheres as 
select nomStation, prix
From Activite 
Where prix > 140

WITH CHECK OPTION

Create view StationEuro ( nomStation, capacite, lieu, tarifeuro) as
select nomStation, capacite, lieu, tarif / 6.58 
FROM Station 
