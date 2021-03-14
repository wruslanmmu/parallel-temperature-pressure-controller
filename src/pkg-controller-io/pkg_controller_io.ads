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
   procedure read_temp_fromSensor    (temp_TagID  : in String; TRead : out PPCDT.temp_reading);
   -- CALCULATIONS FIRST BEFORE TSet (See the temp_controller loop TASK)
   procedure write_temp_toActuator   (temp_TagID  : in String; TSet  : in out PPCDT.temp_setting);
   procedure display_temp_toMonitor  (temp_TagID  : in String; TRead : in out PPCDT.temp_reading); 
  
   -- PRESSURE IO-CONTROL
   procedure read_press_fromSensor   (press_TagID : in String; PRead : out PPCDT.press_reading);
   -- CALCULATIONS FIRST BEFORE PSet (See the press_controller loop TASK)
   procedure write_press_toActuator  (press_TagID : in String; PSet  : in out PPCDT.press_setting);
   procedure display_press_toMonitor (press_TagID : in String; PRead : in out PPCDT.press_reading);  
       
   -- FLOW METER IO-CONTROL
   procedure read_flow_fromSensor    (flow_TagID  : in String; FRead : out PPCDT.flow_reading);
   -- CALCULATIONS FIRST BEFORE FSet (See the flow_controller loop TASK)
   procedure write_flow_toActuator   (flow_TagID  : in String; FSet  : in out PPCDT.flow_setting);
   procedure display_flow_toMonitor  (flow_TagID  : in String; FRead : in out PPCDT.flow_reading);
     
-- ======================================================== 
end pkg_controller_io;
-- ========================================================
