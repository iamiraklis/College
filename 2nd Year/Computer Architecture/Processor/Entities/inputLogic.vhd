----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 02:37:16 AM
-- Design Name: 
-- Module Name: inputLogic - Behavioral
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

entity inputLogic is
    Port(
        a, b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        ab : out std_logic_vector(15 downto 0)
    );  
end inputLogic;

architecture Behavioral of inputLogic is

constant delay: Time := 1 ns;
begin
    
    process(s,a,b)
        begin
        case s is
            when "00" => ab <= a AND b after delay;
            when "01" => ab <= a OR b after delay;
            when "10" => ab <= a XOR b after delay;
            when "11" => ab <= not a after delay;
            when others => ab <= not a after delay;
        end case;
    end process;

end Behavioral;
