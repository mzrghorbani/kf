-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity KalmanUpdateHLS_calcPitch2SoverR_2_get_V_rom is 
    generic(
             dwidth     : integer := 12; 
             awidth     : integer := 9; 
             mem_size    : integer := 512
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of KalmanUpdateHLS_calcPitch2SoverR_2_get_V_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "000000000000", 2 => "000011001001", 3 => "001010110000", 
    4 => "100101010100", 5 => "001001101001", 6 => "100100110100", 
    7 => "011100110010", 8 => "101100010101", 9 => "110000100111", 
    10 => "010110100001", 11 => "010010111001", 12 => "011110110110", 
    13 => "110101111011", 14 => "010101001011", 15 => "111010100011", 
    16 => "100100101000", 17 => "010010010110", 18 => "000010111101", 
    19 => "110101110111", 20 => "101010101001", 21 => "100000111101", 
    22 => "011000100010", 23 => "010001001010", 24 => "001010101010", 
    25 => "000100111011", 26 => "111111110100", 27 => "111011010001", 
    28 => "110111001011", 29 => "110011100000", 30 => "110000001011", 
    31 => "101101001010", 32 => "101010011011", 33 => "100111111011", 
    34 => "100101101001", 35 => "100011100100", 36 => "100001101001", 
    37 => "011111110111", 38 => "011110001111", 39 => "011100101110", 
    40 => "011011010100", 41 => "011010000001", 42 => "011000110100", 
    43 => "010111101011", 44 => "010110101000", 45 => "010101101001", 
    46 => "010100101110", 47 => "010011110111", 48 => "010011000011", 
    49 => "010010010010", 50 => "010001100100", 51 => "010000111001", 
    52 => "010000010000", 53 => "001111101010", 54 => "001111000101", 
    55 => "001110100011", 56 => "001110000010", 57 => "001101100011", 
    58 => "001101000110", 59 => "001100101010", 60 => "001100001111", 
    61 => "001011110110", 62 => "001011011110", 63 => "001011000111", 
    64 => "001010110001", 65 => "001010011100", 66 => "001010001000", 
    67 => "001001110101", 68 => "001001100011", 69 => "001001010001", 
    70 => "001001000001", 71 => "001000110001", 72 => "001000100001", 
    73 => "001000010010", 74 => "001000000100", 75 => "000111110111", 
    76 => "000111101010", 77 => "000111011101", 78 => "000111010001", 
    79 => "000111000101", 80 => "000110111010", 81 => "000110101111", 
    82 => "000110100101", 83 => "000110011011", 84 => "000110010001", 
    85 => "000110001000", 86 => "000101111111", 87 => "000101110110", 
    88 => "000101101110", 89 => "000101100110", 90 => "000101011110", 
    91 => "000101010110", 92 => "000101001111", 93 => "000101001000", 
    94 => "000101000001", 95 => "000100111010", 96 => "000100110100", 
    97 => "000100101101", 98 => "000100100111", 99 => "000100100001", 
    100 => "000100011011", 101 => "000100010110", 102 => "000100010001", 
    103 => "000100001011", 104 => "000100000110", 105 => "000100000001", 
    106 => "000011111100", 107 => "000011111000", 108 => "000011110011", 
    109 => "000011101111", 110 => "000011101010", 111 => "000011100110", 
    112 => "000011100010", 113 => "000011011110", 114 => "000011011010", 
    115 => "000011010111", 116 => "000011010011", 117 => "000011001111", 
    118 => "000011001100", 119 => "000011001000", 120 => "000011000101", 
    121 => "000011000010", 122 => "000010111111", 123 => "000010111100", 
    124 => "000010111001", 125 => "000010110110", 126 => "000010110011", 
    127 => "000010110000", 128 => "000010101101", 129 => "000010101011", 
    130 => "000010101000", 131 => "000010100101", 132 => "000010100011", 
    133 => "000010100000", 134 => "000010011110", 135 => "000010011100", 
    136 => "000010011001", 137 => "000010010111", 138 => "000010010101", 
    139 => "000010010011", 140 => "000010010001", 141 => "000010001111", 
    142 => "000010001101", 143 => "000010001011", 144 => "000010001001", 
    145 => "000010000111", 146 => "000010000101", 147 => "000010000011", 
    148 => "000010000010", 149 => "000010000000", 150 => "000001111110", 
    151 => "000001111100", 152 => "000001111011", 153 => "000001111001", 
    154 => "000001111000", 155 => "000001110110", 156 => "000001110101", 
    157 => "000001110011", 158 => "000001110010", 159 => "000001110000", 
    160 => "000001101111", 161 => "000001101101", 162 => "000001101100", 
    163 => "000001101011", 164 => "000001101010", 165 => "000001101000", 
    166 => "000001100111", 167 => "000001100110", 168 => "000001100101", 
    169 => "000001100011", 170 => "000001100010", 171 => "000001100001", 
    172 => "000001100000", 173 => "000001011111", 174 => "000001011110", 
    175 => "000001011101", 176 => "000001011100", 177 => "000001011011", 
    178 => "000001011010", 179 => "000001011001", 180 => "000001011000", 
    181 => "000001010111", 182 => "000001010110", 183 => "000001010101", 
    184 => "000001010100", 185 => "000001010011", 186 => "000001010010", 
    187 => "000001010001", 188 => "000001010000", 189 to 190=> "000001001111", 
    191 => "000001001110", 192 => "000001001101", 193 => "000001001100", 
    194 to 195=> "000001001011", 196 => "000001001010", 197 => "000001001001", 
    198 to 199=> "000001001000", 200 => "000001000111", 201 => "000001000110", 
    202 to 203=> "000001000101", 204 => "000001000100", 205 to 206=> "000001000011", 
    207 => "000001000010", 208 to 209=> "000001000001", 210 to 211=> "000001000000", 
    212 => "000000111111", 213 to 214=> "000000111110", 215 to 216=> "000000111101", 
    217 to 218=> "000000111100", 219 => "000000111011", 220 to 221=> "000000111010", 
    222 to 223=> "000000111001", 224 to 225=> "000000111000", 226 to 227=> "000000110111", 
    228 to 229=> "000000110110", 230 to 232=> "000000110101", 233 to 234=> "000000110100", 
    235 to 236=> "000000110011", 237 to 239=> "000000110010", 240 to 241=> "000000110001", 
    242 to 243=> "000000110000", 244 to 246=> "000000101111", 247 to 249=> "000000101110", 
    250 to 251=> "000000101101", 252 to 254=> "000000101100", 255 to 257=> "000000101011", 
    258 to 260=> "000000101010", 261 to 264=> "000000101001", 265 to 267=> "000000101000", 
    268 to 270=> "000000100111", 271 to 274=> "000000100110", 275 to 277=> "000000100101", 
    278 to 281=> "000000100100", 282 to 285=> "000000100011", 286 to 289=> "000000100010", 
    290 to 294=> "000000100001", 295 to 298=> "000000100000", 299 to 303=> "000000011111", 
    304 to 308=> "000000011110", 309 to 314=> "000000011101", 315 to 319=> "000000011100", 
    320 to 325=> "000000011011", 326 to 331=> "000000011010", 332 to 338=> "000000011001", 
    339 to 345=> "000000011000", 346 to 352=> "000000010111", 353 to 360=> "000000010110", 
    361 to 369=> "000000010101", 370 to 378=> "000000010100", 379 to 388=> "000000010011", 
    389 to 398=> "000000010010", 399 to 410=> "000000010001", 411 to 422=> "000000010000", 
    423 to 436=> "000000001111", 437 to 452=> "000000001110", 453 to 469=> "000000001101", 
    470 to 488=> "000000001100", 489 to 510=> "000000001011", 511 => "000000001010" );


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

entity KalmanUpdateHLS_calcPitch2SoverR_2_get_V is
    generic (
        DataWidth : INTEGER := 12;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of KalmanUpdateHLS_calcPitch2SoverR_2_get_V is
    component KalmanUpdateHLS_calcPitch2SoverR_2_get_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    KalmanUpdateHLS_calcPitch2SoverR_2_get_V_rom_U :  component KalmanUpdateHLS_calcPitch2SoverR_2_get_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


