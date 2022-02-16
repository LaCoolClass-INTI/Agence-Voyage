--Insert des stations : 

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);

--Mise de 1 et 2 après Guadeloupe pour eviter des problemes.

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Sainte-Rose', 400, 'Guadeloupe1', 'Antilles', 1350);

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Pointe-à-Pitre', 300, 'Guadeloupe2', 'Antilles', 1800);

--Insert test pour voir si on prend une station en dehors des zones données. Ne dois donc pas fonctionner.

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Tokyo', 600, 'Tokyo', 'Japon', 2700);

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Farniente', 200, 'Seychelles', 'Ocean Indien', 1500);

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Santalba', 150, 'Martinique', 'Antilles', 2000);

INSERT INTO STATION (NomStation, Capacite, lieu, region, tarif)
Values ('Passac', 400, 'Alpes', 'Europe', 1000);

--Insert des activités

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Venusa', 'Voile', 150);

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Venusa', 'Plongée', 120)

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Farniente', 'Plongée', 130)

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Passac', 'Ski', 200)

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Passac', 'Piscine', 20)

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Santalba', 'Kayac', 50)

--Insert des clients

INSERT INTO CLIENT (ID, nom, Prenom, Ville, Région, solde)
Values (10, 'Fogg', 'Phileas', 'Londres', 'Europe', 12465);

INSERT INTO CLIENT (ID, nom, Prenom, Ville, Région, solde)
Values (20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763);

INSERT INTO CLIENT (ID, nom, Prenom, Ville, Région, solde)
Values (30, 'Kerouac', 'Jack', 'New York', 'Amérique', 9812);

INSERT INTO CLIENT (ID, nom, Prenom, Ville, Région, solde)
Values (40, 'Nicolas', 'Melba', 'Avignon', 'Europe', 4389);

INSERT INTO CLIENT (ID, nom, Prenom, Ville, Région, solde)
Values (50, 'Smith', 'John', 'Chicago', 'Amérique', 14028);

--Insert des Sejours des clients.

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (20, 'Venusa', '1998-08-03', 4)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (10, 'Passac', '1998-12-18', 7)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (30, 'Santalba', '1999-05-23', 14)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (20, 'Santalba', '1999-07-28', 2)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (10, 'Passac', '2000-02-15', 6)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (40, 'Venusa', '2001-06-10', 5)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (50, 'Farniente', '2001-06-25', 2)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (10, 'Farniente', '2001-07-10', 4)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (50, 'Venusa', '2002-03-11', 2)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (50, 'Pointe-à-Pitre', '2003-08-03', 2)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (40, 'Sainte-Rose', '2003-11-28', 6)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (30, 'Passac', '2003-12-17', 12)

INSERT INTO SEJOUR (ID, station, Debut, nbPlaces)
Values (20, 'Sainte-Rose', '2003-09-17', 2)


