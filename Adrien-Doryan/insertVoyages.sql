INSERT INTO STATION (nomStation, capacite, lieu, region, tarif) VALUES('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);
-- Insertion des valeurs dans la Table STATION à travers le modèle d'insertion type : INSERT INTO <nom table>(colonne1,colonne2,... colonneN) VALUES (valeur 1, valeur 2, ... valeur n)

INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Voile', 150);
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Plongée', 120);

-- Insertion des valeurs dans la Table ACTIVITE à travers le modèle d'insertion type : INSERT INTO <nom table>(colonne1,colonne2,... colonneN) VALUES (valeur 1, valeur 2, ... valeur n)

INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Fogg', 'Phileas', 'Londres', 'Europe', 12465);
INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Pascal', 'Blaise', 'Paris', 'Europe', 6763);
INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Kerouac', 'Jack', 'New York', 'Amérique', 9812);

-- Insertion des valeurs dans la Table CLIENT à travers le modèle d'insertion type : INSERT INTO <nom table>(colonne1,colonne2,... colonneN) VALUES (valeur 1, valeur 2, ... valeur n)

INSERT INTO SEJOUR (idClient, idStation, debut1, nbPlaces) VALUES(2, 1, '1998-08-03', 4);

-- Insertion des valeurs dans la Table SEJOUR à travers le modèle d'insertion type : INSERT INTO <nom table>(colonne1,colonne2,... colonneN) VALUES (valeur 1, valeur 2, ... valeur n)

SELECT * FROM STATION;

SELECT * FROM ACTIVITE;

SELECT * FROM CLIENT;

SELECT * FROM SEJOUR;
-- Affichage des Tables pour vérifier la bonne insertion des valeurs


-- Insert Kayak fin de TP
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Kayak pour bourges', 180);
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Kayak pour prolos', 110);

-- Insertion des valeurs dans la Table ACTIVITE pour tester le bon fonctionnement des VIEW : ACTIVITES_MODIQUES, ACTIVITES_CHERES et TARIFS (Cf : VuesVoyages.sql)

-- INSERT DANS LA VIEW STATION EURO
INSERT INTO STATION VALUES ('Carcazoo', 10, 'Carcassonne', 'Europe', 100);
DELETE FROM STATION WHERE STATION.nomStation = 'Carcazoo';

-- Insertion des valeurs dans la Table STATION pour tester le bon fonctionnement des VIEW : TARIFS et STATIONEURO (Cf : VuesVoyages.sql)