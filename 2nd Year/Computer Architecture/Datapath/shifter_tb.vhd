----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2020 08:51:15 PM
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity Shifter_tb is
--  Port ( );
end Shifter_tb;

architecture Behavioral of Shifter_tb is

    component Shifter 
      Port ( 
        b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        IL, IR : in std_logic;
        h : out std_logic_vector(15 downto 0)
      );
    end component;

    signal b, h : std_logic_vector(15 downto 0);
    signal s : std_logic_vector(1 downto 0);
    signal IL, IR : std_logic;
    
begin

     uut: Shifter port map (
          b => b,
          s => s,
          IL => IL,
          IR => IR,
          h => h
        );

   stim_proc: process

   begin
   
   b <= "1111111111111111";
   s <= "00";
   IL <= '0';
   IR <= '0';
   
   wait for 10 ns;
   
   b <= "1111111111111111";
   s <= "01";
   
   wait for 10 ns;
   
   s <= "10";
   
   wait for 10 ns;
   
   end process;


end Behavioral;
