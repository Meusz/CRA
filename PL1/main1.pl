:-consult(ejecucion1),



/*-----------------------------------------------------------------
--------------------Variables-------------------------------------
--------------------------------------------------------------------*/

%---------------Programa main---------------
write('\tBIENVENIDO A QUIEN ES QUIEN\t\n\n'),write('En este juego tenemos varios niveles: medio, avanzado \n Escoja uno seguido de un punto\n\t'),
read(D),write('\n\nEscogiste el nivel de dificultad '),write(D),write('\n\n'),
personaje(P),length(P,Numero),                    %Obtengo el numero de personajes posibles del juego

%Obtenemos un personaje aleatorio para el Jugador1
random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
nth1(X,P,Personaje1),

%Obtenemos otro personaje aleatorio para el Jugador2

random(0,Numero,Y),
nth1(Y,P,Personaje2),

write('\n'),

write('Te recuerdo sus características:\n'),
lista_caracteristicas(Personaje1,S), write(S),

write('Elige de entre las siguientes preguntas una que quieras hacerme y escríbela\ncambiando la interrogación por un punto: chico?, chica?, gafas?,\npelo_rubio?, pelo_negro?, feliz?, triste?, ropa_roja?, ropa_verde?\n'),


.





:-write('\n\nFIN.').
