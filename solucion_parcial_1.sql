/*
 * @Autores :
 *Santiago Ramirez
 *Franco L. Matheo
*/


/*
 * Punto 1
 * El salario promedio de los profesores de la facultad de Salud
 */
 select avg(SUELDO) as salario_promedio from PROFE where cod_facultad='sal';


--punto 2
--Código y nombre de asignaturas que se programaron en el periodo 2014-1 en el plan de Medicina
select a.cod_a, a.nom_asig --, a.plan_id, p.periodo
from asignatura a, programacion p
where a.plan_id = 3 and p.periodo = '2014-1';


/*
 * Punto 3
 * Código y nombre de asignaturas que han dictado los profesores de categoría 3 y categoría 4.
 */
 (select a.COD_A, NOM_ASIG from ASIGNATURA a, programacion p where COD_P in (select COD_P from profe where CODCAT='3') and
                                                            a.COD_A=p.COD_A group by a.COD_A, NOM_ASIG)
intersect
(select a.COD_A, NOM_ASIG from ASIGNATURA a, programacion p where COD_P in (select COD_P from profe where CODCAT='4') and
                                                            a.COD_A=p.COD_A group by a.COD_A, NOM_ASIG);

/*
 * Punto 4
 * jujujujujujuju
 */


/*
 * Punto 5
 * Código y nombre de asignaturas que nunca se han programado
 */
(select COD_A, NOM_ASIG from ASIGNATURA)
except
(select p.COD_A, NOM_ASIG from PROGRAMACION p, ASIGNATURA a  where p.COD_A=a.COD_A);


-- punto 6
--Código y nombre de profesores que dictaron asignaturas de más de 3 créditos en el
--periodo 2013-1
select DISTINCT p.cod_p, p.nom_prof --, p2.periodo, a.creditos
from profe p,asignatura a, programacion p2
where a.creditos > 3 and p2.periodo ='2013-1';


/*
 * Punto 7
 * Código y nombre de asignaturas que han dado profesores de categoría 1 o categoría 2
 */
select p.COD_A, NOM_ASIG from PROGRAMACION p, ASIGNATURA a
where COD_P in (select COD_P from PROFE where CODCAT in ('1', '2')) and
      p.COD_A=a.COD_A group by p.COD_A, NOM_ASIG;


-- punto 8
--Código y nombre de asignaturas que han dado profesores de categoría 2 o categoría 3 pero no los de la categoría 1
select distinct a.cod_a , a.nom_asig, p2.codcat
from asignatura a, programacion p, profe p2
where p2.codcat != '1'
order by p2.codcat ;


/*
 * Punto 9
 * Código y Nombre de profesores de la facultad de Ingeniería que solo han dado clase en el periodo 2017-1
 */
(select p.COD_P, NOM_PROF from programacion p, profe pr where PERIODO='2017-1'
                                                          and cod_facultad='ing'
                                                          and p.COD_P=pr.COD_P group by p.COD_P, NOM_PROF)
except
(select p.COD_P, NOM_PROF from programacion p, profe pr where PERIODO in (select PERIODO from programacion where PERIODO<>'2017-1')
                                                and cod_facultad='ing'
                                                and p.cod_p=pr.COD_P group by p.COD_P, NOM_PROF);

-- Punto 10
--Código y Nombre de Profesores de la facultad de Ingeniería que dieron alguna asignatura de la facultad de salud
select distinct p.cod_p, p.nom_prof, p.cod_facultad
from profe p, programacion p2, asignatura a, plan p3
where p.cod_facultad = 'ing' and a.plan_id = 3;
