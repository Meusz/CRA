# PECL3 de Conocimiento y Razonamiento Automatizado 
### Mateusz Roman Kolakowski 25 de mayo de 2021

# Scheme - Listas

## Introducción

El objetivo de esta práctica es implementar listas de números enteros mediante lambda cálculo en Scheme, así como un conjunto de operaciones básicas.

## Aritmética entera

Codificar enteros tomando como base una codificación de los naturales es relativamente sencillo. Para ello, dado un par (m,n), con m, n ∈ Ν, consideraremos que representa al entero m-n.

Al igual que ocurre con otras codificaciones de los enteros, los pares no representan a los enteros de manera única, p.e. (n,m) codifica el mismo entero que (n+k,m+k).

En el fichero enteros.rkt se puede ver una codificación de los enteros usando λ-cálculo e implementada empleando Scheme. Dicha codificación incluye las siguientes operaciones:

• Suma y resta.

• Multiplicación.

• División euclídea.

• Cálculo del máximo común divisor.

• Relaciones de igualdad y de orden.

• Reducción a representante canónico, donde tomaremos (n,0) o (0,n) como representantes canónicos.

## Objetivo de la práctica

Consideremos las listas de números enteros. A partir de la codificación de las listas en λ-cálculo de los apuntes, se pide:

1. Codificar las operaciones usuales en listas:
	
	a. Concatenación.

	b. Longitud.

	c. Inversión.

	d. Test de pertenencia.

2. Por otro lado, y usando la codificación de los enteros dada, se pide codificar las siguientes operaciones:

	a. Suma de los elementos de una lista.

	b. Cálculo de máximo y mínimo.

	c. Ordenación de una lista.

	d. Suma de listas consideradas como vectores de un mismo tamaño.

## Scheme y λ-cálculo – Definición de términos

Las necesidades de Scheme para esta práctica quedan cubiertas, salvo en el caso de la recursión, con la siguiente observación:

El λ-término λ𝑥𝑥.𝑀𝑀 se codifica en Scheme mediante _(lambda (x) M)_. En el caso de que necesitáramos dar un nombre a un término para su posterior reutilización, la forma de hacerlo sería la siguiente _(define termino (lambda (x) M))_.
Por ejemplo, siguiendo lo visto en clase (página 57 de los apuntes) uno puede definir:

	(define true (lambda (x y) x)
	(define false (lambda (x y) y))
	(define if (lambda (p x y) (p x y)))
	...

Éstos términos se pueden encontrar al principio del fichero enteros.rkt y son los únicos λtérminos no currificados que se admitirán en la práctica. El resto de expresiones deben estar currificadas.

## Scheme y λ-cálculo – recursividad

El combinador de punto fijo Y ha de definirse aplicando una 𝜂𝜂-expansión (líneas 23 a 29 del fichero enteros.rkt).

	;;;;; Combinador de punto fijo
	(define Y
 		(lambda (f)
 		((lambda (x) (f (lambda (v) ((x x) v))))
 		 (lambda (x) (f (lambda (v) ((x x) v)))))))

Aun definiendo así Y, la recursividad no funciona tal cual se ha visto en clase. En el mismo fichero se pueden encontrar algunos ejemplos sobre cómo se puede simular la recursión. Por ejemplo, en la definición del resto de la división euclídea (líneas 135-153):


