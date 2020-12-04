----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 10:17:34 PM
-- Design Name: 
-- Module Name: microprogrammed_controller_tb - Behavioral
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

entity microprogrammed_controller_tb is
--  Port ( );
end microprogrammed_controller_tb;

architecture Behavioral of microprogrammed_controller_tb is

component microprogrammed_control
    Port (
         reset : in std_logic;
        Clk : in std_logic;
        VCNZ : in std_logic_vector(3 downto 0);
        IR_in : in std_logic_vector(15 downto 0);
        PC_out : out std_logic_vector(15 downto 0);
        TD_DR_out, TD_SA_out, TB_SB_out : out std_logic_vector(3 downto 0);
        FS_out : out std_logic_vector(4 downto 0);
        MB_out, MD_out, MM_out, RW_out, MW_out : out std_logic
    );
end component;

    signal reset : std_logic;
    signal Clk : std_logic := '0';
    signal VCNZ : std_logic_vector(3 downto 0);
    signal IR_in : std_logic_vector(15 downto 0);
    signal TD_DR_out, TD_SA_out, TB_SB_out : std_logic_vector(3 downto 0);
    signal FS_out : std_logic_vector(4 downto 0);
    signal MB_out, MD_out, MM_out, RW_out, MW_out : std_logic;
    signal PC_out : std_logic_vector(15 downto 0);
    

begin

    
    uut : microprogrammed_control PORT MAP (
        reset => reset,
        Clk => Clk,
        VCNZ => VCNZ,
        IR_in => IR_in,
        TD_DR_out => TD_DR_out,
        TD_SA_out => TD_SA_out,
        TB_SB_out => TB_SB_out,
        FS_out => FS_out,
        MB_out => MB_out,
        MD_out => MD_out,
        MM_out => MM_out,
        RW_out => RW_out,
        MW_out => MW_out,
        PC_out => PC_out
    );
    
    stim_proc : process
    begin

    reset <= '1';
    VCNZ <= "0000";
    IR_in <= "0000000000000000";
    
    wait for 1ns;
    VCNZ <= "0001";
    reset <= '0';
    wait for 1ns;
    VCNZ <= "0010";
    IR_in <= "0000000001001001";
    wait for 1ns;
    VCNZ <= "0011";
    IR_in <= "0000000101001001";
    wait for 1ns;
    
     VCNZ <= "0100";
    IR_in <= "0000001010010010";
    wait for 1ns;
    
     VCNZ <= "0101";
    IR_in <= "0000001111011011";
    wait for 1ns;
    
     VCNZ <= "0110";
    IR_in <= "0000010011100100";
    wait for 1ns;
    
     VCNZ <= "0111";
    IR_in <= "0000110010100101";
    wait for 1ns;
    
    VCNZ <= "1000";
    IR_in <= "0001110010101001";
    wait for 1ns;
    
    VCNZ <= "1001";
    IR_in <= "0000010010100111";
    wait for 1ns;
    
    VCNZ <= "1010";
    IR_in <= "0110010010100101";
    wait for 1ns;
    
    VCNZ <= "1011";
    IR_in <= "0001010010101010";
    wait for 1ns;

    VCNZ <= "1100";
    IR_in <= "0110110110101101";
    wait for 1ns;
    
    VCNZ <= "1101";
    IR_in <= "0100010001001110";
    wait for 1ns;
    
     VCNZ <= "1111";
    IR_in <= "1010110110100101";
    wait for 1ns;
    end process;
    
end Behavioral;