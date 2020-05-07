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
      cuenta => binario
      );
  inst_decod: decod
    port map(
      binario => 
      siete_seg => a,b,c,d,e,f,g
      );
  
