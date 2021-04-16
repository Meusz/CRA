:-consult(gramatica).
%:-consult(ejercicio_3_1).


test1:- oracion(X, [el,hombre,come,una,manzana],[]),write(X).

test2:- oracion(X, [la,mujer,come,manzanas],[]),write(X).

test3:- oracion(X, [maría,come,una,manzana,roja],[]),write(X).

test4:- oracion(X, [juan,ama,a,maría],[]),write(X).

test5:- oracion(X, [el,gato,grande,come,un,ratón,gris],[]),write(X).

test6:- oracion(X, [juan,estudia,en,la,universidad],[]),write(X).

test7:- oracion(X, [el,alumno,ama,la,universidad],[]),write(X).

test8:- oracion(X, [el,gato,come,ratones],[]),write(X).

test9:- oracion(X, [la,manzana,come,un,gato],[]),write(X).

test10:- oracion(X, [la,universidad,es,grande],[]),write(X).



test:-test1,write('Frase 1 OK'),nl,

   test2,write('Frase 2 OK'),nl,

   test3,write('Frase 3 OK'),nl,

   test4,write('Frase 4 OK'),nl,

   test5,write('Frase 5 OK'),nl,

   test6,write('Frase 6 OK'),nl,

   test7,write('Frase 7 OK'),nl,

   test8,write('Frase 8 OK'),nl,

   test9,write('Frase 9 OK'),nl,

   test10,write('Frase 10 OK'), nl.
   
   
drawtest1:- oracion(X,[el,hombre,come,una,manzana],[]),write(X), draw(X).

drawtest2:- oracion(X,[la,mujer,come,manzanas],[]),write(X), draw(X).

drawtest3:- oracion(X,[maría,come,una,manzana,roja],[]),write(X), draw(X).

drawtest4:- oracion(X,[juan,ama,a,maría],[]),write(X), draw(X).

drawtest5:- oracion(X,[el,gato,grande,come,un,ratón,gris],[]),write(X), draw(X).

drawtest6:- oracion(X,[juan,estudia,en,la,universidad],[]),write(X), draw(X).

drawtest7:- oracion(X,[el,alumno,ama,la,universidad],[]),write(X), draw(X).

drawtest8:- oracion(X,[el,gato,come,ratones],[]),write(X), draw(X).

drawtest9:- oracion(X,[la,manzana,come,un,gato],[]),write(X), draw(X).

drawtest10:- oracion(X,[la,universidad,es,grande],[]),write(X), draw(X).

drawtest:-drawtest1,write('Frase 1 OK'),nl,

   drawtest2,write('Frase 2 OK'),nl,

   drawtest3,write('Frase 3 OK'),nl,

   drawtest4,write('Frase 4 OK'),nl,

   drawtest5,write('Frase 5 OK'),nl,

   drawtest6,write('Frase 6 OK'),nl,

   drawtest7,write('Frase 7 OK'),nl,

   drawtest8,write('Frase 8 OK'),nl,

   drawtest9,write('Frase 9 OK'),nl,

   drawtest10,write('Frase 10 OK'), nl.
