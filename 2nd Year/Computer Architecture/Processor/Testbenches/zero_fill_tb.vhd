----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2020 11:51:25 PM
-- Design Name: 
-- Module Name: zero_fill_tb - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
 
entity zerofill_tb is
end zerofill_tb;
 
architecture behavior of zerofill_tb is 
 
 
    component zero_fill
    port(
         in0 : in  std_logic_vector(2 downto 0);
         zeros : out  std_logic_vector(15 downto 0)
        );
    end component;
    

   signal in0 : std_logic_vector(2 downto 0) := (others => '0');
   
   signal zeros : std_logic_vector(15 downto 0);
 
 constant delay: Time := 1 ns;
 
begin
 
   uut: zero_fill PORT MAP (
          in0 => in0,
          zeros => zeros
        );
        
   stim_proc: process
   begin	
		wait for delay;
		in0 <= "001";
		wait for delay;
		in0 <= "010";
		wait for delay;
		in0 <= "011";
   end process;

END;
