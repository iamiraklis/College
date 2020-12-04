----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2020 07:56:40 PM
-- Design Name: 
-- Module Name: control_memory256x28_tb - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY control_memory256x28_tb IS
END control_memory256x28_tb;
 
ARCHITECTURE behavior OF control_memory256x28_tb IS 
 
    COMPONENT control_memory256x28
    port(
  MW : out std_logic;
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
    end component;
    

   signal IN_CAR : std_logic_vector(7 downto 0) := (others => '0');
   signal MW : std_logic;
   signal MM : std_logic;
   signal RW : std_logic;
   signal MD : std_logic;
   signal MB : std_logic;
   signal TB : std_logic;
   signal TA : std_logic;
   signal TD : std_logic;
   signal PL : std_logic;
   signal PI : std_logic;
   signal IL : std_logic;
   signal MC : std_logic;
   signal FS : std_logic_vector(4 downto 0);
   signal MS : std_logic_vector(2 downto 0);
   signal NA : std_logic_vector(7 downto 0);
 
begin
 
   uut: control_memory256x28 PORT MAP (
          MW => MW,
          MM => MM,
          RW => RW,
          MD => MD,
          MB => MB,
          TB => TB,
          TA => TA,
          TD => TD,
          PL => PL,
          PI => PI,
          IL => IL,
          MC => MC,
          FS => FS,
          MS => MS,
          NA => NA,
          IN_CAR => IN_CAR
        );

   stim: process
   begin		
		wait for 1ns;
		IN_CAR <= x"00";
				
		wait for 1ns;
		IN_CAR <= x"02";
				
		wait for 1ns;
		IN_CAR <= x"04";
		wait;
   end process;

end;
