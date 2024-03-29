:-consult(conocimiento).

%----------------PREGUNTAS PARA CONOCER RASGOS--------------------
/*Funciones para saber si un dato cumple un determinado rasgo*/
es_chico(Y):- chico(X),member(Y,X).
es_chica(Y):- chica(X),member(Y,X).
tiene_pelo_rubio(Y):- pelo_rubio(X),member(Y,X).
tiene_pelo_negro(Y):- pelo_negro(X),member(Y,X).
tiene_ropa_roja(Y):- ropa_roja(X),member(Y,X).
tiene_ropa_verde(Y):- ropa_verde(X),member(Y,X).
esta_feliz(Y):- feliz(X),member(Y,X).
esta_triste(Y):- triste(X),member(Y,X).
tiene_ojos_azules(Y):- ojos_azules(X),member(Y,X).
tiene_ojos_marrones(Y):- ojos_marrones(X),member(Y,X).
lleva_gafas(Y):- gafas(X),member(Y,X).
no_lleva_gafas(Y):- no_gafas(X),member(Y,X).
lleva_gorra(Y):- gorra(X),member(Y,X).
no_lleva_gorra(Y):- no_gorra(X),member(Y,X).
tiene_pelo_corto(Y):- pelo_largo(X),member(Y,X).
tiene_pelo_largo(Y):- pelo_corto(X),member(Y,X).

es_pregunta(Y):- preguntas(X),member(Y,X).
es_personaje(Y):- personaje(X),member(Y,X).


%------------------------CONSULTAS PARA EL PROGRAMA---------------
/*Funciones para obtener la lista de personajes que no deben ser descartados, tras la respuesta negativa o positiva a una pregunta*/


lista_personajes_validos(Listainicial,Pregunta,Listafinal):- lista_personajes_validos_aux(Listainicial,Pregunta,Listafinal,[]).
lista_personajes_validos_aux([X|Cola],Pregunta,Salida,Cambiante):-
                                                       lista_caracteristicas(X, R),
                                                       (member(Pregunta,R),
                                                       lista_personajes_validos_aux(Cola,Pregunta,Salida,[X|Cambiante]);
                                                       lista_personajes_validos_aux(Cola,Pregunta,Salida,Cambiante)), !.
                                                       lista_personajes_validos_aux(_,_,Cambiante,Cambiante).

lista_personajes_no_validos(Listainicial,Pregunta,Listafinal):- lista_personajes_no_validos_aux(Listainicial,Pregunta,Listafinal,[]).
lista_personajes_no_validos_aux([X|Cola],Pregunta,Salida,Cambiante):-
                                                       lista_caracteristicas(X, R),
                                                       (not(member(Pregunta,R)),
                                                       lista_personajes_no_validos_aux(Cola,Pregunta,Salida,[X|Cambiante]);
                                                       lista_personajes_no_validos_aux(Cola,Pregunta,Salida,Cambiante)), !.
                                                       lista_personajes_no_validos_aux(_,_,Cambiante,Cambiante).






lista_caracteristicas(X, R):-
                         /*Funcion que devuelve lista de caracteristicas R de un personaje X*/
                         append_chico(X,[],A),
                         append_gafas(X,A,B),
                         append_color_pelo(X,B,C),
                         append_ropa(X,C,D),
                         append_estado(X,D,E),
                         append_ojos(X,E,F),
                         append_gorra(X,F,G),
                         append_longitud_pelo(X,G,R).

/*A partir de una lista inicial, se le a�ade una caracteristica, si la cumple*/
append_chico(X,S,R):-  es_chico(X),append(S,['chico'],R); es_chica(X),append(S,['chica'],R).
append_gafas(X,S,R):-  lleva_gafas(X),append(S,['gafas'],R); no_lleva_gafas(X),append(S,['no_gafas'],R).
append_color_pelo(X,S,R):-   tiene_pelo_rubio(X),append(S,['pelo_rubio'],R);tiene_pelo_negro(X),append(S,['pelo_negro'],R).
append_ropa(X,S,R):-   tiene_ropa_roja(X),append(S,['ropa_roja'],R);tiene_ropa_verde(X),append(S,['ropa_verde'],R).
append_estado(X,S,R):- esta_feliz(X),append(S,['feliz'],R);esta_triste(X),append(S,['triste'],R).
append_ojos(X,S,R):-   tiene_ojos_azules(X),append(S,['ojos_azules'],R);tiene_ojos_marrones(X),append(S,['ojos_marrones'],R).
append_gorra(X,S,R):-   lleva_gorra(X),append(S,['gorra'],R);no_lleva_gorra(X),append(S,['no_gorra'],R).
append_longitud_pelo(X,S,R):-   tiene_pelo_corto(X),append(S,['pelo_corto'],R);tiene_pelo_largo(X),append(S,['pelo_largo'],R).




/*Calcular el numero de personajes que cumplen cierta caracteristica*/
cuantos_chicos([X|Cola],N):-
                            cuantos_chicos(Cola,N1),
                            (es_chico(X), N is N1 + 1; N is N1), !.
cuantos_chicos([],N):- N is 0.
                            
cuantos_pelo_rubio([X|Cola],N):-
                            cuantos_pelo_rubio(Cola,N1),
                            (tiene_pelo_rubio(X), N is N1 + 1; N is N1), !.
cuantos_pelo_rubio([],N):- N is 0.

cuantos_ropa_roja([X|Cola],N):-
                            cuantos_ropa_roja(Cola,N1),
                            (tiene_ropa_roja(X), N is N1 + 1; N is N1), !.
cuantos_ropa_roja([],N):- N is 0.

cuantos_feliz([X|Cola],N):-
                            cuantos_feliz(Cola,N1),
                            (esta_feliz(X), N is N1 + 1; N is N1), !.
cuantos_feliz([],N):- N is 0.

cuantos_ojos_azules([X|Cola],N):-
                            cuantos_ojos_azules(Cola,N1),
                            (tiene_ojos_azules(X), N is N1 + 1; N is N1), !.
cuantos_ojos_azules([],N):- N is 0.

cuantos_gafas([X|Cola],N):-
                            cuantos_gafas(Cola,N1),
                            (lleva_gafas(X), N is N1 + 1; N is N1), !.
cuantos_gafas([],N):- N is 0.

cuantos_pelo_largo([X|Cola],N):-
                            cuantos_pelo_largo(Cola,N1),
                            (tiene_pelo_largo(X), N is N1 + 1; N is N1), !.
cuantos_pelo_largo([],N):- N is 0.

cuantos_pelo_corto([X|Cola],N):-
                            cuantos_pelo_corto(Cola,N1),
                            (tiene_pelo_corto(X), N is N1 + 1; N is N1), !.
cuantos_pelo_corto([],N):- N is 0.

cuantos_lleva_gorra([X|Cola],N):-
                            cuantos_lleva_gorra(Cola,N1),
                            (lleva_gorra(X), N is N1 + 1; N is N1), !.
cuantos_lleva_gorra([],N):- N is 0.

cuantos_no_lleva_gorra([X|Cola],N):-
                            cuantos_no_lleva_gorra(Cola,N1),
                            (no_lleva_gorra(X), N is N1 + 1; N is N1), !.
cuantos_no_lleva_gorra([],N):- N is 0.


/*CALCULO DE LONGITUD*/
list_longitud([_|Y],N):- list_longitud(Y,N1), N is N1 + 1.
list_longitud([],N):- N is 0.



