CREATE TABLE PATIENTS (
	id int primary key identity,
	Nom varchar(50) not null,
	Prenom varchar(50) not null,
	Adresse varchar(255) not null,
	CodePostal int not null,
	Ville varchar(50) not null,
	Sexe varchar(50) not null,
	Date_de_naissance date not null,
	Adresse_mail varchar(50) not null,
	Mot_de_passe varchar(50) not null,
	check (sexe in ('Homme', 'Femme'))
);


insert into PATIENTS values ('Dupont', 'Pierre', '12 avenue des tulipes', 31000, 'Toulouse', 'Homme', '1992-12-31', 'pierredupont@.gmail.com', 'pierrot31');
INSERT INTO PATIENTS VALUES ('Dupond', 'Paul', '50 rue des roses', '34000', 'Montpellier', 'Homme', '1970-08-15', 'pauldupond@gmail.com', '123motdepasse');
INSERT INTO PATIENTS VALUES ('Vol', 'Emma', '21 impasse du lys', 84000, 'Avignon', 'Femme', '1990-03-11', 'emma90@gmail.com', 'emma90');
INSERT INTO PATIENTS VALUES ('Santini', 'Georgette', '30 Avenue des rosiers', 86000, 'Poitiers', 'Femme', '2005-04-26', 'geogettelabest@gmail.com', 'Justinbieberjtm');
INSERT INTO PATIENTS VALUES ('Bouvier', 'Lea', '8 Rue des tilleuls', 32000, 'Auch', 'Femme', '1960-08-12', 'leabouvier@gmail.com', 'boubou32');
