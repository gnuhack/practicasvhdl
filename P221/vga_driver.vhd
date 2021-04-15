library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity VGA_driver is
  port (clk   : in  std_logic;
        reset : in  std_logic;
        VS    : out std_logic;
        HS    : out std_logic;
        R     : out std_logic;
        G     : out std_logic;
        B     : out std_logic);
end VGA_driver;

architecture Behavioural of VGA_driver is

  signal clk_pixel, Blank_H, Blank_V, R_in, G_in, B_in, reseth, resetv, enable_and: std_logic;
  signal eje_x, eje_y                                          : std_logic_vector (9 downto 0);
  component contador is
    generic (Nbit : integer := 10);
    port (clk    : in  std_logic;
          reset  : in  std_logic;
          enable : in  std_logic;
          resets : in  std_logic;
          Q      : out std_logic_vector (Nbit-1 downto 0));
  end component;

  component comparador is
    generic (Nbit           : integer := 10;
             End_Of_Screen  : integer := 639;
             Start_Of_Pulse : integer := 655;
             End_Of_Pulse   : integer := 751;
             End_Of_Line    : integer := 799);
    port (clk   : in  std_logic;
          reset : in  std_logic;
          data  : in  std_logic_vector (Nbit-1 downto 0);
          O1    : out std_logic;
          O2    : out std_logic;
          O3    : out std_logic);
  end component;
 
  component dibuja is
    port (eje_x : in  std_logic_vector (9 downto 0);
          eje_y : in  std_logic_vector (9 downto 0);
          R     : out std_logic;
          G     : out std_logic;
          B     : out std_logic);

  end component;

-- Ahora mismo funciona el contador horizontal.
  --Simulando por separado funciona el comparador
  --pero al verlo en el tb_vga_driver no.
  --¿Por qué sale 0 de O3 en el comph?
  --Sale siempre 0 porque O3 nunca llega a
  --End_Of_Line que es 799, ya que al llegar
  --a 255 vuelve a 0.
  --¿Podría pasar porque toma Nbit como 8
  --a pesar de que le he puesto 10?
begin
  enable_and <= clk_pixel and reseth;
  
  dib : dibuja
    port map(
      eje_x => eje_x,
      eje_y => eje_y,
      R => R_in,
      G => G_in,
      B => B_in
      );
  
  conth : contador
    generic map(
      Nbit => 10)
    port map(
      enable => clk_pixel,
      reset  => reset,
      resets => reseth,
      clk    => clk,
      Q      => eje_x
      );

  contv : contador
    generic map(
      Nbit => 10)
    port map(
      enable => enable_and,
      resets => resetv,
      reset  => reset,
      clk    => clk,
      Q      => eje_y
      );

  comph : comparador
    generic map(
      Nbit           => 10,
      End_Of_Screen  => 639,
      Start_Of_Pulse => 655,
      End_Of_Pulse   => 751,
      End_Of_Line    => 799)
    port map(
      clk   => clk,
      reset => reset,
      data  => eje_x,
      O1    => blank_h,
      O2    => HS,
      O3    => reseth);

  compv : comparador
    generic map(
      Nbit           => 10,
      End_Of_Screen  => 479,
      Start_Of_Pulse => 489,
      End_Of_Pulse   => 491,
      End_Of_Line    => 520)
    port map(
      clk   => clk,
      reset => reset,
      data  => eje_y,
      O1    => blank_v,
      O2    => VS,
      O3    => resetv);


  div_frec : process(clk, reset)
  begin
    if (reset = '1') then
      clk_pixel <= '0';
    elsif (clk = '1' and clk'event) then
      clk_pixel <= not clk_pixel;
    end if;
  end process;

  gen_color : process(Blank_H, Blank_V, R_in, G_in, B_in)
  begin
    if (Blank_H = '1' or Blank_V = '1') then
      R <= '0'; G <= '0'; B <= '0';
    else
      R <= R_in; G <= G_in; B <= B_in;
    end if;
  end process;

end Behavioural;