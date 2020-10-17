-- main.hex 

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
--use WORK.I8051_LIB.all;

entity mirom is
    port(rst      : in  STD_LOGIC;
         clk      : in  STD_LOGIC;
         addr     : in  std_logic_vector (3 downto 0);
         data     : out std_logic_vector (7 downto 0)
         );
end mirom;

architecture mirom_arch of mirom is

    type ROM_TYPE is array (0 to 157) of std_logic_vector (7 downto 0);

    constant PROGRAM : ROM_TYPE := (

	"00000010",	-- LJMP   
	"00000000",
	"00000110",
	"00000010",	-- LJMP   
	"00000000",
	"01100011",
	"01110101",	-- MOV_12 
	"10000001",
	"00000111",
	"00010010",	-- LCALL  
	"00000000",
	"10011000",
	"11100101",	-- MOV_2  
	"10000010",
	"01100000",	-- JZ     
	"00000011",
	"00000010",	-- LJMP   
	"00000000",
	"00000011",
	"01111001",	-- MOV_7  
	"00000000",
	"11101001",	-- MOV_1  
	"01000100",	-- ORL_4  
	"00000000",
	"01100000",	-- JZ     
	"00011011",
	"01111010",	-- MOV_7  
	"00000000",
	"10010000",	-- MOV_18 
	"00000000",
	"10011100",
	"01111000",	-- MOV_7  
	"00000001",
	"01110101",	-- MOV_12 
	"10100000",
	"00000000",
	"11100100",	-- CLR_1  
	"10010011",	-- MOVC_1 
	"11110010",	-- MOVX_3 
	"10100011",	-- INC_5  
	"00001000",	-- INC_2  
	"10111000",	-- CJNE_3 
	"00000000",
	"00000010",
	"00000101",	-- INC_3  
	"10100000",
	"11011001",	-- DJNZ_1 
	"11110100",
	"11011010",	-- DJNZ_1 
	"11110010",
	"01110101",	-- MOV_12 
	"10100000",
	"11111111",
	"11100100",	-- CLR_1  
	"01111000",	-- MOV_7  
	"11111111",
	"11110110",	-- MOV_13 
	"11011000",	-- DJNZ_1 
	"11111101",
	"01111000",	-- MOV_7  
	"00000000",
	"11101000",	-- MOV_1  
	"01000100",	-- ORL_4  
	"00000000",
	"01100000",	-- JZ     
	"00001010",
	"01111001",	-- MOV_7  
	"00000001",
	"01110101",	-- MOV_12 
	"10100000",
	"00000000",
	"11100100",	-- CLR_1  
	"11110011",	-- MOVX_3 
	"00001001",	-- INC_2  
	"11011000",	-- DJNZ_1 
	"11111100",
	"01111000",	-- MOV_7  
	"00000000",
	"11101000",	-- MOV_1  
	"01000100",	-- ORL_4  
	"00000000",
	"01100000",	-- JZ     
	"00001100",
	"01111001",	-- MOV_7  
	"00000000",
	"10010000",	-- MOV_18 
	"00000000",
	"00000001",
	"11100100",	-- CLR_1  
	"11110000",	-- MOVX_4 
	"10100011",	-- INC_5  
	"11011000",	-- DJNZ_1 
	"11111100",
	"11011001",	-- DJNZ_1 
	"11111010",
	"00000010",	-- LJMP   
	"00000000",
	"00000011",
	"00100010",	-- RET    
	"10010000",	-- MOV_18 
	"00000000",
	"00000001",
	"11100100",	-- CLR_1  
	"11110101",	-- MOV_8  
	"11110000",
	"00010010",	-- LCALL  
	"00000000",
	"01100010",
	"10000101",	-- MOV_10 
	"10000010",
	"10000000",
	"10010000",	-- MOV_18 
	"00000001",
	"00100011",
	"11100100",	-- CLR_1  
	"11110101",	-- MOV_8  
	"11110000",
	"00010010",	-- LCALL  
	"00000000",
	"01100010",
	"10000101",	-- MOV_10 
	"10000010",
	"10010000",
	"10010000",	-- MOV_18 
	"00100011",
	"01000101",
	"01110101",	-- MOV_12 
	"11110000",
	"00000001",
	"11100100",	-- CLR_1  
	"00010010",	-- LCALL  
	"00000000",
	"01100010",
	"10000101",	-- MOV_10 
	"10000010",
	"10100000",
	"10010000",	-- MOV_18 
	"01000101",
	"01100111",
	"01110101",	-- MOV_12 
	"11110000",
	"00100011",
	"01110100",	-- MOV_4  
	"00000001",
	"00010010",	-- LCALL  
	"00000000",
	"01100010",
	"10000101",	-- MOV_10 
	"10000010",
	"10110000",
	"10000000",	-- SJMP   
	"11111110",
	"01110101",	-- MOV_12 
	"10000010",
	"00000000",
	"00100010",	-- RET    
	"00000000",	-- NOP    
	"00000000");	-- NOP    
begin

    process(rst, clk)
    begin
        if( rst = '1' ) then

            data <= "00000000";
        elsif( clk'event and clk = '1' ) then

          data <= PROGRAM(to_integer(unsigned(addr)));
          
            end if;
    end process;
end mirom_arch;
