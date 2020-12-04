----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 10:29:48 PM
-- Design Name: 
-- Module Name: processor_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_tb IS
END processor_tb;
 
ARCHITECTURE behavior OF processor_tb IS 
 
 
    COMPONENT processor
    PORT(
         reset, Clk: IN  std_logic
        );
    END COMPONENT;
    

   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

   constant delay : time := 1 ns;
 
BEGIN
 
   uut: processor PORT MAP (
          Clk => Clk,
          reset => reset
        );

   Clk_process :process
   begin
		Clk <= '0';
		wait for delay/2;
		Clk <= '1';
		wait for delay/2;
   end process;
 
   stim: process
   begin		
		reset <= '1';
		wait for 1ns;
		
		reset <= '0';
      wait;
   end process;

END;