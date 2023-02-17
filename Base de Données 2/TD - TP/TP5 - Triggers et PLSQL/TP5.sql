BEGIN
EXECUTE IMMEDIATE 'DROP TABLE AB_NB';
EXCEPTION
 WHEN OTHERS THEN
	IF SQLCODE != -942 THEN
	RAISE;
	END IF;
END;
/

CREATE TABLE AB_NB (
	NUMERO NUMERIC(6,0),
    NB NUMERIC(3,0),
    CONSTRAINT PK_AB_NB PRIMARY KEY (NUMERO)
);

/*DECLARE
    CURSOR nbemprunts IS
        SELECT abonne.num_ab,count(num_ex) AS nb FROM emprunt FULL JOIN abonne ON abonne.num_ab=emprunt.num_ab GROUP BY abonne.num_ab;
BEGIN
    FOR nbemprunt IN nbemprunts
    LOOP
        INSERT INTO AB_NB VALUES(nbemprunt.num_ab,nbemprunt.nb);
    END LOOP;
END;
/*/

DECLARE
    NUMERO abonne.num_ab%Type;
    NB NUMERIC(3,0);
BEGIN
    SELECT num_ab,nbprets(numAB) INTO NUMERO,NB FROM emprunt GROUP BY num_ab;
    INSERT INTO AB_NB VALUES(NUMERO,NB);
END;
/

CREATE OR REPLACE FUNCTION nbprets(numAb NUMERIC(6,0))
    RETURN INTEGER IS
        nbemprunt INTEGER;
    BEGIN
        SELECT count(*) INTO nbemprunt FROM emprunt WHERE num_ab=numAb;
        RETURN (nbemprunt);
    END;
    /