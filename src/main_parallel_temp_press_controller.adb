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
with pkg_ada_random_numbers;
with pkg_ada_realtime_delays;
with pkg_controller_data_types;
with pkg_controller_io;
with pkg_controller_parallel_tasks;
with pkg_controller_process_actuations;

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
   package PCPT   renames pkg_controller_parallel_tasks;
   package PCPA   renames pkg_controller_process_actuations;
   
   -- PPOCEDURE-WIDE VARIABLE DEFINITIONS
   startClock    : ART.Time;
   finishClock   : ART.Time;
    
-- ========================================================   
begin  -- FOR procedure main_ada_xxxxxxx
   startClock := ART.Clock; PADTS.dtstamp;
   ATIO.Put_Line ("STARTED: main Bismillah 3 times WRY");
   ATIO.New_Line;
   
   -- CODE BEGINS HERE
   -- =====================================================
      
   -- JUST THIS LINE 
   PCPT.exec_controller_parallel_tasks;
   
   
   -- CODE ENDS HERE
   -- =====================================================
   ATIO.New_Line;   
   ATIO.New_Line; PADTS.dtstamp;
   ATIO.Put ("ENDED: main Alhamdulillah 3 times WRY. ");
   finishClock := ART.Clock;
   PARD.exec_display_execution_time(startClock, finishClock); 
    
-- ========================================================   
end main_parallel_temp_press_controller;
-- ========================================================
