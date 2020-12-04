----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2020 11:49:18 PM
-- Design Name: 
-- Module Name: zero_fill - Behavioral
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

entity zero_fill is
    port ( in0 : in std_logic_vector(2 downto 0);
           zeros : out std_logic_vector(15 downto 0));
end zero_fill;

architecture Behavioral of zero_fill is
 constant delay: Time := 1 ns;
begin
    zeros(2 downto 0) <=  in0 after delay;
    zeros(15 downto 3) <= "0000000000000" after delay;

end Behavioral;
