library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity cont_digito is
  port (clk    : in  std_logic;
        reset  : in  std_logic;
        enable : in  std_logic;
        cuenta : out std_logic_vector (3 downto 0));
end cont_digito;

architecture Behavioral of cont_digito is
-- entradas
  signal p_cuenta : unsigned (3 downto 0);
  signal cuentap  : unsigned(3 downto 0);  --:="0000";
  signal debug    : unsigned(1 downto 0) := "01";
begin
  --cuenta <= cuentap;
  comb : process(enable, cuentap)
  begin
--p_cuenta <= unsigned(cuentap);
    if (enable = '1') then
      p_cuenta <= cuentap+1;
      debug    <= debug + 1;
    else
      p_cuenta <= cuentap;
    end if;
  end process;

  sinc : process(reset, clk)
  begin
    if (reset = '1') then
      cuenta  <= (others => '0');
      cuentap <= (others => '0');
      debug   <= (others => '0');
    elsif (rising_edge(clk)) then
      cuenta <= std_logic_vector(p_cuenta);
    end if;

  end process;


end Behavioral;
