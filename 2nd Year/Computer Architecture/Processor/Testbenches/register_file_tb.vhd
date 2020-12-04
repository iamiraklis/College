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

entity register_file_tb is
--  Port ( );
end register_file_tb;

ARCHITECTURE behavior OF register_file_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT register_file
    PORT(
    src_s: in std_logic_vector(2 downto 0);
    src_s0 : in std_logic;
    src_s1 : in std_logic;
    des_A0 : in std_logic;
    des_A1 : in std_logic;
    des_A2 : in std_logic;
    Clk : in std_logic;
    Q : out std_logic_vector(15 downto 0);
    data_src : in std_logic;
    data : in std_logic_vector(15 downto 0);
    reg0 :  out std_logic_vector(15 downto 0);
reg1 :  out std_logic_vector(15 downto 0);
reg2 :  out std_logic_vector(15 downto 0);
reg3 :  out std_logic_vector(15 downto 0);
reg4 :  out std_logic_vector(15 downto 0);
reg5 :  out std_logic_vector(15 downto 0);
reg6 :  out std_logic_vector(15 downto 0);
reg7 :  out std_logic_vector(15 downto 0)
);
    END COMPONENT;


   --Inputs
  signal src_s :  std_logic_vector(2 downto 0);
  signal src_s0 : std_logic;
  signal src_s1 : std_logic;
  signal des_A0 : std_logic;
  signal des_A1 : std_logic;
  signal des_A2 : std_logic;
  signal Clk : std_logic;
  signal Q : std_logic_vector(15 downto 0);
  signal data_src : std_logic;
  signal data : std_logic_vector(15 downto 0);
  signal reg0 :  std_logic_vector(15 downto 0);
  signal reg1 :  std_logic_vector(15 downto 0);
  signal reg2 :  std_logic_vector(15 downto 0);
  signal reg3 :  std_logic_vector(15 downto 0);
  signal reg4 :  std_logic_vector(15 downto 0);
  signal reg5 :  std_logic_vector(15 downto 0);
  signal reg6 :  std_logic_vector(15 downto 0);
 signal reg7  :  std_logic_vector(15 downto 0);
   constant clk_period : time := 10ns;
BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: register_file PORT MAP (
        src_s => src_s,
       src_s0 => src_s0,
       src_s1 => src_s1,
       des_A0 => des_A0,
       des_A1 => des_A1,
       des_A2 => des_A2,
       data_src => data_src,
       Clk => Clk,
       data => data,
       Q => Q,
       reg0 => reg0,
       reg1 => reg1,
       reg2 => reg2,
       reg3 => reg3,
       reg4 => reg4,
       reg5 => reg5,
       reg6 => reg6,
       reg7 => reg7
     );

   clk_prc: process
   begin
		Clk <= '0';
		wait for clk_period/2;
		Clk <= '1';
		wait for clk_period/2;
   end process;

   stim_proc: process
      begin
   		wait for 10ns;
   		des_a0 <= '0';
   		des_a1 <= '0';
   		des_a2 <= '0';
   		data <= "1111111111111111";

   		wait for 10ns;
   		des_a0 <= '0';
   		des_a1 <= '0';
   		des_a2 <= '1';
   		data <= "1110111011101110";

   		wait for 10ns;
   		des_a0 <= '0';
   		des_a1 <= '1';
   		des_a2 <= '0';
   		data <= "1101110111011101";

   		wait for 10ns;
   		des_a0 <= '0';
   		des_a1 <= '1';
   		des_a2 <= '1';
   		data <= "1100110011001100";

   		wait for 10ns;
   		des_a0 <= '1';
   		des_a1 <= '0';
   		des_a2 <= '0';
   		data <= "1011101110111011";

   		wait for 10ns;
   		des_a0 <= '1';
   		des_a1 <= '0';
   		des_a2 <= '1';
   		data <= "1010101010101010";

   		wait for 10ns;
   		des_a0 <= '1';
   		des_a1 <= '1';
   		des_a2 <= '0';
   		data <= "1001100110011001";

   		wait for 10ns;
   		des_a0 <= '1';
   		des_a1 <= '1';
   		des_a2 <= '1';
   		data <= "1000100010001000";
      end process;

   END;
