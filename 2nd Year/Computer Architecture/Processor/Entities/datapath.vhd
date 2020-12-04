----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2020 04:41:06 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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


entity Datapath is
  Port ( 
        MM, MB, MD, RW : in std_logic;
        TD_DR, TD_SA, TB_SB : in std_logic_vector(3 downto 0);
        FS : in std_logic_vector(4 downto 0);
        pc_in : in std_logic_vector(15 downto 0);
        Clk : in std_logic;
        const_in  : in std_logic_vector(2 downto 0);
        data_in : in std_logic_vector(15 downto 0);
        addr_out : out std_logic_vector(15 downto 0);
        data_out : out std_logic_vector(15 downto 0);
        v, c, n, z : out std_logic
  );
end Datapath;

architecture Behavioral of Datapath is
    
    component functionUnit is
        Port ( 
            a_in, b_in : in std_logic_vector(15 downto 0);
            fs : in std_logic_vector(4 downto 0);
            v, c, n, z : out std_logic;
            f : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component register_file
        Port ( Clk, load_enabled : in std_logic;
            addr_a, addr_b, dest_d : in std_logic_vector(3 downto 0);
            data_src : in std_logic_vector(15 downto 0);
            out_a, out_b : out std_logic_vector(15 downto 0) 
        );
    end component;
    
    component multiplexer_2_1
        Port (
               s : in  std_logic;
               in0 : in  std_logic_vector(15 downto 0);
               in1 : in  std_logic_vector (15 downto 0);
               Z : out  std_logic_vector (15 downto 0)
        );
    end component;
    
    component zero_fill PORT (
        in0 : in std_logic_vector(2 downto 0);
        zeros : out std_logic_vector(15 downto 0)
    );
     end component;
    
        signal bus_A, bus_b, bus_b_1, bus_d, mux_d_in, mux_b_in : std_logic_vector(15 downto 0);


begin
    reg_file0 : register_file Port map (
        Clk => Clk,
        load_enabled => RW,
        addr_a => TD_SA,
        addr_b => TB_SB,
        dest_d => TD_DR,
        data_src => bus_d,
        out_a => bus_A,
        out_b => bus_b
    ); 
    
    zero0 : zero_fill PORT MAP (
        in0 => Const_in ,
        zeros => mux_b_in    
    );
    
    function_unit : functionUnit Port map (
        a_in => bus_A,
        b_in => bus_b_1,
        fs => fs,
        v => v,
        c => c,
        n => n,
        z => z,
        f => mux_d_in
    );
    
    mux2_1 : multiplexer_2_1 Port map (
        s => MM,
        in0 => pc_in,
        in1 => bus_A,
        Z => addr_out
    );
    
    mux2_1_ii : multiplexer_2_1 Port map (
        s => MD,
        in0 => data_in,
        in1 => mux_d_in,
        Z => bus_d
    );
end Behavioral;