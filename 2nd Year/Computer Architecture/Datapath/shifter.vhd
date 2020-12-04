library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifter is
  Port ( 
    b : in std_logic_vector(15 downto 0);
    s : in std_logic_vector(1 downto 0);
    IL, IR : in std_logic;
    h : out std_logic_vector(15 downto 0)
  );
end Shifter;

architecture Behavioral of Shifter is
    
    component multiplexer3_1 is
      Port ( 
        in0, in1, in2 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        z : out std_logic
      );
    end component;

begin

    multiplexer31_00: multiplexer3_1 Port map (
		in0 => b(0),
		in1 => b(1),
		in2 => IL,
		s => s,
		z => h(0)
    );
    
    multiplexer31_01: multiplexer3_1 Port map (
		in0 => b(1),
		in1 => b(2),
		in2 => b(0),
        s => s,
		z => h(1)
    );
    
    multiplexer31_02: multiplexer3_1 Port map (
		in0 => b(2),
		in1 => b(3),
		in2 => b(1),
		s => s,
		z => h(2)
    );
    
    multiplexer31_03: multiplexer3_1 Port map (
		in0 => b(3),
		in1 => b(4),
		in2 => b(2),
		s => s,
		z => h(3)
    );
    
    multiplexer31_04: multiplexer3_1 Port map (
		in0 => b(4),
		in1 => b(5),
		in2 => b(3),
		s => s,
		z => h(4)
    );
    
    multiplexer31_05: multiplexer3_1 Port map (
		in0 => b(5),
		in1 => b(6),
		in2 => b(4),
		s => s,
		z => h(5)
    );
    
    multiplexer31_06: multiplexer3_1 Port map (
		in0 => b(6),
		in1 => b(7),
		in2 => b(5),
		s => s,
		z => h(6)
    );
    
    multiplexer31_07: multiplexer3_1 Port map (
		in0 => b(7),
		in1 => b(8),
		in2 => b(6),
		s => s,
		z => h(7)
    );
    
    multiplexer31_08: multiplexer3_1 Port map (
		in0 => b(8),
		in1 => b(9),
		in2 => b(7),
		s => s,
		z => h(8)
    );
    
    multiplexer31_09: multiplexer3_1 Port map (
		in0 => b(9),
		in1 => b(10),
		in2 => b(8),
		s => s,
		z => h(9)
    );
    
    multiplexer31_10: multiplexer3_1 Port map (
		in0 => b(10),
		in1 => b(11),
		in2 => b(9),
		s => s,
		z => h(10)
    );
    
    multiplexer31_11: multiplexer3_1 Port map (
		in0 => b(11),
		in1 => b(12),
		in2 => b(10),
		s => s,
		z => h(11)
    );
    
    multiplexer31_12: multiplexer3_1 Port map (
		in0 => b(12),
		in1 => b(13),
		in2 => b(11),
		s => s,
		z => h(12)
    );
    
    multiplexer31_13: multiplexer3_1 Port map (
		in0 => b(13),
		in1 => b(14),
		in2 => b(12),
		s => s,
		z => h(13)
    );
    
    multiplexer31_14: multiplexer3_1 Port map (
		in0 => b(14),
		in1 => b(15),
		in2 => b(13),
		s => s,
		z => h(14)
    );
    
    multiplexer31_15: multiplexer3_1 Port map (
		in0 => b(15),
		in1 => IR,
		in2 => b(14),
		s => s,
		z => h(15)
    );

end Behavioral;