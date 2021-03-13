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


/*----------------------------------------------MAIN-----------------------------------*/
escoger_dificultad(Difi):- write('\tBIENVENIDO A QUIEN ES QUIEN\t\n\n'),
                           write('En este juego tenemos varios niveles: medio, avanzado \n Escoja uno seguido de un punto\n\t'),
                           read(Difi),write('\n\nEscogiste el nivel de dificultad '),write(Difi),write('\n\n').
obtener_personajes(Personaje1,Personaje2):-
                          personaje(P),length(P,Numero),                    %Obtengo el numero de personajes posibles del juego

                             %Obtenemos un personaje aleatorio para el Jugador1
                          random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
                           nth1(X,P,Personaje1),

                           %Obtenemos otro personaje aleatorio para el Jugador2
                            random(0,Numero,Y),
                            nth1(Y,P,Personaje2),
                            write('\n').
                            
caracteristicas(Personaje):-

                            write('Tu personaje es '),write(Personaje),write('\n\n'),
                            write('Te recuerdo sus características:\n'),
                            lista_caracteristicas(Personaje, S), write(S).

hacer_pregunta(Pregunta):-
              write('\n\nElige de entre las siguientes preguntas una que quieras hacerme y escríbela\ncambiando la interrogación por un punto: chico?, chica?, gafas?'),
              write('\n,pelo_rubio?, pelo_negro?, feliz?, triste?, ropa_roja?, ropa_verde?\n'),
              read(Pregunta).
              
pregunta_valida(Personaje,Pregunta,Listainicial, Listafinal):-
                                                 write('\nLa pregunta es : '),write(Pregunta),write('\n\n'),
                                                 write('\nTu personaje es : '),write(Personaje),write('\n\n'),
                                                 lista_caracteristicas(Personaje,R),
                                                 (member(Pregunta,R),  write('La respuesta es positiva\n'),
                                                 lista_personajes_validos(Listainicial,Pregunta,Listafinal);
                                                 write('La respuesta es negativa\n'),
                                                 lista_personajes_no_validos(Listainicial,Pregunta,Listafinal) ).
                                                 
pregunta_valida_maquina(Personaje,Pregunta,Listainicial, Listafinal):-
                                                 write('\nLa pregunta es : '),write(Pregunta),write('\n\n'),
                                                 write('\nEl personaje es : '),write(Personaje),write('\n\n'),
                                                 lista_caracteristicas(Personaje,R),
                                                 (member(Pregunta,R),  write('La respuesta a la pregunta es afirmativa.\n'),
                                                 lista_personajes_validos(Listainicial,Pregunta,Listafinal);
                                                 write('La respuesta a la pregunta es negativa.\n'),
                                                 lista_personajes_no_validos(Listainicial,Pregunta,Listafinal) ).


posibles_personajes(Listafinal):-
                                 write('\nYa sabes que soy uno de los personajes de la siguiente lista:\n\n'),
                                 posibles_personajes_aux(Listafinal),write('\n\n').

posibles_personajes_aux([X|Cola]):-
                                   write(X),write('-->'),
                                   lista_caracteristicas(X, R), write(R),write('\n'),
                                   posibles_personajes_aux(Cola), !.
                                   posibles_personajes_aux(_).
                                   
pregunta_aleatoria(Pregunta):-
                              preguntas(P),length(P,Numero),                    %Obtengo el numero de personajes posibles del juego
                              %Obtenemos un personaje aleatorio para el Jugador1
                              random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
                              nth1(X,P,Pregunta).

/*CALCULO DE LONGITUD*/
list_longitud([_|Y],N):- list_longitud(Y,N1), N is N1 + 1.
list_longitud([],N):- N is 0.

                              
                              

