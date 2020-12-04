--------------------------------------------------------------------------------
-- Company: Trinity College
-- Engineer: Dr. Michael Manzke
--
-- Create Date:   11:50:59 02/23/2012
-- Design Name:
-- Module Name:   C:/Xilinx/12.4/ISE_DS/ISE/ISEexamples/MichaelsMultiplexer/multiplexer_tb.vhd
-- Project Name:  MichaelsMultiplexer
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: multiplexer
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY multiplexer_9_1_tb IS
END multiplexer_9_1_tb;

ARCHITECTURE behavior OF multiplexer_9_1_tb IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT multiplexer_9_1
Port (in0, in1, in2, in3, in4, in5, in6, in7, in8: in std_logic_vector (15 downto 0);
  s: in std_logic_vector(2 downto 0);
  z: out std_logic_vector (15 downto 0));
END COMPONENT;


--Inputs
signal s : std_logic_vector(2 downto 0) := (others => '0');
signal in0 : std_logic_vector(15 downto 0) := (others => '0');
signal in1 : std_logic_vector(15 downto 0) := (others => '0');
signal in2 : std_logic_vector(15 downto 0) := (others => '0');
signal in3 : std_logic_vector(15 downto 0) := (others => '0');
signal in4 : std_logic_vector(15 downto 0) := (others => '0');
signal in5 : std_logic_vector(15 downto 0) := (others => '0');
signal in6 : std_logic_vector(15 downto 0) := (others => '0');
signal in7 : std_logic_vector(15 downto 0) := (others => '0');
signal in8 : std_logic_vector(15 downto 0) := (others => '0');


--Outputs
signal z : std_logic_vector(15 downto 0);


BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: multiplexer_9_1 PORT MAP (
s => s,
in0 => in0,
in1 => in1,
in2 => in2,
in3 => in3,
in4 => in4,
in5 => in5,
in6 => in6,
in7 => in7,
in8 => in8,
z => z
);

stim_proc: process
begin
  in0 <= "1111111100000000";
  in1 <= "1111111100000001";
  in2 <= "1111111100000010";
  in3 <= "1111111100000011";
  in4 <= "1111111100000100";
  in5 <= "1111111100000101";
  in6 <= "1111111100000110";
  in7 <= "1111111100000111";
  in8 <= "1111111100001000";

  s <= "000";

  wait for 1 ns;
  s <= "001";

  wait for 1 ns;
  s <= "010";

  wait for 1 ns;
  s <= "011";

  wait for 1 ns;
  s <= "100";

  wait for 1 ns;
  s <= "101";

  wait for 1 ns;
  s <= "110";

  wait for 1 ns;
  s <= "111";
  
   wait for 1 ns;
  s <= "000";

wait for 1 ns;
end process;

END;
