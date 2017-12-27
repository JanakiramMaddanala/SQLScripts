GO

CREATE TABLE [dbo].[Test]
(
	 RecNum NUMERIC(10,0) NOT NULL
	,UserID CHAR(25)
	,OptionCode INT
	,OptionValue VARCHAR(30)
)

ALTER TABLE dbo.Test 
ADD CONSTRAINT usersetting_0pkc PRIMARY KEY(RecNum)

INSERT INTO dbo.Test VALUES
(1,'12345',1,'13'),
(4,'12345',1,'13'),
(10,'12345',1,'13'),
(12,'12345',1,'13'),
(15,'12345',1,'13')

GO

SP_HELP [dbo.Test]

SELECT * FROM [dbo].[Test]

GO

DECLARE @PKName NVARCHAR(100)

SET @PKName = (SELECT name 
			   FROM sysobjects
			   WHERE xtype = 'PK'
			   AND parent_obj = OBJECT_ID('dbo.Test'))
PRINT @PKName

SELECT * 
FROM sysobjects
WHERE xtype = 'PK'

GO

DECLARE @TableName NVARCHAR(50) = '[WideWorldImporters].[dbo].[Test]'
DECLARE @ColumnName NVARCHAR(50) = 'RecNum'
DECLARE @ColumnCount INT
SET @ColumnCount = (SELECT COUNT(*)
					FROM sys.columns 
					WHERE object_id = OBJECT_ID(@TableName) 
					AND name = @ColumnName)