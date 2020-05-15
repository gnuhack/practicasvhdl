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

  comb: process(salida,enable)
  begin
    p_salida <= salida;
    -- sat <='0';
    
    if (enable = '1') then
      p_salida <= salida + 1;
      if (salida="11111111") then
        -- sat <= '1';
        p_salida <= "00000000";
      end if;
    end if;
    
  end process;

  sinc: process(resets, clk)
  begin
    if (resets = '1') then
      salida <= "00000000";
    elsif (rising_edge(clk)) then
      salida <= p_salida;
    end if;

  end process;

end Behavioral;

