---- =========================================================================================================
---- Peds Regimens and Vl SQL Query Journadas
---- Author: Marcela Torres
---- Peds pick ups and VL in FY20
---- Results saved in Sandbox table PedsRegimensVLOverTimeFY20. Power BI connects to the Sandbox table
---- =========================================================================================================


-----Vl and Regimen------------------------------------------------------

WITH CTE as (

	SELECT DISTINCT 
	f.HdD, f.Provincia, f.Distrito, f.designacao,
	p.nid, p. AccessFilePath, p.sexo, p.datanasc,
	t.DatePickup, t.QuarterYear, t.codregime,t.DistType

	FROM
	(SELECT nid, sexo, cast(datanasc as date) as datanasc, hdd, codproveniencia, AccessFilePath
	FROM t_paciente) p

	LEFT JOIN
	(SELECT HdD, Provincia, Distrito, designacao, AccessFilePath
	FROM t_hdd) f
	ON p.hdd = f.HdD

	LEFT JOIN
	(SELECT AccessFilePath, nid, 
	CAST (datatarv as date) AS DatePickup,
	codregime,
	CAST (dataproxima as date) AS NextPickup,
	
	-- Adding column with quarter year for each drug pick up--
	CASE WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2018) then '119'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2019) then '120'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2020) then '121'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2021) then '122'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2018) then '218'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2019) then '219'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2020) then '220'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2021) then '221'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2018) then '318'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2019) then '319'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2020) then '320'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2021) then '321'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2018) then '418'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2019) then '419'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2020) then '420'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2021) then '421'
	END as QuarterYear,

	--Calculating the type of pick up based on the next schedule pick up--
	datediff (day, datatarv, dataproxima) AS DaysDiff,

	CASE when datediff (day, datatarv, dataproxima) < = 35 then 1
		when datediff (day, datatarv, dataproxima) between 36 and 91 then 3
		when datediff (day, datatarv, dataproxima) between 92 and 180 then 6
		end as DistType
		
      FROM t_tarv) t
	  ON p.nid = t.nid AND p.AccessFilePath = t.AccessFilePath
	  WHERE DatePickup >= CAST('2019-10-01 00:00:00.000' as datetime)
),

CTE2 as (

	SELECT DISTINCT 
	p2. AccessFilePath, p2.nid, p2.sexo, p2.datanasc,
	r.codexame, r.dataresultado, r.QuarterYearVL, r.resultado, r.VLCat
	
	FROM
	(SELECT nid, sexo, cast(datanasc as date) as datanasc, hdd, codproveniencia, AccessFilePath
	FROM t_paciente) p2

	LEFT JOIN
	(SELECT AccessFilePath, nid, 
	CAST (dataresultado as date) AS dataresultado,
	codexame, resultado,
	
	-- Adding column with quarter year for each VL test--
	CASE WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2018) then '119'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2019) then '120'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2020) then '121'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2021) then '122'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2018) then '218'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2019) then '219'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2020) then '220'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2021) then '221'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2018) then '318'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2019) then '319'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2020) then '320'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2021) then '321'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2018) then '418'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2019) then '419'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2020) then '420'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2021) then '421'
	END as QuarterYearVL,
	
	-- Adding column VL result category--
	CASE WHEN  resultado  <= 1000 then 'Suppressed'
		 WHEN  resultado  > 1000 then 'Not Suppressed'
	END as VLCat
		
      FROM t_resultadoslaboratorio) r
	  ON p2.nid = r.nid AND p2.AccessFilePath = r.AccessFilePath
      WHERE codexame='Carga Viral'
),

--- Selecting last pick up from each quarter

CTE3 as (
SELECT x.AccessFilePath, x.HdD, x.nid, x.Provincia, x.Distrito, x.designacao, x.sexo, x.AgeBandLastPickUpQuarter, x.QuarterYear, x.codregime, x.DistType
FROM
	(SELECT c.AccessFilePath, c.HdD, c.Provincia, c.Distrito, c.designacao, 
	f. nid, c.sexo, c.datanasc, f.LastPickUpQuarter, f.QuarterYear, c.codregime, c.DistType,
	datediff (year, datanasc, LastPickupQuarter) AS IdadeLastPickUpQuarter,
	CASE WHEN datediff (year, datanasc, LastPickupQuarter) BETWEEN  0 AND 4 THEN '0-4'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  5 AND 9 THEN '5-9'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  10 AND 14 THEN '10-14'
		WHEN datediff (year, datanasc, LastPickupQuarter)  >=15 THEN '15+'
	END AS AgeBandLastPickUpQuarter

	FROM
	((SELECT nid, MAX (DatePickup) LastPickUpQuarter, QuarterYear
	FROM CTE
	GROUP BY QuarterYear, nid) f
	
	LEFT JOIN
	CTE c
	ON f.nid=c.nid AND f.LastPickUpQuarter=c.DatePickup)) x

),

--- Selecting last VL from each quarter

CTE4 as(
SELECT x.AccessFilePath, x.nid, x.sexo, x.datanasc, x.dataresultado, x.codexame, x.QuarterYearVL, x.resultado, x.VLCat
FROM
	(SELECT c. AccessFilePath, f.nid, c.sexo, c.datanasc, c.dataresultado, c.codexame, f.QuarterYearVL, c.resultado, c.VLCat
	FROM
	((SELECT nid, MAX (dataresultado) LastVLQuarter, QuarterYearVL
	FROM CTE2
	GROUP BY QuarterYearVL, nid) f
	
	LEFT JOIN
	CTE2 c
	ON f.nid=c.nid AND f.LastVLQuarter=c.dataresultado)) x
)

SELECT w.nid, w.HdD, w.Provincia, w.Distrito, w.designacao, w.sexo, w.AgeBandLastPickUpQuarter, w.QuarterYear, w.codregime, w.DistType, 
z.dataresultado, z.codexame, z.QuarterYearVL,z.VLCat, count (distinct w.nid) as patients

INTO Sandbox.dbo.PedsRegimensVLOverTimeFY20
FROM CTE3 w
LEFT JOIN CTE4 z
ON w.nid=z.nid and w.QuarterYear=z.QuarterYearVL
WHERE (AgeBandLastPickUpQuarter = '0-4' OR AgeBandLastPickUpQuarter = '5-9' OR AgeBandLastPickUpQuarter = '10-14')
GROUP BY w.nid, w.HdD, w.Provincia, w.Distrito, w.designacao, w.sexo, w.AgeBandLastPickUpQuarter, w.QuarterYear, w.codregime, w.DistType, 
z.dataresultado, z.codexame, z.QuarterYearVL, z.VLCat


---- Data Checks-------------------------------

----68,323 Peds----------------------
SELECT COUNT (DISTINCT nid)
FROM Sandbox.dbo.PedsRegimensAllVLOverTimeFY20

---31,494 with VL FY20 (46%)----------
SELECT COUNT (DISTINCT nid)
FROM Sandbox.dbo.PedsRegimensAllVLOverTimeFY20
WHERE codexame is not null

---20,058 with VL (64%)----------
SELECT COUNT (DISTINCT nid)
FROM Sandbox.dbo.PedsRegimensAllVLOverTimeFY20
WHERE VLCat= 'Suppressed'



