LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_cont_digito IS
END tb_cont_digito;

ARCHITECTURE behavior OF tb_cont_digito IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT cont_digito
  PORT ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
         enable : in STD_LOGIC;
         sat : out STD_LOGIC;
         cuenta : out  STD_LOGIC_VECTOR (3 downto 0));
  END COMPONENT;
  

  --Inputs
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  signal enable : std_logic :='0';
  
  --Outputs
  signal cuenta : std_logic_vector(7 downto 0);
  signal sat : std_logic := '0';

  -- Clock period definitions
  constant clk_period : time := 10 ns;
  
BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: cont_digito PORT MAP (
    clk => clk,
    rst => rst,
    enable => enable,
    sat => sat,
    cuenta => cuenta
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
