-- Exercice Agence de voyage


--Creation de la database
use Agence_de_voyage

--Creation des tables
create table STATION (
	NomStation varchar(255) not null,
	capacité int,
	lieu varchar (255) unique,
	region varchar (255) unique not null,
	tarif float default 0,
	primary key (NomStation),
	check (region in ('Ocean_indien', 'Antilles','Europe','Ameriques','Extreme-orient')),
	);
-- la fonction CHECK limite les insertions aux termes spécifiés pour l'argument region


create table ACTIVITE (
	NomStation varchar(255) not null,
	libellé varchar (255),
	prix float default 0,
	primary key (libellé),
	foreign key (NomStation) references STATION
	ON DELETE CASCADE
	);

-- ON DELETE CASCADE permet de supprimer la table ACTIVITE si le nom de la station correspondante est supprimée.

create table CLIENT (
	ID int not null,
	nom varchar (255) not null,
	prenom varchar (255) not null,
	ville varchar (255) not null,
	region varchar (255) not null,
	solde float default 0,
	primary key (ID)
	);

create table SEJOUR (
	ID int not null,
	NomStation varchar (255) not null,
	debut varchar (255) not null,
	NbPlaces int not null,
	primary key (ID),
	foreign key (ID) references CLIENT,
	foreign key (NomStation) references STATION
	ON DELETE CASCADE
	);

-- ON DELETE CASCADE permet de supprimer la table SEJOUR si le nom de la station correspondante est supprimée.


-- Insertion des valeurs dans les tables:

-- Insertion V1
insert into STATION (NomStation, capacité, lieu, region, tarif)
values ('Venusa', 350, 'Guadeloupe', 'Antilles',1200)
insert into ACTIVITE(NomStation, libellé, prix)
values ('Venusa', 'Voile', 150)
insert into ACTIVITE(NomStation, libellé, prix)
values ('Venusa', 'Plongée', 120)
insert into CLIENT (ID, nom, prenom, ville, region, solde )
values (10, 'Fogg', 'Philieas', 'Londres', 'Europe',12465)
insert into CLIENT (ID, nom, prenom, ville, region, solde )
values (20, 'Pascal', 'Blaise', 'Paris', 'Europe',6763)
insert into CLIENT (ID, nom, prenom, ville, region, solde )
values (30, 'Kerouac', 'Jack', 'New York', 'Ameriques',6763)
insert into SEJOUR(ID, NomStation, debut, NbPlaces)
values (20, 'Venusa', '1998-08-03', 4)

--Insertion V2
insert into STATION values('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);
insert into ACTIVITE values('Venusa', 'Voile', 150);
insert into ACTIVITE values('Venusa', 'Plongee', 120);
insert into CLIENT values(10, 'Fogg', 'Phileas', 'Londres', 'Europe', 12465);
insert into CLIENT values(20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763);
insert into CLIENT values(30, 'Kerouac', 'Jack', 'New-York', 'Amerique', 9812);
insert into SEJOUR values(20, 'Venusa','1998-08-03', 4);


-- Création des Vues
-- Objectif : créer des vues et tester l'interrogation et la mise-à-jour à travers ces vues.

-- Création de la vue ActivitesModiques pour les activités ayant un prix inférieur à 140
CREATE VIEW ActivitesModiques AS select nomStation, libellé
FROM ACTIVITE
WHERE prix < 140;

SELECT * from ActivitesModiques;


-- Création de la vue ActivitesCheres pour les activités ayant un prix supérieur à 140
CREATE VIEW ActivitesCheres AS select nomStation, libellé
FROM ACTIVITE
WHERE prix > 140;

SELECT * from ActivitesCheres;


--Création d'une vue donnant le nom de la station, sa capacité, son lieu et le prix de ses activités en €
CREATE VIEW StationEuro AS select NomStation, capacité, lieu, round (tarif / 6.58,2) AS Tarifeuro 
FROM STATION
SELECT * FROM StationEuro
-- /6.58=> Transfert en €, round(...,2) => Arrondi à 2 décimales

-- Création d'une vue Tarifs donnant le nom de la station, le tarif minimum et maximum de chaque activités
CREATE VIEW Tarifs AS 
select DISTINCT(S.nomstation), S.tarif, (select min(prix) from activite where nomstation = S.nomstation) as minimum, (select max(prix) from activite where nomstation = S.nomstation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;

SELECT * FROM Tarifs


-- ActivitésModiques et activitéscheres sont des views on ne peut donc pas insérer des valeurs à l'intérieur, nous ne pouvons insérer que dans les tables
-- On ne peut pas insérer dans stationEuro car la varaibles tarifs est "composée" (=modifié, passage en euro)
-- Pour insérer dans la station euro, on peut insérer une nouvelle entrée dans la table STATION
insert into STATION values('JOJO', 380, 'Reunion', 'Ocean_indien', 1800);

SELECT * FROM StationEuro
--Suppression de la ligne insérée
DELETE FROM StationEuro 
WHERE NomStation in ('JOJO');

--vérification de la suppression
SELECT * FROM StationEuro