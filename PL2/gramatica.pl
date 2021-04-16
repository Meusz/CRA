% Reglas gramaticales
%Regla de una oracion
oracion(o(GN,GV)) --> g_nominal(GN), g_verbal(GV).

o --> gn, gv.
%Grupo Nominal
g_nominal(gn(N)) --> nombre(N).
g_nominal(gn(D,N)) --> determinante(D), nombre(N).
g_nominal(gn(D,N,A)) --> determinante(D), nombre(N), adjetivo(A).

%Reglas
gn --> nombre.
gn --> det, nombre.
gn --> det, nombre, adjetivo.
gn --> nombre, adjetivo.

%Grupo Verbal
g_verbal(gv(V)) --> verbo(V).
g_verbal(gv(V,GN)) --> verbo(V), g_nominal(GN).
g_verbal(gv(V,GN)) --> verbo(V), g_preposicional(GN).
g_verbal(gv(V,GN)) --> verbo(V), g_adjetival(GN).


%Reglas
gv --> verbo.
gv --> verbo, gn.
gv --> verbo, gadj.

%Sintagma Preposicional
g_preposicional(gprep(PREP,GN)) --> preposicion(PREP),g_nominal(GN).

gprep --> prep, gn.

%Sintagma Adjetival           complemento_adjetivo
g_adjetival(gadj(ADJ)) --> adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ)) --> intensificador(INT), adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ,COMP_ADJ)) --> intensificador(INT), adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).
g_adjetival(gadj(ADJ,COMP_ADJ)) --> adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).

gadj --> adj.
gadj --> int, adj.
gadj --> int, adj,comp_adj.
gadj --> adj,comp_adj.
%Diccionario

%DETERMINANTES
determinante(det(X)) --> [X],{det(X)}.

det(el).
det(la).
det(lo).
det(los).
det(las).
det(un).
det(uno).
det(una).
det(unos).
det(unas).


%NOMBRES
nombre(n(X)) --> [X],{n(X)}.

n(hombre).
n(mujer).
n(juan).
n(mar�a).
n(manzana).
n(manzanas).
n(gato).
n(rat�n).
n(ratones).
n(alumno).
n(universidad).
n --> nombre_propio.
nombre_propio(mar�a).
nombre_propio(juan).


%VERBOS
verbo(v(X)) --> [X],{v(X)}.

v(ama).
v(come).
v(estudia).
v(es).

%ADJETIVOS
adjetivo(adj(X))--> [X],{adj(X)}.

adj(roja).
adj(negro).
adj(grande).
adj(gris).
adj(peque�o).
adj(r�pida).
adj(r�pido).
adj(f�cil).
adj(raro).
adj(harto).

%INTENSIFICADORES
intensificador(int(X))--> [X],{int(X)}.

%adverbios de cantidad
int(muy).
int(tan).
int(bastante).
int(extremadamente).
%adverbios exclamativos
int(cu�n).
int(qu�).
%locuci�n adverbial cuantitativa
%int(un poco).

%COMPLEMENTOS DEL ADJETIVO
complemento_adjetivo(comp_adj(X))--> [X],{comp_adj(X)}.

comp_adj('de todo').
comp_adj('de esperanza').
comp_adj('de s� mismo').

%PREPOSICIONES
preposicion(prep(X)) --> [X],{prep(X)}.

prep(a).
prep(ante).
prep(bajo).
prep(cabe).
prep(con).
prep(contra).
prep(de).
prep(desde).
prep(en).
prep(entre).
prep(hasta).
prep(hacia).
prep(para).
prep(por).
prep(seg�n).
prep(sin).
prep(so).
prep(sobre).
prep(tras).

/*
EJEMPLOS
oracion([el,hombre,come,una,manzana],[]).
oracion([la,mujer,come,manzanas],[]).
oracion([mar�a,come,una,manzana,roja],[]).
oracion([juan,ama,a,mar�a],[]).
*/
