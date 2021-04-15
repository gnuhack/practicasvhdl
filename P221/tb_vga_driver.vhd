LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.all;

ENTITY tb_VGA_DRIVER IS
END tb_vga_driver;

ARCHITECTURE behavior OF tb_vga_driver IS 

component vga_driver
      port (clk   : in  std_logic;
        reset : in  std_logic;
        VS    : out std_logic;
        HS    : out std_logic;
        R     : out std_logic;
        G     : out std_logic;
        B     : out std_logic);
end component;

  -- Component Declaration for the Unit Under Test (UUT)
signal clk, reset, VS, HS, R, G, B: std_logic := '0';

  -- Clock period definitions
  constant clk_period : time := 10 ns;
  
BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: vga_driver PORT MAP (
    clk => clk,
    reset => reset,
    VS => VS,
    HS => HS,
    R => R,
    G => G,
    B => B
    );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    reset <= '1';
    wait for 100 ns;	
    reset <= '0';
--    hs <= '0';

    -- insert stimulus here 

    wait;
  end process;

END;