----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 12:07:44 AM
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

entity program_counter is
	port(	pl, pi, reset : in std_logic;
			extend : in std_logic_vector(15 downto 0);
			pc_out : out std_logic_vector(15 downto 0)
			);
end program_counter;

architecture Behavioral of program_counter is
begin
	process(reset, pl, pi)
	variable tempInt : integer;
	variable current, temp : std_logic_vector(15 downto 0);
	
	begin
		if(pi = '1' and pl = '0') then
			tempInt := conv_integer(current); 
			tempInt := tempInt + conv_integer(1);
			temp := conv_std_logic_vector(tempInt, 16);
			pc_out <= temp after 1ns;
		elsif(pl = '1' and pi = '0') then 
			pc_out <= current + extend after 1ns;
		elsif(reset = '1') then
		    pc_out <= "0000000000000000" after 1ns;
		end if;
	end process;

end Behavioral;