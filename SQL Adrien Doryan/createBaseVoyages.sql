-- Ce script permet de créer les différentes Tables demandées en respectant les différentes conditions propres à chaque colone
CREATE table STATION (
	
	id int not null identity,
	nomStation varchar(50) not null,
	capacite int not null,
	lieu varchar(50) not null unique,
	region varchar(50) not null unique,
	tarif float default 0,
	primary key(id),
	check (region in ('Ocean Indien','Antilles','Europe','Ameriques','Extreme Orient'))

)
-- Pour chaque Tables on a créé une colone Id pour générer les primary key en tant qu'Id
-- Check nous permet de respecter la consigne stipulant qu'il ne peut il y avoir que 5 régions réparties par lignes sans doublon

CREATE table ACTIVITE (
	
	id int not null identity,
	idStation int not null,
	libelle varchar(50) not null,
	prix float default 0, -- la commande "default" nous permet d'indiquer que dans la table si il n'y a pas de prix, la valeur par défaut restera "0"
	primary key(id)

)

CREATE table CLIENT (
	
	id int not null identity,
	nom varchar(50) not null,
	prenom varchar(50) not null,
	ville varchar(50),
	region varchar(50),
	solde float default 0,
	primary key(id)

)

CREATE table SEJOUR (
	
	id int not null identity,
	idClient int not null, -- création des Foreign key pour créer le lien avec la Table Client
	idStation int not null, -- "" avec la Table Station
	debut1 datetime,
	nbPlaces int not null, 
	primary key(id)

)


    alter table ACTIVITE 
        add constraint FK_Activite_Station 
        foreign key (idStation) 
        references STATION(id);

-- Ici nous créons la contrainte entre les Tables Activite et Station pour que les modifications apportées dans Station se répercutent également dans la Table Activite 

    alter table SEJOUR 
        add constraint FK_Sejour_Station 
        foreign key (idStation) 
        references STATION(id);
-- Idem pour les Tables Sejour et Station
    alter table SEJOUR 
        add constraint FK_Sejour_Client 
        foreign key (idClient) 
        references CLIENT(id);
-- et pour la Table Client


