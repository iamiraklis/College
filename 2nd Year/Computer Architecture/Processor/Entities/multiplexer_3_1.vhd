----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2020 08:20:17 PM
-- Design Name: 
-- Module Name: multiplexer_3_1 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_3_1 is
    Port ( s : in STD_LOGIC_VECTOR (1 downto 0);
           in0, in1, in2 : in std_logic;
           z : out std_logic);
end multiplexer_3_1;

architecture Behavioral of multiplexer_3_1 is

begin
    Z <=  in0 after 1ns when s = "00" else
          in1 after 1ns when s = "01" else
          in2 after 1ns when s = "10" else
          '0' after 1ns;
end Behavioral;