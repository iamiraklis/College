----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2020 06:07:06 PM
-- Design Name: 
-- Module Name: register_test_bench - Behavioral
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

ENTITY register_test_bench IS
END register_test_bench;
 
ARCHITECTURE behavior OF register_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg8
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: reg8 PORT MAP (
          D => D,
          load => load,
          clk => clk,
          Q => Q
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   stim_proc: process
   begin		
		wait for 10ns;
		D <= "1111111111111111";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
		
		wait for 10ns;
		D <= "1010101010101010";
		load <= '1';
		
		wait for 10ns;
		load <= '0';
   end process;

END;
