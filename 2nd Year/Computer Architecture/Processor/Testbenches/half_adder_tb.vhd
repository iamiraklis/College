----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2020 01:29:57 AM
-- Design Name: 
-- Module Name: half_adder_tb - Behavioral
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

entity half_adder_tb is 
end half_adder_tb;

architecture Behavioral of half_adder_tb is

component half_adder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;
    -- inputs
    signal x: STD_LOGIC :='0';
    signal y: STD_LOGIC :='0';
    
    -- outputs
    signal s: STD_LOGIC;
    signal c_out: STD_LOGIC;
    
    
    constant delay: time:= 1 ns;

begin

    uut: half_adder port map(
        x=>x,
        y=>y,
        s=>s,
        c_out =>c_out
    );
    
    process
        begin
            wait for delay;
            x <= '1';
            wait for delay;
            y <= '1';
            wait for delay;
            x <= '0';
            wait for delay;
        end process;
        


end Behavioral;