----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2020 11:51:30 PM
-- Design Name: 
-- Module Name: memory512x16_tb - Behavioral
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
 
entity Memory512x16_tb is
end Memory512x16_tb;
 
architecture behavior of Memory512x16_tb is
 
    component Memory512x16
      port ( address : in  std_logic_vector(15 downto 0);
  write_data : in std_logic_vector(15 downto 0);
  MemWrite, MemRead : in std_logic;
  read_data : out std_logic_vector(15 downto 0));
    end component;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) := (others => '0');
   signal write_data : std_logic_vector(15 downto 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal MemRead : std_logic := '0';

 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
begin
 
   uut: Memory512x16 port map (
          address => address,
          write_data => write_data,
          MemWrite => MemWrite,
          MemRead => MemRead,
          read_data => read_data
        );

   stim_proc: process
   begin		
		wait for 1ns;
		address <= x"0000";
		
		wait for 1ns;
		address <= x"0001";
		
		wait for 1ns;
		address <= x"0002";
		
		wait for 1ns;
		address <= x"0003";

      wait;
   end process;

end;
