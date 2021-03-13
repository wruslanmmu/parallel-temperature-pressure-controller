-- File   : pkg_controller_data_types.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08

-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES

-- ========================================================
package pkg_controller_data_types 
-- ========================================================
    with SPARK_Mode => on
is
   
   -- RENAME PACKAGE NAMES
   
   -- DEFINE TYPES
   type temp_reading  is new Float   range 10.0..500.0; -- degrees Centigrade
   type press_reading is new Integer range 150..750;    -- millibars
   type flow_reading  is new Float   range 0.0..2500.0; -- metric tons per hour
 
   type heater_setting is (ON, OFF);                -- Boolean. Heater ON/OFF
   type press_setting  is new Integer range 0..9;   -- Pressure meter scaling
   type flow_setting   is new Integer range 0..100; -- Percent valve opening
   
   -- LIST OF PROCEDURES
   
   -- LIST OF FUNCTIONS
   
-- ======================================================== 
end pkg_controller_data_types;
-- ========================================================


