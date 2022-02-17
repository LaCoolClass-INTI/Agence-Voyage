--Create view ActivitesModiques AS 
--SELECT nomStation ,libelle
--from  ACTIVITE 
--where (prix <140);

--check(regionS in ('Ocean Indien','Antilles','Europe','Ameriques','Extreme Orient'))
--insert into STATION values ('loko',350,'france','Europe',1200);
--insert into Activite values ('kayak','plongée',40);
--insert into ACTIVITE values('loko','Voile',90);
--insert into ACTIVITE values('titi','Plongée',120);
--select * from ActivitesModiques;
--select * from STATION;

--Create view ActivitesCheres AS 
--SELECT nomStation ,libelle
--from  ACTIVITE 
--where (prix >140);
--select * from ActivitesCheres;

--Create view StationEuro AS 
--SELECT nomStation Nom ,capacite,lieu ,tarif, TarifEuro 
--from  STATION ; 
--select * from STATION;

--ALTER TABLE STATION
--ADD TarifEuro AS Tarif *6.58;

--min(A.prix) , max(A.prix)
--Create view Tarifs2 AS
--Select DISTINCT(S.nomStation) , S.tarif , (select min(prix) from ACTIVITE) AS Minimum ,(select max(prix) from ACTIVITE) AS Maximum
--From STATION S 
--INNER JOIN ACTIVITE A 
--ON S.nomstation = A.nomStation;

SELECT * from Tarifs2;


--select min(prix) AS minimum , max(prix) AS maximum
--from ACTIVITE

