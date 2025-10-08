DROP TABLE IF EXISTS NetworkData
GO

SELECT Network.*
INTO NetworkData
FROM OPENROWSET (BULK N'C:\Hy_mgdb_data\network.json', SINGLE_CLOB) AS DATA
CROSS APPLY OPENJSON(BulkColumn)
WITH
(
	ID INT,
	Date DATE '$."Date/Time"',
	Delay DECIMAL '$."Delay (ms)"',
	Down DECIMAL(5,2) '$."Down (Mbps)"',
	Up DECIMAL(5,2) '$."Up (Mbps)"',
	Day SMALLINT '$."Day"',
	MaxTemp DECIMAL(5,2) '$."Max Temp (°C)"',
	Precipitation DECIMAL(5,2) '$."Total Precip (mm)"'
) AS Network

SELECT * FROM NetworkData