

----------------------------------
----------------------------------
--registgro multi funci贸n------
----------------------------------
-----------------------------------

ENTITY registro_mf IS
  PORT(		clk, rst_n: IN bit;   --reloj y reset negativo
		esi: IN bit;  --entrada serie del desplazamiento izquierda
		e : IN bit_vector(2 downto 0);  --dato de carga paralela
		c : IN bit_vector(1 downto 0); --control
		q : OUT bit_vector(2 downto 0));--salida
END registro_mf;

ARCHITECTURE estructural OF registro_mf IS

--declaraci贸n de los componentes biestable y multiplexor4a1

COMPONENT biestable
  PORT(clk : IN bit; rst_n : IN bit; d : IN bit; q : OUT bit);
END COMPONENT;
COMPONENT multiplexor4a1
  PORT(X0,X1,X2,X3 : IN bit; S1,S0 : IN bit; Z : OUT bit);
END COMPONENT;

--declaraci贸n de se帽ales internas a completar por el alumno
--declaraci髇 de se馻les internas a completar por el alumno
-- se馻les de multiplexores a biestables
--se馻les salidas de los biestables

SIGNAL b_sal_1, b_sal_2, b_sal_3, mx1_sal_z, mx2_sal_z, mx3_sal_z : bit;


BEGIN

i_mx_1 : multiplexor4a1 PORT MAP(e(2), b_sal_2, esi, b_sal_1, c(1), c(0), mx1_sal_z);
i_mx_2 : multiplexor4a1 PORT MAP(e(1), b_sal_3, b_sal_1, b_sal_2, c(1), c(0), mx2_sal_z);
i_mx_3 : multiplexor4a1 PORT MAP(e(0), b_sal_1, b_sal_2, b_sal_3, c(1), c(0), mx3_sal_z);

i_b_1 : biestable PORT MAP(clk, rst_n, mx1_sal_z, b_sal_1);
i_b_2 : biestable PORT MAP(clk, rst_n, mx2_sal_z, b_sal_2);
i_b_3 : biestable PORT MAP(clk, rst_n, mx3_sal_z, b_sal_3);

--asignaci贸n de valores al bus de salida

q(0) <= b_sal_1;
q(1) <= b_sal_2;
q(2) <= b_sal_3;

END estructural;
