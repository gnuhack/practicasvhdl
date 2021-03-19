library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity cont_digito is
  port (clk    : in  std_logic;
        reset  : in  std_logic;
        enable : in  std_logic;
        cuenta : out std_logic_vector (3 downto 0);
        sat    : out std_logic);
end cont_digito;

architecture Behavioral of cont_digito is
-- entradas
  signal cont   : unsigned (3 downto 0);
  signal p_cont : unsigned(3 downto 0) := "0000";
-- signal debug    : unsigned(1 downto 0) := "01";
begin
  cuenta <= std_logic_vector(cont);
  comb : process(enable, cont)
  begin
--p_cuenta <= unsigned(cuentap);
    if (enable = '1') then
      if (cont = "1001") then
        p_cont <= "0000";
        sat <= '1';
      else
        p_cont <= cont+1;
        sat <= '0';
      end if;
    else
      p_cont <= cont;
    end if;
  end process;

  sinc : process(reset, clk)
  begin
    if (reset = '1') then
      cont <= (others => '0');
    --  cuentap <= (others => '0');
    -- debug   <= (others => '0');
    elsif(rising_edge(clk)) then
      cont <= p_cont;
    end if;

  end process;


end Behavioral;
