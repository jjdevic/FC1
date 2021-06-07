


ENTITY registro IS
  PORT(  clk, rst : IN bit;   --reloj y reset 
  	ld : IN bit;
  	d : IN bit_vector(3 downto 0);  --entrada d de 4 bits 
    q : OUT bit_vector(3 downto 0));  --salida
  END registro;

ARCHITECTURE estructural OF registro IS

COMPONENT biestable
	PORT(clk: IN bit; rst_n: IN bit; en: IN bit; d: IN bit; q: OUT bit);
END COMPONENT;

BEGIN

i_bst_0 : biestable PORT MAP(clk, rst, ld, d(0), q(0));
i_bst_1 : biestable PORT MAP(clk, rst, ld, d(1), q(1));
i_bst_2 : biestable PORT MAP(clk, rst, ld, d(2), q(2));
i_bst_3 : biestable PORT MAP(clk, rst, ld, d(3), q(3));

END estructural;
