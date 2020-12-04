----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 01:36:38 AM
-- Design Name: 
-- Module Name: instruction_register_tb - Behavioral
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
 
ENTITY instruction_register_tb IS
END instruction_register_tb;
 
ARCHITECTURE behavior OF instruction_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_register
    PORT(
         IR : in  std_logic_vector(15 downto 0);
         IL : in  std_logic;
         opcode : out  std_logic_vector(6 downto 0);
         DR : out  std_logic_vector(2 downto 0);
         SA : out  std_logic_vector(2 downto 0);
         SB : out  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(15 downto 0) := (others => '0');
   signal IL : std_logic := '0';

 	--Outputs
   signal opcode : std_logic_vector(6 downto 0);
   signal DR : std_logic_vector(2 downto 0);
   signal SA : std_logic_vector(2 downto 0);
   signal SB : std_logic_vector(2 downto 0);
 
BEGIN
 
   uut: instruction_register PORT MAP (
          IR => IR,
          IL => IL,
          opcode => opcode,
          DR => DR,
          SA => SA,
          SB => SB
        );
		  
   stim: process
   begin		

		
		wait for 1ns;
		IL <= '1';
		
		wait for 1ns;
		IL <= '0';
		
		wait for 1ns;
		IR <= x"BEEF";
		
		wait for 1ns;
		IL <= '1';
		
		wait for 1ns;
		IL <= '0';

      wait;
   end process;

END;
