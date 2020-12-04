----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2020 09:12:19 PM
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
    Port( reset, Clk : in std_logic);
end processor;

architecture Behavioral of processor is

component microprogrammed_control port (
        reset : in std_logic;
        Clk : in std_logic;
        VCNZ : in std_logic_vector(3 downto 0);
        IR_in : in std_logic_vector(15 downto 0);
        PC_out : out std_logic_vector(15 downto 0);
        TD_DR_out, TD_SA_out, TB_SB_out : out std_logic_vector(3 downto 0);
        FS_out : out std_logic_vector(4 downto 0);
        MB_out, MD_out, MM_out, RW_out, MW_out : out std_logic
    );
    end component;
    
     component Memory512x16 port(
        address, write_data : in  std_logic_vector(15 downto 0);
        MemWrite, MemRead : in std_logic;
        read_data : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component Datapath Port (
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
    end component;
    
    signal RW, MB, MD, MM, MW, MemRead : std_logic;
    signal TD_DR, TD_SA, TB_SB, VCNZ : std_logic_vector(3 downto 0);
    signal FS : std_logic_vector(4 downto 0);
    signal data_in, data_out, PC, Address : std_logic_vector(15 downto 0);
    
begin

    micro_ctrl : microprogrammed_control port map (
        reset => reset,
        Clk => Clk,
        VCNZ => VCNZ,
        IR_in => data_out,
        TD_DR_out => TD_DR,
        TD_SA_out => TD_SA,
        TB_SB_out => TB_SB,
        FS_out => FS,
        PC_out => PC,
        MB_out => MB,
        MD_out => MD,
        MM_out => MM,
        RW_out => RW,
        MW_out => MW
        
    );
    
    main_memory : Memory512x16 port map (
        address => Address,
        write_data => data_in,
        read_data => data_out,
        MemWrite => MW,
        MemRead => MemRead
    );
    
    data_path : Datapath port map (
        Clk => Clk,
        TD_DR => TD_DR,
        TD_SA => TD_SA,
        TB_SB => TB_SB,
        FS => FS,
        pc_in => PC,
        Const_in  => TB_SB(2 downto 0),
        data_in => data_out,
        RW => RW,
        MB => MB,
        MD => MD,
        MM => MM,
        Z => VCNZ(0),
        N => VCNZ(1),
        C => VCNZ(2),
        V => VCNZ(3),
        Data_out => data_in,
        addr_out => Address
    );
    
end Behavioral;
