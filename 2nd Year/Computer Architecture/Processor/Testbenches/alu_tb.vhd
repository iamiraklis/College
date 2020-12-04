----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 03:46:01 AM
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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



entity alu_tb IS
end alu_tb;
 
architecture behaviour OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component alu
    Port ( 
        a, b : in std_logic_vector(15 downto 0);
        g_in : in std_logic_vector(3 downto 0);
        v, c : out std_logic;
        g : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal a, b, g : std_logic_vector(15 downto 0);
    signal g_in : std_logic_vector(3 downto 0);
    signal v, c : std_logic;
 
begin

    uut: alu port map (
          a => a,
          b => b, 
          g_in => g_in,
          v => v,
          c => c, 
          g => g
    );

   stim_proc: process

 constant delay: Time := 1 ns;
 
    begin

    a <= "1001100110011001";
    b <= "1111111111111111";
    g_in <= "0000";
    
    wait for delay;
    g_in <= "0001";
    
    wait for delay;
    g_in <= "0010";
    
    wait for delay;
    g_in <= "0010";
    
    wait for delay;
    g_in <= "0011";
    
    wait for delay;
    g_in <= "0100";
    
    wait for delay;
    g_in <= "0101";
    
    wait for delay;
    g_in <= "0110";
    
    wait for delay;
    g_in <= "0111";
    
    wait for delay;
    g_in <= "1000";
    
    wait for delay;
    g_in <= "1001";
    
    wait for delay;
    g_in <= "1010";
    
    wait for delay;
    g_in <= "1011";
    
    wait for delay;
    g_in <= "1100";
    
    wait for delay;
    g_in <= "1101";
    
    wait for delay;
    g_in <= "1110";
    
    wait for delay;
    g_in <= "1111";
    
   end process;   

end;
