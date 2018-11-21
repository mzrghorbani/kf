-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity KalmanUpdateHLS_calcPitchPSoverR_2_get_V_rom is 
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


architecture rtl of KalmanUpdateHLS_calcPitchPSoverR_2_get_V_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "000000000000", 2 => "101000111111", 3 => "101111000010", 
    4 => "110010100101", 5 => "101001010000", 6 => "100000100100", 
    7 => "011001111000", 8 => "111111100011", 9 => "100110011110", 
    10 => "110111000000", 11 => "100011010101", 12 => "100010111010", 
    13 => "110000010010", 14 => "000111110000", 15 => "100110110100", 
    16 => "001011101100", 17 => "110101000101", 18 => "100010000010", 
    19 => "010001110101", 20 => "000011111101", 21 => "110111111110", 
    22 => "101101100010", 23 => "100100011010", 24 => "011100011000", 
    25 => "010101010010", 26 => "001110111110", 27 => "001001010101", 
    28 => "000100010001", 29 => "111111101110", 30 => "111011100111", 
    31 => "110111111000", 32 => "110100100000", 33 => "110001011010", 
    34 => "101110100101", 35 => "101100000000", 36 => "101001101000", 
    37 => "100111011011", 38 => "100101011010", 39 => "100011100010", 
    40 => "100001110011", 41 => "100000001100", 42 => "011110101100", 
    43 => "011101010011", 44 => "011100000000", 45 => "011010110010", 
    46 => "011001101001", 47 => "011000100101", 48 => "010111100100", 
    49 => "010110101000", 50 => "010101101111", 51 => "010100111010", 
    52 => "010100000111", 53 => "010011011000", 54 => "010010101010", 
    55 => "010010000000", 56 => "010001010111", 57 => "010000110001", 
    58 => "010000001101", 59 => "001111101010", 60 => "001111001001", 
    61 => "001110101010", 62 => "001110001100", 63 => "001101110000", 
    64 => "001101010101", 65 => "001100111011", 66 => "001100100010", 
    67 => "001100001010", 68 => "001011110100", 69 => "001011011110", 
    70 => "001011001010", 71 => "001010110110", 72 => "001010100011", 
    73 => "001010010000", 74 => "001001111111", 75 => "001001101110", 
    76 => "001001011110", 77 => "001001001110", 78 => "001000111111", 
    79 => "001000110001", 80 => "001000100011", 81 => "001000010110", 
    82 => "001000001001", 83 => "000111111101", 84 => "000111110001", 
    85 => "000111100101", 86 => "000111011010", 87 => "000111001111", 
    88 => "000111000101", 89 => "000110111011", 90 => "000110110001", 
    91 => "000110100111", 92 => "000110011110", 93 => "000110010101", 
    94 => "000110001101", 95 => "000110000101", 96 => "000101111101", 
    97 => "000101110101", 98 => "000101101101", 99 => "000101100110", 
    100 => "000101011111", 101 => "000101011000", 102 => "000101010001", 
    103 => "000101001011", 104 => "000101000101", 105 => "000100111110", 
    106 => "000100111000", 107 => "000100110011", 108 => "000100101101", 
    109 => "000100101000", 110 => "000100100010", 111 => "000100011101", 
    112 => "000100011000", 113 => "000100010011", 114 => "000100001110", 
    115 => "000100001010", 116 => "000100000101", 117 => "000100000001", 
    118 => "000011111100", 119 => "000011111000", 120 => "000011110100", 
    121 => "000011110000", 122 => "000011101100", 123 => "000011101000", 
    124 => "000011100100", 125 => "000011100001", 126 => "000011011101", 
    127 => "000011011010", 128 => "000011010110", 129 => "000011010011", 
    130 => "000011010000", 131 => "000011001101", 132 => "000011001010", 
    133 => "000011000111", 134 => "000011000100", 135 => "000011000001", 
    136 => "000010111110", 137 => "000010111011", 138 => "000010111001", 
    139 => "000010110110", 140 => "000010110011", 141 => "000010110001", 
    142 => "000010101110", 143 => "000010101100", 144 => "000010101001", 
    145 => "000010100111", 146 => "000010100101", 147 => "000010100011", 
    148 => "000010100000", 149 => "000010011110", 150 => "000010011100", 
    151 => "000010011010", 152 => "000010011000", 153 => "000010010110", 
    154 => "000010010100", 155 => "000010010010", 156 => "000010010000", 
    157 => "000010001111", 158 => "000010001101", 159 => "000010001011", 
    160 => "000010001001", 161 => "000010001000", 162 => "000010000110", 
    163 => "000010000100", 164 => "000010000011", 165 => "000010000001", 
    166 => "000010000000", 167 => "000001111110", 168 => "000001111101", 
    169 => "000001111011", 170 => "000001111010", 171 => "000001111000", 
    172 => "000001110111", 173 => "000001110101", 174 => "000001110100", 
    175 => "000001110011", 176 => "000001110001", 177 => "000001110000", 
    178 => "000001101111", 179 => "000001101110", 180 => "000001101100", 
    181 => "000001101011", 182 => "000001101010", 183 => "000001101001", 
    184 => "000001101000", 185 => "000001100111", 186 => "000001100110", 
    187 => "000001100100", 188 => "000001100011", 189 => "000001100010", 
    190 => "000001100001", 191 => "000001100000", 192 => "000001011111", 
    193 => "000001011110", 194 => "000001011101", 195 => "000001011100", 
    196 => "000001011011", 197 to 198=> "000001011010", 199 => "000001011001", 
    200 => "000001011000", 201 => "000001010111", 202 => "000001010110", 
    203 => "000001010101", 204 to 205=> "000001010100", 206 => "000001010011", 
    207 => "000001010010", 208 => "000001010001", 209 to 210=> "000001010000", 
    211 => "000001001111", 212 => "000001001110", 213 to 214=> "000001001101", 
    215 => "000001001100", 216 to 217=> "000001001011", 218 => "000001001010", 
    219 => "000001001001", 220 to 221=> "000001001000", 222 to 223=> "000001000111", 
    224 => "000001000110", 225 to 226=> "000001000101", 227 => "000001000100", 
    228 to 229=> "000001000011", 230 to 231=> "000001000010", 232 to 233=> "000001000001", 
    234 => "000001000000", 235 to 236=> "000000111111", 237 to 238=> "000000111110", 
    239 to 240=> "000000111101", 241 to 242=> "000000111100", 243 to 244=> "000000111011", 
    245 to 246=> "000000111010", 247 to 249=> "000000111001", 250 to 251=> "000000111000", 
    252 to 253=> "000000110111", 254 to 255=> "000000110110", 256 to 258=> "000000110101", 
    259 to 260=> "000000110100", 261 to 263=> "000000110011", 264 to 265=> "000000110010", 
    266 to 268=> "000000110001", 269 to 271=> "000000110000", 272 to 274=> "000000101111", 
    275 to 277=> "000000101110", 278 to 280=> "000000101101", 281 to 283=> "000000101100", 
    284 to 286=> "000000101011", 287 to 290=> "000000101010", 291 to 293=> "000000101001", 
    294 to 297=> "000000101000", 298 to 301=> "000000100111", 302 to 305=> "000000100110", 
    306 to 309=> "000000100101", 310 to 313=> "000000100100", 314 to 317=> "000000100011", 
    318 to 322=> "000000100010", 323 to 327=> "000000100001", 328 to 332=> "000000100000", 
    333 to 337=> "000000011111", 338 to 343=> "000000011110", 344 to 349=> "000000011101", 
    350 to 355=> "000000011100", 356 to 362=> "000000011011", 363 to 368=> "000000011010", 
    369 to 376=> "000000011001", 377 to 384=> "000000011000", 385 to 392=> "000000010111", 
    393 to 401=> "000000010110", 402 to 410=> "000000010101", 411 to 420=> "000000010100", 
    421 to 431=> "000000010011", 432 to 443=> "000000010010", 444 to 456=> "000000010001", 
    457 to 470=> "000000010000", 471 to 485=> "000000001111", 486 to 503=> "000000001110", 
    504 to 511=> "000000001101" );


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

entity KalmanUpdateHLS_calcPitchPSoverR_2_get_V is
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

architecture arch of KalmanUpdateHLS_calcPitchPSoverR_2_get_V is
    component KalmanUpdateHLS_calcPitchPSoverR_2_get_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    KalmanUpdateHLS_calcPitchPSoverR_2_get_V_rom_U :  component KalmanUpdateHLS_calcPitchPSoverR_2_get_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

