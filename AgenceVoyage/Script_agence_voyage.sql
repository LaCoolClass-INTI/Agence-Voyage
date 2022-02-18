-- Création des tables 

CREATE TABLE Station (nomStation VARCHAR (200) NOT NULL,    --création de la colonne nomStation==> commande VARCHAR ==> permet de mettre des mots (ici à hauteur de 200 caractères)
                      capacite   INT NOT NULL,                --création de capacite ==> commande INT ==> permet de mettre des chiffres entiers ==> NOT NULL (obligation de mettre une condition)
                      lieu       VARCHAR(200) NOT NULL,
                      region     VARCHAR (200) NOT NULL,
                      tarif      FLOAT DEFAULT 0 NOT NULL,    --commande FLOAT ==> permet de mettre des chiffres avec des décimales ==> NOT NULL (obligation de mettre une condition)
                      CONSTRAINT cle_station PRIMARY KEY (nomStation),   ---fixe la table Station sur le nomStation
                      CONSTRAINT cle_lieu_region UNIQUE (lieu, region),    ---Empêche qu'il y est un même lieu dans la même région
                      CONSTRAINT nom_region
                         CHECK (region IN ('Ocean Indien',                 ---permet de définir les régions autorisés
                                        'Antilles', 'Europe',
                                        'Ameriques', 'Extreme Orient'))
                    );

CREATE TABLE Activite (nomStation   VARCHAR (200) NOT NULL,
                       libelle      VARCHAR(200) NOT NULL,
                       prix         FLOAT DEFAULT 0 NOT NULL,
                       PRIMARY KEY (nomStation, libelle),
                       FOREIGN KEY (nomStation) REFERENCES Station
                         ON DELETE CASCADE                         ----destruction d'une valeur affiliée entraîne la destruction de cette valeur dans les autres tables associées
                       );
					   
CREATE TABLE Client (id INT NOT NULL,
                      nom VARCHAR(200) NOT NULL,
                      prenom VARCHAR (200) NOT NULL,
                       ville VARCHAR (200) NOT NULL,
                       region VARCHAR(200)NOT NULL,
                        solde FLOAT DEFAULT 0 NOT NULL,
                         PRIMARY KEY (id)
                   );  

CREATE TABLE Sejour  (id INT NOT NULL,
                       station VARCHAR (200) NOT NULL,
                       debut1 DATE NOT NULL,
                       nbPlaces  INT NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (Station) REFERENCES Station (nomStation),
                        );
							 
-- Insertion des données

INSERT INTO Station (nomStation, capacite, lieu, region, tarif)     ---insérer des données dans la table
VALUES ('Venusa' , 350 , 'Guadeloupe' , 'Antilles' ,1200
);

INSERT INTO Activite (nomStation, libelle, prix)
VALUES ('Venusa' ,'Voile' ,150
);
VALUES ('Venusa' , 'Plonge' , 120
);

INSERT INTO Client (id, nom, prenom, ville, region, solde)
VALUES (10 , 'Fogg' , 'Phileas', 'Londres', 'Europe', 12465
);
VALUES (20 , 'Pascal' , 'Blaise' , 'Paris' , 'Europe', 6763
);
VALUES (30 , 'Kerouac' , 'Jack' , 'New York' , 'Amerique' , 9812
);

INSERT INTO Sejour (id, station, debut1, nbPlaces)
VALUES (20 , 'Venusa' , '1998-08-03' , 4
);

----------- Une vue ActivitesModiques (Station, Activite) donnant le nom des stations et des activités dont le prix est inférieur à 140 FF. 
CREATE VIEW ActivitesModiques AS 
SELECT nomStation, prix
FROM Activite
WHERE prix < 140 ;

REPLACE VIEW ActivitesModiques AS 
SELECT nomStation, prix
FROM Activite
WHERE prix < 140 
WITH CHECK OPTION;            ---- Toute ligne insérée dans cette vue doit apparaître dans la vue ensuite.

---Une vue ActivitesCheres, de même schéma, avec prix supérieur à 140 FF, et la même contrainte d'insertion

CREATE VIEW ActivitesCheres AS 
SELECT nomStation, prix
FROM Activite
WHERE prix > 140
WITH CHECK OPTION;

---Une vue StationEuro (Nom, Capacite, Lieu, TarifEuro) donnant le nom d'une station, sa capacité, le lieu et le tarif en euro (un euro=6,58 FF).
CREATE VIEW StationEuro1 (nomStation, capacite, lieu, tarifEuros) AS 
SELECT nomStation, capacite, lieu, tarif/ 6.58
FROM Station;

----Une vue Tarifs (Station, Tarif, OptionMin, OptionMax) donnant, pour chaque station, le tarif et les prix min et max des activités.
CREATE VIEW Tarfis (station, tarif, optionMin, optionMAx) AS 
SELECT nomStation, tarif, (SELECT min(prix) FROM Activite) AS OptionMin, (SELECT max(prix) FROM Activite) AS OptionMax
FROM Station;

----- Inserer des parametres
INSERT INTO Station (nomStation, capacite, lieu, region, tarif)
VALUES ('Vatican' , 100 , 'Italie' , 'Europe' , 3000);

INSERT INTO Activite
VALUES ('Vatican' , 'Restau' , 400 );

SELECT * FROM Activite
SELECT * FROM Tarfis

-----Insérez une activité 'Kayac' pour la station 'Venusa' dans ActivitesCheres et ActiviteModiques

INSERT INTO Activite
VALUES ('Venusa' , 'Kayak' , 200 );
INSERT INTO Activite
VALUES ('Venusa' , 'Kayak1' , 90 );

SELECT * FROM ActivitesCheres
SELECT * FROM ActivitesModiques

---- oui car ça permet de ne peut pas mettre 2 prix pour une même activité

---Oui on peut insérer dans la SastionEuro à condition d'insérer une ligne dans Station
INSERT INTO Station (nomStation, capacite, lieu, region, tarif)
VALUES ('Catarata' , 100 , 'Argentine' , 'Ameriques' , 5000);
SELECT * FROM StationEuro1

----Détruisez une ligne de StationEuro.
DELETE FROM Station WHERE nomStation ='Catarata' 
SELECT * FROM StationEuro1

