LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY car_tb IS
END car_tb;
 
ARCHITECTURE behavior OF car_tb IS 
 
 
    COMPONENT car
    Port(	
	       opcode : in std_logic_vector(7 downto 0);
	       load, clk, reset : in std_logic;
	       car_out : buffer std_logic_vector(7 downto 0)
            );
    END COMPONENT;
    

   signal opcode : std_logic_vector(7 downto 0);
   signal load, clk, reset : std_logic := '0';

   signal car_out : std_logic_vector(7 downto 0);
 
BEGIN
 
   uut: car PORT MAP (
          opcode => opcode,
          load => load,
          Clk => Clk,
          reset => reset,
          car_out => car_out
        );
		  
   stim: process
   begin		
		wait for 1ns;
		reset <= '1';
		
		wait for 1ns;
		reset <= '0';
		
		wait for 1ns;
		opcode <= x"10";
		
		wait for 1ns;
		opcode <= x"11";
		load <= '1';

wait;
   end process;

END;