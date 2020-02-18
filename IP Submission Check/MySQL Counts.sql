SELECT CONCAT(
    'SELECT "', 
    table_name, 
    '" AS table_name, COUNT(*) AS exact_row_count FROM `', 
    table_schema,
    '`.`',
    table_name, 
    '` UNION '
) 
FROM INFORMATION_SCHEMA.TABLES 
WHERE table_schema = 'ccs_romao_mozartq3'; -- REPLACE WITH PARTNER SCHEMA

-- AFTER RUNNING THE ABOVE CODE, YOU WILL GET THE FOLLOWING OUTPUT IN THE RESULT WINDOW
-- COPY EVERYTHING UNTIL THE LAST UNION (should not end with UNION) INTO THE EDITOR AND RUN TO GET A TABLE OF COUNTS

SELECT "t_aconselhamento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_aconselhamento` UNION 
SELECT "t_actividadeaconselhamento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_actividadeaconselhamento` UNION 
SELECT "t_adulto" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_adulto` UNION 
SELECT "t_afinidade" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_afinidade` UNION 
SELECT "t_antecedentesclinicospaciente" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_antecedentesclinicospaciente` UNION 
SELECT "t_buscaactiva" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_buscaactiva` UNION 
SELECT "t_contacto" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_contacto` UNION 
SELECT "t_crianca" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_crianca` UNION 
SELECT "t_diagnosticoseguimento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_diagnosticoseguimento` UNION 
SELECT "t_esposicaotarvmae" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_esposicaotarvmae` UNION 
SELECT "t_esposicaotarvnascenca" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_esposicaotarvnascenca` UNION 
SELECT "t_estadopaciente" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_estadopaciente` UNION 
SELECT "t_gaac" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_gaac` UNION 
SELECT "t_gaac_actividades" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_gaac_actividades` UNION 
SELECT "t_hdd" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_hdd` UNION 
SELECT "t_histestadopaciente" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_histestadopaciente` UNION 
SELECT "t_infeccoesoportunisticaseguimento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_infeccoesoportunisticaseguimento` UNION 
SELECT "t_mae" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_mae` UNION 
SELECT "t_observacaopaciente" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_observacaopaciente` UNION 
SELECT "t_paciente" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_paciente` UNION 
SELECT "t_pai" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_pai` UNION 
SELECT "t_questionariotb" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_questionariotb` UNION 
SELECT "t_resultadoslaboratorio" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_resultadoslaboratorio` UNION 
SELECT "t_seguimento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_seguimento` UNION 
SELECT "t_tarv" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_tarv` UNION 
SELECT "t_tratamentoseguimento" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_tratamentoseguimento` UNION 
SELECT "t_tratamentotb" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_tratamentotb` UNION 
SELECT "t_void_duplo" AS table_name, COUNT(*) AS exact_row_count FROM `ccs_romao_mozartq3`.`t_void_duplo` UNION 
