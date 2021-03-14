-- File   : pkg_controller_process_actuations.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_controller_data_types;


-- ========================================================
package pkg_controller_process_actuations
-- ======================================================== 
    with SPARK_Mode => on
is
   
   package SPCDT renames pkg_controller_data_types; 
   
   procedure exec_temp_conversion  (temp_TagID  : in String; TRead : in SPCDT.temp_reading;  TSet : out SPCDT.temp_setting); 
   procedure exec_press_conversion (press_TagID : in String; PRead : in SPCDT.press_reading; PSet : out SPCDT.press_setting); 
   procedure exec_flow_conversion  (flow_TagID  : in String; FRead : in SPCDT.flow_reading;  FSet : out SPCDT.flow_setting); 
   
      
-- ======================================================== 
end pkg_controller_process_actuations;
-- ========================================================
