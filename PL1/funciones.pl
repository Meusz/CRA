:-consult(conocimiento).

%----------------PREGUNTAS PARA CONOCER RASGOS--------------------
es_chico(Y):- chico(X),member(Y,X).                   %,write(true).
es_chica(Y):- chica(X),member(Y,X).                               %,write(true).
tiene_pelo_rubio(Y):- pelo_rubio(X),member(Y,X).                              %,,write(true).
tiene_pelo_negro(Y):- pelo_negro(X),member(Y,X).                                           %,member(Y,X),write(true).
tiene_ropa_roja(Y):- ropa_roja(X),member(Y,X).                   %,member(Y,X),write(true).
tiene_ropa_verde(Y):- ropa_verde(X),member(Y,X).                                         %,member(Y,X),write(true).
esta_feliz(Y):- feliz(X),member(Y,X).                                        %,write(true).
esta_triste(Y):- triste(X),member(Y,X).                                 %,write(true).
tiene_ojos_azules(Y):- ojos_azules(X),member(Y,X).                 %,write(true).
tiene_ojos_marrones(Y):- ojos_marrones(X),member(Y,X).                 %,write(true).
lleva_gafas(Y):- gafas(X),member(Y,X).                                 %,write(true).
no_lleva_gafas(Y):- no_gafas(X),member(Y,X).                           %,write(true).


%------------------------CONSULTAS PARA EL PROGRAMA---------------
%pregunta_valida(Lista,Pregunta,Validas,No_validas):- member(Pregunta,Lista)./*,write('La respuesta a la pregunta es positiva')
                                                     %;write('La respuesta a la pregunta es negativa'),append([],[Pregunta],No_validas).   */
%borrado recursivo
lista_personajes_validos(Listainicial,Pregunta,Listafinal):- lista_personajes_validos_aux(Listainicial,Pregunta,Listafinal,[]).
lista_personajes_validos_aux([X|Cola],Pregunta,Salida,Cambiante):-
                                                       lista_caracteristicas(X, R),
                                                       (member(Pregunta,R),
                                                       lista_personajes_validos_aux(Cola,Pregunta,Salida,[X|Cambiante]);
                                                       lista_personajes_validos_aux(Cola,Pregunta,Salida,Cambiante)), !.
                                                       lista_personajes_validos_aux(_,Pregunta,Cambiante,Cambiante).

lista_personajes_no_validos(Listainicial,Pregunta,Listafinal):- lista_personajes_no_validos_aux(Listainicial,Pregunta,Listafinal,[]).
lista_personajes_no_validos_aux([X|Cola],Pregunta,Salida,Cambiante):-
                                                       lista_caracteristicas(X, R),
                                                       (not(member(Pregunta,R)),
                                                       lista_personajes_no_validos_aux(Cola,Pregunta,Salida,[X|Cambiante]);
                                                       lista_personajes_no_validos_aux(Cola,Pregunta,Salida,Cambiante)), !.
                                                       lista_personajes_no_validos_aux(_,Pregunta,Cambiante,Cambiante).





%personaje_valido(Y):- personaje(X),member(Y,X).


lista_caracteristicas(X, R):- append_chico(X,[],A),append_gafas(X,A,B),append_pelo(X,B,C),append_ropa(X,C,D),append_estado(X,D,E),append_ojos(X,E,R).

append_chico(X,S,R):-  es_chico(X),append(S,['chico'],R); es_chica(X),append(S,['chica'],R).
append_gafas(X,S,R):-  lleva_gafas(X),append(S,['gafas'],R); no_lleva_gafas(X),append(S,['no_gafas'],R).
append_pelo(X,S,R):-   tiene_pelo_rubio(X),append(S,['pelo_rubio'],R);tiene_pelo_negro(X),append(S,['pelo_negro'],R).
append_ropa(X,S,R):-   tiene_ropa_roja(X),append(S,['ropa_roja'],R);tiene_ropa_verde(X),append(S,['ropa_verde'],R).
append_estado(X,S,R):- esta_feliz(X),append(S,['feliz'],R);esta_triste(X),append(S,['triste'],R).
append_ojos(X,S,R):-   tiene_ojos_azules(X),append(S,['ojos_azules'],R);tiene_ojos_marrones(X),append(S,['ojos_marrones'],R).


/*CALCULO DE LONGITUD*/
list_longitud([_|Y],N):- list_longitud(Y,N1), N is N1 + 1.
list_longitud([],N):- N is 0.



