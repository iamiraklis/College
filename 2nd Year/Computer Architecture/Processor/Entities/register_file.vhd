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
 Port ( Clk, load_enabled : in std_logic;
        addr_a, addr_b: in std_logic_vector(3 downto 0);
        dest_d : in std_logic_vector(3 downto 0);
        data_src : in std_logic_vector(15 downto 0);
        out_a, out_b : out std_logic_vector(15 downto 0)
    );

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
COMPONENT decoder_4_9
PORT(
A0 : IN std_logic;
A1 : IN std_logic;
A2 : IN std_logic;
A3 : in std_logic;
Q0 : OUT std_logic;
Q1 : OUT std_logic;
Q2 : OUT std_logic;
Q3 : OUT std_logic;
Q4 : OUT std_logic;
Q5 : OUT std_logic;
Q6 : OUT std_logic;
Q7 : OUT std_logic;
Q8 : OUT std_logic
);
END COMPONENT;


-- 8 to 1 line multiplexer
COMPONENT multiplexer_9_1
PORT(
s : IN  std_logic_vector(2 downto 0);
in0, in1, in2, in3, in4, in5, in6, in7, in8 : IN  std_logic_vector(15 downto 0);
z : OUT  std_logic_vector(15 downto 0)
);
END COMPONENT;

-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, data_src_mux_out, src_reg : std_logic_vector(15 downto 0);
signal A0, A1, A2 : std_logic := '0';
--Outputs
signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8: std_logic := '0';

begin

reg00: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg0,
Clk => Clk,
Q => reg0_q
);

reg01: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg1,
Clk => Clk,
Q => reg1_q
);

reg02: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg2,
Clk => Clk,
Q => reg2_q
);

reg03: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg3,
Clk => Clk,
Q => reg3_q
);

reg04: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg4,
Clk => Clk,
Q => reg4_q
);

reg05: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg5,
Clk => Clk,
Q => reg5_q
);

reg06: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg6,
Clk => Clk,
Q => reg6_q
);

reg07: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg7,
Clk => Clk,
Q => reg7_q
);

reg08: reg8 PORT MAP(
D => data_src_mux_out,
load => load_reg8,
Clk => Clk,
Q => reg8_q
);
des_decoder_4_9: decoder_4_9 Port Map(
A0 => dest_d(0),
A1 => dest_d(1),
A2 => dest_d(2),
A3 => dest_d(3),
Q0 => load_reg0,
Q1 => load_reg1,
Q2 => load_reg2,
Q3 => load_reg3,
Q4 => load_reg4,
Q5 => load_reg5,
Q6 => load_reg6,
Q7 => load_reg7,
Q8 => load_reg8
);

inst_multiplexer9_1_0 : multiplexer_9_1 port map(
    s(0) => addr_b(0),
    s(1) => addr_b(1),
    s(2) => addr_b(2),
    in0 => reg0_q,
    in1 => reg1_q,
    in2 => reg2_q,
    in3 => reg3_q,
    in4 => reg4_q,
    in5 => reg5_q,
    in6 => reg6_q,
    in7 => reg7_q,
    in8 => reg8_q,
    z => out_b
  );
  
Inst_multiplexer_9_1: multiplexer_9_1 PORT MAP(
s(0) => addr_b(0),
    s(1) => addr_b(1),
    s(2) => addr_b(2),
    in0 => reg0_q,
    in1 => reg1_q,
    in2 => reg2_q,
    in3 => reg3_q,
    in4 => reg4_q,
    in5 => reg5_q,
    in6 => reg6_q,
    in7 => reg7_q,
    in8 => reg8_q,
    z => out_b
);
end Behavioral;
