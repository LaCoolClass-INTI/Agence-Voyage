CREATE TABLE MEDECIN (
	
	id int not null identity,
	photo varchar(50),
	civilite varchar(50) not null,
	typeMedecin varchar(50),
	nom varchar(50) not null,
	prenom varchar(50) not null,
	age int not null,
	specialite varchar(50) not null,
	adresse varchar(255) not null,
	codePostal int not null,
	ville varchar(50),
	typeTarif varchar(50),
	primary key(id),
	check (civilite in ('Monsieur', 'Madame', 'Mademoiselle')),
	check (typeMedecin in ('Pr', 'Dr'))

)



INSERT INTO MEDECIN VALUES (' ','Madame', 'Dr', 'Maderma', 'Julie', 56, 'Généraliste', '3 rue Chose', 75010, 'Paris', 'Hors Secteur');
INSERT INTO MEDECIN VALUES (' ','Madame', 'Dr', 'Velter', 'Maria', 30, 'Généraliste', '231 boulevard des patients', 75017, 'Paris', 'Secteur 2');
INSERT INTO MEDECIN VALUES (' ','Monsieur', 'Dr', 'Mongéné', 'Alban', 37, 'Généraliste', '17 rue Truc', 75019, 'Paris', 'Secteur 1');
INSERT INTO MEDECIN VALUES (' ','Monsieur', 'Dr', 'Sipani', 'Luigi', 45, 'Chirurgien', '80 rue du Scalpel', 75013, 'Paris', 'Secteur 1');
INSERT INTO MEDECIN VALUES (' ','Madame', 'Dr', 'Servajean', 'Nathalie', 51, 'Généraliste', '8 bis rue des contractions', 75014, 'Paris', 'Secteur 2');
INSERT INTO MEDECIN VALUES (' ','Madame', 'Dr', 'Powel', 'Lydie', 45, 'Pédiatre', '111 avenue classroom', 75019, 'Paris', 'Secteur 2');