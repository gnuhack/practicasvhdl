LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_control_display IS
END tb_control_display;

ARCHITECTURE behavior OF tb_control_display IS 
  
  -- Component Declaration for the Unit Under Test (UUT)
  
component control_display is
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
end component;

-- Inputs

  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  

  -- Outputs
signal a,b,c,d,e,f,g,dp : std_logic;
signal an : std_logic_vector (3 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;
  
BEGIN
  
  -- Instantiate the Unit Under Test (UUT)
  uut: control_display PORT MAP (
    clk => clk,
    rst => rst,
    a => a,
    b => b,
    c => c,
    d => d,
    e => e,
    f => f,
    g => g,
    dp => dp,
    an => an
    
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
