----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 12:46:35 AM
-- Design Name: 
-- Module Name: program_counter_tb - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY program_counter_tb IS
END program_counter_tb;
 
ARCHITECTURE behavior OF program_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_counter
    PORT(
         pl, pi, reset : in  std_logic;
         extend : in  std_logic_vector(15 downto 0);
         pc_out : out  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal extend : std_logic_vector(15 downto 0);
   signal pl, pi, reset : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(15 downto 0);
 
BEGIN
 
   uut: program_counter port map (
          extend => extend,
          pl => pl,
          pi => pi,
          reset => reset,
          pc_out => pc_out
        );

   stim: process
   begin		
		wait for 1ns;
		reset <= '1';
	    extend <= x"0000";
		
		wait for 1ns;
		reset <= '0';
		
		wait for 1ns;
		pi <= '1';
		pl <= '0';
		extend <= x"0010";
		
		wait for 1ns;
		pi <= '0';
		pl <= '1';
		extend <= x"0100";

      wait;
   end process;

END;
