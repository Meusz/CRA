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
pregunta_valida(Y):- preguntas(X),member(Y,X).
personaje_valido(Y):- personaje(X),member(Y,X).


lista_caracteristicas(X, R):- S = [],append_chico(X,S,A),append_gafas(X,A,B),append_pelo(X,B,C),append_ropa(X,C,D),append_estado(X,D,E),append_ojos(X,E,R).

append_chico(X,S,R):-  es_chico(X),append(S,['chico'],R); es_chica(X),append(S,['chica'],R).
append_gafas(X,S,R):-  lleva_gafas(X),append(S,['lleva_gafas'],R); no_lleva_gafas(X),append(S,['no_lleva_gafas'],R).
append_pelo(X,S,R):-   tiene_pelo_rubio(X),append(S,['tiene_pelo_rubio'],R);tiene_pelo_negro(X),append(S,['tiene_pelo_negro'],R).
append_ropa(X,S,R):-   tiene_ropa_roja(X),append(S,['tiene_ropa_roja'],R);tiene_ropa_verde(X),append(S,['tiene_ropa_verde'],R).
append_estado(X,S,R):- esta_feliz(X),append(S,['esta_feliz'],R);esta_triste(X),append(S,['esta_triste'],R).
append_ojos(X,S,R):-   tiene_ojos_azules(X),append(S,['tiene_ojos_azules'],R);tiene_ojos_marrones(X),append(S,['tiene_ojos_marrones'],R).
                              
                              

