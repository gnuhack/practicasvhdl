LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_div_frec IS
END tb_div_frec;

ARCHITECTURE behavior OF tb_div_frec IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT div_frec
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         sat : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal sat : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: div_frec PORT MAP (
          clk => clk,
          reset => reset,
          sat => sat
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
     reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
     reset <= '0';
      wait for clk_period*100;

      -- insert stimulus here

      wait;
   end process;

END;
