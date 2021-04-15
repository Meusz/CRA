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
gv --> verbo, adjetivo.

%Sintagma Preposicional
g_preposicional(gprep(PREP,GN)) --> preposicion(PREP),g_nominal(GN).

gprep --> prep, gn.

%Sintagma Adjetival
g_adjetival --> (gadj(ADJ)) --> adjetivo(ADJ).
g_adjetival --> (gadj(ADJ,GN)) --> adjetivo(ADJ), g_nominal (GN).

gadj --> adj.
gadj --> adj, gn.
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
n(maría).
n(manzana).
n(manzanas).
n(gato).
n(ratón).
n(ratones).
n(alumno).
n(universidad).
n --> nombre_propio.
nombre_propio(maría).
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
adj(pequeño).

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
prep(según).
prep(sin).
prep(so).
prep(sobre).
prep(tras).

/*
EJEMPLOS
oracion([el,hombre,come,una,manzana],[]).
oracion([la,mujer,come,manzanas],[]).
oracion([maría,come,una,manzana,roja],[]).
oracion([juan,ama,a,maría],[]).
*/
