:-consult(ejecucion1).


/*-----------------------------------------------------------------
--------------------Variables-------------------------------------
--------------------------------------------------------------------*/

%---------------Programa main---------------
jugar:-
       Listainicial =['Albert', 'Paul', 'Tom', 'Derek', 'Richard', 'Louis', 'Michael', 'Charles', 'Sam', 'Steve', 'Will', 'Anthony', 'Billy','Henry' , 'Tiffany' , 'Natalie', 'Roxanne', 'Sarah', 'Sabrina', 'Cindy', 'Emma'],
       Preguntas_validas=['chico','chica','pelo_rubio','pelo_negro','ropa_roja','ropa_verde','feliz','triste','ojos_azules','ojos_marrones','gafas','no_gafas'],
       escoger_dificultad(Difi),
       obtener_personajes(Personaje1,Personaje2),
       (
              Difi == 'medio',write('Escogiste, nivel medio'), jugar_aux(Listainicial,Listainicial,Personaje1,Personaje2,Preguntas_validas)
                        ;
              Difi == 'avanzado',write('Escogiste, nivel avanzado'), jugar_aux(Listainicial,Listainicial,Personaje1,Personaje2,Preguntas_validas)
       )
      .






/*-----------------------------------Simulacion de juego-----------------------------------------------------------------*/
jugar_aux(Listainicial1,Listainicial2,Personaje1,Personaje2,Preguntas_validas):-
                                                              turno_jugador(Personaje1,Personaje2,Listainicial1, Listafinal1),
                                                              turno_maquina(Personaje1,Personaje2,Listainicial2, Listafinal2,Preguntas_validas,Preguntas_final),
                                                              ((list_longitud(Listafinal1,1),list_longitud(Listafinal2,1),write("Empate tecnico");
                                                              (list_longitud(Listafinal1,1),write("Gana Jugador 1");list_longitud(Listafinal2,1),write("Gana la Maquina")));
                                                              jugar_aux(Listafinal1,Listafinal2,Personaje1,Personaje2,Preguntas_final))
                                                              .
                                                              


