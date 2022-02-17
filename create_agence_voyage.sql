Create Table STATION (
nomStation Varchar(30) Primary key,
capacite int not null,
lieu varchar(50) not null unique,
regionS varchar(30) unique,
tarif int default 0,

check(regionS in ('Ocean Indien','Antilles','Europe','Amerique','Extreme Orient'))
);

Create Table ACTIVITE (
idActivite int primary key identity,
nomStation Varchar(30),
libelle varchar(30),
prix int default 0,
foreign key(nomStation) references STATION(nomStation)
ON DELETE CASCADE
);

Create Table CLIENT (
id int not null Primary key identity,
nom varchar(30) not null,
prenom varchar(30),
ville varchar (30) not null,
regionC varchar(30),
solde int not null default 0,

);

Create Table SEJOUR (
id int primary key identity,
nomStation varchar(30),
debut1 date,
nbPlaces int not null,
foreign key (nomStation) references STATION(nomStation)

ON DELETE CASCADE

);