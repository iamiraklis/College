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

entity mux3to1 is
    Port(
        in0, in1, in2: in std_logic;
        s: in std_logic_vector(1 downto 0);
        Z: out std_logic
    );
end mux3to1;

architecture Behavioral of mux3to1 is
   
begin
    with s select
        Z <= in0 after 1 ns when "00",
             in1 after 1 ns when "01",
             in2 after 1 ns when "10",
             'U' after 1 ns when others;

end Behavioral ;