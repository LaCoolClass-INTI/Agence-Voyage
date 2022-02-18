-- Ce script permet de cr�er les diff�rentes Tables demand�es en respectant les diff�rentes conditions propres � chaque colone
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
-- Pour chaque Tables on a cr�� une colone Id pour g�n�rer les primary key en tant qu'Id
-- Check nous permet de respecter la consigne stipulant qu'il ne peut il y avoir que 5 r�gions r�parties par lignes sans doublon

CREATE table ACTIVITE (
	
	id int not null identity,
	idStation int not null,
	libelle varchar(50) not null,
	prix float default 0, -- la commande "default" nous permet d'indiquer que dans la table si il n'y a pas de prix, la valeur par d�faut restera "0"
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
	idClient int not null, -- cr�ation des Foreign key pour cr�er le lien avec la Table Client
	idStation int not null, -- "" avec la Table Station
	debut1 datetime,
	nbPlaces int not null, 
	primary key(id)

)


    alter table ACTIVITE 
        add constraint FK_Activite_Station 
        foreign key (idStation) 
        references STATION(id);

-- Ici nous cr�ons la contrainte entre les Tables Activite et Station pour que les modifications apport�es dans Station se r�percutent �galement dans la Table Activite 

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


