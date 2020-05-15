library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         sat : out STD_ULOGIC);
end div;

architecture Behavioral of div is

  signal cuenta, p_cuenta: unsigned(25 downto 0);
  signal salida: std_logic_vector(25 downto 0);

begin

  salida <= std_logic_vector(cuenta);

  comb: process(cuenta)
  begin
      p_cuenta <= cuenta + 1;

    if (cuenta(6 downto 0) = "1111111") then
      sat<='1';
    else
      sat <='0';
    end if;

  end process;

  sinc: process(rst, clk)
  begin
    if (rst = '1') then
      cuenta <= "00000000000000000000000000";
    elsif (rising_edge(clk)) then
      cuenta <= p_cuenta;
    end if;
    
  end process;

end Behavioral;

