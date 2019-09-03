DROP PROCEDURE IF EXISTS [dbo].[CalculateInitiationAge]
GO

ALTER TABLE [dbo].[t_paciente] DROP COLUMN IF EXISTS [CalculateInitiationAge]
GO

CREATE PROCEDURE [dbo].[CalculateInitiationAge]

AS

UPDATE t_paciente
SET idade = CASE WHEN datainiciotarv IS NULL OR datanasc IS NULL THEN idade
ELSE (CONVERT(int,CONVERT(char(8),cast(datainiciotarv as date),112))-CONVERT(char(8),cast(datanasc as date),112))/10000
END;

