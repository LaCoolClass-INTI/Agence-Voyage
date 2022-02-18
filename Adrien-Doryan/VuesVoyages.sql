-- PAS CHER
CREATE OR ALTER VIEW ACTIVITES_MODIQUES AS -- "Create or Alter VIEW" nous permet de pouvoir effectuer des modification dans la VIEW sans avoir � la supprimer pour ajouter de nouveaux param�tres dans la view

SELECT ACTIVITE.IDSTATION, STATION.nomStation, ACTIVITE.LIBELLE, ACTIVITE.PRIX FROM ACTIVITE  

JOIN STATION ON STATION.ID = ACTIVITE.idStation -- Nous cr�ons ici la jointure, grace aux foreign key g�n�r�es auparavant lors de la cr�ation des Tables, nous permettant d'afficher dans notre VIEW les STATION proposant ces activit�s

WHERE ACTIVITE.PRIX < 140 -- nous demandons ici un tri des prix, ici inf�rieurs � 140 FF



-- Appel de la view
SELECT * FROM ACTIVITES_MODIQUES;

-- Nous affichons la VIEW ACTIVITES_MODIQUES


-- CHER
CREATE OR ALTER VIEW ACTIVITES_CHERES AS

SELECT ACTIVITE.IDSTATION, STATION.nomStation, ACTIVITE.LIBELLE, ACTIVITE.PRIX FROM ACTIVITE 

JOIN STATION ON STATION.ID = ACTIVITE.idStation

WHERE ACTIVITE.PRIX > 140
-- Nous faisons de m�me mais pour des prix cette fois ci sup�rieures � 140 FF

-- Appel de la view
SELECT * FROM ACTIVITES_CHERES;

-- Nous affichons la VIEW ACTIVITES_CHERES


-- CONVERSION TARIF EURO
CREATE OR ALTER VIEW STATIONEURO AS

SELECT STATION.nomStation, STATION.capacite, STATION.lieu, ROUND(STATION.tarif / 6.58, 2) AS TARIF_EURO FROM STATION  
-- Dans cette VIEW nous afichons les tarifs des Stations en les convertissant en �
-- pour cela nous demandons de r�cup�rer les tarifs pr�sents dans la Table STATION, puis nous les divisons par 6.58, c'est a dire la valeur en Franc de 1� 
-- La comande ROUND(Colomn n, Nombre de d�cimale) nous permet d'arrondir les valeurs dans la colone selectionn�e au nombre de d�cimale voulu, ici 2 d�cimales

-- Appel de la view
SELECT * FROM STATIONEURO;

-- Nous affichons la VIEW STATIONEURO




-- TARIF ET PRIX MIN MAX
CREATE OR ALTER VIEW TARIFS AS 

SELECT STATION.nomStation, STATION.tarif, 
(SELECT ACTIVITE.libelle WHERE ACTIVITE.prix =  MIN(ACTIVITE.PRIX)) AS ActiviteMIN, 
MIN(ACTIVITE.PRIX) AS OPTIONMIN,

-- l'id�e est de pouvoir afficher non seulement les tarifs STATION mais aussi les prix dans ACTIVITE, ici nous affichons les prix minimums avec MIN
 
(SELECT ACTIVITE.libelle WHERE ACTIVITE.prix =  MAX(ACTIVITE.PRIX)) AS ActiviteMAX, 
MAX(ACTIVITE.PRIX) AS OPTIONMAX 
FROM STATION

-- id�me pour les prix MAX

JOIN ACTIVITE ON ACTIVITE.IDSTATION = STATION.id
-- Ici nous cr�ons la jointure entra STATION et ACTIVITE pour faire fonctionner l'affichage de la station avec les tarifs dans la VIEW

GROUP BY STATION.nomStation, STATION.tarif, ACTIVITE.LIBELLE, ACTIVITE.PRIX;
-- Enfin nous groupons les r�sultats en par nom de Station, ses tarifs, le nom des activit�s et leurs prix


-- Appel de la view
SELECT * FROM TARIFS;
-- On v�rifie si on a pas tout cass�

