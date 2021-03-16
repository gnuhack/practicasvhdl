library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_display_p1 is
    Port ( a : out  STD_LOGIC;
           b : out  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC;
           f : out  STD_LOGIC;
           g : out  STD_LOGIC;
           dp : out  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end control_display_p1;

architecture Behavioral of control_display_p1 is
  signal s_sat : std_logic;
  signal s_cuenta : std_logic_vector (3 downto 0);
  signal s_dec : std_logic_vector (6 downto 0);

  component div_frec is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sat : out  STD_LOGIC);
  end component;

  component cont_digito is
    port (clk    : in  std_logic;
          reset  : in  std_logic;
          enable : in  std_logic;
          cuenta : out std_logic_vector (3 downto 0));
end component;

component decodificador is
  Port ( binario : in  STD_LOGIC_VECTOR (3 downto 0);
         siete_seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

  divisor : div_frec
    port map(
      clk => clk,
      reset => reset,
      sat => s_sat);

  contador : cont_digito
    port map(
      clk => clk,
      reset => reset,
      enable => s_sat,
      cuenta => s_cuenta);

  decod : decodificador
    port map(
      binario => s_cuenta,
      siete_seg => s_dec);

  dp <= '1';
  an <= "1110";
  a <= s_dec(0);
  b <= s_dec(1);
  c <= s_dec(2);
  d <= s_dec(3);
  e <= s_dec(4);
  f <= s_dec(5);
  g <= s_dec(6);

end Behavioral;
