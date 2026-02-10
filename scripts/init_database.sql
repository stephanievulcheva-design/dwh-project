
/* 
    ---------------
    Script Purpose:
    ---------------
    This script initializes the SQL Server data warehouse environment.

    It checks whether a database named [DWH] exists and drops it if present,
    ensuring a clean and reproducible setup. A new [DWH] database is then
    created and used as the active context.

    Three schemas are created to represent a layered architecture:

        - bronze : Raw ingested data (landing layer)
        - silver : Cleansed and transformed data
        - gold   : Business-ready dimensional models (facts and dimensions)

    This structure follows the medallion architecture pattern,
    promoting clarity, separation of concerns, and maintainability.
*/



USE master;
GO

-- Drop and recreate the 'DWH' db
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DWH')
BEGIN
	ALTER DATABASE DWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DWH;
END;

-- Create a DWH 
CREATE DATABASE DWH;
GO

USE DWH;
GO
-- Create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
