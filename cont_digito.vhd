library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cont_digito is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         enable : in STD_LOGIC;
         sat : out STD_LOGIC;
         cuenta : out  STD_LOGIC_VECTOR (3 downto 0));
end cont_digito;

architecture Behavioral of cont_digito is

  signal salida, p_salida: unsigned(3 downto 0);

begin

  cuenta <= std_logic_vector(salida);

  comb: process(salida)
  begin
      p_salida <= salida + 1;
  end process;
  salida <= p_salida;

  sinc: process(rst, clk)
  begin
    if (rst = '1') then
      salida <= "0000";
    elsif (rising_edge(clk)) then
      salida <= p_salida;
    end if;
  end process;

end Behavioral;

