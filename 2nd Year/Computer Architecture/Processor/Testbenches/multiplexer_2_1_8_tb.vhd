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

ENTITY multiplexer_2_1_8_tb IS
END multiplexer_2_1_8_tb;

ARCHITECTURE behavior OF multiplexer_2_1_8_tb IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT multiplexer_2_1_8
Port ( 
    in0, in1 : in std_logic_vector(7 downto 0);
    s : in std_logic;
    z : out std_logic_vector(7 downto 0)
  );
END COMPONENT;


--Inputs
signal s : std_logic;
signal in0 : std_logic_vector(7 downto 0) := (others => '0');
signal in1 : std_logic_vector(7 downto 0) := (others => '0');


--Outputs
signal z : std_logic_vector(7 downto 0);
-- No clocks detected in port list. Replace <clock> below with
-- appropriate port name


BEGIN

uut: multiplexer_2_1_8 PORT MAP (
s => s,
in0 => in0,
in1 => in1,
z => z
);

stim_proc: process
begin
  in0 <= "11110000";
  in1 <= "11110001";

  s <= '0';

  wait for 1 ns;
  s <= '1';

wait for 1 ns;
end process;

END;
