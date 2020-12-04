----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 03:23:43 AM
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity alu is
    Port ( 
        a, b : in std_logic_vector(15 downto 0);
        g_in : in std_logic_vector(3 downto 0);
        v, c : out std_logic;
        g : out std_logic_vector(15 downto 0)
    );
end alu;

architecture Behaviour of alu is
  
  component ripple_adder
    Port (  a, b: in std_logic_vector(15 downto 0);
        c_in: in std_logic;
        s : out std_logic_vector(15 downto 0);
        c, v_out : out std_logic
    );
    end component;
  
  component inputLogic
  Port(
        a, b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        ab : out std_logic_vector(15 downto 0)
    );  
  end component;
  
  component inputLogic_2 is
	Port(
		b : in std_logic_vector(15 downto 0);
		s_in : in std_logic_vector(1 downto 0);
		b_out : out std_logic_vector(15 downto 0)
	);
    end component;
    
    component multiplexer_2_1
    Port (
           in0, in1 : in std_logic_vector(15 downto 0);
           s: in std_logic;
           Z : out std_logic_vector(15 downto 0)
    );
    end component;

    signal inputlogic_result,  inputLogic_2_result, ripple_adder_result: std_logic_vector(15 downto 0);

begin

    in_logic : inputLogic Port map (
         a => a,
         b => b,
         s => g_in(2 downto 1),
         ab => inputlogic_result
    );
    
    in_logic_2 : inputLogic_2 Port map (
        b => b,
		s_in => g_in(2 downto 1),
		b_out => inputLogic_2_result
    );
    
     r_adder : ripple_adder Port map (
        a => a,
        b => inputLogic_2_result, 
        c_in => g_in(0),
        s => ripple_adder_result,
        c => c,
        v_out => v
    );
    
    mux_2_1_16 : multiplexer_2_1 Port map (
         s => g_in(3),
         in0 => ripple_adder_result, 
         in1 => inputlogic_result,
         Z => g
    );
  
end Behaviour;
