----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2020 09:59:12 PM
-- Design Name: 
-- Module Name: Memory512x16 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory512x16 is -- use unsigned for memory address
  Port ( address, write_data : in  std_logic_vector(15 downto 0);
  MemWrite, MemRead: in std_logic;
  read_data : out std_logic_vector(15 downto 0));
end memory512x16;

architecture Behavioral of memory512x16 is
   type mem_array is array(0 to 511) of std_logic_vector(15 downto 0);
-- define type, for memory arrays
begin
mem_process: process (address, write_data)
  variable data_mem : mem_array := (
        X"0B6D", 
        X"016D", 
        X"0A92",
        X"0690",
        X"0990", 
        X"016D", 
        X"0268",
        X"0A01",
        X"04C0", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"BEEF", X"0000", X"0000",X"0000",
        X"BEEF", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
           X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",

        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000",
        X"0000", X"0000", X"0000",X"0000");
  variable addr:integer;
  
 begin -- the following type conversion function is in std_logic_arith
  addr:=conv_integer(address(2 downto 0));
    if MemWrite ='1' then
     data_mem(addr):= write_data;
    elsif MemRead='1' then
read_data <= data_mem(addr) after 1 ns;
    end if;
 end process;
end Behavioral;
