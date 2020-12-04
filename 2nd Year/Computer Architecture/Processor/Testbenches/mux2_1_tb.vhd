----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:49:48 AM
-- Design Name: 
-- Module Name: multiplexer8_1_1_tb - Behavioral
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

entity mux2_1_tb is
end mux2_1_tb;

architecture behavioral of mux2_1_tb is

component mux2_1
  Port(
        in0, in1, s : in std_logic;
        z : out std_logic
    );
end component;
    
  signal s :  std_logic;
  signal in0, in1 :   std_logic;
  signal z :  std_logic;

begin

    uut: mux2_1 PORT MAP (
          s => s,
          in0 => in0,
          in1 => in1,
          z => z
    );
    
  stim_proc: process
   begin	   
        in0 <= '1';
        in1 <= '0';
   
       wait for 1 ns;
       s <='0';
       wait for 1 ns;
       s <='1';
       wait for 1 ns;
   end process;

end Behavioral;
