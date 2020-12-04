----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2020 08:22:20 PM
-- Design Name: 
-- Module Name: multiplexer3_1_tb - Behavioral
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
 
entity multiplexer3_1_tb IS
end multiplexer3_1_tb;
 
architecture behaviour OF multiplexer3_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component multiplexer3_1
    Port ( 
        in0, in1, in2 : in std_logic;
        s: in std_logic_vector(1 downto 0);
        z : out std_logic
    );
    end component;
    
    signal in0, in1, in2 :  std_logic;
    signal    s :  std_logic_vector(1 downto 0);
    signal     z :  std_logic;
 
begin

    uut: multiplexer3_1 port map (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          s => s,
          z => z
    );

   stim_proc: process

    begin

        in0 <= '1';
        in1 <= '0';
        in2 <= '0';
        
        s <= "00";
        
        wait for 10 ns;

        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        
        s <= "01";
        
        wait for 10 ns;

        in0 <= '0';
        in1 <= '0';
        in2 <= '1';
        
        s <= "10";
        
        wait for 10 ns;


    --     wait;
   end process;   

end;
