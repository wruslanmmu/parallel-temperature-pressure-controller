-- File   : pkg_controller_parallel_tasks.ads
-- Date   : Sat 13 Mar 2021 05:41:53 AM +08
-- Author : wruslandr@gmail.com
-- Version: 1.0 Sat 13 Mar 2021 05:41:53 AM +08
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES

-- IMPORT USER-CREATED ADA PACKAGES

-- ========================================================
package pkg_controller_parallel_tasks
-- ======================================================== 
    with SPARK_Mode => on
is
   -- NOTE: Prefix S is for being in the spec file .ads 
   
   procedure exec_controller_parallel_tasks;
                                
  
 
-- ======================================================== 
end pkg_controller_parallel_tasks;
-- ========================================================

