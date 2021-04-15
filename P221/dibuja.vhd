library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dibuja is
  Port ( eje_x : in STD_LOGIC_VECTOR (9 downto 0);
         eje_y : in STD_LOGIC_VECTOR (9 downto 0);
         R : out STD_LOGIC;
         G : out STD_LOGIC;
         B : out STD_LOGIC);
end dibuja;

architecture Behavorial of dibuja is
  
begin

  process(eje_x, eje_y)
  begin
      G<='1'; B<='1'; R<='1';
    if ((To_integer(Unsigned(eje_x))>279 and To_integer(Unsigned(eje_x))<359) or (To_integer(Unsigned(eje_y))>209 and To_integer(Unsigned(eje_y))<269)) then
      R<='1';G<='0';B<='0';
    end if;

end process;


end Behavorial;