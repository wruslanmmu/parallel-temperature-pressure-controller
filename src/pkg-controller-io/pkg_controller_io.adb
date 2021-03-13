-- File   : pkg_controller_io.adb
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================

-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_ada_datetime_stamp;
with pkg_ada_random_numbers;
with pkg_controller_data_types;

-- ========================================================
package body pkg_controller_io
-- ======================================================== 
--   with SPARK_Mode => on  -- CANNOT BE TURNED ON WHY?
is
 
   -- RENAME PACKAGES
   package ATIO   renames Ada.Text_IO;
   package PADTS  renames pkg_ada_datetime_stamp;
   package PARN   renames pkg_ada_random_numbers;
   package PCDT   renames pkg_controller_data_types;
   
   -- GLOBAL PACKAGE-WIDE VARIABLES
   TRead_Sensor  : Float   := 999.99;  -- Temperature sensor (using random floats)
   PRead_Sensor  : Integer := 999;     -- Pressure sensor (using random integers)
   FRead_Sensor  : Float   := 9999.99; -- Flow rate sensor (using random floats)
     
   cur_TRead_Sensor : Float   := 0.0;
   cur_PRead_Sensor : Integer := 0;
   cur_FRead_Sensor : Float   := 0.0;
   
   -- =====================================================
   procedure read_temp_fromSensor (temp_TagID: in String; out_TRead : out PCDT.temp_reading)  
   -- =====================================================
   is
         
   begin
      -- SUMULATE VALUE OF temp SENSOR WITH RANDOM STANDARD FLOATS
      TRead_Sensor := PARN.get_random_float (10.0, 500.0);
      
      -- Convert random Float to PCDT.temp_reading
      out_TRead := PCDT.temp_reading (TRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("Run read_temp_fromSensor    (" & temp_TagID & ", " & PCDT.temp_reading'Image (out_TRead) & ")" );
      
   end read_temp_fromSensor;
   
   -- ==================================================== 
   procedure read_press_fromSensor (press_TagID : in String; out_PRead : out PPCDT.press_reading)  
   -- ====================================================
   is
         
   begin
    -- SUMULATE VALUE OF temp SENSOR WITH RANDOM STANDARD FLOATS
      PRead_Sensor := PARN.get_random_integer (150, 750);
      
      -- Convert random into PCDT.press_reading
      out_PRead := PCDT.press_reading (PRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("Run read_press_fromSensor   (" & press_TagID & ", " & PCDT.press_reading'Image (out_PRead) & ")" );
   
   end read_press_fromSensor;
   
   -- =====================================================
   procedure write_temp_toActuator (temp_tagID  : in String; out_HSetting : out PPCDT.heater_setting)
   -- =====================================================
   is
         
   begin
     
      -- RECALL: type temp_reading  is new Float range 10.0..500.0;
      cur_TRead_sensor := TRead_sensor;   -- FOR CHECKING
      
      if cur_TRead_sensor < 300.0 then    
         out_HSetting := PCDT.ON;
      else 
         out_HSetting := PCDT.OFF;
      end if;
      
      PADTS.dtstamp;
      ATIO.Put_Line ("Run write_temp_toActuator   (" & temp_TagID & ", " & PCDT.heater_setting'Image (out_HSetting) & ")" );
   
   end write_temp_toActuator;
    
   -- =====================================================
   procedure write_press_toActuator (press_tagID : in String; out_PSetting : out PPCDT.press_setting)  
   -- =====================================================
   is
         
   begin
           
      -- RECALL: PRead_sensor integer (150, 750);
      -- RECALL: type press_setting new Integer is range 0..9;
      cur_PRead_Sensor := PRead_Sensor;  -- FOR CHECKING
      
      if    (cur_PRead_sensor >= 150) and (cur_PRead_sensor <= 250) then 
         out_PSetting := 3;
      elsif (cur_PRead_sensor > 250) and (cur_PRead_sensor <= 500) then     
         out_PSetting := 6;
      elsif (cur_PRead_sensor > 500) and (cur_PRead_sensor <= 750) then
         out_PSetting := 9;
      else 
         ATIO.Put_Line ("ERROR: cur_PRead_sensor is out of integer range (0..750)");
      end if;   
          
      PADTS.dtstamp;
      ATIO.Put_Line ("Run write_press_toActuator  (" & press_TagID & ", " & PCDT.press_setting'Image (out_PSetting) & ")" );
   
   end write_press_toActuator;   
   
   -- =====================================================
   procedure display_temp_toMonitor (temp_TagID  : in String; out_TRead : out PCDT.temp_reading)
   -- =====================================================
   is  
      -- THE IDEA IS TO SEND TO SPECIFIC DISPLAY DEVICES 
      -- AND NOT JUST Standard_Output (Terminal Screen)
      -- This is the difference between display_temperature() and read_temperature().
      
   begin
      cur_TRead_sensor := TRead_sensor; -- Integer type
      -- Convert integer to type PCDT.temp_reading
      out_TRead := PCDT.temp_reading (cur_TRead_Sensor);
      
      -- SEND TO TERMINAL SCREEN
      PADTS.dtstamp;
      ATIO.Put_Line ("Run display_temp_toMonitor  (" & temp_TagID & ", " & PCDT.temp_reading'Image (out_TRead) & ")" );
   
   end display_temp_toMonitor;
   
   -- =====================================================  
   procedure display_press_toMonitor (press_TagID : in String; out_PRead : out PCDT.press_reading)  
   -- =====================================================
   is
   
   begin
      cur_PRead_sensor := PRead_sensor;
      -- Convert integer to type PCDT.temp_reading
      out_PRead := PCDT.press_reading (cur_PRead_Sensor);
            
      PADTS.dtstamp;
      ATIO.Put_Line ("Run display_press_toMonitor (" & press_TagID & ", " & PCDT.press_reading'Image (out_PRead) & ")" );
      
   end display_press_toMonitor;

   -- =====================================================
   procedure read_flow_fromSensor (flow_TagID : in String; out_FRead : out PCDT.flow_reading)  
   -- =====================================================
   is
         
   begin
      -- SUMULATE VALUE OF flow SENSOR WITH RANDOM STANDARD FLOATS
      FRead_Sensor := PARN.get_random_float (1_500.0, 2_500.0);
      
      -- Convert random Float to PCDT.temp_reading
      out_FRead := PCDT.flow_reading (FRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("Run read_temp_fromSensor    (" & flow_TagID & ", " & PCDT.flow_reading'Image (out_FRead) & ")" );
      
   end read_flow_fromSensor;
   
   -- =====================================================
   procedure display_flow_toMonitor (flow_TagID : in String; out_FRead : out PCDT.flow_reading)  
   -- =====================================================
   is
   
   begin
      cur_FRead_sensor := FRead_sensor;
      -- Convert integer to type PCDT.flow_reading
      out_FRead := PCDT.flow_reading (cur_FRead_Sensor);
            
      PADTS.dtstamp;
      ATIO.Put_Line ("Run display_flow_toMonitor  (" & flow_TagID & ", " & PCDT.flow_reading'Image (out_FRead) & ")" );
      
   end display_flow_toMonitor;
   
   -- =====================================================
   procedure write_flow_toActuator (flow_tagID : in String; out_FSetting : out PCDT.flow_setting)  
   -- =====================================================
   is
         
   begin
      -- RECALL: Flow_sensor float (1_500.0 .. 2_500.0);
      -- RECALL: type flow_setting new Integer is range 0..100; Percentage valve opening
      cur_FRead_Sensor := FRead_Sensor;  
      
      if    (cur_FRead_sensor >= 1_500.0) and (cur_FRead_sensor <= 2_000.0) then 
         out_FSetting := 50;
      elsif (cur_FRead_sensor > 2_000.0) and (cur_FRead_sensor <= 2_500.0) then     
         out_FSetting := 80;
      else 
         ATIO.Put_Line ("ERROR: cur_FRead_sensor out of float range (1_500.0 .. 2_500.0)");
      end if;   
          
      PADTS.dtstamp;
      ATIO.Put_Line ("Run write_flow_toActuator   (" & flow_TagID & ", " & PCDT.flow_setting'Image (out_FSetting) & ")" );
   
   end write_flow_toActuator;   
      
-- ========================================================
-- CLOSE THIS PACKAGE      
-- ========================================================
begin
    null;
-- ========================================================    
end pkg_controller_io; 
-- ========================================================
