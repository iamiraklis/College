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
            in1, in2, c_in : in std_logic;
            sum, c_out: out std_logic
        );
    end component;

    signal in1 : std_logic := '0';
    signal in2 : std_logic := '0';
    signal c_in : std_logic := '0';

    signal sum : std_logic;
    signal c_out : std_logic;

begin

    uut : full_adder
        Port Map (
            in1 => in1,
            in2 => in2,
            c_in => c_in,
            sum => sum,
            c_out => c_out
        );

    sim : process

constant gate_delay_1: Time := 10 ns;
    begin

        wait for gate_delay_1;
        in1 <= '0';
        in2 <= '0';
        c_in <= '1';

        wait for gate_delay_1;
        in1 <= '0';
        in2 <= '1';
        c_in <= '0';

        wait for gate_delay_1;
        in1 <= '0';
        in2 <= '1';
        c_in <= '1';

        wait for gate_delay_1;
        in1 <= '1';
        in2 <= '0';
        c_in <= '0';

        wait for gate_delay_1;
        in1 <= '1';
        in2 <= '0';
        c_in <= '1';

        wait for gate_delay_1;
        in1 <= '1';
        in2 <= '1';
        c_in <= '0';

        wait for gate_delay_1;
        in1 <= '1';
        in2 <= '1';
        c_in <= '1';
        
        wait;

    end process;

end Behavioral;
