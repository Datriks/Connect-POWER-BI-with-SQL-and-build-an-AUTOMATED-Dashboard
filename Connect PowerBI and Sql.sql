-- Step 1 Create table with column with names as the ones in excel file

if object_id("Raw_Data_GDP")is not null drop table Raw_Data_GDP

create table Raw_Data_GDP
(DEMO_IND varchar(200),
Indicator varchar(200),
[LOCATION] varchar(200),
Country varchar(200),
[TIME] varchar(200),
[Value] FLOAT,
[Flag Codes] varchar(200),
Flags varchar(200)
)

-- Step 2 Import Data 

bulk insert Raw_Data_GDP
from "D:\!TRAINING\Connect POWER BI with SQL and build an AUTOMATED Dashboard\SQL to Power BI\gdp_raw_data.csv"
with (format = 'csv');

-- select * from Raw_Data_GDP

-- Step 3 create the view we need: this is an "one off"

--/*
-- Drop view GDP_Excel_Input

create view GDP_Excel_Input as

select a.*, b.GDP_Per_Capita from

	(select Country,[Time] as Year_No, [Value] as GDP_Value from Raw_Data_GDP
	where Indicator = 'GDP (current US$)') a
	
	left join
	(select Country, [Time] as Year_No, Value as GDP_Per_Capita from Raw_Data_GDP
	where Indicator = 'GDP per Capita (current US$)') b
	on a.Country = b.Country and a.Year_No = b.Year_No


-- select * from GDP_Excel_Input
--*/

-- Step 4 Create a Store PROCEDURE

create procedure GDP_Excel_Input_Monthly as

if object_id('Raw_Data_GDP')is not null drop table Raw_Data_GDP

create table Raw_Data_GDP
(DEMO_IND varchar(200),
Indicator varchar(200),
[LOCATION] varchar(200),
Country varchar(200),
[TIME] varchar(200),
[Value] FLOAT,
[Flag Codes] varchar(200),
Flags varchar(200)
)

-- Step 2 Import Data 

bulk insert Raw_Data_GDP
from "D:\!TRAINING\Connect POWER BI with SQL and build an AUTOMATED Dashboard\SQL to Power BI\gdp_raw_data.csv"
with (format = 'csv');

-- exec [dbo].[GDP_Excel_Input_Monthly]


