DROP PROCEDURE IF EXISTS [dbo].[CalculateCurrentAge]
GO

ALTER TABLE [dbo].[t_paciente] DROP COLUMN IF EXISTS [Current_Age]
GO

CREATE PROCEDURE [dbo].[CalculateCurrentAge]

AS

ALTER TABLE [dbo].[t_paciente] ADD [Current_Age] 
    AS CASE WHEN datanasc IS NULL THEN NULL
ELSE (CONVERT(int,CONVERT(char(8),GetDate(),112))-CONVERT(char(8),cast(datanasc as date),112))/10000
END


