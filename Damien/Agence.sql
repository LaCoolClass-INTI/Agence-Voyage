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

create table ACTIVITE (
	NomStation varchar(255) not null,
	libellé varchar (255),
	prix float default 0,
	primary key (libellé),
	foreign key (NomStation) references STATION
	ON DELETE CASCADE
	);

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

-- Vues
CREATE VIEW ActivitesModiques AS select nomStation, libellé
FROM ACTIVITE
WHERE prix < 140;

SELECT * from ActivitesModiques;

CREATE VIEW ActivitesCheres AS select nomStation, libellé
FROM ACTIVITE
WHERE prix > 140;

SELECT * from ActivitesCheres;

CREATE VIEW SationEuro AS select NomStation, capacité, lieu, round (tarif / 6.58,2) AS Tarifeuro 
FROM STATION
SELECT * FROM SationEuro

CREATE VIEW Tarifs AS 
select DISTINCT(S.nomstation), S.tarif, (select min(prix) from activite where nomstation = S.nomstation) as minimum, (select max(prix) from activite where nomstation = S.nomstation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;

SELECT * FROM Tarifs


-- ActivitésModiques et activitéscheres sont des views on ne peut donc pas insérer des valeurs à l'intérieur, nous ne pouvons insérer que dans les tables
-- on ne peut pas insérer dans stationEuro car la varaibles tarifs est "composée" (=modifié, passage en euro)
-- 