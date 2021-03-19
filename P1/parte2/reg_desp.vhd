library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg_desp is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           display_enable : out  STD_LOGIC_VECTOR (3 downto 0));
end reg_desp;

architecture Behavioral of reg_desp is
  signal sde : unsigned(3 downto 0);
begin

  comb : process(reset, sde,enable)
    begin
    if (reset = '1') then
      sde <= "1110";
    elsif (enable = '1') then
      if (sde = "1110") then
        sde <= "1101";
      elsif (sde = "1101") then
        sde <= "1011";
      elsif (sde = "1011") then
        sde <= "0111";
      elsif (sde = "0111") then
        sde <= "1110";
      else
        sde <= "0000";
        end if;
      end if;
      display_enable <= std_logic_vector(sde);
    end process;
end Behavioral;
