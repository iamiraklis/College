----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 03:04:03 AM
-- Design Name: 
-- Module Name: inputLogic_2_tb - Behavioral
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

entity inputLogic_2_tb is
end inputLogic_2_tb;
 
architecture Behavior of inputLogic_2_tb is 
 
 
    component inputLogic_2
    port(
         b : IN  std_logic_vector(15 downto 0);
         s_in : IN  std_logic_vector(1 downto 0);
         b_out : OUT  std_logic_vector(15 downto 0)
        );
    end component;
    

   --Inputs
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal s_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal b_out : std_logic_vector(15 downto 0);
 
begin
 
   uut: inputLogic_2 PORT MAP (
          b => b,
          s_in => s_in,
          b_out => b_out
        );



   stim_proc: process
   
constant delay: Time := 1 ns;  
   
   begin		
		b <= "1011111010101111";
		s_in <= "00";
		
		wait for delay;
		s_in <= "01";
		
		wait for delay;
		s_in <= "10";
		
		wait for delay;
		s_in <= "11";

      wait;
   end process;

end;