LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_contador IS
END tb_contador;
 
ARCHITECTURE behavior OF tb_contador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			rst_sync : IN std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
	 signal rst_sync : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador PORT MAP (
          clk => clk,
          rst => rst,
			 rst_sync => rst_sync,
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
      wait for clk_period*10;
		rst_sync <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
