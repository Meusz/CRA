:-consult(ejecucion1),



/*-----------------------------------------------------------------
--------------------Variables-------------------------------------
--------------------------------------------------------------------*/

%---------------Programa main---------------
write('\tBIENVENIDO A QUIEN ES QUIEN\t\n\n'),write('En este juego tenemos varios niveles: medio, avanzado \n Escoja uno seguido de un punto\n\t'),
read(D),write('\n\nEscogiste el nivel de dificultad '),write(D),write('\n\n'),
personaje(P),length(P,Numero),write('La longitud de la lista es \t'),write(Numero),                     %Obtengo el numero de personajes posibles del juego

%Obtenemos un personaje aleatorio para el Jugador1
random(0,Numero,X),                                %Obtengo el numero aleatorio para seleccionar un personaje
nth1(X,P,Personaje1),

%Obtenemos otro personaje aleatorio para el Jugador2

random(0,Numero,Y),
nth1(Y,P,Personaje2),

write('\n').


:-nb_getval(Personaje1, P1),nb_getval(Personaje2, P2),

write(P1).




:-write('\n\nFIN.').
