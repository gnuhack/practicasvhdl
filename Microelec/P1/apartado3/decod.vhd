library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decod is
  port (binario : in std_logic_vector(3 downto 0);
        siete_seg : out std_logic_vector(6 downto 0));
  end decod;


architecture Behavioral of decod is

  begin

    case binario is
      when "0000" =>
        siete_seg="0000001";
      when "0001" =>
        siete_seg="1001111";
      when "0010" =>
        siete_seg="0010010";
      when "0011" =>
        siete_seg="0000110";
      when "0100" =>
        siete_seg="1001100";
      when "0101"=>
        siete_seg="0100100";
      when "0110"=>
        siete_seg="0100000";
      when "0111"=>
        siete_seg="0001111";
      when "1000"=>
        siete_seg="0000000";
      when "1001"=>
        siete_seg="0000100";
      when "1010" =>
        siete_seg="0001000";
      when "1011" =>
        siete_seg="1100000";
      when "1100" =>
        siete_seg="0110001";
      when "1101" =>
        siete_seg="1000010";
      when "1110" =>
        siete_seg="0110000";
      when "1111" =>
        siete_seg="0111000";
    end case;

end Behavioral;

