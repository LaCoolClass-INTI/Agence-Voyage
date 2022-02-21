
CREATE TABLE lieu (
	id_lieu int primary key identity,
	lieu varchar(50) not null,
	adresse varchar(50) not null,
	code_postal int not null,
	ville varchar(50) not null
	);


CREATE TABLE Conferences (
	id_conference int primary key identity,
	Titre varchar(256) not null,
	date_conf_debut date not null,
	date_conf_fin date not null,
	heure_debut time not null,
	heure_fin time not null,			-- '00:00:00' hh:min:ss
	id_lieu int not null,
	FOREIGN KEY (id_lieu) REFERENCES lieu(id_lieu)
	);



insert into Conferences values ('Big Internationnal Best Medical Conference','2021-05-14', '2021-05-14', '07:30:00', '23:59:59', 1);
insert into Conferences values ('Comment ne pas tuer ses patients','2022-03-04', '2022-03-08', '09:30:00', '17:30:00', 2);
insert into Conferences values ('Comment facturer ses clients au max','2024-08-12', '2024-08-15', '09:00:00', '19:00:00', 3) 

insert into lieu values ('Salle des fetes', 'Impasse de la petite huitre', 33120, 'Arcachon');
insert into lieu values ('Salle des survivants', '15 Rue de la morgue', 75019, 'Paris');
insert into lieu values ('Salle Hercule', '22 rue de la tune', 13000, 'Marseille');