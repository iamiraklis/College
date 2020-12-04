----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 03:31:42 AM
-- Design Name: 
-- Module Name: microprogrammed_control - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity microprogrammed_control is
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
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is

component car port (
        opcode : in std_logic_vector(7 downto 0);
        load, clk, reset : in std_logic;
        car_out : buffer std_logic_vector(7 downto 0)
);
end component;

component program_counter Port(	
    extend : in std_logic_vector(15 downto 0);
    PL, PI, reset : in std_logic;
    pc_out : out std_logic_vector(15 downto 0)
);

end component;

component extend Port(
    DR : in  std_logic_vector(2 downto 0);
    SB : in  std_logic_vector(2 downto 0);
    z : out  std_logic_vector(15 downto 0)
);
end component;

component instruction_register Port(
            IR : in std_logic_vector(15 downto 0);
			IL : in std_logic;
			opcode :  out std_logic_vector(6 downto 0);
			DR, SA, SB : out std_logic_vector(2 downto 0)
);
end component;

component control_memory256x28 Port(
  MW : out std_logic;
  MM : out std_logic;
  RW : out std_logic;
  MD : out std_logic;
  FS : out std_logic_vector(4 downto 0);
  MB : out std_logic;
  TB : out std_logic;
  TA : out std_logic;
  TD : out std_logic;
  PL : out std_logic;
  PI : out std_logic;
  IL : out std_logic;
  MC : out std_logic;
  MS : out std_logic_vector(2 downto 0);
  NA : out std_logic_vector(7 downto 0);
  IN_CAR : in std_logic_vector(7 downto 0)
        );
end component;

component multiplexer8_1_1 port (
    in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
    s : in std_logic_vector(2 downto 0);
    Z : out std_logic
);
end component;

component multiplexer_2_1_8 port (
    in0, in1 : in std_logic_vector(7 downto 0);
    s : in std_logic;
    Z : out std_logic_vector(7 downto 0)
);
end component;

    signal PI, PL, IL, mux_8_1_s_out, mux_2_1_c : std_logic;
    signal not_ZC : std_logic_vector(1 downto 0);
    signal DR, SA, SB, mux_8_1_s : std_logic_vector(2 downto 0);
    signal NA, car_out, opcode, mux_2_1_c_out : std_logic_vector(7 downto 0);
    signal pc_value, extend_out : std_logic_vector(15 downto 0);

begin

    prog_counter : program_counter port map (
        reset => reset,
        extend => extend_out,
        PI => PI,
        PL => PL,
        pc_out => pc_value
    );
    
    extend0 : extend port map (
        DR => DR,
        SB => SB,
        z => extend_out
    );
    
    TD_DR_out(2 downto 0) <= DR;
    TD_SA_out(2 downto 0) <= SA;
    TB_SB_out(2 downto 0) <= SB;
    
    inst_register : instruction_register port map (
        IR => IR_in,
        IL => IL,
        opcode => opcode(6 downto 0),
        DR => DR,
        SA => SA,
        SB => SB
    );
    
    opcode(7) <= '0';
    
    car0 : car port map (
        reset => reset,
        opcode => mux_2_1_c_out,
        load => mux_8_1_s_out,
        Clk => Clk,
        car_out => car_out
    );
    
    ctrl_mem0 : control_memory256x28 port map (
        in_car => car_out,
        FS => FS_out,
        MW => MW_out,
        MM => MM_out,
        RW => RW_out,
        MD => MD_out,
        MB => MB_out,
        TB => TB_SB_out(3),
        TA => TD_SA_out(3),
        TD => TD_DR_out(3),
        PL => PL,
        PI => PI,
        IL => IL,
        MC => mux_2_1_c,
        MS => mux_8_1_s,
        NA => NA
    );
    mux2_1_C : multiplexer_2_1_8 port map (
        in0 => NA,
        in1 => opcode,
        s => mux_2_1_c,
        Z => mux_2_1_c_out
    );
    
        not_ZC(0) <= not VCNZ(2);
        not_ZC(1) <= not VCNZ(0);
    
    mux8_1_S : multiplexer8_1_1 port map (
        in0 => '0',
        in1 => '1',
        in2 => VCNZ(2),
        in3 => VCNZ(3),
        in4 => VCNZ(0),
        in5 => VCNZ(1),
        in6 => not_ZC(0),
        in7 => not_ZC(1),
        s => mux_8_1_s,
        Z => mux_8_1_s_out
    );
    
PC_out <= pc_value;

end Behavioral;