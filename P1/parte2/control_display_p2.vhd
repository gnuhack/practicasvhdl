library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_display_p2 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           a : out  STD_LOGIC;
           b : out  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC;
           f : out  STD_LOGIC;
           g : out  STD_LOGIC;
           dp : out  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end control_display_p2;

architecture Behavioral of control_display_p2 is

signal enable_rd : std_logic;
signal s_div_sat : std_logic;
signal s_sat_cont4 : std_logic;
signal s_sat_cont3 : std_logic;
signal s_sat_cont2 : std_logic;
signal enable3 : std_logic;
signal enable2 : std_logic;
signal enable1 : std_logic;
signal scont4 : std_logic_vector(3 downto 0);
signal scont3 : std_logic_vector(3 downto 0);
signal scont2 : std_logic_vector(3 downto 0);
signal scont1 : std_logic_vector(3 downto 0);
signal s_reg : std_logic_vector(3 downto 0);
signal s_reg_desp: std_logic_vector(3 downto 0);

component decodificador is
  Port ( binario : in  STD_LOGIC_VECTOR (3 downto 0);
         siete_seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component div_frec is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           sat : out  STD_LOGIC;
           sat2 : out STD_LOGIC);
end component;

component cont_digito is
port (clk    : in  std_logic;
      reset  : in  std_logic;
      enable : in  std_logic;
      cuenta : out std_logic_vector (3 downto 0);
      sat    : out std_logic);
end component;

component reg_desp is
Port ( clk : in  STD_LOGIC;
       reset : in  STD_LOGIC;
       enable : in  STD_LOGIC;
       display_enable : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

  enable3 <= s_sat_cont4 and s_div_sat;
  enable2 <= s_sat_cont3 and enable3;
  enable1 <= s_sat_cont2 and enable2;
  dp <= '1';
  an <= s_reg_desp;

  s_reg <= scont4 when s_reg_desp="1110" else
           scont3 when s_reg_desp="1101" else
           scont2 when s_reg_desp="1011" else
           scont1 when s_reg_desp="0111"
        else "0000";

  divisor : div_frec
    port map(
      sat2 => enable_rd,
      sat => s_div_sat,
      clk => clk,
      reset => reset);

  cont4 : cont_digito
    port map(
      sat => s_sat_cont4,
      enable => s_div_sat,
      cuenta => scont4,
      clk => clk,
      reset => reset);
  cont3 : cont_digito
    port map(
      sat => s_sat_cont3,
      enable => enable3,
      cuenta => scont3,
      clk => clk,
      reset => reset);
  cont2 : cont_digito
    port map(
      sat => s_sat_cont2,
      enable => enable2,
      cuenta => scont2,
      clk => clk,
      reset => reset);

  cont1 : cont_digito
    port map(
      sat => open,
      enable => enable1,
      cuenta => scont1,
      clk => clk,
      reset => reset);

  registro : reg_desp
    port map(
      display_enable => s_reg_desp,
      enable => enable_rd,
      clk => clk,
      reset => reset);

  decod : decodificador
    port map(
      binario => s_reg,
      siete_seg(0) => a,
      siete_seg(1) => b,
      siete_seg(2) => c,
      siete_seg(3) => d,
      siete_seg(4) => e,
      siete_seg(5) => f,
      siete_seg(6) => g
      );

end Behavioral;
