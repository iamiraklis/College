----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2020 04:21:06 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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
entity register_file is
Port (
src_s: in std_logic_vector(2 downto 0);
src_s0 : in std_logic;
src_s1 : in std_logic;
des_A0 : in std_logic;
des_A1 : in std_logic;
des_A2 : in std_logic;
Clk : in std_logic;
data_src : in std_logic;
data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0);
reg0 :  out std_logic_vector(15 downto 0);
reg1 :  out std_logic_vector(15 downto 0);
reg2 :  out std_logic_vector(15 downto 0);
reg3 :  out std_logic_vector(15 downto 0);
reg4 :  out std_logic_vector(15 downto 0);
reg5 :  out std_logic_vector(15 downto 0);
reg6 :  out std_logic_vector(15 downto 0);
reg7 :  out std_logic_vector(15 downto 0));

end register_file;

  architecture Behavioral of register_file is
-- components
-- 16 bit Register for register file
COMPONENT reg8
PORT(
D : IN std_logic_vector(15 downto 0);
load : IN std_logic;
Clk : IN std_logic;
Q : OUT std_logic_vector(15 downto 0)
);
END COMPONENT;

-- 3 to 4 Decoder
COMPONENT decoder_3_8
PORT(
A0 : IN std_logic;
A1 : IN std_logic;
A2 : IN std_logic;
Q0 : OUT std_logic;
Q1 : OUT std_logic;
Q2 : OUT std_logic;
Q3 : OUT std_logic;
Q4 : OUT std_logic;
Q5 : OUT std_logic;
Q6 : OUT std_logic;
Q7 : OUT std_logic
);
END COMPONENT;

-- 2 to 1 line multiplexer
COMPONENT multiplexer_2_1
PORT(
     s : IN  std_logic;
     in0 : IN  std_logic_vector(15 downto 0);
     in1 : IN  std_logic_vector(15 downto 0);
     z : OUT  std_logic_vector(15 downto 0)
    );
END COMPONENT;

-- 8 to 1 line multiplexer
COMPONENT multiplexer_8_1
PORT(
s : IN  std_logic_vector(2 downto 0);
in0 : IN  std_logic_vector(15 downto 0);
in1 : IN  std_logic_vector(15 downto 0);
in2 : IN  std_logic_vector(15 downto 0);
in3 : IN  std_logic_vector(15 downto 0);
in4 : IN  std_logic_vector(15 downto 0);
in5 : IN  std_logic_vector(15 downto 0);
in6 : IN  std_logic_vector(15 downto 0);
in7 : IN  std_logic_vector(15 downto 0);
z : OUT  std_logic_vector(15 downto 0)
);
END COMPONENT;

-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
signal A0 : std_logic := '0';
signal A1 : std_logic := '0';
signal A2 : std_logic := '0';
--Outputs
signal Q0 : std_logic := '0';
signal Q1 : std_logic := '0';
signal Q2 : std_logic := '0';
signal Q3 : std_logic := '0';
signal Q4 : std_logic := '0';
signal Q5 : std_logic := '0';
signal Q6 : std_logic := '0';
signal Q7 : std_logic := '0';

begin
-- port maps ;-)
-- register 0
reg00: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg0,
Clk => Clk,
Q => reg0_q
);
-- register 1
reg01: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg1,
Clk => Clk,
Q => reg1_q
);

-- register 2
reg02: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg2,
Clk => Clk,
Q => reg2_q
);
-- register 3
reg03: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg3,
Clk => Clk,
Q => reg3_q
);
-- register 4
reg04: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg4,
Clk => Clk,
Q => reg4_q
);
-- register 5
reg05: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg5,
Clk => Clk,
Q => reg5_q
);
-- register 6
reg06: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg6,
Clk => Clk,
Q => reg6_q
);
-- register 7
reg07: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg7,
Clk => Clk,
Q => reg7_q
);
-- Destination register decoder
des_decoder_3_8: decoder_3_8 Port Map(
A0 => des_A0,
A1 => des_A1,
A2 => des_A2,
Q0 => load_reg0,
Q1 => load_reg1,
Q2 => load_reg2,
Q3 => load_reg3,
Q4 => load_reg4,
Q5 => load_reg5,
Q6 => load_reg6,
Q7 => load_reg7
);

-- 2 to 1 Data source multiplexer
data_src_multiplexer_2_1: multiplexer_2_1 PORT MAP(
In0 => data,
In1 => src_reg,
s => data_src,
Z => data_src_mux_out
);
-- 8 to 1 source register multiplexer
Inst_multiplexer_8_1: multiplexer_8_1 PORT MAP(
In0 => reg0_q,
In1 => reg1_q,
In2 => reg2_q,
In3 => reg3_q,
In4 => reg4_q,
In5 => reg5_q,
In6 => reg6_q,
In7 => reg7_q,
s => src_s,
Z => src_reg
);
       reg0 <= reg0_q;
       reg1 <= reg1_q;
       reg2 <= reg2_q;
       reg3 <= reg3_q;
       reg4 <= reg4_q;
       reg5 <= reg5_q;
       reg6 <= reg6_q;
       reg7 <= reg7_q;
end Behavioral;
