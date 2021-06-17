/*
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------Documento donde se albergan las diferentes frases para hacer pruebas----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
*/


test1:- analizar(_, [el,hombre,come,una,manzana],[]).

test2:- analizar(_, [la,mujer,come,manzanas],[]).

test3:- analizar(_, [mar�a,come,una,manzana,roja],[]).

test4:- analizar(_, [juan,ama,a,mar�a],[]).

test5:- analizar(_, [el,gato,grande,come,un,rat�n,gris],[]).

test6:- analizar(_, [juan,estudia,en,la,universidad],[]).

test7:- analizar(_, [el,alumno,ama,la,universidad],[]).

test8:- analizar(_, [el,gato,come,ratones],[]).

test9:- analizar(_, [la,manzana,come,un,gato],[]).

test10:- analizar(_, [la,universidad,es,grande],[]).



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
   

   
   
/*-------------------------PL2 ---------------------------*/

pl2test1:- analizar(_, [juan,es,moreno,y,mar�a,es,alta],[]).
pl2test2:- analizar(_, [juan,estudia,filosof�a,pero,mar�a,estudia,derecho],[]).
pl2test3:- analizar(_, [mar�a,toma,un,caf�,mientras,juan,recoge,la,mesa],[]).
pl2test4:- analizar(_, [juan,toma,caf�,y,lee,el,peri�dico],[]).
pl2test5:- analizar(_, [juan,y,h�ctor,comen,patatas,fritas,y,beben,cerveza],[]).
pl2test6:- analizar(_, [juan,come,patatas,fritas,pero,mar�a,prefiere,paella,aunque,h�ctor,toma,caf�,e,irene,lee,una,novela],[]).
pl2test7:- analizar(_, [irene,canta,y,salta,mientras,juan,estudia],[]).
pl2test8:- analizar(_, [h�ctor,come,patatas,fritas,y,bebe,zumo,mientras,juan,canta,y,salta,aunque,mar�a,lee,una,novela],[]).
pl2test9:- analizar(_, [juan,que,es,�gil,escala,en,el,roc�dromo,por,las,tardes],[]).
pl2test10:- analizar(_, [juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]).
pl2test11:- analizar(_, [el,procesador,de,textos,que,es,una,herramienta,bastante,potente,sirve,para,escribir,documentos],[]).
pl2test12:- analizar(_, [el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos,pero,es,bastante,lento],[]).
pl2test13:- analizar(_, [el,rat�n,que,caz�,el,gato,era,gris],[]).
pl2test14:- analizar(_, [el,hombre,que,vimos,ayer,era,mi,vecino],[]).


pl2test:-pl2test1,nl,write('Frase 1 OK'), nl, nl,

   pl2test2,nl,write('Frase 2 OK'),nl, nl,

   pl2test3,nl,write('Frase 3 OK'),nl, nl,

   pl2test4,nl,write('Frase 4 OK'),nl, nl,

   pl2test5,nl,write('Frase 5 OK'),nl, nl,

   pl2test6,nl,write('Frase 6 OK'),nl, nl,

   pl2test7,nl,write('Frase 7 OK'),nl, nl,

   pl2test8,nl,write('Frase 8 OK'),nl, nl,

   pl2test9,nl,write('Frase 9 OK'),nl, nl,

   pl2test10,nl,write('Frase 10 OK'), nl, nl,

   pl2test11,nl,write('Frase 11 OK'), nl, nl,

   pl2test12,nl,write('Frase 12 OK'), nl, nl,

   pl2test13,nl,write('Frase 13 OK'), nl, nl,

   pl2test14,nl,write('Frase 14 OK'), nl   .



