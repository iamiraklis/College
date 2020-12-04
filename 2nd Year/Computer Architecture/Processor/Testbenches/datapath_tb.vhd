----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 06:30:08 PM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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

entity datapath_tb is
--  Port ( );
end datapath_tb;

architecture Behavioral of datapath_tb is

    component datapath is
        Port ( 
            data_in, const : in std_logic_vector(15 downto 0);
            control : in std_logic_vector(16 downto 0);
            Clk : in std_logic;
            addr_out, data_out : out std_logic_vector(15 downto 0);
            v, c, n, z : out std_logic
        );
    end component;
--input
    signal data_in, const : std_logic_vector(15 downto 0);
    signal control : std_logic_vector(16 downto 0);
    signal Clk :  std_logic;
--output
    signal addr_out, data_out : std_logic_vector(15 downto 0);
    signal v, c, n, z : std_logic;

begin

     uut: datapath port map (
          data_in => data_in,
          const => const,
          control => control,
          Clk => Clk,
          addr_out => addr_out,
          data_out => data_out,
          v => v,
          c => c,
          n => n,
          z => z
    );

   stim_proc: process

 constant delay: Time := 1 ns;

    begin

        data_in <= "1011111011101111";
		const <= "0000000000000000";
		control <= "00010000100000001";
		
		wait for delay;
		data_in <= "1111010011101101";
		control <= "00100100000100011";
		
		wait for delay;
		control <= "01000000100101001";
		
		wait for delay;
        control <= "00000001010001000";

       wait;
   end process;   

end Behavioral;
