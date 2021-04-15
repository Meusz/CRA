% Reglas gramaticales
%Regla de una oracion
oracion(o(GN,GV)) --> g_nominal(GN), g_verbal(GV).

o --> gn, gv.
%Sintagma Nominal
g_nominal(gn(N)) --> nombre(N).
g_nominal(gn(D,N)) --> determinante(D), nombre(N).

gn --> nombre.
gn --> det, nombre.
gn --> det, nombre, adjetivo.
gn --> nombre, adjetivo.
%Sintagma Preposicional
gv --> verbo.
gv --> verbo, gn.
gv --> verbo, adjetivo.

%Sintagma Preposicional
g_preposicional(gprep(PREP,GN)) --> preposicion(PREP),g_nominal(GN).

gprep --> prep, gn.

%Sintagma Adjetival
gadj --> _.
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
n(alumno).
n(universidad).
n --> nombre_propio.
nombre_propio(mar�a).
nombre_propio(juan).


%VERBOS
verbo(n(X)) --> [X],{v(X)}.

v(ama).
v(come).
v(estudia).

%ADJETIVOS


adj(roja).
adj(negro).
adj(grande).
adj(gris).
adj(peque�o).

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