----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2020 02:09:54 PM
-- Design Name: 
-- Module Name: multiplexer_2_1 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2_1 is
  Port ( in0, in1 : in std_logic_vector(15 downto 0);
  s: in std_logic;
  Z : out std_logic_vector(15 downto 0));
end multiplexer_2_1;

architecture Behavioral of multiplexer_2_1 is
 begin
    process (s,in0,in1)
		begin
		if (s='0') then
			z <= in0;
		elsif (s ='1')then
		z<=in1;
		else
		 z <= in0;
		end if;
	end process;
      end Behavioral;
