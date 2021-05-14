library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
  Generic (Nbit: INTEGER := 8);
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         enable : in STD_LOGIC;
         resets : in STD_LOGIC;
         Q : out STD_LOGIC_VECTOR (Nbit-1 downto 0));
end contador;

architecture Behavioral of contador is

  signal salida, p_salida: unsigned(Nbit-1 downto 0);

begin

  Q <= std_logic_vector(salida);

  comb: process(salida,enable,resets)
  begin
    p_salida <= salida;
    if (resets = '1') then
        p_salida <= (others => '0');

      elsif (enable = '1') then
        p_salida <= salida + 1;

      else
        p_salida <= salida;
    end if;
    
  end process;

  sinc: process(reset, clk)
  begin
    if (reset = '1') then
      salida <= (others => '0');
    elsif (rising_edge(clk)) then
      salida <= p_salida;
    end if;

  end process;

end Behavioral;

