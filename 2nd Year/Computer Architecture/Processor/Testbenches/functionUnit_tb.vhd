----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 04:09:37 PM
-- Design Name: 
-- Module Name: functionUnit_tb - Behavioral
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

entity functionUnit_tb is
--  Port ( );
end FunctionUnit_tb;

architecture Behavioral of functionUnit_tb is
    
    component functionUnit is
        Port ( 
            a_in, b_in : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            v, c, n, z : out std_logic;
            f : out std_logic_vector(15 downto 0)
        );
    end component;
    
    signal a_in, b_in, f : std_logic_vector(15 downto 0);
    signal fs : std_logic_vector(4 downto 0);
    signal v,c,n,z : std_logic;

begin

    uut: functionUnit Port map (
          a_in => a_in,
          b_in => b_in,
          fs => fs,
          v => v,
          c => c,
          n => n,
          z => z,
          f => f
    );

   stim_proc: process
   
constant delay: Time := 1 ns;

   begin		
        
        a_in <= "1010101010101010";
        b_in <= "0101010101010101";
        
        fs <= "00000";
		wait for delay;
		
		fs <= "00001";
		wait for delay;
		
		fs <= "00010";
		wait for delay;
		
		fs <= "00011";
		wait for delay;
		
		fs <= "00100";
		wait for delay;
		
		fs <= "00101";
		wait for delay;
		
		fs <= "00110";
		wait for delay;
		
		fs <= "00111";
		wait for delay;
		
		fs <= "01000";
		wait for delay;
		
		fs <= "01001";
		wait for delay;
		
		fs <= "01010";
		wait for delay;
		
		fs <= "01011";
		wait for delay;
		
		fs <= "01100";
		wait for delay;
		
		fs <= "01101";
		wait for delay;
		
		fs <= "01110";
		wait for delay;
		
		fs <= "01111";
		wait for delay;
		
		fs <= "10000";
		wait for delay;
		
		fs <= "10100";
		wait for delay;
		
		fs <= "11000";
		wait for delay;
		
      wait;
   end process;


end Behavioral;