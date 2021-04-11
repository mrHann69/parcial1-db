/*
 * @Autores :
 *Santiago Ramirez
 *Franco L. Matheo
*/


























--punto 2
--Código y nombre de asignaturas que se programaron en el periodo 2014-1 en el plan de Medicina
select a.cod_a, a.nom_asig --, a.plan_id, p.periodo
from asignatura a, programacion p
where a.plan_id = 3 and p.periodo = '2014-1';




-- punto 6
--Código y nombre de profesores que dictaron asignaturas de más de 3 créditos en el
--periodo 2013-1
select DISTINCT p.cod_p, p.nom_prof --, p2.periodo, a.creditos
from profe p,asignatura a, programacion p2
where a.creditos > 3 and p2.periodo ='2013-1';


-- punto 8
--Código y nombre de asignaturas que han dado profesores de categoría 2 o categoría 3 pero no los de la categoría 1
select distinct a.cod_a , a.nom_asig, p2.codcat
from asignatura a, programacion p, profe p2
where p2.codcat != '1'
order by p2.codcat ;

-- Punto 10
--Código y Nombre de Profesores de la facultad de Ingeniería que dieron alguna asignatura de la facultad de salud
select distinct p.cod_p, p.nom_prof, p.cod_facultad
from profe p, programacion p2, asignatura a, plan p3
where p.cod_facultad = 'ing' and a.plan_id = 3;
