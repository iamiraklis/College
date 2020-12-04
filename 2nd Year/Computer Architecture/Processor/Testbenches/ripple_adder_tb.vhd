----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2020 02:22:28 AM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity ripple_adder_tb IS
end ripple_adder_tb;
 
architecture behaviour OF ripple_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component ripple_adder
    Port (  a, b: in std_logic_vector(15 downto 0);
        c_in: in std_logic;
        s : out std_logic_vector(15 downto 0);
        c, v_out : out std_logic
    );
    end component;

   --Inputs
 
    signal a, b, s: std_logic_vector(15 downto 0);
    signal c_in, c, v_out: std_logic;
 
begin

    uut: ripple_adder port map (
          a => a,
          b => b,
          c_in => c_in,
          s => s,
          c => c,
          v_out => v_out
        );

   stim_proc: process
   
constant delay: Time := 1 ns;
   begin
       
     a <= "0000000000000000";
     b <= "0000000000000000";
     c_in <= '0';
     wait for delay;
     
     a <= "1010101010101010";
     wait for delay;
     
     b <= "0000000000000010";
     wait for delay;
     
     b <= a;
     wait for delay;
 
     b <= "0010000000000000";
     wait for delay;
    
     c_in <= '1';
     wait for delay;
     
   end process;   

end;