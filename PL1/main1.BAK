:-consult(ejecucion1).


/*-----------------------------------------------------------------
--------------------Variables-------------------------------------
--------------------------------------------------------------------*/

%---------------Programa main---------------
jugar:-
       /*Funcion principal que solicita la dificultad y lanza el juego con el nivel de dificultad solicitado*/
       Listainicial =['Albert', 'Paul', 'Tom', 'Derek', 'Richard', 'Louis', 'Michael', 'Charles', 'Sam', 'Steve', 'Will', 'Anthony', 'Billy','Henry' , 'Tiffany' , 'Natalie', 'Roxanne', 'Sarah', 'Sabrina', 'Cindy', 'Emma'],
       Preguntas_validas=['chico','pelo_rubio','ropa_roja','feliz','ojos_azules','gafas','gorra','pelo_largo'],
       escoger_dificultad(Difi),
       obtener_personajes(Personaje1,Personaje2),
       (
              Difi == 'medio',write('Escogiste, nivel medio'), jugar_aux(Listainicial,Listainicial,Personaje1,Personaje2,Preguntas_validas)
                        ;
              Difi == 'avanzado',write('Escogiste, nivel avanzado'), jugar_aux_avanzado(Listainicial,Listainicial,Personaje1,Personaje2,Preguntas_validas)
       )
      .






/*-----------------------------------Simulacion de juego-----------------------------------------------------------------*/
jugar_aux(Listainicial1,Listainicial2,Personaje1,Personaje2,Preguntas_validas):-
                                                                                /*Jugamos al nivel medio del juego*/
                                                              turno_jugador(Personaje1,Personaje2,Listainicial1, Listafinal1),
                                                              turno_maquina(Personaje1,Personaje2,Listainicial2, Listafinal2,Preguntas_validas,Preguntas_final),
                                                              (se_acabo(Listafinal1,Listafinal2);
                                                              jugar_aux(Listafinal1,Listafinal2,Personaje1,Personaje2,Preguntas_final))
                                                              .

jugar_aux_avanzado(Listainicial1,Listainicial2,Personaje1,Personaje2,Preguntas_validas):-
                                                                                         /*Jugamos al nivel avanzado del juego*/
                                                              turno_jugador(Personaje1,Personaje2,Listainicial1, Listafinal1),
                                                              turno_maquina_avanzado(Personaje1,Personaje2,Listainicial2, Listafinal2,Preguntas_validas,Preguntas_final),
                                                              (se_acabo(Listafinal1,Listafinal2);
                                                              jugar_aux_avanzado(Listafinal1,Listafinal2,Personaje1,Personaje2,Preguntas_final))
                                                              .
                                                              
se_acabo(Lista1,Lista2):-
                         /*A partir de dos listas, si la longitud de alguna o de ambas es 1, termina el juego*/
                                    ( list_longitud(Lista1,1),list_longitud(Lista2,1),write("Empate tecnico");
                                        (list_longitud(Lista1,1),write("Gana Jugador 1");
                                               list_longitud(Lista2,1),write("Gana la Maquina")
                                        )
                                    ).
                                                              


