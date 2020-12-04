----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 02:43:28 AM
-- Design Name: 
-- Module Name: inputLogic_tb - Behavioral
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

entity inputLogic_tb is
end inputLogic_tb;
 
architecture Behavior of inputLogic_tb is 
 
    component inputLogic
    port(
        a, b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        ab : out std_logic_vector(15 downto 0)
    );  
    end component;
    
   signal a, b : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic_vector(1 downto 0) := (others => '0');
   
   signal ab : std_logic_vector(15 downto 0) := (others => '0');
 
begin

   uut: inputLogic port map (
          a => a,
          b => b,
          s => s,
          ab => ab
        );



   stim_proc: process
   
 constant delay: Time := 1 ns;
   
   begin		
		a <= "1011111010101111";
		b <= "1101111010101111";
		s <= "00";
		
		wait for delay;
		s <= "01";
		
		wait for delay;
		s <= "10";
		
		wait for delay;
		s <= "11";

      wait;
   end process;

end;
