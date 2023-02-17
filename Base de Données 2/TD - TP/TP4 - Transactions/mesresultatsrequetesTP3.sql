/*
USAGE :
Penser à remplir les champs Numéro carte, nom, prénom, date.

Utiliser ce fichier pour répondre aux différentes questions. 
Pour chaque requete vous avez le résultat que vous devez obtenir avec les données de la base BIBLIOTHEQUE.

Les requêtes sont affichées

Si vous ne voulez pas afficher à chaque fois vos requêtes vous pouvez les mettre en commentaire. 
Attention sous ORACLE pour les marques des commentaires (le slash et l'étoile) doivent être seuls sur une ligne.

*/


/*
Numéro de carte étudiant : 
Nom : GALLERNE
Prénom : Romain
Date : 
*/

/*
Mise en page - Ne pas toucher
*/

CLEAR SCREEN
SET PAGESIZE 30
COLUMN COLUMN_NAME FORMAT A30
SET LINESIZE 300


prompt --- Q3 : modification de la relation mot_clefs

ALTER TABLE mot_clef MODIFY MOT VARCHAR(50);
ALTER TABLE mot_clef ADD MOT_PERE VARCHAR(50);
ALTER TABLE mot_clef ADD CONSTRAINT MOT_PERE_FK FOREIGN KEY (MOT_PERE) REFERENCES mot_clef(MOT);


/*
Table modifiee.
*/

prompt --- Q4 : ajout de la date de naissance des abonnés, du type parmi  {‘ADULTE’, ‘ENFANT}) et de leur catégorie dont les valeurs admissibles sont : {‘REGULIER’, ‘OCCASIONNEL’, ‘A PROBLEME’, ‘EXCLU’}.


ALTER TABLE abonne RENAME COLUMN age TO DATE_NAI;
ALTER TABLE abonne MODIFY DATE_NAI NUMERIC(4,0);
ALTER TABLE abonne ADD CAT_AB VARCHAR(16);
ALTER TABLE abonne ADD CONSTRAINT categorie_correct CHECK (CAT_AB IN ('REGULIER','OCCASIONNEL','A PROBLEME','EXCLU'));
ALTER TABLE abonne ADD TYPE_AB VARCHAR(16);
ALTER TABLE abonne ADD CONSTRAINT type_correct CHECK (TYPE_AB IN ('ADULTE','ENFANT'));


/*
Table modifiee.
*/
         
prompt --- Q4 : describe


DESC ABONNE;


/*
Exemple de résultat obtenu en fonction des types retenuss
Nom		NULL ?		Type
--------------------------------------------------
NUM_AB 	NOT NULL 	NUMBER(6)
 NOM		NOT NULL 	VARCHAR2(15)
 PRENOM 			VARCHAR2(20)
 VILLE				VARCHAR2(13)
 AGE				NUMBER(3)
 TARIF				NUMBER(3)
 REDUC				NUMBER(3)
 DATE_NAI			DATE
 TYPE_AB			VARCHAR2(6)
 CAT_AB 			VARCHAR2(12)
*/

prompt -- Q4 : mises à jour qui violent la contrainte


INSERT INTO abonne VALUES (0,'0','0','0',0,0,0,'0','0');


/*
Exemples d'erreurs obtenues :
ERREUR a la ligne 1 :
ORA-02290: violation de contraintes (P00000008868.DOM_CAT_AB) de verification

ORA-12899: valeur trop grande pour la colonne "P00000008868"."ABONNE"."TYPE_AB" (reelle : 8, maximum
 : 6)

*/

prompt --- Q5 - Augmentation de la taille des noms


ALTER TABLE abonne MODIFY nom VARCHAR(20);


/*
Table modifiee.
*/

prompt --- Q5 - Verification que la taille des noms a bien été prise en compte


DESC ABONNE;


/*
Par rapport à la version précédente, le type de NOM a bien été modifié
Nom			NULL ?		Type
 -----------------------------------------------------
 NUM_AB 		NOT NULL 	NUMBER(6)
 NOM			NOT NULL 	VARCHAR2(20)
 PRENOM 				VARCHAR2(20)
 VILLE					VARCHAR2(13)
 AGE					NUMBER(3)
 TARIF					NUMBER(3)
 REDUC					NUMBER(3)
 DATE_NAI				DATE
 TYPE_AB				VARCHAR2(6)
 CAT_AB 				VARCHAR2(12)
*/

prompt --- Q6 - Ajout des auteurs dans la base

CREATE TABLE AUTEUR (
    NUM_AUTEUR NUMERIC(6,0),
    NOM VARCHAR(50),
    PRENOM VARCHAR(50),
    NATIONALITE VARCHAR(50),
    CONSTRAINT PK_ECRIT_AUTEUR PRIMARY KEY(NUM_AUTEUR)
);

CREATE TABLE ECRIT (
    NUM_AUTEUR NUMERIC(6,0),
    ISBN VARCHAR(15),
    CONSTRAINT PK_ECRIT_ECRIT PRIMARY KEY(NUM_AUTEUR,ISBN),
    CONSTRAINT ECRIT_NUM_AUTEUR_FK FOREIGN KEY(NUM_AUTEUR) REFERENCES AUTEUR(NUM_AUTEUR),
    CONSTRAINT ECRIT_ISBN_FK FOREIGN KEY (ISBN) REFERENCES LIVRE(ISBN)
);

/*
Table creee.


Table creee.
*/

prompt --- Q7 - Ajout de données dans le thésaurus

INSERT INTO mot_clef VALUES('ROOT',NULL);

UPDATE mot_clef SET MOT_PERE='ROOT' WHERE MOT='MEDECINE';
UPDATE mot_clef SET MOT_PERE='ROOT' WHERE MOT='LITTERATURE';
UPDATE mot_clef SET MOT_PERE='ROOT' WHERE MOT='SCIENCES';
UPDATE mot_clef SET MOT_PERE='SCIENCES' WHERE MOT='INFORMATIQUE';
UPDATE mot_clef SET MOT_PERE='INFORMATIQUE' WHERE MOT='BASES DE DONNEES';

INSERT INTO mot_clef VALUES('PROGRAMMATION','INFORMATIQUE');
INSERT INTO mot_clef VALUES('MODELE RELATIONNEL','BASES DE DONNEES');
INSERT INTO mot_clef VALUES('MODELES ORIENTES OBJETS','BASES DE DONNEES');

/* 
Il faut au préalable insérer un tuple avec
INSERT INTO MOT_CLEF VALUES ('INDEX', NULL);

1 ligne modifiée.
*/

prompt --- Q8 - Creation des dates de naissances et du type d'abonné

/*
VOTRE REPONSE ICI
*/

/*
11 lignes mises a jour.


7 lignes mises a jour.
*/

prompt --- Q9 - Insertion d'auteurs 

/*
VOTRE REPONSE ICI
*/

/*
1 ligne créee.

autant de fois qu'il y a d'insertion
*/

prompt --- Q10 - Quels sont les différents propriétaires des tables ? 

/*
VOTRE REPONSE ICI
*/

/*
La dernière valeur correspond à votre identifiant UNIX.
----------------------------------------------------------------------------------------------------
----------------------------
SYSTEM
AUDSYS
XDB
SYS
P00000008868
*/


prompt --- Q11 - Quels sont les noms de tous les attributs de la relation ABONNE ?

/*
VOTRE REPONSE ICI
*/

/*
COLUMN_NAME
------------------------------
NUM_AB
NOM
PRENOM
VILLE
AGE
TARIF
REDUC
DATE_NAI
TYPE_AB
CAT_AB

10 lignes selectionnees.
*/

prompt --- Q12 - Quel est le nombre d'attributs définis dans la BD BIBLIO ?


/*
VOTRE REPONSE ICI
*/

prompt --- Q13 - Quelles sont toutes les contraintes d'intégrité définies sur les relations de donné
es de la base BIBLIO ?

/*
VOTRE REPONSE ICI
*/

prompt --- Q14 - Création de la relation TESTINDEX

/*
VOTRE REPONSE ICI
*/

/*
Table créée.
*/
prompt --- Q14 - Création de l'index

/*
VOTRE REPONSE ICI
*/


/*
Index créé.
*/

prompt --- Q14 - Essai de deux insertions

/*
VOTRE REPONSE ICI
*/

/*
Les valeurs peuvent changer :
1 ligne creee.

.......

*
ERREUR a la ligne 1 :
ORA-00001: violation de contrainte unique (P00000008868.CLE_TESTINDEX)
*/

prompt --- Q14 - Affichage de l'index dans les tables systèmes


/*
VOTRE REPONSE ICI
*/

/*
INDEX_NAME		INDEX_TYPE
-----------------------------------
CLE_TESTINDEX		NORMAL
*/


prompt --- Q15 - Existe-t-il, dans la base BIBLIO, une relation pour laquelle aucun index n’a été sp
écifié ?

/*
VOTRE REPONSE ICI
*/

/*
aucune ligne selectionnee
*/


prompt --- Q16 - Création vue ABONNE_MONTP


/*
VOTRE REPONSE ICI
*/

/*
Vue creee.
*/

prompt --- Q16 - Insertion d'un tuple dans la vue

/*
VOTRE REPONSE ICI
*/

/*
1 ligne creee.
*/

prompt --- Q16 - Visualisation d'abonne

/*
VOTRE REPONSE ICI
*/

/*
    NUM_AB NOM			PRENOM		     VILLE		  AGE
---------- -------------------- -------------------- ------------- ----------
     TARIF	REDUC DATE_NAI	 TYPE_A CAT_AB
---------- ---------- ---------- ------ ------------
.....
950001	  FAURE

12 lignes sélectionnées.
*/
...

prompt --- Q17 : Vérifier que la vue a bien été créée dans les tables systèmes.

/*
VOTRE REPONSE ICI
*/

/*
VIEW_NAME
--------------------------------------------------------------------------------
ABONNE_MONTP
*/

prompt --- Q18 - vue ETAT_ETAT EXEMPLAIRE

/*
VOTRE REPONSE ICI
*/

/*
Vue créée.
*/

prompt --- Q18 - tentative d'insertion dans la vue d'un tuple erroné

/*
VOTRE REPONSE ICI
*/

/*
INSERT INTO ...
            *
ERREUR a la ligne 1 :
ORA-01402: vue WITH CHECK OPTION - violation de clause WHERE
*/

prompt --- Q19 - Creation de la vue EMP

/*
VOTRE REPONSE ICI
*/

/*
Vue créée.
*/

prompt --- Q20 - Test d'une inserion invalide

/*
VOTRE REPONSE ICI
*/

 /*
INSERT INTO ...
            *
ERREUR a la ligne 1 :
ORA-01402: vue WITH CHECK OPTION - violation de clause WHERE
*/

