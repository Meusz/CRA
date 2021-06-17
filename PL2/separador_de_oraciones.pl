/* Separador de oraciones complejas en varias*/


/*Escribir frases*/
%Estas funciones reciben una lista, que posee sublistas de frases, que ira separando y mostrando
 
escribir_frases([Cabeza|Cuerpo]):- %Separa la cabeza y el cuerpo de la lista para desglosar las listas en oraciones
                                  escribir_frases(Cabeza),
                                  escribir_frases(Cuerpo).
escribir_frases([Cabeza|Cuerpo]):-
                                  escribir(Cabeza),
                                  escribir_frases(Cuerpo).

escribir_frases([Cabeza|_]):-    /*Desglosa la cabeza por si la componen varias oraciones simples*/
                                escribir_frases(Cabeza).

escribir_frases([Cabeza|_]):-   /*Si ha alcanzado una oracion simple la escribe*/
                                escribir(Cabeza).

escribir_frases([]).

%Funcion para que recibida una oracion, la escriba por pantalla
escribir([Cabeza,Cola]):-
                         write('o('),write(Cabeza),write(','),write(Cola),write(')'),nl.

/*Crear frases*/
%Estas funciones recibiran los gn y gv en el orden que existen en la oracion, de modo que ahora crearan oraciones

formar_frases(X,Y):-
                    /*Busca un GN y Gv, para unirlos, posteriormente busca mas GV para unirlos al GN original. Si no puede, se llama recursivamente
                     Para dar paso a otro GN  */
                    obtener_gn(GN,X,W),
                    obtener_gv(GV,W,U),
                    append([GN],[GV],A),
                    seguir_formando(GN,U,B,Z),
                    append([A],[B],C),
                    formar_frases(Z,D),
                    append(C,D,Y).
formar_frases(X,Y):-
                    /*Busca un GN y Gv, para unirlos,posteriormente busca mas GV para unirlos al GN original. */
                    obtener_gn(GN,X,W),
                    obtener_gv(GV,W,U),
                    append([GN],[GV],A),
                    seguir_formando(GN,U,B,_),
                    append([A],[B],Y).

formar_frases(X,Y):-
                    /*Busca un GN y Gv, para unirlos, posteriormente se llama recursivamente
                     Para dar paso a otro GN */
                    obtener_gn(GN,X,W),
                    obtener_gv(GV,W,U),
                    append([GN],[GV],A),
                    formar_frases(U,B),
                    append([A],[B],Y).

formar_frases(X,Y):-
                    /*Busca un GN y Gv, para unirlos. */
                    obtener_gn(GN,X,W),
                    obtener_gv(GV,W,_),
                    append([GN],[GV],Y).
                    
formar_frases([Cabeza|Cola],Y):-
                                /*Separa una lista y busca formar oracioens con cada parte */
                                formar_frases(Cabeza,A),
                                formar_frases(Cola,B),
                                append([A],[B],Y).

formar_frases([Cabeza|_],Y):-
                                formar_frases(Cabeza,A), Y =[A].
formar_frases([Cabeza|_],Y):-
                                formar_frases(Cabeza,Y).
formar_frases(X,Y):-
                    /*Si hay dos GN seguidos, los separa y forma oraciones para cada GN con los mismos GV*/
                    obtener_gn(GN1,X,W),
                    obtener_gn(GN2,W,U),
                    formar_frases([GN1|U],A),
                    formar_frases([GN2|U],B),
                    append(A,B,Y)
                    .


seguir_formando(GN,X,Y,Z):-
                           /*Funcion que dado un GN, forma mas frases con los siguientes GV*/
                           obtener_gv(GV,X,U),
                           appendo(GN,GV,A),
                           seguir_formando(GN,U,B,Z),
                           appendo(A,B,Y).
                           
seguir_formando(GN,X,Y,Z):-
                           /*Funcion que dado un GN, forma mas frases con el siguiente GV*/
                           obtener_gv(GV,X,Z),
                           appendo(GN,GV,Y).
                           

/*Combrueba que el valor obtenido es un GN*/
obtener_gn(GN,[Cabeza|Cuerpo],Cuerpo):-
                                  Cabeza =..[Z|_],
                                  Z = 'gn',
                                  GN=Cabeza.
obtener_gn(GN,Cabeza,[]):-
                                  Cabeza =..[Z|_],
                                  Z = 'gn',
                                  GN=Cabeza.
                                  
/*Combrueba que el valor obtenido es un GV*/
obtener_gv(GV,[Cabeza|Cuerpo],Cuerpo):-
                                  Cabeza =..[Z|_],
                                  Z = 'gv',
                                  GV=Cabeza.
obtener_gv(GV,Cabeza,[]):-
                                  Cabeza =..[Z|_],
                                  Z = 'gv',
                                  GV=Cabeza.






/*Operaciones para obtener gn y gv en orden*/


obtener_gn_gv(Oracion,Lista):-  %Compruebo si es una oracion y busco sus GN y GV
                                      Oracion =.. [Cabeza|Cuerpo],
                                      Cabeza=o,
                                      buscar_gn_gv(Cuerpo,Lista)
                                      .
obtener_gn_gv(Oracion,Lista):-  %Compruebo si es una oracion subordinada de relativo y busco sus GN y GV
                                      Oracion =.. [Cabeza|Cuerpo],
                                      Cabeza=os,
                                      buscar_gn_gv(Cuerpo,Lista)
                                      .
obtener_gn_gv(Oracion,Lista):-  %Compruebo si es una oracion coordinada y busco sus GN y GV
                                      Oracion =.. [Cabeza|Cuerpo],
                                      Cabeza=oc,
                                      Cuerpo=[X,_,Y|_],
                                      obtener_gn_gv(X,A),
                                      obtener_gn_gv(Y,B),
                                      appendo(A,B,Lista)
                                      .
                                      
obtener_gn_gv(Oracion,Lista):-  %Compruebo si es una oracion Compuesta y busco que elementos la componen
                                      Oracion =.. [Cabeza|Cuerpo],
                                      Cabeza=ocm,
                                      obtener_gn_gv_compuesta(Cuerpo,Lista)
                                      .

obtener_gn_gv_compuesta([X,_,Y|_],Lista):-
                                          /*Compruebo si a la oracion Compuesta la compoenne una oracion coordinada y una oracion, si
                                          es asi, busco sus GN y GV      */
                                      X =.. [Cabeza1|Cuerpo1],
                                      Cabeza1 = oc,
                                      Y =.. [Cabeza2|_],
                                       Cabeza2 = o,
                                      Cuerpo1=[X1,_,Y1|_],
                                      obtener_gn_gv(X1,A),
                                      obtener_gn_gv(Y1,B),
                                      appendo(A,B,C),
                                      obtener_gn_gv(Y,D),
                                      appendo(C,D,Lista)
                                      .
obtener_gn_gv_compuesta([X,_,Y|_],Lista):-
                                          /*Compruebo si a la oracion Compuesta la compoenne una oracion coordinada y una oracion subordinada, si
                                          es asi, busco sus GN y GV      */
                                      X =.. [Cabeza1|Cuerpo1],
                                      Cabeza1 = oc,
                                      Y =.. [Cabeza2|_],
                                       Cabeza2 = os,
                                      Cuerpo1=[X1,_,Y1|_],
                                      obtener_gn_gv(X1,A),
                                      obtener_gn_gv(Y1,B),
                                      appendo(A,B,C),
                                      obtener_gn_gv(Y,D),
                                      appendo(C,D,Lista)
                                      .


obtener_gn_gv_compuesta([X,_,Y|_],Lista):-
                                          /*Compruebo si a la oracion Compuesta la compoenne una oracion coordinada y una oracion coordinada, si
                                          es asi, busco sus GN y GV      */
                                      X =.. [Cabeza1|Cuerpo1],
                                      Cabeza1 = oc,
                                      Y =.. [Cabeza2|Cuerpo2],
                                      Cabeza2 = oc,
                                      Cuerpo1=[X1,_,Y1|_],
                                      Cuerpo2=[X2,_,Y2|_],
                                      obtener_gn_gv(X1,A),
                                      obtener_gn_gv(Y1,B),
                                      appendo(A,B,C),
                                      obtener_gn_gv(X2,D),
                                      obtener_gn_gv(Y2,E),
                                      appendo(D,E,G),
                                      appendo(C,G,Lista)
                                      .
                                      
obtener_gn_gv_compuesta([X,_,Y|_],Lista):-
                                          /*Compruebo si a la oracion Compuesta la compoenne una oracion coordinada y una oracion compuesta, si
                                          es asi, busco sus GN y GV      */
                                      X =.. [Cabeza1|Cuerpo1],
                                      Cabeza1 = oc,
                                      Y =.. [Cabeza2|Cuerpo2],
                                      Cabeza2 = ocm,
                                      Cuerpo1=[X1,_,Y1|_],
                                      Cuerpo2=[X2,_,Y2|_],
                                      obtener_gn_gv(X1,A),
                                      obtener_gn_gv(Y1,B),
                                      appendo(A,B,C),
                                      obtener_gn_gv(X2,D),
                                      obtener_gn_gv(Y2,E),
                                      appendo(D,E,G),
                                      appendo(C,G,Lista)
                                      .




                                      
buscar_gn_gv([Cabeza|Cuerpo],Lista):-
                                     /*Compruebo si posee un GN y realizo una llamada recursiva*/
                                      devolver_gn_gv(Cabeza,A),
                                      buscar_gn_gv(Cuerpo,B),
                                      appendo(A,B,Lista).
                                      
buscar_gn_gv([Cabeza|Cuerpo],Lista):-
                                     /*Compruebo si posee un GN y un GV*/
                                      obtener_gn_gv(Cabeza,A),
                                      buscar_gn_gv(Cuerpo,B),
                                      appendo(A,B,Lista).


buscar_gn_gv([Cabeza|_],Lista):-
                                 /*Compruebo si posee un GN */
                                      devolver_gn_gv(Cabeza,Lista).
buscar_gn_gv([Cabeza|_],Lista):-
                                /*Compruebo si posee un GV */
                                      obtener_gn_gv(Cabeza,Lista).



buscar_gn_gv([_|Cuerpo],Lista):-
                                      /*Compruebo si posee un GN o Gv en su cuerpo */
                                      buscar_gn_gv(Cuerpo,Lista).

                                      

/*Una vez obtenido un elemento suficientemente pequeño, compruebo si es un GN o un GV*/
devolver_gn_gv(Oracion,Lista):-
            Oracion =.. [Cabeza|_],
            Cabeza ='gn',
            Lista = Oracion.

devolver_gn_gv(Oracion,Lista):-
            Oracion =.. [Cabeza|_],
            Cabeza ='gv',
            Lista = Oracion.
            
            
/*Contamos el numero de verbos que posee la oracion*/

num_verbos(X,Y):-
                    X =.. [Cabeza|Cola],
                    es_verbo(Cabeza,Y1),
                    nume_verbos(Cola,Y2),
                    Y is Y1 + Y2.
                    
nume_verbos([Cabeza|Cola],Y):-
                            num_verbos(Cabeza,Y1),
                            nume_verbos(Cola,Y2),
                            Y is Y1 + Y2.

nume_verbos([],Y):- Y is 0.


es_verbo(X,Y):-
                    X =.. [Cabeza|_],
                    Cabeza = v,
                    Y is 1.
es_verbo(X,Y):-
                    X =.. [Cabeza|_],
                    Cabeza = vs,
                    Y is 1.

es_verbo(X,Y):-
                    X =.. [Cabeza|_],
                    Y is 0.


/*Contamos el numero de conjunciones que posee la oracion*/

num_conjunciones(X,Y):-
                    X =.. [Cabeza|Cola],
                    es_conjuncion(Cabeza,Y1),
                    nume_conjunciones(Cola,Y2),
                    Y is Y1 + Y2.

nume_conjunciones([Cabeza|Cola],Y):-
                            num_conjunciones(Cabeza,Y1),
                            nume_conjunciones(Cola,Y2),
                            Y is Y1 + Y2.

nume_conjunciones([],Y):- Y is 0.


es_conjuncion(X,Y):-
                    X =.. [Cabeza|_],
                    Cabeza = conj,
                    Y is 1.

es_conjuncion(X,Y):-
                    X =.. [Cabeza|_],
                    Y is 0.
                    
                    


/*Operacion para concatenar, GN, GV y listas*/
appendo(X,Y,S):-
                append(X,Y,S).
appendo(X,Y,S):-
                append(X,[Y|_],S).
appendo(X,Y,S):-
                S=[X,Y].
appendo(X,Y,S):-
                append([X],Y,S).
appendo(X,Y,S):-
                append([X],[Y],S).


