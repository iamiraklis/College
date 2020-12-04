----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 02:54:43 AM
-- Design Name: 
-- Module Name: inputLogic_2 - Behavioral
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

entity inputLogic_2 is
	Port(
		b : in std_logic_vector(15 downto 0);
		s_in : in std_logic_vector(1 downto 0);
		b_out : out std_logic_vector(15 downto 0)
	);
end inputLogic_2;

architecture behavioral of inputLogic_2 is
	
	
	Component mux2_1
	Port(
		s, in0, in1 : in std_logic;
		Z : out std_logic
	);
	end Component;

begin
	input0: mux2_1 port map(
		s => b(0),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(0)
	);
	
	input1: mux2_1 port map(
		s => b(1),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(1)
	);
	
	input2: mux2_1 port map(
		s => b(2),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(2)
	);
	
	input3: mux2_1 port map(
		s => b(3),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(3)
	);
	
	input4: mux2_1 port map(
		s => b(4),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(4)
	);
	
	input5: mux2_1 port map(
		s => b(5),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(5)
	);
	
	input6: mux2_1 port map(
		s => b(6),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(6)
	);
	
	input7: mux2_1 port map(
		s => b(7),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(7)
	);
	
	input8: mux2_1 port map(
		s => b(8),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(8)
	);
	
	input9: mux2_1 port map(
		s => b(9),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(9)
	);
	
	input10: mux2_1 port map(
		s => b(10),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(10)
	);
	
	input11: mux2_1 port map(
		s => b(11),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(11)
	);
	
	input12: mux2_1 port map(
		s => b(12),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(12)
	);
	
	input13: mux2_1 port map(
		s => b(13),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(13)
	);
	
	input14: mux2_1 port map(
		s => b(14),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(14)
	);
	
	input15: mux2_1 port map(
		s => b(15),
		in0 => s_in(0),
		in1 => s_in(1),
		Z => b_out(15)
	);

end behavioral;