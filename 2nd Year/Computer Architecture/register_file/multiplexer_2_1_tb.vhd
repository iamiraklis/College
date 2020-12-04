----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02/14/2020 02:10:36 PM
-- Design Name:
-- Module Name: multiplexer_tb - Behavioral
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

entity multiplexer_2_1_tb is
--  Port ( );
end multiplexer_2_1_tb;

ARCHITECTURE behavior OF multiplexer_2_1_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT multiplexer_2_1
    PORT(
         s : IN  std_logic;
         in0 : IN  std_logic_vector(15 downto 0);
         in1 : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal s : std_logic;
   signal in0 : std_logic_vector(15 downto 0) := (others => '0');
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');

  --Outputs
   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

--   constant Clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer_2_1 PORT MAP (
          s => s,
          in0 => in0,
          in1 => in1,
          z => z
        );

   stim_proc: process
   begin
      in0 <= "1111111100000000";
      in1 <= "1111111100000001";

      s <= '0';

      wait for 5 ns;
      s <= '1';

      wait for 5 ns;

 --     wait;
   end process;

END;
