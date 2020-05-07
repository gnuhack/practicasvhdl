library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  rst_sync: in STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end contador;

architecture Behavioral of contador is

  signal cuenta, p_cuenta: unsigned(7 downto 0);

begin

  salida <= std_logic_vector(cuenta);

  comb: process(cuenta, rst_sync)
  begin
    if (rst_sync = '1') then
	   p_cuenta <= (others => '0');
	 else
      p_cuenta <= cuenta + 1;
	 end if;
  end process;

  sinc: process(rst, clk)
  begin
    if (rst = '1') then
	   cuenta <= "00000000";
	 elsif (rising_edge(clk)) then
	   cuenta <= p_cuenta;
	 end if;
  end process;

end Behavioral;

