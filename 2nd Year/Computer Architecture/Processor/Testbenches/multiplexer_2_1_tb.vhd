----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/14/2020 02:10:36 PM
-- Design Name:
-- Module Name: multiplexer_tb - Behavioral
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

entity multiplexer_2_1_tb is
end multiplexer_2_1_tb;

architecture behavior of multiplexer_2_1_tb is



    component multiplexer_2_1
    port(
         s : in std_logic;
         in0, in1 : in  std_logic_vector(15 downto 0);
         z : out  std_logic_vector(15 downto 0)
        );
    end component;


   signal s : std_logic;
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');

   signal z : std_logic_vector(15 downto 0);
   

begin
   uut: multiplexer_2_1 PORT MAP (
          in0 => in0,
          in1 => in1,
          s => s,
          z => z
        );

   stim: process
   begin
      in0 <= "1111111100000000";
      in1 <= "1111111100000001";


      s <= '0';
      wait for 1 ns;
      s <= '1';

      wait for 1 ns;
      
   end process;

end;
