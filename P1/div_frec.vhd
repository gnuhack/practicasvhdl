library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div_frec is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sat : out  STD_LOGIC;
           sat2 : out STD_LOGIC);
end div_frec;

architecture Behavioral of div_frec is
-- entradas
  signal cuenta,p_cuenta :unsigned(25 downto 0);
begin

  comb : process(reset,cuenta)
begin

      p_cuenta <= cuenta+1;
      if (cuenta="11111111111111111111111111") then
        sat<='1';
      else
        sat<='0';
      end if;
      if (cuenta(7 downto 0) = "11111111") then
        sat2 <= '1';
      else
        sat2 <= '0';
        end if;
  end process;

  sinc : process(reset, p_cuenta, clk)
begin
    if (reset = '1') then
      cuenta <= (others =>'0');

    elsif (rising_edge(clk)) then
      cuenta <= p_cuenta;
    end if;

      end process;

end Behavioral;
