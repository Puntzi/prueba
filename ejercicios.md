1º.-  Capital de los países
//paises/pais/capital
2º.-  Nombre de las ciudades
//ciudades/ciudad/nombre
3º.-  Longitud de los ríos
//rios/rio/longitud
4º.-  Oblast al que pertenecen las ciudades que pertenecen a algún Oblast
//ciudades/ciudad/@oblast
5º.-  Mostrar todos los datos de las ciudades que pertenecen al condado de Fier
//ciudades/ciudad[@condado="Fier"]
6º.-  Nombre del Pais cuya población hace referencia al censo de 2016
//pais/poblacion[@anio=2016]/../nombre
7º.-  Nombre de las Islas que tienen población
//isla/poblacion/../nombre
8º.-  Nombre de los ríos que pasan por Francia
//rio/curso/pais[@cod_pais=//pais[nombre='Francia']/cod_pais]/../../nombre
9º.-Nombre de las ciudades por las que pasa el rio cuyo código es el f0_1100483901
//ciudad[rios/cod_rio="f0_1100483901"]/nombre
10º.-  Nombre de los ríos que pasan por Berlín
//rio[cod_rio=//ciudad[nombre="Berlín"]/rios/cod_rio]/nombre
11º.-  Nombre del país en el que se encuentra la ultima montaña
//pais[cod_pais=//montana[last()]/cod_pais]/nombre
12º.-  Nombre de los países por los que pasa el río que está en la posición 14
//pais[cod_pais=//rios/rio[position()=14]/curso/pais/@cod_pais]/nombre

13º.-  visualizar los kilómetros de frontera que tiene España con Portugal
//paises/pais[nombre="España"]/fronteras/frontera[@cod_pais=//pais[nombre="Portugal"]/cod_pais]

14º.-  Nombre de los países que tienen ciudades por los que pasa el rio Mura
//paises/pais/cod_pais[.=//rios/rio/nombre[.="Río Mura"]/../curso/pais/@cod_pais]/../nombre

15º.-  Nombre de los ríos de España asi como los kilómetros que tienen en España
//rio/curso/pais[@cod_pais=//pais[nombre="España"]/cod_pais]/../../nombre | //rio/curso/pais[@cod_pais=//pais[nombre="España"]/cod_pais]/kilómetros

16º.-  Extension, nombre y población de las ciudades cuya población hace referencia al censo del año 2019
//ciudades/ciudad/poblacion[@anio=2019]/../extension | //ciudades/ciudad/poblacion[@anio=2019]/../nombre | //ciudades/ciudad/poblacion[@anio=2019]/../poblacion


Ejercicio 1

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
		<body>
			<table border="1">
				<caption><h2>Paises cuyo nombre empieza por M y son una República Parlamentaria</h2></caption>
				<tr bgcolor="orange">
					<th>Nombre</th>
                    <th>Capital</th>
					<th>Población</th>
                    <th>Superficie</th>
					<th>Estado</th>
				</tr>
      				<xsl:for-each select="europa/paises/pais">
                        <xsl:if test="starts-with(nombre,'M')">
                            <xsl:if test="contains(estado,'República Parlamentaria')">
                                <tr>
                                    <td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="capital"/></td>
                                     <td><xsl:value-of select="poblacion"/></td>
                                    <td><xsl:value-of select="superficie"/></td>
                                    <td><xsl:value-of select="estado"/></td>
                                </tr>
                            </xsl:if> 
                        </xsl:if>  
                    </xsl:for-each>
    			</table>
  		</body>
  	</html>
</xsl:template>
</xsl:stylesheet>



Ejercicio 2:

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
		<body>	 	  
			<table border="1">
				<caption bgcolor="red">PAISES DE EUROPA ORDENADOS POR POBLACIÓN</caption>
				<tr bgcolor="yellow">
					<td><b>NOMBRE</b></td>
					<td><b>CAPITAL</b></td>
					<td><b>POBLACION</b></td>
					<td><b>SUPERFICIE</b></td>
					<td><b>LENGUA</b></td>
                    <td><b>PORCENTAJE</b></td>	
                </tr>	
				<xsl:for-each select="//paises/pais"> 
                    <xsl:sort select="poblacion"/>
					<tr>
						<td><xsl:value-of select="nombre"/></td>
						<td><xsl:value-of select="capital"/></td>
						<td><xsl:value-of select="poblacion"/></td> 
						<td><xsl:value-of select="superficie"/></td>
						<td><xsl:value-of select="lenguas/lengua"/></td>
                        <td><xsl:value-of select="lenguas/lengua/@porcentaje"/></td>
					</tr>
				</xsl:for-each>
			</table> 
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>

Ejercicio 3


<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
		<body>	 	  
			<table border="1">
				<caption>ISLAS CON SUPERFICIE PAR</caption>
				<tr bgcolor="BlueViolet">
					<td><b>ARCHIPIELAGO</b></td>
					<td><b>NOMBRE</b></td>
					<td><b>SUPERFICIE</b></td>
					<td><b>POBLACION</b></td>
					<td><b>AÑO</b></td>                              	
                </tr>	
				<xsl:for-each select="//islas/isla"> 
                    <xsl:if test="superficie mod 2=0">
						<tr>
							<td><xsl:value-of select="archipielago"/></td>
							<td><xsl:value-of select="nombre"/></td>
							<td><xsl:value-of select="superficie"/></td> 
							<td><xsl:value-of select="poblacion"/></td>
							<td><xsl:value-of select="poblacion/@anio"/></td>                                          
						</tr>
                    </xsl:if>
				</xsl:for-each>
			</table> 
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>

Ejercicio 4

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
		<body>
			<table border="1">
				<caption><h2>Ciudades de la provincia de Turín con Población  guardada en el censo de 2011</h2></caption>
				<tr bgcolor="red">
					<th>Nombre</th>
                    <th>Provincia</th>
					<th>Extensión</th>
                    <th>Año</th>
                    <th>Población</th>
                </tr>
      				<xsl:for-each select="europa/ciudades/ciudad">
                        <xsl:if test="contains(@provincia,'Turín')">
                            <xsl:if test="poblacion/@anio=2011">
                          		<tr>
        							<td><xsl:value-of select="nombre"/></td>
                                    <td><xsl:value-of select="@provincia"/></td>
                        			<td><xsl:value-of select="extension"/></td>
                                    <td><xsl:value-of select="poblacion/@anio"/></td>
        							<td><xsl:value-of select="poblacion"/></td>
                                </tr>
                            </xsl:if>
                        </xsl:if>		
                    </xsl:for-each>
                <tr>
          		    <th colspan="4">poblacion media de las ciudades del censo de 2011 de la provincia de Turín:</th>  
          		    <th><xsl:value-of select="sum(/europa/ciudades/ciudad[@provincia='Turín']/poblacion[@anio=2011]) div count(/europa/ciudades/ciudad[@provincia='Turín']/poblacion[@anio=2011]) " /></th>
                </tr>
    			</table>
  		</body>
  	</html>
</xsl:template>
</xsl:stylesheet>



Ejercicio 5

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
        <table border="1">
            <caption><h2>Ciudades de España con mas de 50000 habitantes</h2></caption>
            <tr bgcolor="blue">
                <th>Ciudad</th>
                <th>Población</th>
                <th>País</th>
            </tr>
            <xsl:for-each select="europa/ciudades/ciudad">
                <xsl:sort select="poblacion"/>
                    <xsl:if test="poblacion &gt; 50000">
                        <xsl:if test="@cod_pais='f0_110016'">
                            <tr>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="poblacion"/></td> 
                                <td><xsl:value-of select="//pais[cod_pais='f0_110016']/nombre"/></td>
                            </tr>            
                        </xsl:if>	
                    </xsl:if>	
            </xsl:for-each>              	
        </table>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>

Ejercicio 6

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
        <h2>Ríos de Europa</h2>   
        <ul>
            <xsl:for-each select="/europa/rios/rio">
                <li><b>Código del río:  </b> <xsl:value-of select="cod_rio"/></li>
                <li><b>Nombre del río:  </b> <xsl:value-of select="nombre"/></li>
                <li><b>Longitud del río:  </b> <xsl:value-of select="longitud"/></li>
                <br></br>  
                <table border="1">
                    <tr>
                        <th>Código del pais</th>
                        <xsl:for-each select="curso/pais">
                            <td><xsl:value-of select="@cod_pais"/></td>     
                        </xsl:for-each>
                    </tr>
                    <tr>								                
                    <th>Kilómetros</th>                                                                                           
                        <xsl:for-each select="curso/pais">
                            <td><xsl:value-of select="kilometros"/></td>
                        </xsl:for-each>
                    </tr>
                </table>
                <br></br>
            </xsl:for-each>
        </ul>
  	</body>
</html>
</xsl:template>
</xsl:stylesheet>



Ejercicio 7

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
        <h2>Nombre de los países y grupos étnicos con porcentajes superiores al 20%</h2>   
            <ul>
                <xsl:for-each select="//paises/pais">
                <li>
                    <b>nombre país: </b><xsl:value-of select="nombre"/>
                </li>
                    <ul>
                        <xsl:for-each select="grupos_etnicos/grupo_etnico">
                            <xsl:if test="@porcentaje &gt; 20">
                            <li>
                                <b> grupo étnico:</b><xsl:value-of select="."/>
                            </li>
                            <ul>
                            <li>
                                <b>porcentaje:</b><xsl:value-of select="@porcentaje"/>
                            </li>
                            </ul>
                            </xsl:if>
                            <br></br>                                                                                                             
                        </xsl:for-each>   
                    </ul>     
                </xsl:for-each>
            </ul>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>

Ejercicio 8

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <body>
    	<h2>Nombre de cada país y nombre de los paises que tienen frontera superior a 400 kilometros con él</h2>  
        <ul>
            <xsl:for-each select="//paises/pais">
                <li><b>nombre país: </b><xsl:value-of select="nombre"/></li>
                <ul>
                    <xsl:for-each select="fronteras/frontera">
                    <xsl:variable name="a" select="@cod_pais"/>
                            <xsl:if test=".&gt; 400">
                                    <li><b> frontera:</b><xsl:value-of select="//pais[cod_pais=$a]/nombre"/></li>
                                        <ul>
                                    <li><b>kilometros:</b><xsl:value-of select="."/></li>
                                        </ul>
                            </xsl:if>
                            <br></br>                                                                                                             
                    </xsl:for-each>
                </ul>
            </xsl:for-each>
        </ul>
    </body>
</html>
</xsl:template>
</xsl:stylesheet>

 
Ejercicio 9:

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<body>
    <ul>
        <li><strong>nombre país: </strong>Austria</li>
    </ul>
    <ul><!-- Pongo doble ul por el espacio que se ve en la foto -->
        <li><strong>Montañas: </strong></li>
        <xsl:for-each select="//montana[cod_pais = //pais [nombre='Austria']/cod_pais]">
            <xsl:if test="altura &gt; 3500">
                    <ul>
                        <li><xsl:value-of select="nombre"/> </li>
                        <ul>   
                            <li>Altura: <xsl:value-of select="altura"/> </li>
                        </ul>
                    </ul>
            </xsl:if>
        </xsl:for-each>
    </ul>
</body>
</html>
</xsl:template>
</xsl:stylesheet> 


Ejercicio 10

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<body>
    <ul>
        <li><strong>nombre país: </strong>Alemania</li>
    </ul>
    <ul><!-- Pongo doble ul por el espacio que se ve en la foto -->
        <li><strong>ciudades: </strong></li>
        <xsl:for-each select="//ciudad[@cod_pais = //pais[nombre='Alemania']/cod_pais]">
                <xsl:if test="poblacion &gt; 250000">
                    <ul>
                        <li><xsl:value-of select="nombre"/> </li>
                        <ul>   
                                <li>población: <xsl:value-of select="poblacion"/> </li>
                        </ul>
                    </ul>
            </xsl:if>
        </xsl:for-each>
    </ul>
</body>
</html>
</xsl:template>
</xsl:stylesheet>


-- XSLT --

1º.-  Visualizar los nombres de los socios de las localidades cuyos códigos postales son mayores que 28900 y menores que 28935, ordenados por nombre de localidad y dentro de la localidad por el nombre del socio.

<resultado>
{for $x in doc("c:\david\videoclub.xml")//socios/socio
where $x/cod_postal>28900 and $x/cod_postal<28935
order by $x/localidad, $x/nombre
return <tupla> {$x/nombre, $x/localidad} </tupla>}
</resultado>


2º.- Visualizar los distintos nombres de los actores ordenados descendentemente

for $x in distinct-values ( doc("c:\david\videoclub.xml")//actores/actor/nombre)
order by $x descending
return  ($x)

3º.- Visualizar el nombre y apellidos de los socios cuyo nombre empieza por J, ordenados por apellidos de forma descendente.

for $x in  doc("c:\david\videoclub.xml")//socios/socio
where  substring($x/nombre,1,1)="J"
order by $x/apellidos descending
return <salida>{$x/nombre, $x/apellidos}</salida>

4º.-  Visualizar los caracteres del 2 al 4 de los apellidos de los actores cuyo nombre es Antonio

for $x in  doc("c:\david\videoclub.xml")//actores/actor
let $b:=  substring($x/apellido,2,3)
where $x/nombre="Antonio"
return concat($x/apellido,'  ',$b)

5º.- visualizar el nombre y apellidos de todos los socios cuyo nombre termina por n y su segundo apellido termina por z 

for $x in  doc("c:\david\videoclub.xml")//socios/socio
where  substring($x/nombre,string-length($x/nombre),1)="n"
and  substring($x/apellidos,string-length($x/apellidos),1)="z"
return <salida>{$x/nombre, $x/apellidos}</salida>

6º.-  visualizar de todos los ejemplares agrupados por estado de conservación, cuantos hay de cada tipo de estado de conservación.

for $x in  doc("c:\videoclub\videoclub.xml")//ejemplares/ejemplar
group by $c:=$x/estado_conservacion
return <grupo estado="{$c}"  numero="{count($x/estado_conservacion)}"/>


7º.-  Visualizar para cada película, su título, su productora y el nombre y apellido de su director.

for $pel in(//peliculas/pelicula)
let $nom:=$pel/titulo
let $prod:=$pel/productora
let $dir:=$pel/cod_dir
let $nom_dir:=(//directores/director[cod_dir=$dir]/nombre)
let $ape_dir:=(//directores/director[cod_dir=$dir]/apellido)

return
<salida>
{$nom, $prod,  $nom_dir, $ape_dir}
</salida>

8º.-  Visualizar para cada actor su nombre, apellido, así como el título de todas las películas en la que ha participado

for $act in(//actores/actor)
let $cod_act:=$act/cod_actor
let $nom:=$act/nombre
let $ape:=$act/apellido
let $tit:=(//participar/participa[cod_actor=$cod_act]/titulo)
return

<salida>
<actor> {$cod_act,$nom,  $ape}</actor>
<peliculas>{$tit}  </peliculas>
</salida>

9º.-  Visualizar el código de cada actor, su nombre, así como el número de películas que ha realizado ordenado por el número de películas y por el nombre

let $result := (
for $codactor in distinct-values(//participar/participa/cod_actor)
let $numero := count(//participar/*[cod_actor=$codactor])
let $nombre:=(//actores/*[cod_actor=$codactor])
return
element actor
{
<cod_actor>{$codactor }</cod_actor>,

<nombre>{$nombre/nombre}, {$nombre/apellido}</nombre>,
<num_peliculas>{$numero}</num_peliculas>
}
)
for $i in $result

order by $i/num_peliculas descending, $i/nombre
return
<salida>{$i}</salida>

10º.-  Visualizar el nombre y apellidos del director, los títulos de las películas que ha realizado y los actores que participan en cada película

for $soc in (//directores/director)
let $nom :=$soc/nombre
let $cod_di:=$soc/cod_dir
let $titulo:=(//peliculas/pelicula[cod_dir=$cod_di]/titulo)
let $cod_act:=(//participar/participa[titulo=$titulo]/cod_actor)
let $nom_act:=(//actores/actor[cod_actor=$cod_act]/nombre)

return
<salida>
{$nom,$soc/apellido, $titulo, $nom_act}
</salida>

11º.-  Visualizar para cada película, su título ordenadas por el mismo y los nombres de los actores que participan en ella.

for $pelicula in //participar/participa
let $actores := //actores/*[cod_actor=$pelicula/cod_actor]
let $nombre :=$actores/nombre
order by $pelicula/titulo

return
(
<pelicula>
{
<titulo>{data($pelicula/titulo)}</titulo>,
for $i in $actores

return $i/nombre
}
</pelicula>
)

12º.-  nombre de las películas alquiladas por el socio Juan, siempre que el ejemplar alquilado de la película sea superior a 3

for $pelicula in //peliculas/pelicula
for $ejemplar in //ejemplares/ejemplar
for $alquila in //alquilar/alquila
for $socio in  //socios/socio
where $pelicula/titulo = $ejemplar/titulo and  
$ejemplar/titulo = $alquila/titulo
and $alquila/cod_socio= $socio/cod_socio
and $alquila/numero_ejemplar=$ejemplar/numero_ejemplar
and $socio/nombre="Juan" and $ejemplar/numero_ejemplar>3
order by $ejemplar/titulo, $alquila/fech_alquiler
  
return 
<salida>
{ $socio/nombre,$pelicula/titulo, $ejemplar/numero_ejemplar, $alquila/fech_alquiler,$alquila/fech_devolucion }
</salida>

13º.-  Visualiza, para cada ejemplar, su número, el número de veces que ha sido alquilado y los códigos de socio que lo han alquilado

for $b in //alquilar/alquila
group by $c:= $b/numero_ejemplar
order by $c
let $count:=count($b/numero_ejemplar)

return 

<grupo num_ejemplar="{$c}"  veces_alquilado="{($count)}, socio={distinct-values($b/cod_socio)}"/>

