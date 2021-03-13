-- File   : pkg_controller_procedures.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_controller_data_types;
-- use  pkg_controller_data_types;

-- ========================================================
package pkg_controller_procedures
-- ======================================================== 
    with SPARK_Mode => on
is
   
   package PCDT renames pkg_controller_data_types; 
   
   procedure temp_convert  (TRead : in PCDT.temp_reading;  HSet : out PCDT.heater_setting); 
   procedure press_convert (PRead : in PCDT.press_reading; PSet : out PCDT.press_setting); 
      
-- ======================================================== 
end pkg_controller_procedures;
-- ========================================================
