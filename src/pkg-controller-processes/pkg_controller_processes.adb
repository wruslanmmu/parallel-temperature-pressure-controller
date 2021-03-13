-- File   : pkg_controller_processes.adb
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;

-- IMPORT USER-CREATED ADA PACKAGES
with pkg_controller_data_types;
with pkg_controller_io;
with pkg_controller_procedures;

-- ========================================================
package body pkg_controller_processes
-- ======================================================== 
--   with SPARK_Mode => on  -- CANNOT BE TURNED ON WHY?
is
    -- RENAME PACKAGES
    package ATIO   renames Ada.Text_IO;
    package PCDT   renames pkg_controller_data_types;
    package PCIO   renames pkg_controller_io;
    package PCProcedures    renames pkg_controller_procedures;

   -- =====================================================  
   procedure temperature_controller_loop (
                              TRead : PCDT.temp_reading;
                              HSet  : PCDT.heater_setting)
   -- =====================================================
   is
          
   begin
      -- loop        -- FOR ENDLESS LOOP
      for idx in range 1..10 loop
         
         PCIO.read_sensor (TRead);
         PCProcedures.temp_convert (TRead; HSet);
         PCIO.write_display (HSet);
         PCIO.write_display (TRead);
         
      end loop; 
   end temperature_controller_loop;   
   
   -- =====================================================  
   procedure pressure_controller_loop (
                              PRead : PCDT.temp_reading;
                              PSet  : PCDT.press_setting)
   -- =====================================================
   is
      
   begin
      -- loop        -- FOR ENDLESS LOOP
      for idx in range 1..10 loop
         
         PCIO.read_sensor (PRead);
         PCProcedures.temp_convert (PRead; PSet);
         PCIO.write_display (PSet);
         PCIO.write_display (PRead);
         
      end loop; 
   end pressure_controller_loop;     
   
-- ========================================================
-- CLOSE THIS PACKAGE      
-- ========================================================
begin
    null;
-- ========================================================    
end pkg_controller_processes; 
-- ========================================================
