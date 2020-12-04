library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
    Port (
        opcode : in std_logic_vector(7 downto 0);
        load, clk, reset : in std_logic;
        car_out : buffer std_logic_vector(7 downto 0)
    );
end car;


architecture Behavioral of car is

begin

process(clk)

begin
    if reset = '1' then
        car_out <= X"00";
    else
        if(rising_edge(clk) and load = '1') then
            if load = '1' then
                car_out <= opcode;
            else
                car_out <= car_out + 1 after 1 ns;
            end if;
        end if;
    end if;
end process;

end Behavioral;