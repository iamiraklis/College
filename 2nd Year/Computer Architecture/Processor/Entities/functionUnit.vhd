----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 03:52:47 PM
-- Design Name: 
-- Module Name: functionUnit - Behavioral
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

entity functionUnit is
  Port ( 
    a_in, b_in : in std_logic_vector(15 downto 0);
    fs : in std_logic_vector(4 downto 0);
    v, c, n, z : out std_logic;
    f : out std_logic_vector(15 downto 0)
  );
end functionUnit;

architecture Behavioral of functionUnit is
    
    component ALU
    Port ( 
        a, b : in std_logic_vector(15 downto 0);
        g_in : in std_logic_vector(3 downto 0);
        v, c : out std_logic;
        g : out std_logic_vector(15 downto 0)
    );
    end component;
    
     component shifter 
      Port ( 
        b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        l,r : in std_logic;
        h : out std_logic_vector(15 downto 0)
      );
    end component;
    
    component multiplexer_2_1
    Port (
           s : in  std_logic;
           in0 : in  std_logic_vector(15 downto 0);
           in1 : in  std_logic_vector (15 downto 0);
           z : out  std_logic_vector (15 downto 0)
    );
    end component;
    
    signal alu_out, shifter_out, final_signal : std_logic_vector(15 downto 0);
    
begin

    alu0: alu Port map (
        a => a_in,
        b => b_in,
        g_in => fs(3 downto 0),
        v => v,
        c => c,
        g => alu_out
    );
    
    shifter0: shifter Port map (
        b => b_in,
        s => fs(3 downto 2),
        l => '0',
        r => '0',
        h => shifter_out
    );

    multiplexer: multiplexer_2_1 Port map (
        s => fs(4),
        in0 => alu_out,
        in1 => shifter_out,
        z => final_signal
    );
    
    f <= final_signal;
    
    n <= final_signal(15);
    z <= (final_signal(0) or final_signal(1) or final_signal(2) or final_signal(3) or final_signal(4) 
            or final_signal(5) or final_signal(6) or final_signal(7) or final_signal(8) or final_signal(9) 
            or final_signal(10) or final_signal(11) or final_signal(12) or final_signal(13) or final_signal(14) or final_signal(15));

end Behavioral;