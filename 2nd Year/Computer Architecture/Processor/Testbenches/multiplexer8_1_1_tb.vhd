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

entity multiplexer8_1_1_tb is
end multiplexer8_1_1_tb;

architecture behavioral of multiplexer8_1_1_tb is

component multiplexer8_1_1
port (  in0, in1, in2, in3, in4, in5, in6, in7 : in  std_logic;
            s : in  std_logic_vector(2 downto 0);
           z : out  std_logic);
end component;
    
  signal s :  std_logic_vector (2 downto 0);
  signal in0, in1, in2, in3, in4, in5, in6, in7 :   std_logic;
  signal z :  std_logic;

begin

    uut: multiplexer8_1_1 PORT MAP (
          s => s,
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          z => z
    );
    
  stim_proc: process
   begin	   
        in0 <= '1';
        in1 <= '0';
        in2 <= '0';
        in3 <= '1';
        in4 <= '1';
        in5 <= '0';
        in6 <= '1';
        in7 <= '0';
   
       wait for 1 ns;
       s <="000";
       wait for 1 ns;
       s <="001";
       wait for 1 ns;
       s <="010";
       wait for 1 ns;
       s <="011";
       wait for 1 ns;
       s <="100";
       wait for 1 ns;
       s <="101";
       wait for 1 ns;
       s <="110";
       wait for 1 ns;
       s <="111";
   end process;

end Behavioral;
