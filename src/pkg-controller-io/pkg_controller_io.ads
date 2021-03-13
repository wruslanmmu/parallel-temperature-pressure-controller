-- File   : pkg_controller_io.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_controller_data_types;

-- ========================================================
package pkg_controller_io
-- ======================================================== 
    with SPARK_Mode => on
is
   package PPCDT renames pkg_controller_data_types;
   
   -- TEMPERATURE IO-CONTROL
   procedure read_temp_fromSensor    (temp_TagID  : in String; out_TRead    : out PPCDT.temp_reading);
   procedure display_temp_toMonitor  (temp_TagID  : in String; out_TRead    : out PPCDT.temp_reading); 
   procedure write_temp_toActuator   (temp_tagID  : in String; out_HSetting : out PPCDT.heater_setting); 
   
   -- PRESSURE IO-CONTROL
   procedure read_press_fromSensor   (press_TagID : in String; out_PRead    : out PPCDT.press_reading);  
   procedure display_press_toMonitor (press_TagID : in String; out_PRead    : out PPCDT.press_reading);  
   procedure write_press_toActuator  (press_tagID : in String; out_PSetting : out PPCDT.press_setting);  
    
   -- FLOW METER IO-CONTROL
   procedure read_flow_fromSensor    (flow_TagID  : in String; out_FRead    : out PPCDT.flow_reading);  
   procedure display_flow_toMonitor  (flow_TagID  : in String; out_FRead    : out PPCDT.flow_reading);
   procedure write_flow_toActuator   (flow_tagID  : in String; out_FSetting : out PPCDT.flow_setting); 
     
-- ======================================================== 
end pkg_controller_io;
-- ========================================================
