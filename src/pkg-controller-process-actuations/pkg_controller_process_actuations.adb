-- File: pkg_controller_process_actuations.adb

with Ada.Text_IO; -- use Ada.Text_IO;
with pkg_controller_data_types;
with pkg_ada_datetime_stamp;

-- ========================================================
package body pkg_controller_process_actuations
-- ======================================================== 
--   with SPARK_Mode => on  -- CANNOT BE TURNED ON WHY?
is
 
  package ATIO   renames Ada.Text_IO;
  package PCDT   renames pkg_controller_data_types;
  package PADTS  renames pkg_ada_datetime_stamp;
   
  -- GLOBAL PACKAGE-WIDE VARIABLES
 
-- ========================================================   
procedure exec_temp_conversion  (temp_TagID  : in String; TRead : in PCDT.temp_reading;  TSet : out PCDT.temp_setting) 
-- ======================================================== 
is
      temp_value : Float := Float (TRead);
begin
   -- RECALL: type temp_reading  is new Float   range 10.0..500.0; -- degrees Centigrade  
   -- RECALL: ttype temp_setting   is new Float range 10.0 .. 20.0;
         
   if (temp_value >= 10.0) and (temp_value <= 100.0) then    
         TSet := PCDT.temp_setting(10.1111);
   elsif (temp_value > 100.0) and (temp_value <= 200.0) then 
         TSet := PCDT.temp_setting(12.2222);
   elsif (temp_value > 200.0) and (temp_value <= 300.0) then 
         TSet := PCDT.temp_setting(15.5555);      
   elsif (temp_value > 300.0) and (temp_value <= 400.0) then 
         TSet := PCDT.temp_setting(18.8888);     
   elsif (temp_value > 400.0) and (temp_value <= 500.0) then 
         TSet := PCDT.temp_setting(20.0000);
   else 
      ATIO.Put_Line ("ERROR: TRead is out of float range (10.0 .. 500.0)");  
   end if;   

   PADTS.dtstamp;
   ATIO.Put_Line ("RUN: TEMP  exec_temp_conversion   (" & temp_TagID & ", " & 
                       PCDT.temp_reading'Image (TRead) & ", " &
                       PCDT.temp_setting'Image (TSet) & ")" );       

   end exec_temp_conversion;   
   
-- ========================================================   
procedure exec_press_conversion (press_TagID : in String; PRead : in PCDT.press_reading; PSet  : out PCDT.press_setting)
-- ========================================================   
is
      press_value : Integer := 999;
begin
      -- RECALL: PRead_sensor integer (150, 750);
      -- RECALL: type press_setting new Integer is range 0..9;
      press_value := Integer (PRead);  -- CASTING
      
      if    (press_value >= 150) and (press_value <= 250) then 
         PSet := 3;
      elsif (press_value  > 250) and (press_value <= 500) then     
         PSet := 6;
      elsif (press_value  > 500) and (press_value <= 750) then
         PSet := 9;
      else 
         ATIO.Put_Line ("ERROR: PRead is out of integer range (0..750)");
      end if;   

      PADTS.dtstamp;
      ATIO.Put_Line ("RUN: PRESS exec_press_conversion     (" & press_TagID & ", " & 
                       PCDT.press_reading'Image (PRead) & ", " &
                       PCDT.press_setting'Image (PSet) & ")" );         

end exec_press_conversion;   
 
-- ========================================================   
procedure exec_flow_conversion  (flow_TagID  : in String; FRead : in PCDT.flow_reading; FSet  : out PCDT.flow_setting)
-- ========================================================   
is
     flow_value : Float := 999.99;       
begin
      
  -- RECALL: FRead is float (1_500.0 .. 2_500.0);
  -- RECALL: type flow_setting new Integer is range 0..100; Percentage valve opening
  -- Convert type PCDT.flow_reading to Standard Float (CASTING)
  flow_value := Float(FRead);    
     
  if    (flow_value >= 1_500.0) and (flow_value <= 2_000.0) then 
      FSet := PCDT.flow_setting(50);
  elsif (flow_value  > 2_000.0) and (flow_value <= 2_500.0) then     
      FSet := PCDT.flow_setting(80);
  else 
      ATIO.Put_Line ("ERROR: FRead is out of float range (1_500.0 .. 2_500.0)");
  end if;       
  
     PADTS.dtstamp;
     ATIO.Put_Line ("RUN: FLOW  exec_flow_conversion   (" & flow_TagID & ", " & 
                       PCDT.flow_reading'Image (FRead) & ", " &
                       PCDT.flow_setting'Image (FSet) & ")" );    
      
end exec_flow_conversion;   
 
-- ========================================================
-- CLOSE THIS PACKAGE      
-- ========================================================
begin
    null;
-- ========================================================    
end pkg_controller_process_actuations; 
-- ========================================================
