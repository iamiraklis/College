----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2020 08:46:24 PM
-- Design Name: 
-- Module Name: function_unit_tb - Behavioral
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

entity FunctionUnit_tb is
--  Port ( );
end FunctionUnit_tb;

architecture Behavioral of FunctionUnit_tb is
    
    component FunctionUnit is
        Port ( 
            a_in, b_in : in std_logic_vector(15 downto 0);
            function_select : in std_logic_vector(4 downto 0);
            v, c, n, z : out std_logic;
            f : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal a_in, b_in, f : std_logic_vector(15 downto 0);
    signal function_select : std_logic_vector(4 downto 0);
    signal v,c,n,z : std_logic;

begin

    uut: FunctionUnit Port map (
          a_in => a_in,
          b_in => b_in,
          function_select => function_select,
          v => v,
          c => c,
          n => n,
          z => z,
          f => f
    );

   -- Stimulus process
   stim_proc: process
   begin		
        
        a_in <= "0011001100110011";
        b_in <= "1100110011001100";
        
        function_select <= "00000";
		wait for 20ns;
		
		function_select <= "00001";
		wait for 20ns;
		
		function_select <= "00010";
		wait for 20ns;
		
		function_select <= "00011";
		wait for 20ns;
		
		function_select <= "00100";
		wait for 20ns;
		
		function_select <= "00101";
		wait for 20ns;
		
		function_select <= "00110";
		wait for 20ns;
		
		function_select <= "00111";
		wait for 20ns;
		
		function_select <= "01000";
		wait for 20ns;
		
		function_select <= "01001";
		wait for 20ns;
		
		function_select <= "01010";
		wait for 20ns;
		
		function_select <= "01011";
		wait for 20ns;
		
		function_select <= "01100";
		wait for 20ns;
		
		function_select <= "01101";
		wait for 20ns;
		
		function_select <= "01110";
		wait for 20ns;
		
		function_select <= "01111";
		wait for 20ns;
		
		function_select <= "10000";
		wait for 20ns;
		
		function_select <= "10100";
		wait for 20ns;
		
		function_select <= "11000";
		wait for 20ns;
		
      wait;
   end process;


end Behavioral;