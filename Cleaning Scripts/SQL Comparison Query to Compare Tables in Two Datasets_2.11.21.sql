/****** Data Integrety Check Script to check duplicate datasets ******/
/****** Author: Marcela Torres 2/11/2021 ******/
/****** First count then number of tables to make sure the name matches in both datasets ******/
/****** If new tables have been added add the corresponding lines of code below to check the rows of those tables ******/
/****** Run this script to check that all rows have been copied. There have been instances where some rows are left out ******/

---TODO: Optimize the code so that the rows are compared in the back end and you only see Errors for those tables for which the numbers do not match
--- Update the names of the datasets as neccesary
--- Run these lines in sets to compare the nunmber of rows from each set of tables
  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_aconselhamento]
  
  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_aconselhamento]


  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_aconselhamento]

  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_aconselhamento]


  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_antecedentesclinicospaciente]

  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_antecedentesclinicospaciente]
   

  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_buscaactiva]

  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_buscaactiva]


  SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_contacto]
  
     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_contacto]


     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_crianca]
  
     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_crianca]


       SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_diagnosticoseguimento]

         SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_diagnosticoseguimento]

  
       SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_esposicaotarvmae]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_esposicaotarvmae]


  
       SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_esposicaotarvnascenca]
  
       SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_esposicaotarvnascenca]


       SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_estadopaciente]

        SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_estadopaciente]


         SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_gaac]

           SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_gaac]


         SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_gaac_actividades]

           SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_gaac_actividades]


      SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_hdd]

  
      SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_hdd]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_histestadopaciente]

   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_histestadopaciente]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_infeccoesoportunisticaseguimento]

   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_infeccoesoportunisticaseguimento]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_mae]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_mae]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_observacaopaciente]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_observacaopaciente]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_paciente]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_paciente]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_pai]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_pai]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_questionariotb]

    SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_questionariotb]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_resultadoslaboratorio]
  
   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_resultadoslaboratorio]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_seguimento]

     SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_seguimento]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_tarv]

   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_tarv]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_tratamentoseguimento]

    SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_tratamentoseguimento]


   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020].[dbo].[t_tratamentoTB]
  
   SELECT COUNT (*) AS "Number of Rows"
  FROM [MozART_q4_2020_Clean_1].[dbo].[t_tratamentoTB]
