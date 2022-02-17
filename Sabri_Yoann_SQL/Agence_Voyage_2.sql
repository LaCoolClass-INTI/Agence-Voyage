--insert into station values('Venusa', 350 ,'Guadeloupe', 'Antilles', 1200)
--insert into activite (nomStation, libelle, prix) values ('Venusa', 'Voile', 150)
--insert into activite values('Venusa', 'Plongee', 120)
--insert into client values(10, 'Fogg', 'Phileas', 'Londres', 'Europe', 12465)
--insert into client values(20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763)
--insert into client values(30, 'Kerouac', 'Jack', 'New York', 'Ameriques', 9812)
--insert into sejour values(20, 'Venusa', '1998-08-03', 4)
--select * from activite;
--select * from client;
--select * from sejour;

--create view ActivitesModiques as 
--select nomStation, libelle from activite
--where (prix < 140);

--insert into station values('Montpellier', 350000 ,'France', 'Europe', 60)
--insert into station values('Toulouse', 400000 ,'Las_Vegas', 'Ameriques', 150); -- erreur dans la table avec la region qui est unique
--insert into activite values ('Montpellier', 'Bronzette', 10);
--insert into activite values('Toulouse', 'Rugby', 135);

--select * from ActivitesModiques

--create view ActivitesCheres as 
--select nomStation, libelle from activite
--where (prix > 140);

--select * from station

--Une vue StationEuro (Nom, Capacite, Lieu, TarifEuro) 
--donnant le nom d'une station, sa capacité, le lieu et le tarif en euro (un euro=6,58 FF).

--alter table station
--add TarifEuros as  Tarif *6.58
--create view StationEuro as 
--select nomStation, capacite, lieu,TarifEuros from station

--select * from tarifs

--Une vue Tarifs (Station, Tarif, OptionMin, OptionMax) donnant, pour chaque station,
--le tarif et les prix min et max des activités.

--create view Tarifs as 
--select Distinct (s.nomStation), s.tarif, (select min(prix) from activite) as Minimum,
--(select max(prix) from activite) as Maximum
--from station s

--drop view if exists tarifs ;
--go

--UPDATE activitesmodiques SET libelle = 'Pepouze'
--WHERE libelle = 'Bronzette';
--select * from activitesmodiques
