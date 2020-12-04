--------------------------------------------------------------------------------
-- Company: Trinity College
-- Engineer: Luke Hackett
--
-- Create Date:   11:50:59 02/23/2012
-- Design Name:   
-- Module Name:   ripple_adder_tb
-- Project Name:  Register file
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
--------------------------------------------------------------------------------
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
        c_out, v_out : out std_logic
    );
    end component;

   --Inputs
 
    signal a, b, s: std_logic_vector(15 downto 0);
    signal c_in, c_out, v_out: std_logic;
 
begin

    uut: ripple_adder port map (
          a => a,
          b => b,
          c_in => c_in,
          s => s,
          c_out => c_out,
          v_out => v_out
        );

   stim_proc: process

   begin
       
     a <= "0000000000000000";
     b <= "0000000000000000";
     c_in <= '0';
     wait for 10 ns;
     
     a <= "1010101010101010";
     
     wait for 10 ns;
     
     b <= "0000000000000001";
 
     wait for 10 ns;
     
     b <= a;
     
     wait for 10 ns;
 
     b <= "1000000000000000";
    
     wait for 10 ns;
    
     c_in <= '1';
     
     wait for 10 ns;
    
    --     wait;
   end process;   

end;