:-consult(ejecucion1).


/*-----------------------------------------------------------------
--------------------Variables-------------------------------------
--------------------------------------------------------------------*/

%---------------Programa main---------------
jugar:-
       Listainicial =['Albert', 'Paul', 'Tom', 'Derek', 'Richard', 'Louis', 'Michael', 'Charles', 'Sam', 'Steve', 'Will', 'Anthony', 'Billy','Henry' , 'Tiffany' , 'Natalie', 'Roxanne', 'Sarah', 'Sabrina', 'Cindy', 'Emma'],
       escoger_dificultad(Difi),
       obtener_personajes(Personaje1,Personaje2),
       jugar_aux(Listainicial,Listainicial,Personaje1,Personaje2).

jugar_aux(Listainicial1,Listainicial2,Personaje1,Personaje2):-
                                                              turno_jugador(Personaje1,Personaje2,Listainicial1, Listafinal1),
                                                              turno_maquina(Personaje1,Personaje2,Listainicial2, Listafinal2)
                                                              %jugar_aux(Listafinal1,Listainicial2,Personaje1,Personaje2)
                                                              .
                                                              
turno_jugador(Personaje1,Personaje2,Listainicial, Listafinal):-
               write('\t\tEs tu Turno\n'),
               caracteristicas(Personaje1),
               hacer_pregunta(Pregunta),
               pregunta_valida(Personaje2,Pregunta,Listainicial, Listafinal),
               posibles_personajes(Listafinal).
turno_maquina(Personaje1,Personaje2,Listainicial, Listafinal):-
                                                  write('\t\tAhora te hago yo una pregunta:\n'),
                                                  pregunta_aleatoria(Pregunta),
                                                  write(Pregunta),write('?\n'),
                                                  pregunta_valida_maquina(Personaje1,Pregunta,Listainicial, Listafinal),
                                                  list_longitud(Listafinal,N),
                                                  write('Por lo tanto, aún dudo entre '),write(N),write('posibilidades.\n\n')
                                                  .



