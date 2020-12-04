----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 07:23:44 PM
-- Design Name: 
-- Module Name: decoder_3_8_tb - Behavioral
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

ENTITY decoder_4_9_tb IS
END decoder_4_9_tb;

ARCHITECTURE behavior OF decoder_4_9_tb IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT decoder_4_9
Port ( A0 : in std_logic;
  A1 : in std_logic;
  A2 : in std_logic;
  A3 : in std_logic;
  Q0 : out std_logic;
  Q1 : out std_logic;
  Q2 : out std_logic;
  Q3 : out std_logic;
  Q4 : out std_logic;
  Q5 : out std_logic;
  Q6 : out std_logic;
  Q7 : out std_logic;
  Q8 : out std_logic);
END COMPONENT;



--Inputs
signal A0 : std_logic := '0';
signal A1 : std_logic := '0';
signal A2 : std_logic := '0';
signal A3 : std_logic := '0';
--Outputs
signal Q0 : std_logic := '0';
signal Q1 : std_logic := '0';
signal Q2 : std_logic := '0';
signal Q3 : std_logic := '0';
signal Q4 : std_logic := '0';
signal Q5 : std_logic := '0';
signal Q6 : std_logic := '0';
signal Q7 : std_logic := '0';
signal Q8 : std_logic := '0';

-- No clocks detected in port list. Replace <clock> below with
-- appropriate port name

--   constant Clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
UUT: decoder_4_9
Port Map(
A0 => A0,
A1 => A1,
A2 => A2,
A3 => A3,
Q0 => Q0,
Q1 => Q1,
Q2 => Q2,
Q3 => Q3,
Q4 => Q4,
Q5 => Q5,
Q6 => Q6,
Q7 => Q7,
Q8 => Q8
);

stim_proc: process
begin
  A0 <= '0';
  A1 <= '0';
  A2 <= '0';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '1';
  A1 <= '0';
  A2 <= '0';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '0';
  A1 <= '1';
  A2 <= '0';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '1';
  A1 <= '1';
  A2 <= '0';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '0';
  A1 <= '0';
  A2 <= '1';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '1';
  A1 <= '0';
  A2 <= '1';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '0';
  A1 <= '1';
  A2 <= '1';
  A3 <= '0';

  wait for 1 ns;

  A0 <= '1';
  A1 <= '1';
  A2 <= '1';
  A3 <= '0';
  
  wait for 1 ns;

  A0 <= '0';
  A1 <= '0';
  A2 <= '0';
  A3 <= '1';
  
   wait for 1 ns;

  A0 <= '1';
  A1 <= '0';
  A2 <= '0';
  A3 <= '1';
  
   wait for 1 ns;

  A0 <= '0';
  A1 <= '1';
  A2 <= '0';
  A3 <= '1';
  
   wait for 1 ns;

  A0 <= '1';
  A1 <= '1';
  A2 <= '0';
  A3 <= '1';
  
   wait for 1 ns;

  A0 <= '0';
  A1 <= '0';
  A2 <= '1';
  A3 <= '1';
  
   wait for 1 ns;

  A0 <= '1';
  A1 <= '0';
  A2 <= '1';
  A3 <= '1';
  
  wait for 1 ns;

  A0 <= '0';
  A1 <= '1';
  A2 <= '1';
  A3 <= '1';
  
  wait for 1 ns;

  A0 <= '1';
  A1 <= '1';
  A2 <= '1';
  A3 <= '1';

  wait for 1 ns;

end process;

END;