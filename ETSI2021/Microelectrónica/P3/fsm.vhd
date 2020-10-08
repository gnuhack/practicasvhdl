entity fsm is
  Generic (ancho_bus_dir  : integer := 4;
           VAL_SAT_CONT   : integer := 20000;
           ANCHO_CONTADOR : integer := 20);
  Port (clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        button : in STD_LOGIC;
        data : in std_logic_vector(7 downto 0);
        direcc : out std_logic_vector(ancho_bus_dir-1 downto 0);
        TX : out std_logic);
        end fsm;
        

  
