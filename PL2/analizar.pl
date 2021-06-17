/* ANALIZADOR DE ORACIONES*/

analizar(X,Y,Z) :-
                nl,write('*------------------------------------------------------------------------------------------------*'),
                parse(X,Y,Z),write(X),nl,
                /*DATOS DE ORACIONES*/
                write('***********DATOS DE ORACIONES******************'),nl,nl,
                num_verbos(X,Num_verbos),
                write('Numero de verbos: '),write(Num_verbos),nl,
                num_conjunciones(X, Num_conjunciones),
                write('Numero de conjunciones : '),write(Num_conjunciones),nl,
                write('*************************************************'),nl,
                draw(X),
                
                /*Obtengo suboraciones*/
                write('***********************SUB-ORACIONES**********************'),nl,
                obtener_gn_gv(X,W), formar_frases(W,S),escribir_frases(S),
                nl,write('*------------------------------------------------------------------------------------------------*'),nl.



/*Mediante Parse, obtendremos el tipo de oracion que es y ademas, las reglas que la forman por dentro*/


parse(X,Y,Z) :-  oracion(X,Y,Z).

parse(X,Y,Z) :-  oracion_coordinada(X,Y,Z).

parse(X,Y,Z) :-  oracion_subordinada(X,Y,Z).

parse(X,Y,Z) :-  oracion_compuesta(X,Y,Z).

