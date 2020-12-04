----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:43:14 AM
-- Design Name: 
-- Module Name: multiplexer8_1_1 - Behavioral
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

entity multiplexer8_1_1 is
port (   
           in0, in1, in2, in3, in4, in5, in6, in7 : in  std_logic;
            s : in  std_logic_vector(2 downto 0);
           z : out  std_logic);
end multiplexer8_1_1;

architecture Behavioral of multiplexer8_1_1 is

begin

  process ( s,in1,in2,in3,in4,in5,in6,in7)
		begin
		case s is
			when "000" => z <= in0;
			when "001" => z <= in1;
			when "010" => z <= in2;
			when "011" => z <= in3;
			when "100" => z <= in4;
			when "101" => z <= in5;
			when "110" => z <= in6;
			when "111" => z <= in7;
			when others => z <= in0;
		end case;
	end process;

end Behavioral;
