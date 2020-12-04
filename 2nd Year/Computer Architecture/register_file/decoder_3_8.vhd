----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 07:20:43 PM
-- Design Name: 
-- Module Name: decoder_3_8 - Behavioral
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

entity decoder_3_8
is
  Port ( A0 : in std_logic;
  A1 : in std_logic;
  A2 : in std_logic;
  Q0 : out std_logic;
  Q1 : out std_logic;
  Q2 : out std_logic;
  Q3 : out std_logic;
  Q4 : out std_logic;
  Q5 : out std_logic;
  Q6 : out std_logic;
  Q7 : out std_logic);
end decoder_3_8;

architecture Behavioral of decoder_3_8 is
 begin
    Q0<= ((not A0) and (not A1) and (not A2)) after 5 ns;
    Q1<= (A0 and (not A1) and (not A2)) after 5 ns;
    Q2<= ((not A0) and A1 and (not A2)) after 5 ns;
    Q3<= (A0 and A1 and (not A2)) after 5 ns;
    Q4<= ((not A0) and (not A1) and A2) after 5 ns;
    Q5<= (A0 and (not A1) and A2) after 5 ns;
    Q6<= ((not A0) and A1 and A2) after 5 ns;
    Q7<= (A0 and A1 and A2) after 5 ns;
  end Behavioral;
