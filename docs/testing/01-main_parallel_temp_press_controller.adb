-- File   : main_parallel_temp_press_controller.adb
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================

-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;  
-- use  Ada.Text_IO;
with Ada.Real_Time;
-- use Ada.Real_Time;

-- IMPORT USER-DEFINED ADA PACKAGES 
-- (LOOKS FOR CORRESPONDING NAMED .ads FILE)
with pkg_ada_datetime_stamp;
with pkg_ada_realtime_delays;
with pkg_controller_data_types;
with pkg_controller_io;

-- ========================================================
procedure main_parallel_temp_press_controller
-- ========================================================
--	with SPARK_Mode => on
is 
   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO   renames Ada.Text_IO;
   package ART    renames Ada.Real_Time;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS  renames pkg_ada_datetime_stamp;
   package PARD   renames pkg_ada_realtime_delays;
   package PCDT   renames pkg_controller_data_types;
   package PCIO   renames pkg_controller_io;
   
   -- PPOCEDURE-WIDE VARIABLE DEFINITIONS
   startClock    : ART.Time;
   finishClock   : ART.Time;
     
   out_TRead : PCDT.temp_reading; 
   out_PRead : PCDT.press_reading; 
   out_FRead : PCDT.flow_reading; 
   
   out_TSetting : PCDT.heater_setting; 
   out_PSetting : PCDT.press_setting; 
   out_FSetting : PCDT.flow_setting; 
   
-- ========================================================   
begin  -- FOR procedure main_ada_xxxxxxx
   startClock := ART.Clock; PADTS.dtstamp;
   ATIO.Put_Line ("STARTED: main Bismillah 3 times WRY");
   ATIO.New_Line;
   
   -- CODE BEGINS HERE
   -- =====================================================
   PCIO.read_temp_fromSensor    ("CDU1_T001", out_TRead); 
   PCIO.display_temp_toMonitor  ("CDU1_T001", out_TRead); 
   PCIO.write_temp_toActuator   ("CDU1_T001", out_TSetting); 
   
   -- =====================================================
   PCIO.read_press_fromSensor   ("CDU1_P001", out_PRead); 
   PCIO.display_press_toMonitor ("CDU1_P001", out_PRead); 
   PCIO.write_press_toActuator  ("CDU1_P001", out_PSetting); 

   -- =====================================================
   PCIO.read_flow_fromSensor    ("CDU1_F001", out_FRead); 
   PCIO.display_flow_toMonitor  ("CDU1_F001", out_FRead); 
   PCIO.write_flow_toActuator   ("CDU1_F001", out_FSetting); 
    
   -- =====================================================
   
   
   
   
   -- CODE ENDS HERE
   -- =====================================================
      
   ATIO.New_Line; PADTS.dtstamp;
   ATIO.Put ("ENDED: main Alhamdulillah 3 times WRY. ");
   finishClock := ART.Clock;
   PARD.exec_display_execution_time(startClock, finishClock); 
    
-- ========================================================   
end main_parallel_temp_press_controller;
-- ========================================================
