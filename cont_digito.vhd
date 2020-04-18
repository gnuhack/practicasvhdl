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

  signal cuenta, p_cuenta: unsigned(3 downto 0);

begin

  cuenta <= std_logic_vector(cuenta);

  comb: process(cuenta)
  begin
      p_cuenta <= cuenta + 1;
  end process;
  cuenta <= p_cuenta;

  sinc: process(rst, clk)
  begin
    if (rst = '1') then
      cuenta <= "0000";
    elsif (rising_edge(clk)) then
      cuenta <= p_cuenta;
    end if;
  end process;

end Behavioral;

