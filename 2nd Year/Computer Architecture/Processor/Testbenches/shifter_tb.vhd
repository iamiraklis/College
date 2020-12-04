----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 02:04:21 AM
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

entity shifter_tb is
end shifter_tb;

architecture Behavioral of shifter_tb is

    component shifter 
      port ( 
        b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        l, r : in std_logic;
        h : out std_logic_vector(15 downto 0)
      );
    end component;

    signal b, h : std_logic_vector(15 downto 0);
    signal s : std_logic_vector(1 downto 0);
    signal l, r : std_logic;
    
begin

     uut: shifter port map (
          b => b,
          s => s,
          l => l,
          r => r,
          h => h
        );

   stim_proc: process

constant delay: Time := 1 ns;

   begin
   
   b <= "1111111111111111";
   s <= "00";
   l <= '0';
   r <= '0';
   wait for delay;
   
   b <= "1111111111111111";
   s <= "01";
   wait for delay;
   
   s <= "10";
   wait for delay;
   
   end process;


end Behavioral;

