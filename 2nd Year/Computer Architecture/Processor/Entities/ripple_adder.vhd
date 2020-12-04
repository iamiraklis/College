----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2020 02:13:48 AM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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
        c, v_out : out std_logic);
end ripple_adder;

architecture ripple_adder of ripple_adder is
    component full_adder 
    port(
        x, y, c_in : in std_logic;
        s, c_out : out std_logic
    );
    end component;

    signal c_out: std_logic_vector(15 downto 1);
    signal c_final : std_logic;
    
begin 

    FA0: full_adder
        port map (b(0), a(0), c_in, s(0), c_out(1));
    FA1: full_adder
        port map (b(1), a(1), c_out(1), s(1), c_out(2));
    FA2: full_adder
        port map (b(2), a(2), c_out(2), s(2), c_out(3));
    FA3: full_adder
        port map (b(3), a(3), c_out(3), s(3), c_out(4));
    FA4: full_adder
        port map (b(4), a(4), c_out(4), s(4), c_out(5));
    FA5: full_adder
        port map (b(5), a(5), c_out(5), s(5), c_out(6));
    FA6: full_adder
        port map (b(6), a(6), c_out(6), s(6), c_out(7));
    FA7: full_adder
        port map (b(7), a(7), c_out(7), s(7), c_out(8));
    FA8: full_adder
        port map (b(8), a(8), c_out(8), s(8), c_out(9));
    FA9: full_adder
        port map (b(9), a(9), c_out(9), s(9), c_out(10));
    FA10: full_adder
        port map (b(10), a(10), c_out(10), s(10), c_out(11));
    FA11: full_adder
        port map (b(11), a(11), c_out(11), s(11), c_out(12));
    FA12: full_adder
        port map (b(12), a(12), c_out(12), s(12), c_out(13));
    FA13: full_adder
        port map (b(13), a(13), c_out(13), s(13), c_out(14));
    FA14: full_adder
        port map (b(14), a(14), c_out(14), s(14), c_out(15));
    FA15: full_adder
        port map (b(15), a(15), c_out(15), s(15), c_final);

    c <= c_final;
    v_out <= (c_out(15) xor c_final);

end ripple_adder;