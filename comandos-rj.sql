select first_name, salary from employees order by salary desc fetch first 7 rows with TIES

-- lista el porcentaje de 20
SELECT * FROM EMPLOYEES FETCH FIRST 20 PERCENT ROWS ONLY;

-- FUNCIONES
--- LOWER (minuscula)
SELECT EMAIL, LOWER(EMAIL) FROM EMPLOYEES;

--- UPPER (mayuscula)
SELECT EMAIL, UPPER(EMAIL) FROM EMPLOYEES;
SELECT FIRST_NAME FROM EMPLOYEES WHERE UPPER(FIRST_NAME) = 'DAVID';

--- INTICAP (la primera letra sale en mayuscula)
SELECT INITCAP('esto es una prueba') as columm1 FROM DUAL;


--- CONCAT
SELECT FIRST_NAME ||' '|| LAST_NAME AS NOMBRE FROM EMPLOYEES;
SELECT CONCAT(FIRST_NAME, CONCAT(' ',LAST_NAME)) AS NOMBRE FROM EMPLOYEES; -- es recomendado para respetar las versiones

--- LENGTH (CI)
SELECT FIRST_NAME AS NOMBRE, LENGTH(FIRST_NAME) FROM EMPLOYEES;
SELECT FIRST_NAME AS NOMBRE FROM EMPLOYEES WHERE LENGTH(FIRST_NAME) = 5;

--- SUBSTR(CADENA,POSICION,LONGITUD)
SELECT FIRST_NAME AS NOMBRE, SUBSTR(FIRST_NAME, 1, 3) FROM EMPLOYEES; -- POSICION HASTA EL 3
SELECT FIRST_NAME AS NOMBRE, SUBSTR(FIRST_NAME, 3) FROM EMPLOYEES; -- DESDE EL 3 AL ULTIMO
SELECT FIRST_NAME AS NOMBRE, SUBSTR(FIRST_NAME, LENGTH(FIRST_NAME), 1)  FROM EMPLOYEES; -- ULTIMA LETRA 

---- INSTR(C1, C2) O INSTR(C1, C2, POSITION) 
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES; -- calcula de acuerdo al valor cadenas
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES where INSTR(FIRST_NAME, 'a') <> 0;
SELECT FIRST_NAME, INSTR( LOWER(FIRST_NAME), 'a') FROM EMPLOYEES where INSTR( LOWER(FIRST_NAME), 'a') <> 0;
SELECT FIRST_NAME, INSTR( LOWER(FIRST_NAME), 'a') FROM EMPLOYEES where INSTR( LOWER(FIRST_NAME), 'a', 4) <> 0;

--- LPAD, RPAD
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT RPAD(FIRST_NAME, 20, '*') FROM EMPLOYEES; -- LLENA LOS DEMAS ESPACIAS EN BLANCO CON TEXTO A�ADIDO DERECHO 
SELECT LPAD(FIRST_NAME, 20, '*') FROM EMPLOYEES; -- LLENA LOS DEMAS ESPACIAS EN BLANCO CON TEXTO A�ADIDO IZQUIERDO

---- REPLACE (CADENA, CAD_ORIGINAL, NUEVA)
SELECT REPLACE(FIRST_NAME, 'a', '*') FROM EMPLOYEES;

--- LTRIM RTRIM / LIMPIA LOS CARACTERES EN BLANCO DE LA DERECHA O IZQUIERDA
SELECT RTRIM('ALBERTO              ') || ' HOLA' FIRST_NAME FROM EMPLOYEES;
SELECT 'ALBERTO ' || lTRIM ('                      HOLA') FIRST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME , RTRIM(FIRST_NAME, 'n') FROM EMPLOYEES; -- quita el texto ultimo por palabra de la derecha
SELECT FIRST_NAME , LTRIM(FIRST_NAME, 'S') FROM EMPLOYEES; -- quita el texto ultimo por palabra de la izquierda



--- PRACTICAS
SELECT * FROM LOCATIONS S WHERE UPPER(S.COUNTRY_ID) IN ('CA', 'US') AND LENGTH(s.street_address) > 15 ; -- quita el texto ultimo por palabra

SELECT s.first_name || ' ' || s.last_name  as Nombre, (s.salary * 14) as Salario FROM EMPLOYEES s
where INSTR(s.last_name, 'b', 3) <> 0;

SELECT s.first_name || ' ' || s.last_name  as Nombre, s.salary as Salario FROM EMPLOYEES s
where INSTR(s.first_name, 'a') <> 0
and s.salary between 4000 and 7000;

SELECT FIRST_NAME, LAST_NAME, SUBSTR(FIRST_NAME, 1, 1) ||'.'|| SUBSTR(LAST_NAME, 1, 1) || '.' AS INICIALES  FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME  
FROM EMPLOYEES
WHERE UPPER(SUBSTR(FIRST_NAME, 1, 1)) = 'S'
OR UPPER(SUBSTR(LAST_NAME, 1, 1)) = 'S';

SELECT FIRST_NAME, salary,RPAD('*', SALARY/1000 , '*') FROM EMPLOYEES;

----------------------------------------------------------------
/*FUNCIONES TIPO NUMERICOS 
    ROUND
    TRUNC
    MOD
    POWER
    
    *LAS CIENTIFICAS*
    SIGN - SENO 
    SIN - COCENO
    SINH - 
    SQRT
    TAN  . TANGENTE
    TANH
*/
----------------------------------------------------------------
--- ROUND (C1. N)
SELECT ROUND(50.900, 2) FROM DUAL;    -- redondea
SELECT ROUND(50.923164, 2) FROM DUAL; -- redondea

--- TRUNC(C1, N)
SELECT TRUNC(50.900, 2) FROM DUAL;  -- quita los ceros de un decimal 
SELECT TRUNC(50.923164, 2) FROM DUAL; -- coloca el decimal establecido

--- MOD(A,B)
SELECT MOD(8200, 3) FROM DUAL; -- RESIDUO DE UNA DIVICION usar para par o impar

--- POWER(NUMERO, N_POTENCIAL)
SELECT POWER (10, 2) FROM DUAL; -- ELEVA AL CUADRADO

--- PRACTICA
SELECT EMPLOYEE_ID, first_name, salary FROM EMPLOYEES WHERE mod(EMPLOYEE_ID,2) <> 0;

SELECT TRUNC(25.34,0),ROUND(25.34,0) FROM DUAL;
SELECT TRUNC(25.34,1),ROUND(25.34,1) FROM DUAL;
SELECT TRUNC(25.67,-1),ROUND(25.67,-1) FROM DUAL;
TRUNC(25.67,0) ROUND(25.67,0)
-------------- --------------
 25 26
TRUNC(25.67,1) ROUND(25.67,1)
-------------- --------------
25,6 25,7
TRUNC(25.34,0) ROUND(25.34,0)
-------------- --------------
 25 25
TRUNC(25.34,1) ROUND(25.34,1)
-------------- --------------
25,3 25,3
TRUNC(25.67,-1) ROUND(25.67,-1)

-----------------------------------------------
/*
    FECHA ARITMETICA
*/
----------------------------------------------
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES;

SELECT SYSDATE FROM DUAL;

-- RECORDAR 1 ENERO -4712 AC > DC

--- SUMAR UN NUMERO
SELECT SYSDATE+2 FROM DUAL;

--- RESTAR UN NUMERO
SELECT SYSDATE-2 FROM DUAL;

--- RESTAR FECHAS
SELECT HIRE_DATE, (SYSDATE - HIRE_DATE)/7 FROM EMPLOYEES;

--- MONTHS_BETWEEN(F1,F2)
SELECT HIRE_DATE, MONTHS_BETWEEN(SYSDATE,HIRE_DATE) FROM EMPLOYEES; -- CALCULA LOS DIAS HASTA LA FECHA ACTUAL
--- ADD_MONTHS(F1,N)
SELECT HIRE_DATE, ADD_MONTHS(HIRE_DATE,3) FROM EMPLOYEES; -- A�ADE MESES DE ACUERDO EL N  

--- NEXT_DAY(FECHA,STRING)
SELECT SYSDATE, NEXT_DAY(SYSDATE,'MAR') FROM DUAL; -- CALCULA LA FECHA DEL SIGUIENTE DIA ESPA�OL

--- LAST_DAY(FECHA)
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL; -- Te captura el ultimo dia del mes

--- ROUND(FECHA, TIPO_DAY/MONTH/YEAR) OR TRUNC(FECHA, TIPO_DAY/MONTH/YEAR) 
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR') FROM DUAL;
SELECT SYSDATE, ROUND(SYSDATE, 'MONTH'), ROUND(TO_DATE(TO_CHAR('01-07-2021')), 'YEAR') FROM DUAL; -- ROUND YEAR SI ES MAYOR AL NUMERO DE MES REDONDEA AL SIGUIENTE A�O

SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR') FROM DUAL;
SELECT SYSDATE, TRUNC(SYSDATE, 'MONTH'), TRUNC(TO_DATE(TO_CHAR('01-07-2021')), 'YEAR') FROM DUAL; -- TRUNC YEAR SOLO PINTA DEL MES INICIAL CON EL A�O

----- PRACTICA 
SELECT first_name, HIRE_DATE, ROUND((SYSDATE-HIRE_DATE),0)  FROM EMPLOYEES; 

SELECT SYSDATE+15  FROM DUAL; 

SELECT ROUND(MONTHS_BETWEEN('25-12-2021',SYSDATE),1) FROM DUAL; 

SELECT first_name, HIRE_DATE, LAST_DAY(HIRE_DATE)  FROM EMPLOYEES; 

SELECT first_name, HIRE_DATE FROM EMPLOYEES
WHERE ROUND(HIRE_DATE, 'MONTH') > HIRE_DATE; -- MUESTRA LOS EMPLEADOS QUE ENTRARON MAYOIR A 15 DIAS




