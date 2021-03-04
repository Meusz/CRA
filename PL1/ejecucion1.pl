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
