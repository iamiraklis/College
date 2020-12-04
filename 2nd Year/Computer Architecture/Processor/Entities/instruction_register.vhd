----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 01:32:02 AM
-- Design Name: 
-- Module Name: instruction_register - Behavioral
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

entity instruction_register is
	Port(	IR : in std_logic_vector(15 downto 0);
			IL : in std_logic;
			opcode :  out std_logic_vector(6 downto 0);
			DR, SA, SB : out std_logic_vector(2 downto 0)
			);
end instruction_register;

architecture Behavioral of instruction_register is
begin
process(IL)
begin
if (IL = '1') then
	Opcode(6 downto 0) <= IR(15 downto 9) after 1ns;
	DR <= IR(8 downto 6) after 1ns;
	SA <= IR(5 downto 3) after 1ns;
	SB <= IR(2 downto 0) after 1ns;
end if;
end process;
end Behavioral;
