----- Based on Randy and Orrin's Cleaning Script
----- Edited by Marcela Torres 1/19/2021 and 2/11/2021
----- Edited by Neha, Adelino, and Marcela on 2/18/2021
----- Downdload the latest cleaning script from GitHub
----- https://github.com/mozaude/MozART_ETL/blob/master/Cleaning%20Scripts/Q1%202020

----- TO DO: Ask Maria for new regimen EPTS script and update these lines accordingly--
----- TO DO: Standarize early dates for lines 17-30



----- WARNING: Only run if you need to delete specific observations from specific tables

--2,736,417 rows but 5,709 rows with sex T
SELECT COUNT (*)
FROM t_paciente
WHERE sexo='T'

--593 rows but 1 rows with hdd code CCST11110415
SELECT COUNT (*)
FROM t_hdd
WHERE hdd='CCST11110415'

DELETE FROM t_paciente
WHERE sexo='T'

DELETE FROM t_hdd
WHERE hdd='CCST11110415'

----- Cleaning of dates multiple tables --------------------------------------------------

-- Date fixes throughout the database
-- These lines need to be updated when the submission changes from year to year
-- Change 2020 to 2021 in Q1 2021 submission
update t_paciente set datanasc = NULL where (year(datanasc)<1930 or year(datanasc)>2021) 
update t_paciente set idade = NULL where (idade < 0 or idade > 88 or idade not like '%[0-9]%') 
update t_paciente set datadiagnostico = NULL where (year(datadiagnostico)<1986 or year(datadiagnostico)>2021)
update t_paciente set dataabertura = NULL where (year(dataabertura)<1986 or year(dataabertura)>2021) 
update t_paciente set datainiciotarv = NULL where (year(datainiciotarv) < 2004 or year(datainiciotarv)> 2021)
update t_gaac_actividades set dataInscricao = NULL where (year(dataInscricao)<2008 or year(dataInscricao)>2021)
update t_gaac_actividades set datasaida = NULL where (year(datasaida)<2008 or year(datasaida)>2021)
update t_tarv set datatarv = NULL where (year(datatarv)<2003 or year(datatarv)>2021)
update t_tarv set dataproxima = NULL where (year(dataproxima )<2003 or year(dataproxima )>2021) 
update t_aconselhamento set datapronto = NULL where (year(datapronto)<2003 or year(datapronto)>2021) 
update t_seguimento set dataseguimento = NULL where (year(dataseguimento)<1988 or year(dataseguimento)>2021)
update t_seguimento set dataproximaconsulta = NULL where (year(dataproximaconsulta)<1988 or year(dataproximaconsulta)>2021) 
update t_resultadoslaboratorio set dataresultado = NULL where (year(dataresultado)<1988 or year(dataresultado)>2021) 
update t_resultadoslaboratorio set datapedido = NULL where  (year(datapedido)<1988 or year(datapedido)>2021) 
update t_adulto set dataparto = NULL where (year(dataparto)<1930 or year(dataparto)>2021) 

----- Cleaning t_adulto-------------------------------------------------------------
----- TO DO: Collapse the codnivel categories
----- Not applicable for the new system, however safe to run-- 
update t_adulto set codnivel = NULL where codnivel = '0'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '1 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '10 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '10ª'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '10a Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '10ª Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '11 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '11ª'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '11ª Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '12 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '12ª'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '12ª Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '12ªClasse'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '1ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '1a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '1ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '1ªClasse'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = '1º Ano'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '2 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '2ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '2a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '2ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '2ªClasse'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3ªClasse'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = '3º Ano'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '3º classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '4 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '4ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '4a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '4ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '4ªClasse'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5a classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '5ªClasse'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '6 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '6ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '6a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '6ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '6ªClasse'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '7 Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '7ª'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '7a Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '7ª Classe'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = '7ªClasse'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '8 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '8ª'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '8ª Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '8ªClasse'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '9 Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '9ª'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '9ª Classe'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = '9ªClasse'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Analfabeta'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Analfabetico'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Analfabeto'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Analfabeto(a)'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Analfateta'
update t_adulto set codnivel = NULL where codnivel = 'Arabo'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Bacharelato'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Basico'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Básico'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Comercio'
update t_adulto set codnivel = NULL where codnivel = 'Domestico'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Economista'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Elementar'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Ensino Tecnico'
update t_adulto set codnivel = NULL where codnivel = 'Estudante'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'IFAPA'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'instututo'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Licenciado'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Licenciatura'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Medio'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Médio'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Medio Ensino Geral'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Medio geral'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Mestrado'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao Aplica'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não escolarizado'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao escolarizado /a'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao Estodou'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não Estuda'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao Estudou'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não Estudou'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao foi a escola'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Naõ foi a Escola'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não foi a escola'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não foi á Escola'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não sabe ler'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao Tem'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'nao tem nivel'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nao tem nível'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Não tem nível'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nenhum'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nenhum Nivel'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Nenhuma'
update t_adulto set codnivel = NULL where codnivel = 'Nivel'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Nivel Basico'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Nível Basico'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nivel Medio'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nível Médio'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Nivel Primario'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Nível Primário'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nível Secundário'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nível Secundário Basico'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nível Secundário Médio'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Nivel Segundario'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Nivel Superior'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Nível Superior'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Nível Universitário'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'Outors'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'OUTRO'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'Outros'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Pre universitario'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Primaria'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Primário'
update t_adulto set codnivel = 'PRIMARIO' where codnivel = 'Primario 2º grau'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'S/I'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Secundario'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Secundário'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'SECUNDARIO BASICO'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'SECUNDARIO MEDIO'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Secundário Médio'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Sem Escolaridade'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'Sem infarmaáo'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'Sem Informacao'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'Sem informação'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Sem Nive'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'sem Nivel'
update t_adulto set codnivel = 'NENHUM' where codnivel = 'Sem Nível'
update t_adulto set codnivel = 'OUTRO  NAO CODIFICADO' where codnivel = 'SI'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Superior'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'TECNICO BASICO'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Tecnico Básico'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'TECNICO MEDIO'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Técnico Médio'
update t_adulto set codnivel = 'SECUNDARIO  NIVEL MEDIO' where codnivel = 'Técnoco Medio'
update t_adulto set codnivel = NULL where codnivel = 'u'
update t_adulto set codnivel = 'UNIVERSITARIO' where codnivel = 'Universitário'

/*#commented out for below update           
# update t_adulto set codestadocivil = 'CASADO' where codestadocivil = 'C'
# update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'DIVORCIADO'
# update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'O'
# update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'OUTRO'
# update t_adulto set codestadocivil = 'SOLTEIRO' where codestadocivil = 'S'
# update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'SEPARADO'
# update t_adulto set codestadocivil = 'UNIÃO DE FACTO' where codestadocivil = 'U'
# update t_adulto set codestadocivil = 'VIUVO' where codestadocivil = 'V'*/


--#update to this script as it includes the difference of seperado
update t_adulto set codestadocivil = 'CASADO' where codestadocivil = 'C'
update t_adulto set codestadocivil = 'SEPARADO' where codestadocivil = 'DIVORCIADO'
update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'O'
update t_adulto set codestadocivil = 'OUTRO  NAO CODIFICADO' where codestadocivil = 'OUTRO'
update t_adulto set codestadocivil = 'SOLTEIRO' where codestadocivil = 'S'
update t_adulto set codestadocivil = 'UNIAO DE FACTO' where codestadocivil = 'U'
update t_adulto set codestadocivil = 'VIUVO' where codestadocivil = 'V'
             
update t_paciente set sexo = 'M' where sexo = '´m'
update t_paciente set sexo = 'F' where sexo = 'f'
update t_paciente set sexo = 'M' where sexo = 'm'
update t_paciente set sexo = 'F' where sexo = 'FP'


----- Cleaning t_paciente-------------------------------------------------------------

update t_paciente set codestado = 'ABANDONO' where codestado = 'Abandono'
update t_paciente set codestado = 'ABANDONO' where codestado = 'Desistente Gacc' 
update t_paciente set codestado = 'OBITOU' where codestado = 'Morte'
update t_paciente set codestado = 'OBITOU' where codestado = 'OBITO'
update t_paciente set codestado = 'OUTRO, NAO CODIFICADO' where codestado = 'Outro'
update t_paciente set codestado = 'ABANDONO' where codestado = 'Perda de Seguimento'
update t_paciente set codestado = 'SUSPENDER TRATAMENTO' where codestado = 'SUSPENDER'
update t_paciente set codestado = 'SUSPENDER TRATAMENTO' where codestado = 'Suspender Tarv'
update t_paciente set codestado = 'TRANSFERIDO PARA' where codestado = 'Transferido para'


----- Cleaning t_tarv-------------------------------------------------------------

/*#Update to this code to clean the codregime without removing important data */
-- TO DO:  Ask Maria for new regimen EPTS script and update these lines accordingly--
       
update t_tarv set codregime = NULL where codregime = 'SEMCODREGIME'
update t_tarv set codregime = 'D4T+3TC+NVP' where codregime = 'D4T20+3TC+NVP'
update t_tarv set codregime = 'DDI+ABC+LPV/r' where codregime = 'DDI50+ABC+LPV'
update t_tarv set codregime = 'ABC+TDF+LPV/r' where codregime = 'ABC+TDF+LPV'
update t_tarv set codregime = 'AZT+3TC+LPV/r' where codregime = 'AZT+3TC+LPV (2ª Linha)'
update t_tarv set codregime = 'AZT+3TC+DDI+LPV/r' where codregime = 'AZT+3TC+DDI+LPV'
update t_tarv set codregime = 'TDF+3TC+LPV/r' where codregime = 'TDF+3TC+LPV/r(2ª Linha)'
update t_tarv set codregime = 'AZT+3TC+LPV/r' where codregime = 'AZT+3TC+LPV/r(2ª Linha)'
update t_tarv set codregime = 'TDF+3TC+EFV' where codregime = '3DFC'
update t_tarv set codregime = 'TDF+3TC+EFV' where codregime = 'EFV'
update t_tarv set codregime = 'ABC+3TC+EFV' where codregime = '2DFC+EFV'

----- Cleaning t_hdd-------------------------------------------------------------

--PROVINCIA
update t_hdd set Provincia = 'Zambézia' where Provincia like 'Zambezia'
update t_hdd set Provincia = 'Gaza' where Provincia like 'Chokwe' 
update t_hdd set Provincia = 'Maputo Cidade' where Provincia like 'Cidade de Maputo'
update t_hdd set Provincia = 'Maputo Província' where Distrito like 'Matola'
update t_hdd set Provincia = 'Maputo Província' where Provincia like 'Maputo'
update t_hdd set Provincia = 'Inhambane' where Provincia like 'Maxixe'
update t_hdd set Provincia = 'Nampula' where Provincia like 'Cidade de Nampula'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Kamavota'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Kamaxakeni'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Kampfumu'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Kamubukwana'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Katembe'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Nlhamankulu'
update t_hdd set Provincia = 'Inhambane' where Distrito like 'Inharrime'
update t_hdd set Provincia = 'Inhambane' where Distrito like 'Zavala'
update t_hdd set Provincia = 'Inhambane' where Distrito like 'Inhambane'
update t_hdd set Provincia = 'Zambézia' where Distrito like 'Ile'
update t_hdd set Provincia = 'Maputo Cidade' where Provincia like 'Cidade de Maputo'
update t_hdd set Provincia = 'Maputo Província' where Provincia like 'Maputo'
update t_hdd set Provincia = 'Gaza' where designacao like 'CS Maqueze'
update t_hdd set Provincia = 'Zambézia' where designacao like 'CS Socovinho'
update t_hdd set Provincia = 'Maputo Cidade' where Distrito like 'Nlhamankulu'


--DISTRITO
update t_hdd set Distrito = 'Chiúre' where Distrito like 'Chiure'
update t_hdd set Distrito = 'Chimoio' where Distrito like 'Cidade de Chimoio'
update t_hdd set Distrito = 'Inhambane' where Distrito like 'Cidade de Inhambane'
update t_hdd set Distrito = 'Ilha de Moçambique' where Distrito like 'Ilha de Mocambique'
update t_hdd set Distrito = 'Nampula' where Distrito like 'Cidade de Nampula'
update t_hdd set Distrito = 'Nampula' where Distrito like 'Distrito de Nampula'
update t_hdd set Distrito = 'Tete' where Distrito like 'Cidade de Tete'
update t_hdd set Distrito = 'Lichinga' where Distrito like 'Distrito de Lichinga'
update t_hdd set Distrito = 'Nacala-Porto' where Distrito like 'Cidade de Nacala Porto'
update t_hdd set Distrito = 'Chibuto' where designacao like 'CS Maqueze'
update t_hdd set Distrito = 'Nlhamankulu' where designacao like 'Centro de Saúde José Macamo-S.TARV'
update t_hdd set Distrito = 'Muecate' where designacao like 'CS Muecate'
update t_hdd set Distrito = 'Nacala-a-Velha' where designacao like 'CS Ontupaia'
update t_hdd set Distrito = 'Chibuto' where designacao like 'CS Maqueze'
update t_hdd set Distrito = 'Mossuril' where designacao like 'CS Chocas Mar'
update t_hdd set Distrito = 'Nacala-Porto' where designacao like 'CS Ontupaia'
update t_hdd set Distrito = 'Rapale' where designacao like 'CS Namaita'
update t_hdd set Distrito = 'Larde' where designacao like 'CS Larde'
update t_hdd set Distrito = 'Nicoadala' where designacao like 'CS Marrongane'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Mulevala'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Chiraco'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Tebo'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Jajo'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Marropino'
update t_hdd set Distrito = 'Mulevala' where designacao like 'CS Morrua'
update t_hdd set Distrito = 'Funhalouro' where designacao like 'Centro de Saúde de Funhalouro'
update t_hdd set Distrito = 'Govuro' where designacao like 'C.S.Doane'
update t_hdd set Distrito = 'Homoine' where designacao like 'Centro de Saude de Homoine'
update t_hdd set Distrito = 'Inharrime' where designacao like 'Centro de Saude de Inharrime'
update t_hdd set Distrito = 'Inhassoro' where designacao like 'Centro de Saúde de Inhassoro'
update t_hdd set Distrito = 'Inhassoro' where designacao like 'Centro de Saúde de Mangungumete'
update t_hdd set Distrito = 'Jangamo' where designacao like 'CS Cumbana'
update t_hdd set Distrito = 'Jangamo' where designacao like 'CENTRO DE  SAUDE DE JANGAMO'
update t_hdd set Distrito = 'Mabote' where designacao like 'Centro de Saúde de Mabote'
update t_hdd set Distrito = 'Massinga' where designacao like 'Centro de Saude de Massinga'
update t_hdd set Distrito = 'Maxixe' where designacao like 'Hospital de Dia de Chicuque'
update t_hdd set Distrito = 'Maxixe' where designacao like 'Centro de Saude da Maxixe'
update t_hdd set Distrito = 'Morrumbene' where designacao like 'Centro de Saude de Morrumbene'
update t_hdd set Distrito = 'Morrumbene' where designacao like 'CS Maivene'
update t_hdd set Distrito = 'Panda' where designacao like 'Centro de Saúde de Panda'
update t_hdd set Distrito = 'Vilankulos' where designacao like 'Hospital Rural Vilanculos'
update t_hdd set Distrito = 'Vilankulos' where designacao like 'Centro de Saúde de Mapinhane'
update t_hdd set Distrito = 'Limpopo' where designacao like 'CS Chissano'
update t_hdd set Distrito = 'Mapai' where designacao like 'CS Mapai'
update t_hdd set Distrito = 'Limpopo' where designacao like 'HR Chicumbane'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Banhine'
update t_hdd set Distrito = 'Limpopo' where designacao like 'CS Chipenhe'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Chongoene'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Nhacutse'
update t_hdd set Distrito = 'Limpopo' where designacao like 'CS JNyerere'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Maciene'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Siaia'
update t_hdd set Distrito = 'Limpopo' where designacao like 'CS Zongoene'
update t_hdd set Distrito = 'Limpopo' where designacao like 'CS Vlademir Lenine'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Nhamavila'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Bungane'
update t_hdd set Distrito = 'Chongoene' where designacao like 'CS Ndambine'
update t_hdd set Distrito = 'Matola' where designacao like 'CS Matola Gare'


--Designacao
update t_hdd set designacao = 'CS Mavala' where designacao like 'Centro de Saude de MAVALA - 27/02/2015'
update t_hdd set designacao = 'CS Meza' where designacao like 'Centro de Saúde de Meza 27/05/2013'
update t_hdd set designacao = 'CS Mangoma' where designacao like 'Centro de Saúde de Mangõma'
update t_hdd set designacao = 'Hospital Central de Maputo - Adulto' where designacao like ' Hospital Central Adulto'
update t_hdd set designacao = 'CS Urbano Inhambane' where designacao like 'Hospital de dia do C. de Saude Urbano Inhambane'
update t_hdd set designacao = 'CS Cumbana' where designacao like 'Hospital de Dia do Centro de Saude de Cumbana'
update t_hdd set designacao = 'CS Salela' where designacao like 'Hospital de Dia do Centro de Saude de Salela'
update t_hdd set designacao = 'CS Marracuene' where designacao like 'Centro de Saude  de Marracuene'
update t_hdd set designacao = 'HP Tete' where designacao like 'HPT'
update t_hdd set designacao = 'CS Polana Cimento' where designacao like 'Hospital de Dia do Centro de Saude Polana Cimento'
update t_hdd set designacao = 'HG Jose Macamo' where designacao like 'Hospital de Dia do José Macamo'
update t_hdd set designacao = 'HG Mavalane' where designacao like 'Hospital de Dia do Mavalane'
update t_hdd set designacao = 'HG Mavalane Pediatric' where designacao like 'Hospital de Dia do Mavalane - Pediatria'
update t_hdd set designacao = 'CS Doane' where designacao like 'C.S.Doane'
update t_hdd set designacao = 'CS Jagamo' where designacao like 'CENTRO DE  SAUDE DE JANGAMO'
update t_hdd set designacao = 'CS 7 de Abril' where designacao like 'Centro de Saude 7 de Abril'
update t_hdd set designacao = 'CS Catembe' where designacao like 'Centro de Saude da Catembe'
update t_hdd set designacao = 'CS Maxixe' where designacao like 'Centro de Saude da Maxixe'
update t_hdd set designacao = 'CS Bagamoyo' where designacao like 'Centro de Saude de Bagamoyo'
update t_hdd set designacao = 'CS Funhalouro' where designacao like 'Centro de Saúde de Funhalouro'
update t_hdd set designacao = 'CS Homoine' where designacao like 'Centro de Saude de Homoine'
update t_hdd set designacao = 'CS Inhaca' where designacao like 'CENTRO DE SAUDE DE INHACA'
update t_hdd set designacao = 'CS Inharrime' where designacao like 'Centro de Saude de Inharrime'
update t_hdd set designacao = 'CS Inhassoro' where designacao like 'Centro de Saúde de Inhassoro'
update t_hdd set designacao = 'CS Mabote' where designacao like 'Centro de Saúde de Mabote'
update t_hdd set designacao = 'CS Mangungumente' where designacao like 'Centro de Saúde de Mangungumete'
update t_hdd set designacao = 'CS Mapinhane' where designacao like 'Centro de Saúde de Mapinhane'
update t_hdd set designacao = 'CS Massinga' where designacao like 'Centro de Saude de Massinga'
update t_hdd set designacao = 'CS Mavalane' where designacao like 'Centro de Saude de Mavalane'
update t_hdd set designacao = 'CS Morrumbene' where designacao like 'Centro de Saude de Morrumbene'
update t_hdd set designacao = 'CS Panda' where designacao like 'Centro de Saúde de Panda'
update t_hdd set designacao = 'CS Pescadores' where designacao like 'Centro de Saúde de Pescadores'
update t_hdd set designacao = 'CS Zimpeto' where designacao like 'Centro de Saude de Zimpeto'
update t_hdd set designacao = 'CS Jose Macamo' where designacao like 'Centro de Saúde José Macamo-S.TARV'
update t_hdd set designacao = 'CS Magoanine Tendas' where designacao like 'Centro de Saude Magoanine Tendas'
update t_hdd set designacao = 'CS Polana Canico' where designacao like 'Centro Saude Polana Canico'


---- To Run after the cleaning section has been executed-------------------------------------
-------------------------------Data Checks---------------------------------------------------

---- Identifying errors in sexo variable: Counting nids with sex other than female or male

SELECT COUNT (DISTINCT nid), sexo
FROM t_paciente
WHERE (sexo <> 'M') AND (sexo <> 'F')
GROUP BY sexo

---- Identigying errors in the province variable: Counting nids in each province
---- Look out for mispelled provinces

SELECT COUNT (DISTINCT nid), Provincia
FROM t_hdd h
left join (SELECT AccessFilePath, hdd, nid from t_paciente) p
ON h.AccessFilePath = p.AccessFilePath AND h.hdd=p.hdd
GROUP BY Provincia

---- Results on 2020 included
SELECT CAST (dataresultado as date) AS dataresultado
  FROM t_resultadoslaboratorio
  WHERE codexame='Carga Viral' and year(dataresultado) > 2019

---- Results on 2020 included
SELECT CAST (datanasc as date) AS datanasc
  FROM t_paciente
  WHERE year(datanasc) > 2019



SELECT COUNT (DISTINCT nid), codregime
FROM t_tarv
GROUP BY codregime


