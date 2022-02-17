INSERT INTO STATION (nomStation, capacite, lieu, region, tarif) VALUES('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);


INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Voile', 150);
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Plongée', 120);

INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Fogg', 'Phileas', 'Londres', 'Europe', 12465);
INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Pascal', 'Blaise', 'Paris', 'Europe', 6763);
INSERT INTO CLIENT (nom, prenom, ville, region, solde) VALUES('Kerouac', 'Jack', 'New York', 'Amérique', 9812);

INSERT INTO SEJOUR (idClient, idStation, debut1, nbPlaces) VALUES(2, 1, '1998-08-03', 4);



SELECT * FROM STATION;

SELECT * FROM ACTIVITE;

SELECT * FROM CLIENT;

SELECT * FROM SEJOUR;



-- Insert Kayak fin de TP
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Kayak pour bourges', 180);
INSERT INTO ACTIVITE (idStation, libelle, prix) VALUES((SELECT STATION.id FROM STATION WHERE STATION.nomStation = 'Venusa'), 'Kayak pour prolos', 110);

-- INSERT DANS LA VIEW STATION EURO
INSERT INTO STATION VALUES ('Carcazoo', 10, 'Carcassonne', 'Europe', 100);
DELETE FROM STATION WHERE STATION.nomStation = 'Carcazoo';