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

CREATE table ACTIVITE (
	
	id int not null identity,
	idStation int not null,
	libelle varchar(50) not null,
	prix float default 0,
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
	idClient int not null,
	idStation int not null,
	debut1 datetime,
	nbPlaces int not null, 
	primary key(id)

)


    alter table ACTIVITE 
        add constraint FK_Activite_Station 
        foreign key (idStation) 
        references STATION(id);

    alter table SEJOUR 
        add constraint FK_Sejour_Station 
        foreign key (idStation) 
        references STATION(id);

    alter table SEJOUR 
        add constraint FK_Sejour_Client 
        foreign key (idClient) 
        references CLIENT(id);



