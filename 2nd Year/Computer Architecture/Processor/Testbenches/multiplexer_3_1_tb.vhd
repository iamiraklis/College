----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2020 02:57:39 AM
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer3_1_tb is
end multiplexer3_1_tb;
 
architecture behaviour of multiplexer3_1_tb is 
 
    component multiplexer3_1
    Port ( 
        in0, in1, in2 : in std_logic;
        s: in std_logic_vector(1 downto 0);
        z : out std_logic
    );
    end component;
    
    signal in0, in1, in2 :  std_logic;
    signal s :  std_logic_vector(1 downto 0);
    signal z :  std_logic;
 
begin

    uut: multiplexer3_1 port map (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          s => s,
          z => z
    );

   stim_proc: process

constant delay: Time := 1 ns;
    begin

        in0 <= '1';
        in1 <= '0';
        in2 <= '0';
        
        s <= "00";
        
        wait for delay;

        in0 <= '0';
        in1 <= '1';
        in2 <= '0';
        
        s <= "01";
        
        wait for delay;

        in0 <= '0';
        in1 <= '0';
        in2 <= '1';
        
        s <= "10";
        
        wait for delay;
        
   end process;   

end;
