


ENTITY multiplexor_vectorial IS
  PORT(   a : IN bit_vector(3 downto 0);  --entrada a de 4 bits 
          b : IN bit_vector(3 downto 0);  --entrada b de 4 bits  
          c : IN bit_vector(3 downto 0);  --entrada c de 4 bits 
          d : IN bit_vector(3 downto 0);  --entrada d de 4 bits 
    s : IN bit_vector(1 downto 0);  --entrada s de control de 2 bits
    z : OUT bit_vector(3 downto 0));  --salida
  END multiplexor_vectorial;

ARCHITECTURE estructural OF multiplexor_vectorial IS

COMPONENT multiplexor4a1
  PORT(X0,X1,X2,X3 : IN bit; S1,S0 : IN bit; Z : OUT bit);
END COMPONENT;

BEGIN

i_mx_0 : multiplexor4a1 PORT MAP(d(0), c(0), b(0), a(0), s(1), s(0), z(0));
i_mx_1 : multiplexor4a1 PORT MAP(d(1), c(1), b(1), a(1), s(1), s(0), z(1));
i_mx_2 : multiplexor4a1 PORT MAP(d(2), c(2), b(2), a(2), s(1), s(0), z(2));
i_mx_3 : multiplexor4a1 PORT MAP(d(3), c(3), b(3), a(3), s(1), s(0), z(3));

END estructural;
