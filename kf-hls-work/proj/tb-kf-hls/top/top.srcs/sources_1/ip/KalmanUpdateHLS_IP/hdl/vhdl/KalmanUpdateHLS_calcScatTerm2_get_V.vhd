-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity KalmanUpdateHLS_calcScatTerm2_get_V_rom is 
    generic(
             dwidth     : integer := 22; 
             awidth     : integer := 6; 
             mem_size    : integer := 36
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of KalmanUpdateHLS_calcScatTerm2_get_V_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "1000001000100101110010", 1 => "0111001110110010110101", 
    2 => "0110011000011001011110", 3 => "0101100101011001101011", 
    4 => "0100110101110011011111", 5 => "0100001001100110111000", 
    6 => "0011100000110011110110", 7 => "0010111011011010011001", 
    8 => "0010011001011010100011", 9 => "0001111010110100010001", 
    10 => "0001011111100111100110", 11 => "0001000111110100011111", 
    12 => "0000110011011010111110", 13 => "0000100010011011000011", 
    14 => "0000010100110100101101", 15 => "0000001010100111111101", 
    16 => "0000000011110100110010", 17 to 18=> "0000000000011011001100", 
    19 => "0000000011110100110010", 20 => "0000001010100111111101", 
    21 => "0000010100110100101101", 22 => "0000100010011011000011", 
    23 => "0000110011011010111110", 24 => "0001000111110100011111", 
    25 => "0001011111100111100110", 26 => "0001111010110100010001", 
    27 => "0010011001011010100011", 28 => "0010111011011010011001", 
    29 => "0011100000110011110110", 30 => "0100001001100110111000", 
    31 => "0100110101110011011111", 32 => "0101100101011001101011", 
    33 => "0110011000011001011110", 34 => "0111001110110010110101", 
    35 => "1000001000100101110010" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity KalmanUpdateHLS_calcScatTerm2_get_V is
    generic (
        DataWidth : INTEGER := 22;
        AddressRange : INTEGER := 36;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of KalmanUpdateHLS_calcScatTerm2_get_V is
    component KalmanUpdateHLS_calcScatTerm2_get_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    KalmanUpdateHLS_calcScatTerm2_get_V_rom_U :  component KalmanUpdateHLS_calcScatTerm2_get_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


