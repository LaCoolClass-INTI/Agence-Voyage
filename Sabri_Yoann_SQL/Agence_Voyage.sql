--création de la database

--create database ag_voyage; --ne fonctionne pas

-- création des tables station, activité, client et sejour

Create table STATION(
	nomStation varchar(25) not null primary key,
	capacite int not null,
	lieu varchar(25) not null unique,
	region varchar(25) unique,
	tarif float default 0
	);

Create table ACTIVITE (
	id_activite int primary key identity,
	nomStation varchar(25) not null,
	libelle varchar(25),
	prix float default 0,
	
	constraint fk_activite foreign key(nomStation) references station(nomStation)
	on delete cascade 
	);

Create table CLIENT (
	id int not null primary key,
	nom varchar(25) not null,
	prenom varchar(25),
	ville varchar(25) not null,
	region varchar(25),
	solde float not null default 0,
	
	check(region in ('Ocean Indien', 'Antilles', 'Europe', 'Ameriques', 'Extreme Orient')));

Create table SEJOUR (
	id int not null,
	station varchar(25),
	debut1 date,
	nbPlaces int not null,
	constraint fk_sejour foreign key(station) references station(nomStation) on delete cascade
	);







