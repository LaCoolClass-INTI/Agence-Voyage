--   Cr�ation des tables


create table STATION (
        nomStation varchar(255) not null,
		capacit� int not null,
		lieu varchar(255) not null unique,
		r�gion varchar(255) unique,
		tarif float DEFAULT 0,
        primary key (nomStation),
		check (r�gion in ('Ocean_Indien','Antilles', 'Europe', 'Am�riques', 'Extr�me-Orient')),
		
		);

create table CLIENT (
        id int not null,
		nom varchar(255) not null,
		pr�nom varchar(255) not null,
		ville varchar(255) not null,
		R�gion varchar(255) not null,
		solde float DEFAULT 0,
        primary key (id)
		);


create table ACTIVITE (
        nomStation varchar(255) not null,
		lib�ll� varchar(255),
		prix float DEFAULT 0,
        primary key (lib�ll�),
		foreign KEY (nomStation) REFERENCES STATION
		
		ON DELETE CASCADE
			
		);

create table SEJOUR (
        idCLIENT int not null,
		NomStation varchar(255) not null,
		d�but1 datetime not null,
		nbPlaces int not null,
        primary key (idCLIENT),
		foreign KEY (nomStation) REFERENCES STATION,
		foreign KEY (idCLIENT) REFERENCES CLIENT
		ON DELETE CASCADE

		);

--   Insertion de donn�es
insert into STATION values('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);
insert into ACTIVITE values('Venusa', 'Voile', 150);
insert into ACTIVITE values('Venusa', 'Plongee', 120);
insert into CLIENT values(10, 'Fogg', 'Phileas', 'Londres', 'Europe', 12465);
insert into CLIENT values(20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763);
insert into CLIENT values(30, 'Kerouac', 'Jack', 'New-York', 'Amerique', 9812);
insert into SEJOUR values(20, 'Venusa', '1998-08-03', 4);

insert into STATION values('toto', 200, 'Guadeloupe', 'Antilles', 800);
insert into STATION values('titi', 500, 'inconnue', 'nullepart', 3000);

--   Vues

CREATE VIEW ActivitesModiques AS select nomStation, lib�ll�
FROM ACTIVITE
WHERE prix < 140;


--SELECT * from ActivitesModiques;


CREATE VIEW ActivitesCheres AS select nomStation, lib�ll�
FROM ACTIVITE
WHERE prix > 140;


--SELECT * from ActivitesCheres;

CREATE VIEW StationEuro AS select nomStation, capacit�, lieu, round (tarif / 6.58,2) as TarifEuro
FROM STATION;

--SELECT * from StationEuro;

;
CREATE VIEW Tarifs AS 
select DISTINCT(S.nomStation), S.tarif, (select min(prix) from ACTIVITE where nomStation = S.nomStation) as minimum, (select max(prix) from ACTIVITE where nomStation = S.nomStation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;

--SELECT * from Tarifs;



-- insersation kayak cher et modique

insert into ACTIVITE values('Venusa', 'Kayak', 120);
insert into ACTIVITE values('Venusa', 'Kayak', 240);


