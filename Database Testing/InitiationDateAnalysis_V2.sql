---- =========================================================================================================
---- MozART Analysis of ART Initiation Date (datainiciotarv) and Drug Pickup Date (datatarv)
---- AUTHOR: RANDY YEE (CDC/GDIT)
---- REV DATE: 9/8/2019
---- Gets the earliest date of either datainiciotarv or datatarv
---- Calculates the difference between the adjusted initiation date and the initiation date as entered in MozART
---- for those who have an earlier datatarv
---- Also for those without initiation date, it will take the earliest drug pickup for those who have drug pickup dates
---- Those with earlier drug pickup date may be transferred
---- =========================================================================================================

SELECT n.nid, n.sexo, n.dataabertura, n.datadiagnostico, n.datainiciotarv, first_data_tarv, adj_data_inicio_tarv, data_tarv_provenance,
datediff(dd, n.datainiciotarv, adj_data_inicio_tarv) as initiation_to_firstpickup,
datediff(dd, n.datadiagnostico, n.datainiciotarv) AS diagnosis_to_initiation,
datediff(dd, n.datadiagnostico, first_data_tarv) AS diagnosis_to_firstpickup
FROM
(
	select pt.nid, pt.sexo, pt.codestado, pt.idade, cast(dataabertura as date) as dataabertura, cast(datadiagnostico as date) as datadiagnostico, cast(pt.datainiciotarv as date) as datainiciotarv, min(cast(t.datatarv as date)) as first_data_tarv,
	Case
	when (min(cast(pt.datainiciotarv as date)) <=  min(cast(t.datatarv as date)) or (min(cast(t.datatarv as date)) is  null and min(cast(pt.datainiciotarv as date)) is not null )) then min(cast(pt.datainiciotarv as date))
	when (min(cast(pt.datainiciotarv as date)) >  min(cast(t.datatarv as date)) or (min(cast(t.datatarv as date)) is  not null and min(cast(pt.datainiciotarv as date)) is null )) then min(cast(t.datatarv as date))
	end as adj_data_inicio_tarv,

	Case
	when (min(cast(pt.datainiciotarv as date)) <  min(cast(t.datatarv as date)) or (min(cast(t.datatarv as date)) is  null and min(cast(pt.datainiciotarv as date)) is not null )) then 'datainiciotarv'
	when (min(cast(pt.datainiciotarv as date)) >  min(cast(t.datatarv as date)) or (min(cast(t.datatarv as date)) is  not null and min(cast(pt.datainiciotarv as date)) is null )) then 'datatarv'
	when ((min(cast(pt.datainiciotarv as date)) =  min(cast(t.datatarv as date))) and (min(cast(pt.datainiciotarv as date)) is not null and min(cast(t.datatarv as date)) is not null )) then 'both'
	end as data_tarv_provenance
	FROM
	t_paciente pt
	left join
	t_tarv t
	on
	pt.nid=t.nid AND pt.AccessFilePath=t.AccessFilePath
	GROUP BY pt.nid, pt.sexo, pt.idade, pt.datainiciotarv, pt.dataabertura, pt.datadiagnostico
) n


SELECT TOP 10 * FROM t_paciente ORDER BY nid ASC

SELECT * FROM t_paciente WHERE nid ='  041121010016000011'
SELECT * FROM t_tarv WHERE nid = '  041121010016000011'
