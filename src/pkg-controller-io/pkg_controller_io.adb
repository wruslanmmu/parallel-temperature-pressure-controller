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
   
   -- =====================================================
   procedure read_temp_fromSensor (temp_TagID: in String; TRead : out PCDT.temp_reading)  
   -- =====================================================
   is
        TRead_Sensor : Float := 0.0; 
   begin
      -- SUMULATE VALUE OF temp SENSOR WITH RANDOM STANDARD FLOATS
      -- DEFINED: type temp_reading  is new Float   range 10.0..500.0; -- degrees Centigrade
      -- Convert random Float to PCDT.temp_reading
      
      TRead_Sensor := PARN.get_random_float (10.0, 500.0); -- Random number generator
      TRead := PCDT.temp_reading (TRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: TEMP  read_temp_fromSensor   (" & temp_TagID & ", " & PCDT.temp_reading'Image (TRead) & ")" );
      
   end read_temp_fromSensor;
   
   -- ==================================================== 
   procedure read_press_fromSensor (press_TagID : in String; PRead : out PPCDT.press_reading)  
   -- ====================================================
   is
         PRead_Sensor : Integer := 0;
   begin
      -- SUMULATE VALUE OF temp SENSOR WITH RANDOM STANDARD FLOATS
      -- DEFINED: type press_reading is new Integer range 150..750;    -- millibars
      -- Convert random into PCDT.press_reading
     
      PRead_Sensor := PARN.get_random_integer (150, 750); -- a simulation
      PRead := PCDT.press_reading (PRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: PRESS read_press_fromSensor     (" & press_TagID & ", " & PCDT.press_reading'Image (PRead) & ")" );
   
   end read_press_fromSensor;
       
   -- =====================================================
   procedure display_temp_toMonitor (temp_TagID  : in String; TRead : in out PCDT.temp_reading)
   -- =====================================================
   is  
      -- THE IDEA IS TO SEND TO SPECIFIC DISPLAY DEVICES 
      -- AND NOT JUST Standard_Output (Terminal Screen)
      -- This is the difference between display_temperature() and read_temperature().
      
   begin
      -- SEND TO TERMINAL SCREEN
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: TEMP  display_temp_toMonitor (" & temp_TagID & ", " & PCDT.temp_reading'Image (TRead) & ")" );
   
   end display_temp_toMonitor;
   
   -- =====================================================  
   procedure display_press_toMonitor (press_TagID : in String; PRead : in out PCDT.press_reading)  
   -- =====================================================
   is
   
   begin
      -- THE IDEA IS TO SEND TO SPECIFIC DISPLAY DEVICES 
      -- AND NOT JUST Standard_Output (Terminal Screen)
      -- This is the difference between display_press_toMonitor() and read_press_fromSensor().
      -- DEFINED: type press_reading is new Integer range 150..750;    -- millibars
            
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: PRESS display_press_toMonitor   (" & press_TagID & ", " & PCDT.press_reading'Image (PRead) & ")" );
      
   end display_press_toMonitor;

   -- =====================================================
   procedure read_flow_fromSensor (flow_TagID : in String; FRead : out PCDT.flow_reading)  
   -- =====================================================
   is
        FRead_Sensor : Float := 0.0;   
      
   begin
      -- SUMULATE VALUE OF flow SENSOR WITH RANDOM STANDARD FLOATS
      -- DEFINED: type flow_reading  is new Float range 0.0..2500.0; -- metric tons per hour 
      
      -- Convert random Float to PCDT.temp_reading
      FRead_Sensor := PARN.get_random_float (1_500.0, 2_500.0);
      FRead := PCDT.flow_reading (FRead_Sensor);
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: FLOW  read_flow_fromSensor   (" & flow_TagID & ", " & PCDT.flow_reading'Image (FRead) & ")" );
      
   end read_flow_fromSensor;
   
   -- =====================================================
   procedure display_flow_toMonitor (flow_TagID : in String; FRead : in out PCDT.flow_reading)  
   -- =====================================================
   is
       flow_value : Float := Float (FRead); -- CASTING
       
   begin
      -- EXECUTE THE ACTUAL CODE TO WRITE (SEND COMMAND SIGNALS) HERE
      -- TO THE HARDWARE MONITOR DIAPLAY DEVICE
      -- DEFINED: type flow_reading  is new Float range 0.0..2500.0; -- metric tons per hour 
      
      FRead := PCDT.flow_reading (flow_value); -- JUST DUMMY
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: FLOW  display_flow_toMonitor (" & flow_TagID & ", " & PCDT.flow_reading'Image (FRead) & ")" );
      
   end display_flow_toMonitor;
   
   -- ======================================================================================
   procedure write_temp_toActuator (temp_TagID : in String; TSet : in out PCDT.temp_setting) 
   -- ======================================================================================
   is
         
   begin
            
      -- EXECUTE THE ACTUAL CODE TO WRITE (SEND COMMAND SIGNALS) HERE
      -- TO THE HARDWARE TEMPERATURE ACTUATOR DEVICE
      -- DEFINED: type temp_setting   is (ON, OFF);   -- Boolean. Heater ON/OFF
      
     --  TSet := PCDT.temp_setting (PCDT.OFF);  -- JUST DUMMY TO HARDWARE
        
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: TEMP  write_temp_toActuator  (" & temp_TagID & ", " & PCDT.temp_setting'Image (TSet) & ")" );
   
   end write_temp_toActuator;
   
   -- ======================================================================================
   procedure write_press_toActuator (press_TagID : in String; PSet : in out PCDT.press_setting) 
   -- ======================================================================================
   is
      
   begin
            
      -- EXECUTE THE ACTUAL CODE TO WRITE (SEND COMMAND SIGNALS) HERE
      -- TO THE HARDWARE PRESSURE ACTUATOR DEVICE
      -- type press_setting  is new Integer range 0..9;   -- Pressure meter scaling
      
      -- PSet := PCDT.press_setting (0); -- JUST DUMMY TO HARDWARE
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: PRESS write_pressure_toActuator (" & press_TagID & ", " & PCDT.press_setting'Image (PSet) & ")" );
   
        
   end write_press_toActuator;
   
   -- ======================================================================================
   procedure write_flow_toActuator (flow_TagID : in String; FSet : in out PCDT.flow_setting) 
   -- ======================================================================================
   is
      
   begin
           
      -- EXECUTE THE ACTUAL CODE TO WRITE (SEND COMMAND SIGNALS) HERE
      -- TO THE HARDWARE FLOW ACTUATOR DEVICE
      -- DEFINED: type flow_setting   is new Integer range 0..100; -- Percent valve opening
      
      -- FSet := PCDT.flow_setting (0); -- JUST DUMMY TO HARDWARE (Integer)
      
      
      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: FLOW  write_flow_toActuator  (" & flow_TagID & ", " & PCDT.flow_setting'Image (FSet) & ")" );
      
   end write_flow_toActuator;
      
-- ========================================================
-- CLOSE THIS PACKAGE      
-- ========================================================
begin
    null;
-- ========================================================    
end pkg_controller_io; 
-- ========================================================
