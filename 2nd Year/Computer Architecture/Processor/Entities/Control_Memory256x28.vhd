-- Michael Manzke
-- michael.manzke@cs.tcd.ie
-- 25 April 2003
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory256x28 is
  Port ( MW : out std_logic;
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
  IN_CAR : in std_logic_vector(7 downto 0));
end control_memory256x28;

architecture Behavioral of control_memory256x28 is
  type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
  begin
    memory_m: process(IN_CAR)
    variable control_mem : mem_array:=(
    x"0E20024", -- 0 add
	x"0E2000C", -- 1 ldr 
	x"0EE1004", -- 2 str
	x"0E20014", -- 3 inc 
	x"0E200E4", -- 4 not 
	x"0E20224", -- 5 add 
	x"0E22000", -- 6 branch
	x"0000000", -- 7 
	X"DDDDDDD", -- 8
    X"0000000", -- 9
    X"1111111", -- A
    X"0000000", -- B
    X"2222222", -- C
    X"0000000", -- D
    X"3333333", -- E
    X"0000000", -- F
	
	x"0000000", --0 
	x"0000000", --1 
	x"0000000", --2 
	x"0000000", --3 
	x"0000000", --4 
	x"0000000", --5 
	x"0000000", --6
	x"0000000", --7 
	x"0000000", --8 
	x"0000000", --9 
	x"0000000", --A  
	x"0000000", --B 
	x"0000000", --C 
	x"0000000", --D 
	x"0000000", --E 
	x"0000000", --F 
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"C10C002", --E fetch
	x"0030000", --F exit 
	
	x"0000000", --0 
	x"0000000", --1 
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
	x"0000000", --F
	
	x"0000000", --0
	x"0000000", --1
	x"0000000", --2
	x"0000000", --3
	x"0000000", --4
	x"0000000", --5
	x"0000000", --6
	x"0000000", --7
	x"0000000", --8
	x"0000000", --9
	x"0000000", --A
	x"0000000", --B
	x"0000000", --C
	x"0000000", --D
	x"0000000", --E
    x"0000000" --F
    );
variable addr : integer;
variable control_out : std_logic_vector(27 downto 0);

 begin
  addr := conv_integer(IN_CAR);
  control_out := control_mem(addr);
  MW <= control_out(0);
  MM <= control_out(1);
  RW <= control_out(2);
  MD <= control_out(3);
  FS <= control_out(8 downto 4);
  MB <= control_out(9);

  TB <= control_out(10);
  TA <= control_out(11);
  TD <= control_out(12);
  PL <= control_out(13);
  PI <= control_out(14);
  IL <= control_out(15);
  MC <= control_out(16);
  MS <= control_out(19 downto 17);
  NA <= control_out(27 downto 20);
 end process;
end Behavioral;