-- File   : pkg_controller_processes.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES

-- ========================================================
package pkg_controller_processes
-- ======================================================== 
    with SPARK_Mode => on
is
   procedure temperature_controller_loop (
                                  TRead : PCDT.temp_reading;
                                  HSet  : PCDT.heater_setting);
   
   procedure pressure_controller_loop (
                                  PRead : PCDT.temp_reading;
                                  PSet  : PCDT.press_setting);
     
-- ======================================================== 
end pkg_controller_processes;
-- ========================================================

