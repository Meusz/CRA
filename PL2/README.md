# PECL2 de Conocimiento y Razonamiento Automatizado 
### Mateusz Roman Kolakowski 27 de abril de 2021

# Análisis y simplificación de oraciones

## Objetivos

El objetivo de la práctica es doble:
-Por un lado, crear una Gramática de Cláusulas Definidas que permita analizar sintácticamente una oración en español y crear el árbol de constituyentes.
-Por otro, simplificar oraciones complejas convirtiéndolas en oraciones simples.
Dada la complejidad de la gramática de la lengua española se trabajará con una versión reducida de la misma que permita analizar un conjunto limitado de frases.

## Práctica

Abordar la creación de una gramática compleja que valide, represente el árbol de constituyentes y simplifique oraciones complejas de los siguientes tipos (entre paréntesis):

-Oración Simple (o).

-Oración  Coordinada (oc).

-Oración  Subordinada de Relativo (or).

-Oraciones Compuestas, es decir combinaciones de oraciones simples, coordinadas y de relativo (ocm).

En cuanto a los grupos sintácticos, se deben incluir reglas que soporten los siguientes tipos:

-Grupo Nominal (gn).

-Grupo Adjetival (gadj).

-Grupo Adverbial (gadv).

-Grupo Preposicional (gp).

-Grupo Verbal (gv).

lo que implica la definición de los siguientes tipos de términos:

-Determinantes (det).

-Nombres (n).

-Nombres propios (np).

-Verbos (v).

-Adjetivos (adj).

-Adverbios (adv).

-Conjunciones (conj).

-Preposiciones (prep).


La simplificación de oraciones coordinadas, subordinadas de relativo o compuestas consistirá en la conversión de cualquiera de estas oraciones en tantas oraciones simples como se componga la original. A continuación se muestran varios ejemplos:

-“Juan estudia Filosof´ıa pero Maria estudia Derecho” se debe descomponer en “Juan estudia Filosof´ıa” y “Maria estudia Derecho”.

-“Juan come y bebe mientras Maria lee” se debe descomponer en “Juan come”, “Juan bebe” y “Maria lee”.

-“Juan, que es muy alto, tiene el pelo rubio” se debe descomponer en “Juan es muy alto” y “Juan tiene el pelo rubio”.

-“Juan, que es muy alto, tiene el pelo rubio pero Maria es morena” se debe descomponer en “Juan es muy alto” , “Juan tiene el pelo rubio” y “Maria es morena”.

El código de la práctica se entregar´a en dos ficheros: el programa propiamente dicho y la utilidad draw.pl que deber´a ser consultada por el primero para representar gráficamente los árboles de constituyentes de las oraciones analizadas y simplificadas.

## Conjunto de oraciones

Además de las recogidas en los apartados anteriores, la gramática debe analizar y simplificar correctamente las siguientes oraciones tipo:

	1. Juan es moreno y Maria es alta.
	2. Juan estudia Filosofia pero Maria estudia Derecho.
	3. Maria toma un cafe mientras Juan recoge la mesa.
	4. Juan toma cafe y lee el periodico.
	5. Juan y Hector comen patatas fritas y beben cerveza.
	6. Juan come patatas fritas pero Maria prefiere paella aunque Hector toma cafe e Irene lee una novela.
	7. Irene canta y salta mientras Juan estudia.
	8. Hector come patatas fritas y bebe zumo mientras Juan canta y salta aunque Maria lee una novela.
	9. Juan, que es agil, escala en el rocodromo por las tardes.
	10. Juan, que es muy delicado, come solamente manzanas rojas.
	11. El procesador de textos, que es una herramienta bastante potente, sirve para escribir documentos.
	12. El procesador de textos es una herramienta muy potente que sirve para escribir documentos pero es bastante lento.
	13. El raton que cazo el gato era gris.
	14. El hombre que vimos ayer era mi vecino.

## Mejoras del programa

Se valorará positivamente cualquier mejora de la gramática sobre lo expuesto anteriormente. Algunas ideas son las siguientes:

-Introducir algún preprocesamiento de la oración que agilice el proceso de análisis de una estructura sintáctica compleja.

-Implementar algún mecanismo para flexionar las palabras del diccionario, añadiendo el plural a las palabras en singular o el femenino para las palabras de género masculino (o viceversa).

-Asignar funciones a cada uno de los grupos gramaticales indicando si funcionan como Complemento Directo, C. Indirecto, Atributo, C. Circunstancial, etc.

Para refrescar los conceptos de análisis sintáctico (tipos de sintagmas, tipos de oración, funciones de los sintagmas, ejemplos resueltos,...) se recomienda
consultar la siguiente [página](https://sintaxis.org). El analizador que incluye no siempre es capaz de analizar las oraciones propuestas en este enunciado, pero puede
servir para resolver los ejemplos de la propia página web.
