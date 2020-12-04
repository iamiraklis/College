----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 02:02:48 AM
-- Design Name: 
-- Module Name: extend_tb - Behavioral
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

entity extend_tb is
end extend_tb;

architecture Behavioral of extend_tb is

    component extend port (
        DR, SB : in std_logic_vector(2 downto 0);
        z : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal DR, SB : std_logic_vector(2 downto 0);
    signal z : std_logic_vector(15 downto 0);

begin

    uut : extend PORT MAP (
        DR => DR,
        SB => SB,
        z => z
    );
    
    stim : process
    begin
    
    DR <= "001";
    SB <= "010";
    wait for 1ns;
    DR <= "011";
    SB <= "100";
    wait for 1ns;
    DR <= "101";
    wait for 1ns;
    SB <= "110";

    end process;


end Behavioral;
