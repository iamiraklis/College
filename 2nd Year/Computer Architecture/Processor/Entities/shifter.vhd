----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 01:50:15 AM
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
  Port ( 
    b : in std_logic_vector(15 downto 0);
    s : in std_logic_vector(1 downto 0);
    l, r : in std_logic;
    h : out std_logic_vector(15 downto 0)
  );
end shifter;

architecture Behavioral of shifter is
    
    component multiplexer_3_1 is
      Port ( 
        in0, in1, in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic
      );
    end component;

begin

    shifter0: multiplexer_3_1 Port map (
		in0 => b(0),
		in1 => b(1),
		in2 => l,
		s => s,
		z => h(0)
    );
    
    shifter1: multiplexer_3_1 Port map (
		in0 => b(1),
		in1 => b(2),
		in2 => b(0),
        s => s,
		z => h(1)
    );
    
    shifter2: multiplexer_3_1 Port map (
		in0 => b(2),
		in1 => b(3),
		in2 => b(1),
		s => s,
		z => h(2)
    );
    
    shifter3: multiplexer_3_1 Port map (
		in0 => b(3),
		in1 => b(4),
		in2 => b(2),
		s => s,
		z => h(3)
    );
    
    shifter4: multiplexer_3_1 Port map (
		in0 => b(4),
		in1 => b(5),
		in2 => b(3),
		s => s,
		z => h(4)
    );
    
    shifter5: multiplexer_3_1 Port map (
		in0 => b(5),
		in1 => b(6),
		in2 => b(4),
		s => s,
		z => h(5)
    );
    
    shifter6: multiplexer_3_1 Port map (
		in0 => b(6),
		in1 => b(7),
		in2 => b(5),
		s => s,
		z => h(6)
    );
    
    shifter7: multiplexer_3_1 Port map (
		in0 => b(7),
		in1 => b(8),
		in2 => b(6),
		s => s,
		z => h(7)
    );
    
    shifter8: multiplexer_3_1 Port map (
		in0 => b(8),
		in1 => b(9),
		in2 => b(7),
		s => s,
		z => h(8)
    );
    
    shifter9: multiplexer_3_1 Port map (
		in0 => b(9),
		in1 => b(10),
		in2 => b(8),
		s => s,
		z => h(9)
    );
    
    shifter10: multiplexer_3_1 Port map (
		in0 => b(10),
		in1 => b(11),
		in2 => b(9),
		s => s,
		z => h(10)
    );
    
    shifter11: multiplexer_3_1 Port map (
		in0 => b(11),
		in1 => b(12),
		in2 => b(10),
		s => s,
		z => h(11)
    );
    
    shifter12: multiplexer_3_1 Port map (
		in0 => b(12),
		in1 => b(13),
		in2 => b(11),
		s => s,
		z => h(12)
    );
    
    shifter13: multiplexer_3_1 Port map (
		in0 => b(13),
		in1 => b(14),
		in2 => b(12),
		s => s,
		z => h(13)
    );
    
    shifter14: multiplexer_3_1 Port map (
		in0 => b(14),
		in1 => b(15),
		in2 => b(13),
		s => s,
		z => h(14)
    );
    
    shifter15: multiplexer_3_1 Port map (
		in0 => b(15),
		in1 => r,
		in2 => b(14),
		s => s,
		z => h(15)
    );

end Behavioral;