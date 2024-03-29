/*FICHERO DE EJECUCION
En este fichero se guardan las funciones mas importantes, que permiten que el juego funcione segun las reglas y
procedimientos esperados

*/

:-consult(conocimiento).
:-consult(funciones).


/*----------------------------------------------MAIN-----------------------------------*/
turno_jugador(Personaje1,Personaje2,Listainicial, Listafinal):-
                                                  /*Durante el turno del jugador, se debe obtener la pregunta que realice
                                                  Para posteriormente averiguar entre que personajes debe dudar el jugador*/
                                                  write('\t\tEs tu Turno\n'),
                                                  caracteristicas(Personaje1),
                                                  hacer_pregunta(Pregunta),
                                                  write(Pregunta),write('\n\n'),
                                                  pregunta_valida(Personaje2,Pregunta,Listainicial, Listafinal),
                                                  posibles_personajes(Listafinal).


turno_maquina(Personaje1,Listainicial, Listafinal,Preguntas_validas,Preguntas_final):-
                                                  /*Durante el turno de la maquina de nivel medio, se debe obtener la pregunta.
                                                  Esta pregunta la obtendra de forma aleatoria, a partir de una lista de preguntas que
                                                  puede realizar. Notese que no puede obtener preguntas repetidas de la lista.
                                                  Esta pregunta, la usara posteriormente para averiguar entre que personajes debe dudar la maquina*/
                                                  
                                                  write('\t\tAhora te hago yo una pregunta:\n'),
                                                  pregunta_aleatoria(Pregunta,Preguntas_validas,Preguntas_final),
                                                  write('\t'),write(Pregunta),write('?\n'),
                                                  pregunta_valida_maquina(Personaje1,Pregunta,Listainicial, Listafinal),
                                                  list_longitud(Listafinal,N),
                                                  write('\t'),write('Por lo tanto, a�n dudo entre '),write(N),write(' posibilidades.\n\n')
                                                  .
turno_maquina_avanzado(Personaje1,Listainicial, Listafinal):-
                                                           /*Durante el turno de la maquina de nivel avanzado, se debe obtener la pregunta.
                                                           Esta pregunta la obtendra de forma razonada. Es decir, mediante una busqueda binaria,
                                                           la maquina descubrira que pregunta es mas eficiente de realizar. Esta busqueda razonada
                                                           la realizara de forma binaria.
                                                           Esta pregunta, la usara posteriormente para averiguar entre que personajes debe dudar la maquina*/
                                                           write('\t\tAhora te hago yo una pregunta:\n'),
                                                           pregunta_avanzada(Pregunta,Listainicial),
                                                           write('\t'),write(Pregunta),write('?\n'),
                                                           pregunta_valida_maquina(Personaje1,Pregunta,Listainicial, Listafinal),
                                                           list_longitud(Listafinal,N),
                                                           write('\t'),write('Por lo tanto, a�n dudo entre '),write(N),write(' posibilidades.\n\n')
                                                           .


escoger_dificultad(Difi):-
                          /*Funcion que solicita una dificultad al usuario y la mostrara por la consola*/
                          write('\tBIENVENIDO A QUIEN ES QUIEN\t\n\n'),
                          write('En este juego tenemos varios niveles: medio, avanzado \n Escoja uno seguido de un punto\n\t'),
                          read(Difi),write('\n\nEscogiste el nivel de dificultad '),write(Difi),write('\n\n').
                           
obtener_personajes(Personaje1,Personaje2):-
                                           /*Se obtienen dos personajes aleatorios de la lista de personajes aleatorios*/
                                           personaje(P),length(P,Numero),                    %Obtengo el numero de personajes posibles del juego
                                           %Obtenemos un personaje aleatorio para el Jugador1
                                           random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
                                           nth1(X,P,Personaje1),
                                           %Obtenemos otro personaje aleatorio para el Jugador2
                                           random(0,Numero,Y),
                                           nth1(Y,P,Personaje2),
                                           write('\n').
                            
caracteristicas(Personaje):-
                            /*Se recuerda por consola quien es el Personaje del Jugador, y se muestra la lista de caracteristicas que cumple.
                            Obviamente, la maquina no podra leer esta informacion para hacer trampas.*/
                            write('Tu personaje es '),write(Personaje),write('\n\n'),
                            write('Te recuerdo sus caracter�sticas:\n'),
                            lista_caracteristicas(Personaje, S), write(S).

hacer_pregunta(Pregunta):-
                          /*Se lee dede consola la pregunta que quiera realizar el jugador. Antes se le ha escrito por consola un texto para saber que escribir*/
                          write('\n\nElige de entre las siguientes preguntas una que quieras hacerme y escr�bela\ncambiando la interrogaci�n por un punto: chico?, chica?, gafas?'),
                          write('\n,pelo_rubio?, pelo_negro?, feliz?, triste?, ropa_roja?, ropa_verde? , gorra?, no_gorra, pelo_largo?, pelo_corto?\n'),
                          write('Tambien, puedes resolver diciendo el nombre del perosnaje de la maquina, para ello escribe \'nombre_personaje\'\n'),
                          read(Pregunta).
              
pregunta_valida(Personaje,Pregunta,Listainicial, Listafinal):-
                                                 /*
                                                 Se comprueba que la pregunta es valida, y se procesa la lista de personajes que el personaje no ha descartado.
                                                 Por lo que al final obtendra una lista reducida con los personajes que aun no fueron descartados.
                                                 Tambien, comprueba si ha dicho el nombre de un personaje y si lo ha adivinado.
                                                 */
                                                 ((es_pregunta(Pregunta),
                                                 lista_caracteristicas(Personaje,R),
                                                 (member(Pregunta,R),  write('La respuesta es positiva\n'),
                                                 lista_personajes_validos(Listainicial,Pregunta,Listafinal);
                                                 write('La respuesta es negativa\n'),
                                                 lista_personajes_no_validos(Listainicial,Pregunta,Listafinal) ));
                                                 (es_personaje(Pregunta),
                                                   (Pregunta = Personaje, write('Acertaste al Personaje final'),
                                                    Listafinal=[Pregunta];
                                                    write('No acertaste al Personaje final'),
                                                    Listafinal = Listainicial)
                                                 ));
                                                 write('La pregunta no ha sido valida'), Listafinal = Listainicial
                                                 .
                                                 
pregunta_valida_maquina(Personaje,Pregunta,Listainicial, Listafinal):-
                                                         /*
                                                         Se valida la pregunta realizada por la maquina y se obtiene, a partir de una lista de personajes
                                                         no descartados, la lista de personajes obtenida tras la pregunta, quedando menos personajes que en la inicial.
                                                         */
                                                 write('\nLa pregunta es : '),write(Pregunta),write('\n\n'),
                                                 write('\nEl personaje es : '),write(Personaje),write('\n\n'),
                                                 lista_caracteristicas(Personaje,R),
                                                 (member(Pregunta,R),  write('La respuesta a la pregunta es afirmativa.\n'),
                                                 lista_personajes_validos(Listainicial,Pregunta,Listafinal);
                                                 write('La respuesta a la pregunta es negativa.\n'),
                                                 lista_personajes_no_validos(Listainicial,Pregunta,Listafinal) ).


posibles_personajes(Listafinal):-
                                 /*Muestra por consola la lista de personajes aun validos*/
                                 write('\nYa sabes que soy uno de los personajes de la siguiente lista:\n\n'),
                                 posibles_personajes_aux(Listafinal),write('\n\n').

posibles_personajes_aux([X|Cola]):-
                                   /*Muestra por consola la lista de personajes aun validos y sus caracteristicas*/
                                   write(X),write('-->'),
                                   lista_caracteristicas(X, R), write(R),write('\n'),
                                   posibles_personajes_aux(Cola), !.
                                   posibles_personajes_aux(_).
                                   
pregunta_aleatoria(Pregunta,Preguntas_validas,Preguntas_final):-
                                                                /*Se obtiene una pregunta aleatoria para la maquina. Estas preguntas no se pueden repetir*/
                                                                length(Preguntas_validas,Numero),                    %Obtengo el numero de personajes posibles del juego
                                                                %Obtenemos un personaje aleatorio para el Jugador1
                                                                random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
                                                                nth1(X,Preguntas_validas,Pregunta),
                                                                select(Pregunta,Preguntas_validas,Preguntas_final)
                                                                .

pregunta_avanzada(Pregunta,ListaPersonajes):-
                                              /*La maquina usara una busqueda en la que buscara dividir la lista en dos constantemente, hasta dar con la solucion.
                                              Para ello, obtendra la mitad de la lista y contara que dato se aproxima a la mitad de la lista. Para solo ir obteniendo
                                              tras cada turno la mitad de esta*/
                                              length(ListaPersonajes,Numero),                    %Obtengo el numero de personajes posibles del juego
                                              %Obtenemos un personaje aleatorio para el Jugador1
                                              Mitad is Numero//2,                                %Obtengo el numero aleatorio para seleccionar un personaje
                                              (
                                                    cuantos_chicos(ListaPersonajes,Num_chicos),mas_o_menos_igual(Num_chicos,Mitad)  ,Pregunta = 'chico' ;
                                                    (
                                                        cuantos_pelo_rubio(ListaPersonajes,Num_Pelo_rubio),mas_o_menos_igual(Num_Pelo_rubio,Mitad),Pregunta = 'pelo_rubio' ;
                                                        (
                                                            cuantos_ropa_roja(ListaPersonajes,Num_ropa_roja),mas_o_menos_igual(Num_ropa_roja,Mitad),Pregunta = 'ropa_roja' ;
                                                                (
                                                                     cuantos_feliz(ListaPersonajes,Num_feliz),mas_o_menos_igual(Num_feliz,Mitad),Pregunta = 'feliz' ;
                                                                     (
                                                                            cuantos_ojos_azules(ListaPersonajes,Num_ojos_azules),mas_o_menos_igual(Num_ojos_azules,Mitad),Pregunta = 'ojos_azules';
                                                                            (
                                                                            cuantos_gafas(ListaPersonajes,Num_gafas),mas_o_menos_igual(Num_gafas,Mitad),Pregunta = 'gafas';
                                                                                 (
                                                                                 cuantos_lleva_gorra(ListaPersonajes,Num_gorras),mas_o_menos_igual(Num_gorras,Mitad),Pregunta = 'gorra';
                                                                                 cuantos_pelo_largo(ListaPersonajes,Num_largos),mas_o_menos_igual(Num_largos,Mitad),Pregunta = 'pelo_largo'
                                                                                 )
                                                                            )
                                                                     )
                                                                )
                                                        )
                                                    )
                                              )
                                              .
mas_o_menos_igual(N,X):-
                        /*Dado un valor X, se comprueba que el valor N tiene valor X-1 o X o X+1
                        Si X=1 el unico valor valido es N=X*/
                        X=1,N=X; X > 1,
                        (Inferior is X-1,N = Inferior;
                                    (N = X;
                                          Superior is X+1, N = Superior
                                    )
                        ), N > 0 .

                              

                              

