--(Léon)
-- LES VIEWS : 

--Creation view d'activités modiques. 
--Create wiew = create metadata of a function to show what we want.
CREATE VIEW ActivitesModiques
AS select nomstation, libelle
FROM activite
WHERE prix < 140
WITH CHECK OPTION;


--Creation view d'activités chères. 

CREATE VIEW ActivitesCheres 

AS select nomstation, libelle
FROM activite
WHERE prix > 140
WITH CHECK OPTION;

-- pour voir la view faire " select * from ActivitesCheres "

-- Creation View StationEuro
CREATE VIEW StationEuro (Nom, Capacite, Lieu, TarifEuro)

AS select nomstation, capacite, lieu, tarif / 6.58
FROM STATION;

--Ici, le tarif change de la valeur donné puis diviser par la valeur en € -- Ne marche pas. Utiliser F5 pour activer la selection. 

CREATE VIEW Tarifs AS 
select DISTINCT(S.nomstation), S.tarif, (select min(prix) from activite where nomstation = S.nomstation) as minimum, (select max(prix) from activite where nomstation = S.nomstation) as maximum
FROM STATION S
INNER JOIN ACTIVITE A
ON S.NomStation = A.NomStation;