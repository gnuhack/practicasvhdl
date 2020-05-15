library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_display is
  Port( clk : in std_logic;
        rst : in std_logic;
        a : out std_logic;
        b : out std_logic;
        c : out std_logic;
        d : out std_logic;
        e : out std_logic;
        f : out std_logic;
        g : out std_logic;
        dp : out std_logic;
        an: out std_logic_vector (3 downto 0));
end control_display;

architecture Behavioral of control_display is

  -- Signals
  signal enable : std_logic;
  signal binario : std_logic_vector (3 downto 0);
  
  component div is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sat : out STD_ULOGIC
           );
  end component;

  component cont_digito is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in STD_LOGIC;
           sat : out STD_LOGIC;
           cuenta : out  STD_LOGIC_VECTOR (3 downto 0));
  end component;

  component decod is
    port (binario : in std_logic_vector(3 downto 0);
          siete_seg : out std_logic_vector(6 downto 0));
  end component;

  
  
begin

  dp <= '1';
  an <= "1110";

  
  
  inst_div: div
    port map(
      clk => clk,
      rst => rst,
      sat => enable
      );

  inst_cont_digito: cont_digito
    port map(
      clk => clk,
      rst => rst,
      cuenta => binario,
      sat => open,
      enable => enable
      );
  inst_decod: decod
    port map(
      binario => binario,
      siete_seg(0) => a,
      siete_seg(1) => b,
      siete_seg(2) => c,
      siete_seg(3) => d,
      siete_seg(4) => e,
      siete_seg(5) => f,
      siete_seg(6) => g
      
      );
  
end Behavioral;
