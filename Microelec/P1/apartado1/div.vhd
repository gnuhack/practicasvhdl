library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity div is
  Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         sat : out STD_ULOGIC;
         rst_sync: in STD_LOGIC;
         salida : out  STD_LOGIC_VECTOR (3 downto 0));
end div;

architecture Behavioral of div is

  signal cuenta, p_cuenta: unsigned(3 downto 0);

begin

  salida <= std_logic_vector(cuenta);

  comb: process(cuenta, rst_sync)
  begin

    if (rst_sync = '1') then
      p_cuenta <= (others => '0');
    else
      p_cuenta <= cuenta + 1;
    end if;
    if (cuenta = "1111") then
      sat<='1';
    else
      sat <='0';
    end if;

  end process;

  sinc: process(rst, clk)
  begin
    if (rst = '1') then
      cuenta <= "0000";
    elsif (rising_edge(clk)) then
      cuenta <= p_cuenta;
    end if;
    
  end process;

end Behavioral;

