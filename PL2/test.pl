:-consult(gramatica).
%:-consult(ejercicio_3_1).


test1:- oracion(X, [el,hombre,come,una,manzana],[]),write(X).

test2:- oracion(X, [la,mujer,come,manzanas],[]),write(X).

test3:- oracion(X, [mar�a,come,una,manzana,roja],[]),write(X).

test4:- oracion(X, [juan,ama,a,mar�a],[]),write(X).

test5:- oracion(X, [el,gato,grande,come,un,rat�n,gris],[]),write(X).

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

drawtest3:- oracion(X,[mar�a,come,una,manzana,roja],[]),write(X), draw(X).

drawtest4:- oracion(X,[juan,ama,a,mar�a],[]),write(X), draw(X).

drawtest5:- oracion(X,[el,gato,grande,come,un,rat�n,gris],[]),write(X), draw(X).

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
   
   
   
   
   
   
/*-------------------------PL2 ---------------------------*/

pl2test1:- oracion(X, [juan,es,moreno,y,mar�a,es,alta],[]),write(X).
pl2test2:- oracion(X, [juan,estudia,filosof�a,pero,mar�a,estudia,derecho],[]),write(X).
pl2test3:- oracion(X, [mar�a,toma,un,caf�,mientras,juan,recoge,la,mesa],[]),write(X).
pl2test4:- oracion(X, [juan,toma,caf�,y,lee,el,peri�dico],[]),write(X).
pl2test5:- oracion(X, [juan,y,h�ctor,comen,patatas,fritas,y,beben,cerveza],[]),write(X).
pl2test6:- oracion(X, [juan,come,patatas,fritas,pero,mar�a,prefiere,paella,aunque,h�ctor,toma,caf�,e,irene,lee,una,novela],[]),write(X).
pl2test7:- oracion(X, [irene,canta,y,salta,mientras,juan,estudia],[]),write(X).
pl2test8:- oracion(X, [h�ctor,come,patatas,fritas,y,bebe,zumo,mientras,juan,canta,y,salta,aunque,mar�a,lee,una,novela],[]),write(X).
pl2test9:- oracion(X, [juan,que,es,�gil,escala,en,el,roc�dromo,por,las,tardes],[]),write(X).
pl2test10:- oracion(X, [juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]),write(X).
pl2test11:- oracion(X, [el,procesador,de,textos,que,es,una,herramienta,bastante,potente,sirve,para,escribir,documentos],[]),write(X).
pl2test12:- oracion(X, [el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos,pero,es,bastante,lento],[]),write(X).
pl2test13:- oracion(X, [el,rat�n,que,caz�,el,gato,era,gris],[]),write(X).
pl2test14:- oracion(X, [el,hombre,que,vimos,ayer,era,mi,vecino],[]),write(X).


pl2test:-pl2test1,write('Frase 1 OK'),nl,

   pl2test2,write('Frase 2 OK'),nl,

   pl2test3,write('Frase 3 OK'),nl,

   pl2test4,write('Frase 4 OK'),nl,

   pl2test5,write('Frase 5 OK'),nl,

   pl2test6,write('Frase 6 OK'),nl,

   pl2test7,write('Frase 7 OK'),nl,

   pl2test8,write('Frase 8 OK'),nl,

   pl2test9,write('Frase 9 OK'),nl,

   pl2test10,write('Frase 10 OK'), nl,

   pl2test11,write('Frase 11 OK'), nl,

   pl2test12,write('Frase 12 OK'), nl,

   pl2test13,write('Frase 13 OK'), nl,

   pl2test14,write('Frase 14 OK'), nl   .



