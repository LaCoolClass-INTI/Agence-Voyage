-- Exercice Agence de voyage


--Creation de la database
use Agence_de_voyage

--Creation des tables
create table STATION (
	NomStation varchar(255) not null,
	capacit� int,
	lieu varchar (255) unique,
	region varchar (255) unique not null,
	tarif float default 0,
	primary key (NomStation),
	check (region in ('Ocean_indien', 'Antilles','Europe','Ameriques','Extreme-orient')),
	);
-- la fonction CHECK limite les insertions aux termes sp�cifi�s pour l'argument region


create table ACTIVITE (
	NomStation varchar(255) not null,
	libell� varchar (255),
	prix float default 0,
	primary key (libell�),
	foreign key (NomStation) references STATION
	ON DELETE CASCADE
	);

-- ON DELETE CASCADE permet de supprimer la table ACTIVITE si le nom de la station correspondante est supprim�e.

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

-- ON DELETE CASCADE permet de supprimer la table SEJOUR si le nom de la station correspondante est supprim�e.


-- Insertion des valeurs dans les tables:

-- Insertion V1
insert into STATION (NomStation, capacit�, lieu, region, tarif)
values ('Venusa', 350, 'Guadeloupe', 'Antilles',1200)
insert into ACTIVITE(NomStation, libell�, prix)
values ('Venusa', 'Voile', 150)
insert into ACTIVITE(NomStation, libell�, prix)
values ('Venusa', 'Plong�e', 120)
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


-- Cr�ation des Vues
-- Objectif : cr�er des vues et tester l'interrogation et la mise-�-jour � travers ces vues.

-- Cr�ation de la vue ActivitesModiques pour les activit�s ayant un prix inf�rieur � 140
CREATE VIEW ActivitesModiques AS select nomStation, libell�
FROM ACTIVITE
WHERE prix < 140;

SELECT * from ActivitesModiques;


-- Cr�ation de la vue ActivitesCheres pour les activit�s ayant un prix sup�rieur � 140
CREATE VIEW ActivitesCheres AS select nomStation, libell�
FROM ACTIVITE
WHERE prix > 140;

SELECT * from ActivitesCheres;


--Cr�ation d'une vue donnant le nom de la station, sa capacit�, son lieu et le prix de ses activit�s en �
CREATE VIEW StationEuro AS select NomStation, capacit�, lieu, round (tarif / 6.58,2) AS Tarifeuro 
FROM STATION
SELECT * FROM StationEuro
-- /6.58=> Transfert en �, round(...,2) => Arrondi � 2 d�cimales

-- Cr�ation d'une vue Tarifs donnant le nom de la station, le tarif minimum et maximum de chaque activit�s
CREATE VIEW Tarifs AS 
select DISTINCT(S.nomstation), S.tarif, (select min(prix) from activite where nomstation = S.nomstation) as minimum, (select max(prix) from activite where nomstation = S.nomstation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;

SELECT * FROM Tarifs


-- Activit�sModiques et activit�scheres sont des views on ne peut donc pas ins�rer des valeurs � l'int�rieur, nous ne pouvons ins�rer que dans les tables
-- On ne peut pas ins�rer dans stationEuro car la varaibles tarifs est "compos�e" (=modifi�, passage en euro)
-- Pour ins�rer dans la station euro, on peut ins�rer une nouvelle entr�e dans la table STATION
insert into STATION values('JOJO', 380, 'Reunion', 'Ocean_indien', 1800);

SELECT * FROM StationEuro
--Suppression de la ligne ins�r�e
DELETE FROM StationEuro 
WHERE NomStation in ('JOJO');

--v�rification de la suppression
SELECT * FROM StationEuro