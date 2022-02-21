CREATE TABLE Diplomes (
	id_diplome int primary key identity,
	Nom varchar(50) not null,
	Specialite varchar(50) not null,
	Pays varchar(50) not null,
	Numero_diplome int not null unique,
	date_diplome date not null,
	Universite varchar(50) not null,
	Date_validite date,
	pdf varchar(50) not null,
	id_medecin int not null,
	check (specialite in ('Generaliste', 'Pediatre', 'Dermatologue')),
	FOREIGN KEY (id_medecin) REFERENCES Medecin(id)
	);

insert into Diplomes values ('Diplome d"etat', 'Generaliste', 'France', 1234,'2019-04-23', 'Universite de la Sorbonne', null, 'diplome.pdf', 1);
INSERT INTO Diplomes VALUES ('Diplome d"etat', 'Generaliste', 'France',12345,'1990-09-08', 'Universite Paris 5', null, 'diplome1.pdf', 2);
INSERT INTO Diplomes VALUES ('Diplome d"etat', 'Generaliste', 'France',123456,'2017-01-12', 'Universite Paul Sabatier', '2020-01-01', 'diplome2.pdf', 3);
INSERT INTO Diplomes VALUES ('Diplome de pediatrie', 'Pediatre', 'France',1234567,'2003-12-23', 'Universite de l"Hopital', null, 'diplome3.pdf', 4);
INSERT INTO Diplomes VALUES ('Diplome de dermato', 'Dermatologue', 'Angleterre',12345678,'2022-02-20', 'Universite des nouveaux medecins', null, 'diplome4.pdf', 5);