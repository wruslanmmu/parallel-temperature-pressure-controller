-- File   : pkg_controller_parallel_tasks.adb
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================

-- IMPORT STANDARD ADA PACKAGES
with Ada.Real_Time;
use  Ada.Real_Time; -- IMPT: To make + legally valid
with Ada.Text_IO;

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_ada_datetime_stamp;
with pkg_ada_random_numbers;
with pkg_ada_realtime_delays;

with pkg_controller_data_types;
with pkg_controller_io;
with pkg_controller_parallel_tasks;
with pkg_controller_process_actuations;
-- with pkg_controller_processes;

-- ========================================================
package body pkg_controller_parallel_tasks
-- ======================================================== 
--   with SPARK_Mode => on  -- CANNOT BE TURNED ON WHY? Answer = ART.Clock
is
   -- RENAME PACKAGES
   package ART    renames Ada.Real_Time;
   package ATIO   renames Ada.Text_IO;
   
   package PADTS  renames pkg_ada_datetime_stamp;
   package PARN   renames pkg_ada_random_numbers;
   package PARD   renames pkg_ada_realtime_delays;
   
   package PCDT   renames pkg_controller_data_types;
   package PCIO   renames pkg_controller_io;
   package PCPT   renames pkg_controller_parallel_tasks;
   package PCPA   renames pkg_controller_process_actuations;
  
   -- =====================================================  
   procedure exec_controller_parallel_tasks 
   -- =====================================================
   is
      
      -- ==================================================
      -- DEFINITIONS - TASKS CODE BEGIN HERE
      -- ==================================================
      task tsk_Temperature_Controller_Loop;
      task tsk_Pressure_Controller_Loop;
      task tsk_FlowRate_Controller_Loop;
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     -- ==============================================
      -- ==================================================
      task body tsk_Temperature_Controller_Loop 
      -- ==================================================
      is
         TagID : String := "CDU1_T001";  
         TRead : PCDT.temp_reading;
         TSet  : PCDT.temp_setting;
         NextTime  : ART.Time;
         Interval  : ART.Time_Span := ART.Milliseconds (100);
      begin 
 
         NextTime := ART.Clock;
         -- loop                      -- LOOP FOREVER
         for idx in 1..10 loop
            
            -- PADTS.dtstamp; 
            ATIO.Put_Line ("TASK TEMP  LOOPNO: " & Integer'Image (idx) & " =====> Running tsk_Temperature_Controller_Loop");
            
            -- Temperature sensor inputs simulated using random number generator.
            
            PCIO.read_temp_fromSensor   (TagID, TRead);  -- From hardware 
            PCPA.exec_temp_conversion   (TagID, TRead, TSet); -- Calculations
            PCIO.write_temp_toActuator  (TagID, TSet);   -- To hardware
            PCIO.display_temp_toMonitor (TagID, TRead);  -- To hardware
            
            NextTime := NextTime + Interval;
            delay until NextTime;
         end loop;   
       
      end tsk_Temperature_Controller_Loop;
      
      -- ==================================================
      task body tsk_Pressure_Controller_Loop 
      -- ==================================================
      is
         TagID : String := "CDU1_P001";
         PRead : PCDT.press_reading;
         PSet  : PCDT.press_setting;
         NextTime : ART.Time;
         Interval : ART.Time_Span := ART.Milliseconds (50);
      begin
 
         NextTime := ART.Clock;
         
         -- loop                      -- LOOP FOREVER
         for idx in 1..10 loop
            
             -- PADTS.dtstamp; 
            ATIO.Put_Line ("TASK PRESS LOOPNO: " & Integer'Image (idx) & " =====> Running tsk_Pressure_Controller_Loop"); 
            
           -- Pressure sensor inputs simulated using random number generator. 
            
            PCIO.read_press_fromSensor   (TagID, PRead);  -- From hardware
            PCPA.exec_press_conversion   (TagID, PRead, PSet); -- Calculations
            PCIO.write_press_toActuator  (TagID, PSet);   -- To hardware
            PCIO.display_press_toMonitor (TagID, PRead);  -- To hardware
            
            NextTime := NextTime + Interval;
            delay until NextTime;
         end loop;   
 
      end tsk_Pressure_Controller_Loop;
         
      -- ==================================================
      task body tsk_FlowRate_Controller_Loop 
      -- ==================================================                                      
      is  
         TagID : String := "CDU1_F001";
         FRead : PCDT.flow_reading;
         FSet  : PCDT.flow_setting;
         NextTime : ART.Time;
         Interval : ART.Time_Span := ART.Milliseconds (70);
      begin
 
         NextTime := ART.Clock;
         
         -- loop                      -- LOOP FOREVER
         for idx in 1..10 loop
            
             -- PADTS.dtstamp; 
            ATIO.Put_Line ("TASK FLOW  LOOPNO: " & Integer'Image (idx) & " =====> Running tsk_FlowRate_Controller_Loop"); 
            
            -- FlowRate sensor inputs simulated using random number generator.
            
            PCIO.read_flow_fromSensor   (TagID, FRead);  -- From hardware (random no)
            PCPA.exec_flow_conversion   (TagID, FRead, FSet); -- Calculations
            PCIO.write_flow_toActuator  (TagID, FSet);   -- To hardware
            PCIO.display_flow_toMonitor (TagID, FRead);  -- To hardware
            
            NextTime := NextTime + Interval;
            delay until NextTime;
         end loop;   
 
      end tsk_FlowRate_Controller_Loop;   
          
      -- TASKS CODE END HERE
      -- =====================================================
   begin  -- BEGIN FOR PROCEDURE
      -- IMPT: All tasks start automatically at the begin point here.
      null;
   -- ====================================================== 
   end exec_controller_parallel_tasks; -- END FOR PROCEDURE
   -- ======================================================
   
-- ========================================================
begin  -- BEGIN FOR PACKAGE
    null;
-- ========================================================    
end pkg_controller_parallel_tasks; -- END FOR PACKAGE
-- ========================================================
