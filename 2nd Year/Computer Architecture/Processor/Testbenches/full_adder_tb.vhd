----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2020 03:28:56 PM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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
use IEEE.std_logic_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is

    component full_adder
        port (
            x, y, c_in : in std_logic;
            s, c_out: out std_logic
        );
    end component;

    signal x : std_logic := '0';
    signal y : std_logic := '0';
    signal c_in : std_logic := '0';

    signal s : std_logic;
    signal c_out : std_logic;

begin

    uut : full_adder
        Port Map (
            x => x,
            y => y,
            c_in => c_in,
            s => s,
            c_out => c_out
        );

    sim : process

constant delay: Time := 1 ns;
    begin

        wait for delay;
        x <= '0';
        y <= '0';
        c_in <= '1';

        wait for delay;
        x <= '0';
        y <= '1';
        c_in <= '0';

        wait for delay;
        x <= '0';
        y <= '1';
        c_in <= '1';

        wait for delay;
        x <= '1';
        y <= '0';
        c_in <= '0';

        wait for delay;
        x <= '1';
        y <= '0';
        c_in <= '1';

        wait for delay;
        x <= '1';
        y <= '1';
        c_in <= '0';

        wait for delay;
        x <= '1';
        y <= '1';
        c_in <= '1';
        
        wait;

    end process;

end Behavioral;
