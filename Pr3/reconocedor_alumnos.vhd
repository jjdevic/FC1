
ENTITY ffd IS
  PORT( 
        clk: in bit;
        d: in bit;
        nclear: in bit;
        q: out bit;
        qn: out bit );
END ffd;

ARCHITECTURE comportamiento OF ffd IS
BEGIN
  PROCESS(clk)
  BEGIN
    IF (nclear='0') THEN
      q <= '0';
      qn<='1';
    ELSIF (clk'event and clk='1') THEN
      q <= d;
      qn <= not d;
    END IF;
  END PROCESS;
END comportamiento;


ENTITY and3 IS
  PORT(e1, e2, e3 : IN bit; s : OUT bit);
END and3;
ARCHITECTURE comportamiento OF and3 IS
BEGIN
  s <= e1 AND e2 AND e3;
END comportamiento;


ENTITY and2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END and2;
ARCHITECTURE comportamiento OF and2 IS

BEGIN
  s <= e1 AND e2;
END comportamiento;

ENTITY or2 IS
  PORT(e1, e2 : IN bit; s : OUT bit);
END or2;
ARCHITECTURE comportamiento OF or2 IS
BEGIN
  s <= e1 OR e2;
END comportamiento;



ENTITY inv IS
  PORT(e : IN bit; s : OUT bit);
END inv;
ARCHITECTURE comportamiento OF inv IS
BEGIN
  s <= NOT e;
END comportamiento;
----------------------------------
----------------------------------
--reconocedor del patron 010------
----------------------------------
-----------------------------------


ENTITY reconocedor IS
  PORT(clk, nclear, x : IN bit; z : OUT bit);
END reconocedor;

ARCHITECTURE estructural OF reconocedor IS

--declaración de componentes, a completar por el alumno
  COMPONENT inv
    PORT(e : IN bit; s : OUT bit);
  END COMPONENT;
  COMPONENT ffd
    PORT(clk, d, nclear : IN bit; q, qn : OUT bit);
  END COMPONENT;
  COMPONENT and3
    PORT(e1, e2, e3 : IN bit; s : OUT bit);
  END COMPONENT;
  COMPONENT and2
    PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;
  COMPONENT or2
    PORT(e1, e2 : IN bit; s : OUT bit);
  END COMPONENT;
--declaración de señales . a completar por el alumno
  SIGNAL sal_inv, sal_and3, sal_and2, sal_or2, sal_ffd0, sal_ffd0_inv, sal_ffd1, sal_ffd1_inv : bit;


BEGIN
--descripción estructural de la arquitectura 
--utilizando las componentes, inv,or2,and2,and3 y ffd
  i_inv_1 : inv PORT MAP(x, sal_inv);
  i_and3_1 : and3 PORT MAP(sal_inv, sal_ffd1, sal_ffd0_inv, sal_and3);
  i_and2_1 : and2 PORT MAP(x, sal_ffd0, sal_and2);
  i_or2_1 : or2 PORT MAP(sal_and3, sal_and2, sal_or2);
  i_and2_2 : and2 PORT MAP(sal_ffd0, sal_ffd1, z);
  i_ffd_0 : ffd PORT MAP(clk, sal_inv, nclear, sal_ffd0, sal_ffd0_inv);
  i_ffd_1 : ffd PORT MAP(clk, sal_or2, nclear, sal_ffd1, sal_ffd1_inv);
END estructural;



