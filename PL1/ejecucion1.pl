:-consult(conocimiento).
:-consult(funciones).


/*----------------------------------------------MAIN-----------------------------------*/
turno_jugador(Personaje1,Personaje2,Listainicial, Listafinal):-
               write('\t\tEs tu Turno\n'),
               caracteristicas(Personaje1),
               hacer_pregunta(Pregunta),
               pregunta_valida(Personaje2,Pregunta,Listainicial, Listafinal),
               posibles_personajes(Listafinal).

turno_maquina(Personaje1,Personaje2,Listainicial, Listafinal,Preguntas_validas,Preguntas_final):-
                                                  write('\t\tAhora te hago yo una pregunta:\n'),
                                                  pregunta_aleatoria(Pregunta,Preguntas_validas,Preguntas_final),
                                                  write(Pregunta),write('?\n'),
                                                  pregunta_valida_maquina(Personaje1,Pregunta,Listainicial, Listafinal),
                                                  list_longitud(Listafinal,N),
                                                  write('Por lo tanto, aún dudo entre '),write(N),write('posibilidades.\n\n')
                                                  .


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
                                   
pregunta_aleatoria(Pregunta,Preguntas_validas,Preguntas_final):-
                              length(Preguntas_validas,Numero),                    %Obtengo el numero de personajes posibles del juego
                              %Obtenemos un personaje aleatorio para el Jugador1
                              random(0,Numero,X),write(Numero),write('  '),write(X),write('  '),write(Preguntas_validas),                                %Obtengo el numero aleatorio para seleccionar un personaje
                              nth1(X,Preguntas_validas,Pregunta),
                              select(Pregunta,Preguntas_validas,Preguntas_final)
                              .

                              

