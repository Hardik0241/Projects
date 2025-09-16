CREATE DATABASE EV_ChargingDB;
USE EV_ChargingDB;

CREATE TABLE EV_Charging(
 `User ID` VARCHAR(100),
  `Vehicle Model` VARCHAR(150),
  `Battery Capacity (kWh)` DECIMAL(6,2),
  `Charging Station ID` VARCHAR(100),
  `Charging Station Location` VARCHAR(255),
  `Charging Start Time` VARCHAR(40),   -- will later convert to DATETIME
  `Charging End Time` VARCHAR(40),     -- will later convert to DATETIME
  `Energy Consumed (kWh)` DECIMAL(8,3),
  `Charging Duration (hours)` DECIMAL(6,3),
  `Charging Rate (kW)` DECIMAL(6,3),
  `Charging Cost (USD)` DECIMAL(10,2),
  `Time of Day` VARCHAR(50),
  `Day of Week` VARCHAR(30),
  `State of Charge (Start %)` DECIMAL(5,2), -- percentage
  `State of Charge (End %)` DECIMAL(5,2),   -- percentage
  `Distance Driven (since last charge) (km)` DECIMAL(9,2),
  `Temperature (°C)` DECIMAL(5,2),
  `Vehicle Age (years)` DECIMAL(5,2),
  `Charger Type` VARCHAR(50),
  `User Type` VARCHAR(50));

SELECT COUNT(*) FROM EV_Charging;
SELECT * FROM EV_Charging LIMIT 10; 

SELECT        -- Check for NULLs in each column
    SUM(`Energy Consumed (kWh)` IS NULL OR `Energy Consumed (kWh)` = 0.0) AS Issue_Energy,
    SUM(`Charging Rate (kW)` IS NULL OR `Charging Rate (kW)` = 0.0) AS Issue_Rate,
    SUM(`Distance Driven (since last charge) (km)` IS NULL OR `Distance Driven (since last charge) (km)` = 0.0) AS Issue_Distance
FROM EV_Charging;

SELECT        -- Find Averages
    AVG(`Energy Consumed (kWh)`) AS Avg_Energy,
    AVG(`Charging Rate (kW)`) AS Avg_Rate
FROM EV_Charging
WHERE `Energy Consumed (kWh)` <> 0.0
  AND `Charging Rate (kW)` <> 0.0;

SET SQL_SAFE_UPDATES = 0;

UPDATE EV_Charging     -- Replace 0.0 with average in Energy Consumed (kWh)
SET `Energy Consumed (kWh)` = 42.8882477
WHERE `Energy Consumed (kWh)` = 0.0;

UPDATE EV_Charging     -- Replace 0.0 with average in Charging Rate (kW)
SET `Charging Rate (kW)` = 25.8679160
WHERE `Charging Rate (kW)` = 0.0;

SET SQL_SAFE_UPDATES = 1;

SELECT                 -- Validation after update
    SUM(`Energy Consumed (kWh)` = 0.0) AS Zero_Energy,
    SUM(`Charging Rate (kW)` = 0.0) AS Zero_Rate
FROM EV_Charging; 

ALTER TABLE EV_Charging  -- new columns in table
ADD COLUMN ChargingStart DATETIME,
ADD COLUMN ChargingEnd DATETIME;

UPDATE EV_Charging       -- Converted existing text into datetime format
SET ChargingStart = STR_TO_DATE(`Charging Start Time`, '%d-%m-%Y %H:%i:%s'),
    ChargingEnd   = STR_TO_DATE(`Charging End Time`, '%d-%m-%Y %H:%i:%s');

SELECT `Charging Start Time`, ChargingStart,   -- Verify conversion
       `Charging End Time`, ChargingEnd
FROM EV_Charging
LIMIT 10;

ALTER TABLE EV_Charging   -- Dropping old columns
DROP COLUMN `Charging Start Time`,
DROP COLUMN `Charging End Time`;

ALTER TABLE EV_Charging   -- new calculated column
ADD COLUMN ChargingDuration_mins INT;

UPDATE EV_Charging        -- calculates the difference in minutes
SET ChargingDuration_mins = TIMESTAMPDIFF(MINUTE, ChargingStart, ChargingEnd);

SELECT ChargingStart, ChargingEnd, ChargingDuration_mins -- Verifying
FROM EV_Charging
LIMIT 10;

