ENTITY banco IS
  PORT(  clk, rst : IN bit;   --reloj
  	we : IN bit;	-- entrada capacitacion 1 bit (decodificador)
  	wa : IN bit_vector(1 downto 0);		--entrada wa de 2 bits (decodificador)
  	di : IN bit_vector(3 downto 0);		--entrada di de 4 bits (registro)
  	ra : IN bit_vector(1 downto 0);		--entrada ra de 2 bits (multiplexor) 
    do : OUT bit_vector(3 downto 0));	--salida (multiplexor)
  END banco;

ARCHITECTURE estructural OF banco IS

COMPONENT registro			
	 PORT(  clk, rst : IN bit;   --reloj y reset 
  	ld : IN bit;
  	d : IN bit_vector(3 downto 0);  --entrada d de 4 bits 
    q : OUT bit_vector(3 downto 0));  --salida
END COMPONENT;

COMPONENT multiplexor_vectorial
PORT(	a : IN bit_vector(3 downto 0);  --entrada a de 4 bits 
        b : IN bit_vector(3 downto 0);  --entrada b de 4 bits  
        c : IN bit_vector(3 downto 0);  --entrada c de 4 bits 
        d : IN bit_vector(3 downto 0);  --entrada d de 4 bits 
    s : IN bit_vector(1 downto 0);  --entrada s de control de 2 bits
    z : OUT bit_vector(3 downto 0));  --salida
  END COMPONENT;

COMPONENT decodificador2a4
	PORT (entrada: IN bit_vector(1 downto 0); en: IN bit; salida: OUT bit_vector(3 downto 0));
END COMPONENT;

SIGNAL reg0_s, reg1_s, reg2_s, reg3_s, deco_s : bit_vector(3 downto 0);

BEGIN

i_deco : decodificador2a4 PORT MAP(wa, 	we, deco_s);

i_reg0 : registro PORT MAP(clk, rst, deco_s(0), di, reg0_s);
i_reg1 : registro PORT MAP(clk, rst, deco_s(1), di, reg1_s);
i_reg2 : registro PORT MAP(clk, rst, deco_s(2), di, reg2_s);
i_reg3 : registro PORT MAP(clk, rst, deco_s(3), di, reg3_s);

i_mx : multiplexor_vectorial PORT MAP(reg0_s, reg1_s, reg2_s, reg3_s, ra, do);

END estructural;