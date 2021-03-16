--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:52:42 03/16/2021
-- Design Name:
-- Module Name:   /home/carlos/Plantillas/pruebacont/p1/tb_control_display_p1.vhd
-- Project Name:  p1
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: control_display_p1
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_control_display_p1 IS
END tb_control_display_p1;

ARCHITECTURE behavior OF tb_control_display_p1 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT control_display_p1
    PORT(
         a : OUT  std_logic;
         b : OUT  std_logic;
         c : OUT  std_logic;
         d : OUT  std_logic;
         e : OUT  std_logic;
         f : OUT  std_logic;
         g : OUT  std_logic;
         dp : OUT  std_logic;
         an : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal a : std_logic;
   signal b : std_logic;
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;
   signal f : std_logic;
   signal g : std_logic;
   signal dp : std_logic;
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: control_display_p1 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g,
          dp => dp,
          an => an,
          clk => clk,
          reset => reset
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
      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
