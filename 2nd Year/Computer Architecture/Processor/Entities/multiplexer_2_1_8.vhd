----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 04:06:45 AM
-- Design Name: 
-- Module Name: multiplexer_2_1_8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer_2_1_8 is
  Port ( 
    in0, in1 : in std_logic_vector(7 downto 0);
    s : in std_logic;
    z : out std_logic_vector(7 downto 0)
  );
end multiplexer_2_1_8;

architecture Behavioral of multiplexer_2_1_8 is

begin
    z <= 	in0 after 1ns when (s <= '0') else
			in1 after 1ns when (s <= '1');

end Behavioral;
