library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
    Port(
        a, b: in std_logic_vector(15 downto 0);
        c_in: in std_logic;
        s : out std_logic_vector(15 downto 0);
        c_out, v_out : out std_logic);
end ripple_adder;

architecture structure_ripple of ripple_adder is
    component full_adder 
    port(
        x, y, z : in std_logic;
        s, c : out std_logic
    );
    end component;

    signal c: std_logic_vector(15 downto 1);
    signal c_final : std_logic;
    
begin 

    Bit0: full_adder
        port map (b(0), a(0), c_in, s(0), c(1));
    Bit1: full_adder
        port map (b(1), a(1), c(1), s(1), c(2));
    Bit2: full_adder
        port map (b(2), a(2), c(2), s(2), c(3));
    Bit3: full_adder
        port map (b(3), a(3), c(3), s(3), c(4));
    Bit4: full_adder
        port map (b(4), a(4), c(4), s(4), c(5));
    Bit5: full_adder
        port map (b(5), a(5), c(5), s(5), c(6));
    Bit6: full_adder
        port map (b(6), a(6), c(6), s(6), c(7));
    Bit7: full_adder
        port map (b(7), a(7), c(7), s(7), c(8));
    Bit8: full_adder
        port map (b(8), a(8), c(8), s(8), c(9));
    Bit9: full_adder
        port map (b(9), a(9), c(9), s(9), c(10));
    Bit10: full_adder
        port map (b(10), a(10), c(10), s(10), c(11));
    Bit11: full_adder
        port map (b(11), a(11), c(11), s(11), c(12));
    Bit12: full_adder
        port map (b(12), a(12), c(12), s(12), c(13));
    Bit13: full_adder
        port map (b(13), a(13), c(13), s(13), c(14));
    Bit14: full_adder
        port map (b(14), a(14), c(14), s(14), c(15));
    Bit15: full_adder
        port map (b(15), a(15), c(15), s(15), c_final);

    c_out <= c_final;
    v_out <= (c(15) xor c_final);

end structure_ripple;