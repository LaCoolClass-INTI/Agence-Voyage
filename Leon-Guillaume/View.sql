
-- 3) LES VIEWS :   
--Objectif : créer des vues et tester l'interrogation et la mise-à-jour à travers ces vues.


--Creation view d'activités modiques. 
--Create wiew = create metadata of a function to show what we want.
CREATE or ALTER VIEW  ActivitesModiques
AS select nomstation, libelle
FROM activite
WHERE prix < 140
WITH CHECK OPTION;


--Creation view d'activités chères. 

CREATE or ALTER VIEW  ActivitesCheres 

AS select nomstation, libelle
FROM activite
WHERE prix > 140
WITH CHECK OPTION;

-- pour voir la view faire " select * from ActivitesCheres "

-- Creation View StationEuro
CREATE or ALTER VIEW StationEuro (Nom, Capacite, Lieu, TarifEuro)

AS select nomstation, capacite, lieu, tarif / 6.58
FROM STATION;

--round (tarif / 6.58,2) pour avoir le tarif en euro avec 2 décimales. 

--Ici, le tarif change de la valeur donné puis diviser par la valeur en €. 

--Utiliser F5 pour activer la selection. 


-- Creation View Tarif

CREATE or ALTER VIEW Tarifs AS 
select DISTINCT(S.nomstation),
		S.tarif, 
		(select min(prix) from activite where nomstation = S.nomstation) as minimum, 
		(select max(prix) from activite where nomstation = S.nomstation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;


--Opération suivantes pour views : 

-- Insert de l'activité kayac dans Venusa pour modique et chère. 
INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Venusa', 'Kayac1', 175);

Select * from activitesCheres;

INSERT INTO ACTIVITE (NomStation, Libelle, Prix)
Values ('Venusa', 'Kayac2', 105);

Select * from activitesModiques;

-- Insertion dans StationEuro d'une nouvelle station. 

Insert Into STATION (NomStation, Capacite, Lieu)
Values ('Tigne', 1200, 'Alpes');

Select * from StationEuro

-- Delete a row from StationEuro (Ici la station ajouté précedement).

Delete from StationEuro
Where nom In ('Tigne')

select * from StationEuro