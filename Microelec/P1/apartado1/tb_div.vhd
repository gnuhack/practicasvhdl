LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_div IS
END tb_div;

ARCHITECTURE behavior OF tb_div IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT div
    PORT(
      clk : IN  std_logic;
      rst : IN  std_logic;
      rst_sync : in std_logic;
      sat : OUT std_logic;
      salida : OUT  std_logic_vector(3 downto 0)
      );
  END COMPONENT;
  

  --Inputs
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  
  signal rst_sync : std_logic := '0';

  --Outputs
  signal salida : std_logic_vector(3 downto 0);
  signal sat : std_ulogic :='0';

  -- Clock period definitions
  constant clk_period : time := 10 ns;
  
BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: div PORT MAP (
    clk => clk,
    rst_sync => rst_sync,
    rst => rst,
    sat => sat,
    salida => salida
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
    rst <= '1';

    wait for 100 ns;	
    rst <= '0';


    -- insert stimulus here 

    wait;
  end process;

END;
