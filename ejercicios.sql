/* 1º.-  Realizar un bloque Pl/Sql que calcule el importe de una factura sabiendo que el IVA a aplicar es del 12% y que si el importe bruto de la factura es 
superior a 50.000 € se debe realizar un descuento del 5%. */

declare
iva constant real:=0.12;
importe_bruto real;
importe_neto real;
begin
importe_bruto:='&importe_bruto';
importe_bruto:=importe_bruto + (iva * importe_bruto);
if (importe_bruto>50000)
  then
    importe_neto:=importe_bruto - (importe_bruto*0.05);
    dbms_output.put_line('el importe neto de la factura con descuento es '||importe_neto||' euros');
  else
     importe_neto:=importe_bruto;
     dbms_output.put_line('el importe neto de la factura sin descuento es '||importe_neto||' euros');
end if;
end;
/

/* 2º.-  Realizar un bloque Pl/Sql en el que introducimos tres números por teclados y nos los visualiza  de mayor a menor */

declare
        num1 integer:=&num1;
        num2 integer:=&num2;
        num3 integer:=&num3;
begin
        if num1>num2
            then
                if num1>num3
                    then
                        if num2>num3
                            then
                                DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num1||'  '|| num2||'  '|| num3);
                            else
                                DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num1||'  '|| num3||'  '|| num2); 
                        end if;
                    else
                        DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num3||'  '|| num1||'  '|| num2);
                end if;
            else
                if num2>num3
                    then
                        if num1>num3
                            then
                                DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num2||'  '|| num1||'  '|| num3);
                            else
                                DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num2||'  '|| num3||'  '|| num1); 
                        end if;
                    else
                        DBMS_OUTPUT.PUT_LINE('los numeros de mayor a menor son '|| num3||'  '|| num2||'  '|| num1); 
                end if; 
        end if;
end;
/



/* 3º.-  Realizar un bloque Pl/Sql que calcule el salario neto semanal de un trabajador en función del número de horas trabajadas y la tasa de impuestos de acuerdo a las siguientes hipótesis:
•	Las primeras 35 horas se pagan a tarifa normal
•	Las horas que pasen de 35 se pagan 1.5 veces la tarifa normal
•	 Las tasas de impuestos son:
o	Los primeros 50 dólares son libres de impuestos 
o	Los siguientes 40 dólares tienen un 25% de impuestos 
o	Los restantes de 45% de impuestos */

declare
salario_neto_semanal real;
horas_trabajadas real;
precio_hora real;
impuestos25 real;
impuestos45 real;
begin
horas_trabajadas:='&horas_trabajadas';
precio_hora:='&precio_hora';
impuestos25:=0;
impuestos45:=0;
salario_neto_semanal := horas_trabajadas * precio_hora;
if  horas_trabajadas <= 35
      then
          if (salario_neto_semanal>50)
              then
                 if (salario_neto_semanal<=90)
                      then
                          impuestos25:=(salario_neto_semanal-50)*0.25;
                      else
                          impuestos25:=40*0.25;
                          impuestos45:=(salario_neto_semanal-90)*0.45;                  
                 end if;
          end if;
              salario_neto_semanal := salario_neto_semanal - impuestos25 -impuestos45; 
              dbms_output.put_line('el salario neto semanal es '||salario_neto_semanal||' euros');
      else
          salario_neto_semanal:=precio_hora*35 + ((horas_trabajadas -35) *precio_hora*1.5);
          if (salario_neto_semanal>=50)
              then
                  if (salario_neto_semanal<=90)
                      then
                          impuestos25:=(salario_neto_semanal-50)*0.25;
                      else
                          impuestos25:=40*0.25;
                          impuestos45:=(salario_neto_semanal-90)*0.45;   
                  end if;
         end if;
         salario_neto_semanal := salario_neto_semanal - impuestos25 -impuestos45; 
        dbms_output.put_line('el salario neto semanal es '||salario_neto_semanal||' euros');
end if;
end;
/



/* 4º.-  Realizar un bloque pl/sql que calcule las raíces de la ecuación (ax2 + bx + c = 0) teniendo en cuenta los siguientes casos: 
a. Utilizaremos la fórmula siguiente: x= (-b ± √(b2 – 4ac))/(2a) La expresión d = b2 – 4ac se denomina discriminante. 
a1.   Si d>0 entonces hay dos raíces reales
a2.   Si d=0 entonces hay una raíz real que es  x=-b/(2a)
a3.  Si d<0 entonces hay dos raíces complejas de la forma: x+yi, x-yi. Siendo x el valor –b/2a e y  de √(|b2 -4ac|)/(2a) */

declare
    a real :=&coef_x2;
    b real :=&coef_x;
    c real :=&ter_ind;
    dis real;
    sol1 real;
    sol2 real;
    x real;
begin
    dis:=power(b,2) -4*a*c;
    if dis <0
       then
          dis:=abs(dis);
           sol1:=(sqrt(dis))/(2*a);
           sol2:=(-sqrt(dis))/(2*a);
           x:= -b/(2*a);
          DBMS_OUTPUT.PUT_LINE('las soluciones complejas de la ecuación de segundo grado son: ' ||x || ' + '|| sol1 ||'i y '|| x ||' - '|| abs(sol2) ||'i'); 
       else
            if dis=0
	         then
	            sol1:=-b/(2*a);
	            DBMS_OUTPUT.PUT_LINE('la ecuacion dada tiene solucion unica, esta es '||sol1);
	         else
	            sol1:=(-b+sqrt(dis))/(2*a);
	            sol2:=(-b-sqrt(dis))/(2*a);
	            DBMS_OUTPUT.PUT_LINE('las soluciones de la ecuacion de segundo grado son '||sol1||' y '|| sol2);
            end if;
  end if;
end;
/


/* 5º.-  Realizar un bloque pl/sql que nos pida un valor numérico por teclado y nos diga si dicho número es primo o no. Un número es primo si solo es divisible por el mismo y por la unidad. */

declare
	n number(3);
  	sw integer;
  	i integer;
 begin
 	n:='&numero';
 	i:=2;
 	sw:=1;
	while i<=n-1  loop
		sw:=n mod i;
		if sw=0
			then
 				exit;
 		end if;
		i:=i+1;
	end loop;
	if n=1
		then
			DBMS_OUTPUT.PUT_LINE(n||' no es primo');
		else

			if sw = 1
				then
              				DBMS_OUTPUT.PUT_LINE(n||' es primo');
          			else
              				DBMS_OUTPUT.PUT_LINE(n||' no es primo');
   			end if;
	end if;
 end;
/

/* 6º.- Realizar un bloque pl/sql que nos pida2 valores numéricos enteros por teclado y calcule la multiplicación  de dichos números por sumas sucesivas. */

declare
    num1 number(3):=&num1;
    num2 number(3):=&num2;
    num11 number(3);
    num12 number(3);
    resul number(3):=0;
    cont number(3):=0;
begin
    num11 := abs(num1);
    num12 := abs(num2);
    while cont < num12  loop
    	resul:=resul+num11;
        	cont:=cont+1;
    end loop;
    if( num1>0 and num2 >0) or (num1<0 and num2<0)
    	then
    		DBMS_OUTPUT.PUT_LINE('el resultado de multiplicar '||num1||' * '||num2||' = ' || resul);
    	else
     		DBMS_OUTPUT.PUT_LINE('el resultado de multiplicar '||num1||' * '||num2||' = '|| -resul);
    end if;
end;
/



 /* 7º.- Realizar un bloque pl/sql que nos pida dos números  enteros por teclado y calcule su división por restas sucesivas. */

declare
dividendo real;
divisor real;
cociente real;
resto real;
begin
dividendo:='&dividendo';
divisor:='&divisor';
dbms_output.put_line('dividendo: '||dividendo);
dbms_output.put_line('divisor: '||divisor);
cociente:=0;
if (dividendo =0 and divisor =0)
    then
       dbms_output.put_line('indeterminación');
    else 
        if ( divisor = 0)
            then
                dbms_output.put_line('no se puede dividir por cero');
             else
                 if (dividendo > 0 and divisor > 0)
                      then
                          while (dividendo >= divisor) loop
                              dividendo:=dividendo-divisor;
                              cociente:=cociente+1;
                          end loop;
                          resto:=dividendo;
                          dbms_output.put_line('cociente: '||cociente);
                          dbms_output.put_line('resto: '||resto);
                        else
                          dbms_output.put_line('los dos numeros han de ser positivos');
                  end if;
        end if;
end  if;
end;
/


/* 8º.-  Realizar un bloque pl/sql que nos pida  un numero entero por teclado y calcule su factorial. */

declare
    num integer:=&num;
    fact real;
    num1 integer;
 begin
   if num<0 
     then
        DBMS_OUTPUT.PUT_LINE('no existen factoriales de numeros negativos');
     else
        if num=0
	       then
	          DBMS_OUTPUT.PUT_LINE('el factorial de cero vale 1');
	       else
		 num1:=num;
                     fact:=1;
                     while num>=1 loop
                          fact:= fact*num;
                          num:=num-1;
                     end loop;
                     DBMS_OUTPUT.PUT_LINE('el factorial de  ' || num1 ||' es '||fact);
        end if;
   end if;
 end;
/



/* 9º.-  Realizar un bloque pl/sql que calcule la suma de los números enteros hasta un número dado introducido por el usuario */

declare
        	num integer:=&num;
    	suma integer;
    	i integer;
 begin
 	suma:=0;
	if num>0
		then
 			i:=1;
 			while i<=num loop
    				suma:=suma + i;
  				 i:=i+1;
			end loop;
    			DBMS_OUTPUT.PUT_LINE('la suma de los ' ||num ||'  primeros enteros es ' ||suma);
		else
			if num<0
				then
					i:=-1;
 					while i>=num loop
    						suma:=suma + i;
  				 		i:=i-1;
					end loop;
    					DBMS_OUTPUT.PUT_LINE('la suma de los ' ||num ||' primeros enteros es ' ||suma);
				else
					DBMS_OUTPUT.PUT_LINE('la suma de los 0 primeros primeros enteros es  0');
			end if;
	end if
	
  end;
  /



/* 10º.-  Realizar un bloque pl/sql que calcule las tablas de multiplicar del 1 al 9 */

declare
    	mult real;
   	 num integer;
   	 i integer;
    	j integer;
 begin
 	num:=9;
	 i:=1;
 	while i<=num loop
    		j:=1;
    		while j<=10 loop
       			 mult:=i*j;
			DBMS_OUTPUT.PUT_LINE(i ||'x'|| j|| '='|| mult);
        			j:=j+1;
     		end loop;
      		DBMS_OUTPUT.PUT_LINE(' ');
     		DBMS_OUTPUT.PUT_LINE(' ');
     		i:=i+1;
     	end loop;
 end;
  /

/* 1º.- Crear un procedimiento que se denomine ordenación_tres al que se le pasen tres números como parámetros  y nos salgan ordenados de mayor a menor
 */
create or replace procedure ordenacion_tres (num1 real, num2 real, num3 real) is
  BEGIN
    if (num1 = num2 and num2 = num3) then
      dbms_output.put_line('Todos son iguales, orden '||num1||', '||num2||', '||num3);
    elsif (num1 >= num2 and num1 >= num3) then
      if (num2 > num3) then
        dbms_output.put_line(num1||', '||num2||', '||num3);
      elsif (num3 >= num2) then
        dbms_output.put_line(num1||', '||num3||', '||num2);
      end if;
    elsif (num2 >= num1 and num2 >= num3) then
      if (num1 >= num3) then
        dbms_output.put_line(num2||', '||num1||', '||num3);
      elsif (num3 >= num1) then
        dbms_output.put_line(num2||', '||num3||', '||num1);
      end if;
    elsif (num3 >= num1 and num3 >= num2) then
      if (num1 >= num2) then
        dbms_output.put_line(num3||', '||num1||', '||num2);
      elsif (num2 >= num1) then
        dbms_output.put_line(num3||', '||num2||', '||num1);
      end if;
    end if;
  END;
/

Execute ordenacion_tres (1,2,3);


/* 	2º.-  Crear un procedimiento Pcalcularsueldosdep al que se le pasa un numero de departamento y muestra cuantos empleados hay en el departamento,  el total de sueldos y el total de comisiones del  departamento
 */
create or replace procedure pcalcularsueldosdep
 	(ndep employee.department_id%type) as
	numemp number;
	sums number;
	sumc number;
begin

select count(*) , sum(salary) , nvl(sum(commission),0) into  numemp, sums,sumc 
from employee
where department_id=ndep;
dbms_output.put_line ('numero de empleados: '||numemp||' del departamento '||ndep||' total de sueldos '||sums||' total comisiones '||sumc);
end;
/

execute Pcalcularsueldosdep (20);

/* 	3º.-  Desarrolla un procedimiento denominado pverApellidos que visualice el apellido y la fecha de alta de todos los empleados ordenados por apellido
 */
create or replace procedure pverapellidos
as
vapel employee.last_name%type;

vfecha employee.hire_date%type;
cursor capellido is
	select last_name, hire_date 
	from employee order by last_name;
begin
	open capellido;
	fetch capellido into vapel,vfecha;
	while capellido%found  loop
		dbms_output.put_line (vapel||' '||vfecha);
		fetch capellido into vapel,vfecha;
	end loop;
	dbms_output.put_line ('se han procesado '||capellido%rowcount||' registros');
	close capellido;
end;
/

execute pverApellidos();





/* 4º.-  Crear un procedimiento  pverempleoficio al que le paso un oficio y muestra el nombre, apellidos, oficio, código de departamento y nombre del departamento de los empleados que tienen ese oficio
 */

create or replace procedure pverempleoficio 
(poficio employee.job_id%type) as
	vnombre employee.first_name%type; 
	vapel employee.last_name%type;
	voficio employee.job_id%type;
	coddep department.department_id%type;
	vnombredep department.name%type;
	cursor c is
	select first_name,last_name,job_id, department.department_id, name 	into vnombre, vapel, voficio, coddep, vnombredep
	from employee, department
	where employee.department_id=department.department_id and employee.job_id=poficio;

begin
open c;
fetch c into vnombre, vapel, voficio, coddep, vnombredep;
while c%found loop
	dbms_output.put_line (vnombre||' '||vapel||' '||voficio||' '||coddep||'  	'||vnombredep);
	fetch c into vnombre, vapel, voficio, coddep, vnombredep;
end loop;
close c;
end;
/


execute pverempleoficio(669);


/* 5º.-  Crear un procedimiento denominado ver_productos al que se le pase como parámetro el nombre de un cliente y muestre todos los productos  dicho cliente.
 */
create or replace procedure ver_productos
(nombre product.description%type) is
cursor c is 
select distinct description 
from product ,sales_order ,item ,customer 
where product.product_id=item.product_id  and item.order_id=sales_order.order_id 
and sales_order.customer_id=customer.customer_id      and customer.name=nombre;
nombre1 product.description%type;
begin
	open c;
    	dbms_output.put_line('El cliente'||nombre||'ha comprado');
  	fetch c into nombre1;
    	while c%found loop
       		dbms_output.put_line(nombre1);
       		fetch c into nombre1;
    	end loop; 
    	close c;   
end;
/

execute ver_productos('VOLLYRITE');


/* 6º.-  Crear un procedimiento  denominado clientes_productos que muestre todos los productos  de todos los clientes. Para ello utiliza el procedimiento ver_productos del ejercicio anterior.
 */
create or replace procedure clientes_productos is
    cursor c1 is select name from customer;
    nombre customer.name%type;
begin
    open c1;
    fetch c1 into nombre;
    while c1%found loop
      ver_productos(nombre);
      dbms_output.put_line('  ');
      fetch c1 into nombre;
    end loop;    
    close c1;
end;
/

execute clientes_productos;




/* 7º.-  Crear una funcion denominada cuentablancos a la que se le pasa una cadena  de caracteres y nos devuelve el número de espacios que tiene dicha cadena de caracteres
 */
create or replace function cuentablancos(cadena varchar2)
 return number is
contador number(2):=0;
begin
  for i in 1..length(cadena) loop
      if substr(cadena,i,1)=' ' then
         contador:=contador + 1;
      end if;
end loop;
return contador;
end;
/


var cadena varchar2(3000);

declare
  caracteres number(2);
    begin
      :cadena:='&cadena';
      caracteres:=cuentablancos(:cadena);
      dbms_output.put_line(to_char(caracteres));
end;
/


/* 8º.-  crear una funcion denominada suma_salarial en la que se le pasa el nombre de un departamento y nos devuelve la suma de salarios de los empleados de dicho departamento.
 */
create or replace function suma_salarial(nombre varchar2)
  return number is
 suma employee.salary%type;
 begin
  select sum(salary) into suma
    from employee,department
    where employee.department_id=department.department_id
    and name=nombre;
 return suma;
 end;
 /
select name,suma_salarial(name) 
from department;




/* 9º.-  Escribir una funcion  denominada trienios que haciendo uso de la función func_fecha del ejemplo resuelto en el tema  devuelva los trienios que hay entre dos fechas. (Un trienio  son tres años completos).
 */

create or replace function trienios (fecha1 date, fecha2 date) return integer as
	tri integer;
begin
	tri := trunc(func_fecha(fecha1, fecha2)/3);
	return tri;
end trienios;
/

declare
trienios1 number;
begin
trienios1:=trienios ('03/12/2005', '08/08/1999');
dbms_output.put_line(trienios1);
end;
/

/* 10º.-  Crear una función que permita visualizar la ciudad que más órdenes de venta ha realizado. */
create or replace function get_city_sales return varchar2
is
  cursor c_city is
  select c.city city, count(*) cant
  from sales_order so, customer c
  where so.customer_id = c.customer_id
  group by c.city
  order by cant desc;
  city varchar2(14);
  cant number(6);
begin
  open c_city;
  fetch c_city into city, cant;
  if c_city%found then
   return city;  
  else    
   return 'no hay ventas';
  end if;
  close c_city;
end;
/

begin
  dbms_output.put_line(get_city_sales);
end;
/

/* 
11º.-  Crear una función en la que dado un departamento devuelva el empleado (apellido) de dicho departamento que cuenta con mayor salario */

create or replace function get_max_sal_emp (dep varchar2) return varchar2
is 
  emp varchar2(14);
  sal number(6);
  cursor c_emp is
  select e.last_name emp,  e.salary sal 
  from  employee e, department d
  where d.department_id = e.department_id and  d.name= dep
  order by sal desc;
  
begin
  open c_emp;
  fetch c_emp into emp, sal;
  if c_emp%found then
   return emp;  
  else    
   return 'no hay empleado';
  end if;
  close c_emp;
end;
/

declare
  emp varchar2(15);
begin
  emp := get_max_sal_emp('research');
  dbms_output.put_line(emp);
end;
/

/* 1º.- Crear un procedimiento que se denomine ordenación_tres al que se le pasen tres números como parámetros  y nos salgan ordenados de mayor a menor
 */
create or replace procedure ordenacion_tres (num1 real, num2 real, num3 real) is
  BEGIN
    if (num1 = num2 and num2 = num3) then
      dbms_output.put_line('Todos son iguales, orden '||num1||', '||num2||', '||num3);
    elsif (num1 >= num2 and num1 >= num3) then
      if (num2 > num3) then
        dbms_output.put_line(num1||', '||num2||', '||num3);
      elsif (num3 >= num2) then
        dbms_output.put_line(num1||', '||num3||', '||num2);
      end if;
    elsif (num2 >= num1 and num2 >= num3) then
      if (num1 >= num3) then
        dbms_output.put_line(num2||', '||num1||', '||num3);
      elsif (num3 >= num1) then
        dbms_output.put_line(num2||', '||num3||', '||num1);
      end if;
    elsif (num3 >= num1 and num3 >= num2) then
      if (num1 >= num2) then
        dbms_output.put_line(num3||', '||num1||', '||num2);
      elsif (num2 >= num1) then
        dbms_output.put_line(num3||', '||num2||', '||num1);
      end if;
    end if;
  END;
/

Execute ordenacion_tres (1,2,3);

	/* 2º.-  Crear un procedimiento Pcalcularsueldosdep al que se le pasa un numero de departamento y muestra cuantos empleados hay en el departamento,  el total de sueldos y el total de comisiones del  departamento
 */
create or replace procedure pcalcularsueldosdep
 	(ndep employee.department_id%type) as
	numemp number;
	sums number;
	sumc number;
begin

select count(*) , sum(salary) , nvl(sum(commission),0) into  numemp, sums,sumc 
from employee
where department_id=ndep;
dbms_output.put_line ('numero de empleados: '||numemp||' del departamento '||ndep||' total de sueldos '||sums||' total comisiones '||sumc);
end;
/

execute Pcalcularsueldosdep (20);

	/* 3º.-  Desarrolla un procedimiento denominado pverApellidos que visualice el apellido y la fecha de alta de todos los empleados ordenados por apellido
 */
create or replace procedure pverapellidos
as
vapel employee.last_name%type;

vfecha employee.hire_date%type;
cursor capellido is
	select last_name, hire_date 
	from employee order by last_name;
begin
	open capellido;
	fetch capellido into vapel,vfecha;
	while capellido%found  loop
		dbms_output.put_line (vapel||' '||vfecha);
		fetch capellido into vapel,vfecha;
	end loop;
	dbms_output.put_line ('se han procesado '||capellido%rowcount||' registros');
	close capellido;
end;
/

execute pverApellidos();





/* 4º.-  Crear un procedimiento  pverempleoficio al que le paso un oficio y muestra el nombre, apellidos, oficio, código de departamento y nombre del departamento de los empleados que tienen ese oficio
 */

create or replace procedure pverempleoficio 
(poficio employee.job_id%type) as
	vnombre employee.first_name%type; 
	vapel employee.last_name%type;
	voficio employee.job_id%type;
	coddep department.department_id%type;
	vnombredep department.name%type;
	cursor c is
	select first_name,last_name,job_id, department.department_id, name 	into vnombre, vapel, voficio, coddep, vnombredep
	from employee, department
	where employee.department_id=department.department_id and employee.job_id=poficio;

begin
open c;
fetch c into vnombre, vapel, voficio, coddep, vnombredep;
while c%found loop
	dbms_output.put_line (vnombre||' '||vapel||' '||voficio||' '||coddep||'  	'||vnombredep);
	fetch c into vnombre, vapel, voficio, coddep, vnombredep;
end loop;
close c;
end;
/


execute pverempleoficio(669);


/* 5º.-  Crear un procedimiento denominado ver_productos al que se le pase como parámetro el nombre de un cliente y muestre todos los productos  dicho cliente.
 */
create or replace procedure ver_productos
(nombre product.description%type) is
cursor c is 
select distinct description 
from product ,sales_order ,item ,customer 
where product.product_id=item.product_id  and item.order_id=sales_order.order_id 
and sales_order.customer_id=customer.customer_id      and customer.name=nombre;
nombre1 product.description%type;
begin
	open c;
    	dbms_output.put_line('El cliente'||nombre||'ha comprado');
  	fetch c into nombre1;
    	while c%found loop
       		dbms_output.put_line(nombre1);
       		fetch c into nombre1;
    	end loop; 
    	close c;   
end;
/

execute ver_productos('VOLLYRITE');


/* 6º.-  Crear un procedimiento  denominado clientes_productos que muestre todos los productos  de todos los clientes. Para ello utiliza el procedimiento ver_productos del ejercicio anterior.
 */
create or replace procedure clientes_productos is
    cursor c1 is select name from customer;
    nombre customer.name%type;
begin
    open c1;
    fetch c1 into nombre;
    while c1%found loop
      ver_productos(nombre);
      dbms_output.put_line('  ');
      fetch c1 into nombre;
    end loop;    
    close c1;
end;
/

execute clientes_productos;




/* 7º.-  Crear una funcion denominada cuentablancos a la que se le pasa una cadena  de caracteres y nos devuelve el número de espacios que tiene dicha cadena de caracteres
 */
create or replace function cuentablancos(cadena varchar2)
 return number is
contador number(2):=0;
begin
  for i in 1..length(cadena) loop
      if substr(cadena,i,1)=' ' then
         contador:=contador + 1;
      end if;
end loop;
return contador;
end;
/


var cadena varchar2(3000);

declare
  caracteres number(2);
    begin
      :cadena:='&cadena';
      caracteres:=cuentablancos(:cadena);
      dbms_output.put_line(to_char(caracteres));
end;
/


/* 8º.-  crear una funcion denominada suma_salarial en la que se le pasa el nombre de un departamento y nos devuelve la suma de salarios de los empleados de dicho departamento.
 */
create or replace function suma_salarial(nombre varchar2)
  return number is
 suma employee.salary%type;
 begin
  select sum(salary) into suma
    from employee,department
    where employee.department_id=department.department_id
    and name=nombre;
 return suma;
 end;
 /
select name,suma_salarial(name) 
from department;




/* 9º.-  Escribir una funcion  denominada trienios que haciendo uso de la función func_fecha del ejemplo resuelto en el tema  devuelva los trienios que hay entre dos fechas. (Un trienio  son tres años completos).
 */

create or replace function trienios (fecha1 date, fecha2 date) return integer as
	tri integer;
begin
	tri := trunc(func_fecha(fecha1, fecha2)/3);
	return tri;
end trienios;
/

declare
trienios1 number;
begin
trienios1:=trienios ('03/12/2005', '08/08/1999');
dbms_output.put_line(trienios1);
end;
/

/* 10º.-  Crear una función que permita visualizar la ciudad que más órdenes de venta ha realizado. */
create or replace function get_city_sales return varchar2
is
  cursor c_city is
  select c.city city, count(*) cant
  from sales_order so, customer c
  where so.customer_id = c.customer_id
  group by c.city
  order by cant desc;
  city varchar2(14);
  cant number(6);
begin
  open c_city;
  fetch c_city into city, cant;
  if c_city%found then
   return city;  
  else    
   return 'no hay ventas';
  end if;
  close c_city;
end;
/

begin
  dbms_output.put_line(get_city_sales);
end;
/


/* 11º.-  Crear una función en la que dado un departamento devuelva el empleado (apellido) de dicho departamento que cuenta con mayor salario
 */
create or replace function get_max_sal_emp (dep varchar2) return varchar2
is 
  emp varchar2(14);
  sal number(6);
  cursor c_emp is
  select e.last_name emp,  e.salary sal 
  from  employee e, department d
  where d.department_id = e.department_id and  d.name= dep
  order by sal desc;
  
begin
  open c_emp;
  fetch c_emp into emp, sal;
  if c_emp%found then
   return emp;  
  else    
   return 'no hay empleado';
  end if;
  close c_emp;
end;
/

declare
  emp varchar2(15);
begin
  emp := get_max_sal_emp('research');
  dbms_output.put_line(emp);
end;
/

/* 1º.- Crear un procedimiento que se denomine ordenación_tres al que se le pasen tres números como parámetros  y nos salgan ordenados de mayor a menor
 */
create or replace procedure ordenacion_tres (num1 real, num2 real, num3 real) is
  BEGIN
    if (num1 = num2 and num2 = num3) then
      dbms_output.put_line('Todos son iguales, orden '||num1||', '||num2||', '||num3);
    elsif (num1 >= num2 and num1 >= num3) then
      if (num2 > num3) then
        dbms_output.put_line(num1||', '||num2||', '||num3);
      elsif (num3 >= num2) then
        dbms_output.put_line(num1||', '||num3||', '||num2);
      end if;
    elsif (num2 >= num1 and num2 >= num3) then
      if (num1 >= num3) then
        dbms_output.put_line(num2||', '||num1||', '||num3);
      elsif (num3 >= num1) then
        dbms_output.put_line(num2||', '||num3||', '||num1);
      end if;
    elsif (num3 >= num1 and num3 >= num2) then
      if (num1 >= num2) then
        dbms_output.put_line(num3||', '||num1||', '||num2);
      elsif (num2 >= num1) then
        dbms_output.put_line(num3||', '||num2||', '||num1);
      end if;
    end if;
  END;
/

Execute ordenacion_tres (1,2,3);


	/* 2º.-  Crear un procedimiento Pcalcularsueldosdep al que se le pasa un numero de departamento y muestra cuantos empleados hay en el departamento,  el total de sueldos y el total de comisiones del  departamento
 */
create or replace procedure pcalcularsueldosdep
 	(ndep employee.department_id%type) as
	numemp number;
	sums number;
	sumc number;
begin

select count(*) , sum(salary) , nvl(sum(commission),0) into  numemp, sums,sumc 
from employee
where department_id=ndep;
dbms_output.put_line ('numero de empleados: '||numemp||' del departamento '||ndep||' total de sueldos '||sums||' total comisiones '||sumc);
end;
/

execute Pcalcularsueldosdep (20);

	/* 3º.-  Desarrolla un procedimiento denominado pverApellidos que visualice el apellido y la fecha de alta de todos los empleados ordenados por apellido
 */
create or replace procedure pverapellidos
as
vapel employee.last_name%type;

vfecha employee.hire_date%type;
cursor capellido is
	select last_name, hire_date 
	from employee order by last_name;
begin
	open capellido;
	fetch capellido into vapel,vfecha;
	while capellido%found  loop
		dbms_output.put_line (vapel||' '||vfecha);
		fetch capellido into vapel,vfecha;
	end loop;
	dbms_output.put_line ('se han procesado '||capellido%rowcount||' registros');
	close capellido;
end;
/

execute pverApellidos();





/* 4º.-  Crear un procedimiento  pverempleoficio al que le paso un oficio y muestra el nombre, apellidos, oficio, código de departamento y nombre del departamento de los empleados que tienen ese oficio
 */

create or replace procedure pverempleoficio 
(poficio employee.job_id%type) as
	vnombre employee.first_name%type; 
	vapel employee.last_name%type;
	voficio employee.job_id%type;
	coddep department.department_id%type;
	vnombredep department.name%type;
	cursor c is
	select first_name,last_name,job_id, department.department_id, name 	into vnombre, vapel, voficio, coddep, vnombredep
	from employee, department
	where employee.department_id=department.department_id and employee.job_id=poficio;

begin
open c;
fetch c into vnombre, vapel, voficio, coddep, vnombredep;
while c%found loop
	dbms_output.put_line (vnombre||' '||vapel||' '||voficio||' '||coddep||'  	'||vnombredep);
	fetch c into vnombre, vapel, voficio, coddep, vnombredep;
end loop;
close c;
end;
/


execute pverempleoficio(669);


/* 5º.-  Crear un procedimiento denominado ver_productos al que se le pase como parámetro el nombre de un cliente y muestre todos los productos  dicho cliente.
 */
create or replace procedure ver_productos
(nombre product.description%type) is
cursor c is 
select distinct description 
from product ,sales_order ,item ,customer 
where product.product_id=item.product_id  and item.order_id=sales_order.order_id 
and sales_order.customer_id=customer.customer_id      and customer.name=nombre;
nombre1 product.description%type;
begin
	open c;
    	dbms_output.put_line('El cliente'||nombre||'ha comprado');
  	fetch c into nombre1;
    	while c%found loop
       		dbms_output.put_line(nombre1);
       		fetch c into nombre1;
    	end loop; 
    	close c;   
end;
/

execute ver_productos('VOLLYRITE');


/* 6º.-  Crear un procedimiento  denominado clientes_productos que muestre todos los productos  de todos los clientes. Para ello utiliza el procedimiento ver_productos del ejercicio anterior.
 */
create or replace procedure clientes_productos is
    cursor c1 is select name from customer;
    nombre customer.name%type;
begin
    open c1;
    fetch c1 into nombre;
    while c1%found loop
      ver_productos(nombre);
      dbms_output.put_line('  ');
      fetch c1 into nombre;
    end loop;    
    close c1;
end;
/

execute clientes_productos;




/* 7º.-  Crear una funcion denominada cuentablancos a la que se le pasa una cadena  de caracteres y nos devuelve el número de espacios que tiene dicha cadena de caracteres
 */
create or replace function cuentablancos(cadena varchar2)
 return number is
contador number(2):=0;
begin
  for i in 1..length(cadena) loop
      if substr(cadena,i,1)=' ' then
         contador:=contador + 1;
      end if;
end loop;
return contador;
end;
/


var cadena varchar2(3000);

declare
  caracteres number(2);
    begin
      :cadena:='&cadena';
      caracteres:=cuentablancos(:cadena);
      dbms_output.put_line(to_char(caracteres));
end;
/


/* 8º.-  crear una funcion denominada suma_salarial en la que se le pasa el nombre de un departamento y nos devuelve la suma de salarios de los empleados de dicho departamento.
 */
create or replace function suma_salarial(nombre varchar2)
  return number is
 suma employee.salary%type;
 begin
  select sum(salary) into suma
    from employee,department
    where employee.department_id=department.department_id
    and name=nombre;
 return suma;
 end;
 /
select name,suma_salarial(name) 
from department;




/* 9º.-  Escribir una funcion  denominada trienios que haciendo uso de la función func_fecha del ejemplo resuelto en el tema  devuelva los trienios que hay entre dos fechas. (Un trienio  son tres años completos).
 */

create or replace function trienios (fecha1 date, fecha2 date) return integer as
	tri integer;
begin
	tri := trunc(func_fecha(fecha1, fecha2)/3);
	return tri;
end trienios;
/

declare
trienios1 number;
begin
trienios1:=trienios ('03/12/2005', '08/08/1999');
dbms_output.put_line(trienios1);
end;
/

/* 10º.-  Crear una función que permita visualizar la ciudad que más órdenes de venta ha realizado. */
create or replace function get_city_sales return varchar2
is
  cursor c_city is
  select c.city city, count(*) cant
  from sales_order so, customer c
  where so.customer_id = c.customer_id
  group by c.city
  order by cant desc;
  city varchar2(14);
  cant number(6);
begin
  open c_city;
  fetch c_city into city, cant;
  if c_city%found then
   return city;  
  else    
   return 'no hay ventas';
  end if;
  close c_city;
end;
/

begin
  dbms_output.put_line(get_city_sales);
end;
/


/* 11º.-  Crear una función en la que dado un departamento devuelva el empleado (apellido) de dicho departamento que cuenta con mayor salario
 */
create or replace function get_max_sal_emp (dep varchar2) return varchar2
is 
  emp varchar2(14);
  sal number(6);
  cursor c_emp is
  select e.last_name emp,  e.salary sal 
  from  employee e, department d
  where d.department_id = e.department_id and  d.name= dep
  order by sal desc;
  
begin
  open c_emp;
  fetch c_emp into emp, sal;
  if c_emp%found then
   return emp;  
  else    
   return 'no hay empleado';
  end if;
  close c_emp;
end;
/

declare
  emp varchar2(15);
begin
  emp := get_max_sal_emp('research');
  dbms_output.put_line(emp);
end;
/

