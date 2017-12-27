SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Janakiram Maddanala
-- Create date: 21/12/2017
-- Description:	Convert primary key column into IDENTITY
-- =============================================
CREATE PROCEDURE [dbo].[SP_ConvertToIdentity]
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRAN
		
			DECLARE @TableName NVARCHAR(50) = '[WideWorldImporters].[dbo].[Test]'
			DECLARE @ColumnName NVARCHAR(50) = 'RecNum'

			IF (OBJECT_ID(@TableName) IS NOT NULL)
			BEGIN
				-- Get Primary Key Constraint Name
				DECLARE @PKName NVARCHAR(100)

				SET @PKName = (SELECT name 
							   FROM sysobjects
							   WHERE xtype = 'PK'
							   AND parent_obj = OBJECT_ID(@TableName))
				
				DECLARE @Query NVARCHAR(100)

				-- Drop Primary Key Constraint
				SET @Query = N'ALTER TABLE ' +  @TableName + ' DROP CONSTRAINT ' + @PKName
				PRINT @Query
				EXECUTE SP_EXECUTESQL @Query


				-- Drop Column
				SET @Query = N'ALTER TABLE ' +  @TableName + ' DROP COLUMN ' + @ColumnName
				PRINT @Query
				EXECUTE SP_EXECUTESQL @Query

				-- Add Column as IDENTITY Column
				SET @Query = N'ALTER TABLE ' +  @TableName + ' ADD ' + @ColumnName + ' INT IDENTITY(1,1)'
				PRINT @Query
				EXECUTE SP_EXECUTESQL @Query

				-- ADD Primary Key Constraint
				SET @Query = N'ALTER TABLE ' +  @TableName + ' ADD CONSTRAINT ' + @PKName + ' PRIMARY KEY(' + @ColumnName + ')'
				PRINT @Query
				EXECUTE SP_EXECUTESQL @Query
			END 

		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
		PRINT 'Rolled back because of script failure.'
	END CATCH

	SET NOCOUNT OFF
END

GO
