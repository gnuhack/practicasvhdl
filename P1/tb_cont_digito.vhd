LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_cont_digito IS
END tb_cont_digito;

ARCHITECTURE behavior OF tb_cont_digito IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT cont_digito
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         cuenta : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal cuenta : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: cont_digito PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
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
     reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;
     reset <= '0';
     enable <='1';
     wait for 10 ns;
     enable <='0';
     wait for 100 ns;
     enable <='1';
     wait for 10 ns;
     enable <='0';
     wait for 100 ns;
     enable <='1';
     wait for 10 ns;
     enable <='0';
     wait for 100 ns;
     enable <='1';

      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
