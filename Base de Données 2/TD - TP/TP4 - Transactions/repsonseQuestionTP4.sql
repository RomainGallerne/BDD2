/*
Exo 1 - Q1
*/
select * from All_TABLES;

/*1551 lignes selectionnées*/

/*
Exo 1 - Q2
*/
select count(*) from user_tab_columns where table_name='ABONNE';

/*9 lignes séléctionnées*/

/*
Exo 1 - Q3
*/

 select constraint_name,status from user_constraints where owner='E20200007056' and table_name not like 'BIN%' and constraint_name not like 'SYS%';

 /*17 lignes séléctionnées*/

/*
Exo 1 - Q4
*/

select constraint_name,status from user_constraints where owner='E20200007056' and table_name not like 'BIN%' and constraint_name not like 'SYS%' and constraint_type='P';

/*6 lignes séléctionnées*/

/*
Exo 1 - Q5
*/

select table_name,column_name,data_type,nullable from user_tab_columns where table_name='ABONNE';

/*9 lignes séléctionnées*/

/*
Exo 2 - Q1.1
*/

GRANT SELECT ON ABONNE TO E20200007055;
SELECT * FROM E20200007055.ABONNE;

/*
Exo 2 - Q1.2
*/

grant all on livre to E20200007055;
update E20200007055.LIVRE set titre='THE WALL' where titre='LE MUR';

/*
Exo 2 - Q1.3
*/

select * from user_tab_privs_made;

/*
Exo 2 - Q1.4
*/

select table_name from all_catalog where owner like 'E20200007055';

/*
Exo 2 - Q1.5
*/

create view IdAdulte as select num_ab,nom,prenom from E20200007055.abonne where TYPE_AB='ADULTE';

/*
Exo 2 - Q2.1
*/

revoke all on livre from E20200007055;
revoke all on abonne from E20200007055;

/*
Exo 2 - Q2.2
*/

select * from IdAdulte;

/*
Exo 2 - Q2.3
*/

/*BAH CA MARCHE PAS*/