% REGLAS GRAMATICALES

% GRAMATICA
%Regla de una oracion  compleja
oracion_compuesta(ocm(OC)) --> oracion_coordinada(OC).
oracion_compuesta(ocm(OS)) --> oracion_subordinada(OS).
oracion_compuesta(ocm(O)) --> oracion(O).


oracion_compuesta(ocm(OC,C,O)) --> oracion_coordinada(OC), conjuncion(C), oracion(O).
oracion_compuesta(ocm(OC,C,OS)) --> oracion_coordinada(OC),conjuncion(C),oracion_subordinada(OS).
oracion_compuesta(ocm(OC1,C,OC2)) --> oracion_coordinada(OC1),conjuncion(C),oracion_coordinada(OC2).

oracion_compuesta(ocm(OS,C,O)) --> oracion_subordinada(OS),conjuncion(C),oracion(O).
oracion_compuesta(ocm(OS,C,OC)) --> oracion_subordinada(OS),conjuncion(C),oracion_coordinada(OC).
oracion_compuesta(ocm(OS1,C,OS2)) --> oracion_subordinada(OS1),conjuncion(C),oracion_subordinada(OS2).
oracion_compuesta(ocm(O1,C,O2)) --> oracion_compuesta(O1),conjuncion(C),oracion_compuesta(O2).



ocm --> oc,c,o.
ocm --> oc,c,os.
ocm --> oc,c,oc.

ocm --> os,c,o.
ocm --> os,c,oc.
ocm --> os,c,os.

ocm --> o.
ocm --> oc.
ocm --> os.
ocm --> ocm,c,ocm.

%Regla de una oracion  subordinada de relativo
oracion_subordinada(os(GN,C,O,GV)) --> g_nominal(GN),conjuncion(C),oracion(O), g_verbal(GV).

os --> gn, c, o, gv.

%Regla de una oracion  coordinada
oracion_coordinada(oc(O1,C,O2)) --> oracion(O1),conjuncion(C), oracion(O2).

oc --> o, conj,o.

%Regla de una oracion
oracion(o(GN,GV)) --> g_nominal(GN), g_verbal(GV).
oracion(o(GN)) --> g_nominal(GN).
oracion(o(GV)) --> g_verbal(GV).

o --> gn,gv.
o --> gn.
o --> gv.
%Grupo Nominal
g_nominal(gn(N)) --> nombre(N).
g_nominal(gn(D,N)) --> determinante(D), nombre(N).
g_nominal(gn(D,N,A)) --> determinante(D), nombre(N), g_adjetival(A).
g_nominal(gn(N,A)) --> nombre(N), g_adjetival(A).
g_nominal(gn(D,N,A)) --> determinante(D), nombre(N), g_preposicional(A).
g_nominal(gn(D,N,A)) --> determinante(D), nombre(N), g_preposicional(A).
g_nominal(gn(N)) --> nombre_propio(N).


%Reglas
gn --> nombre.
gn --> det, nombre.
gn --> det, nombre, gadj.
gn --> nombre, gadj.
gn --> det, nombre, gp.
gn --> nombre, gp.
gn --> np.

%Grupo Verbal
g_verbal(gv(V)) --> verbo(V).
g_verbal(gv(V,GN)) --> verbo(V), g_nominal(GN).
g_verbal(gv(V,GP)) --> verbo(V), g_preposicional(GP).
g_verbal(gv(V,GADJ)) --> verbo(V), g_adjetival(GADJ).
g_verbal(gv(V,GADV)) --> verbo(V), g_adverbial(GADV).


%Reglas
gv --> verbo.
gv --> verbo, gn.
gv --> verbo, gadj.

%Sintagma Preposicional
g_preposicional(gp(PREP,GN)) --> preposicion(PREP),g_nominal(GN).

gp --> prep, gn.

%Sintagma Adjetival
g_adjetival(gadj(ADJ)) --> adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ)) --> intensificador(INT), adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ,COMP_ADJ)) --> intensificador(INT), adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).
g_adjetival(gadj(ADJ,COMP_ADJ)) --> adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).

gadj --> adj.
gadj --> int, adj.
gadj --> int, adj,comp_adj.
gadj --> adj,comp_adj.

%Sintagma Adverbial
g_adverbial(gadv(ADV)) --> adverbio(ADV).
g_adverbial(gadv(INT,ADV)) --> intensificador(INT),adverbio(ADV).
g_adverbial(gadv(INT,ADV,GP)) --> intensificador(INT),adverbio(ADV), g_preposicional(GP).
g_adverbial(gadv(ADV,GP)) --> adverbio(ADV), g_preposicional(GP).

gadv --> adv.
gadv --> int,adv.
gadv --> int,adv,gp.
gadv --> adv, gp.

% LEXICO

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
n(manzana).
n(manzanas).
n(gato).
n(ratón).
n(ratones).
n(alumno).
n(universidad).
n(mesa).
n(derecho).
n(filosofía).
n(café).
n(novela).
n(paella).
n(periódico).
n(patatas).
n(cerveza).
n(zumo).
n(tardes).
n(rocódromo).
n(herramienta).
n(procesador).
n(documentos).
n(gato).
n(vecino).

%Nombres propios

nombre_propio(np(X)) --> [X],{np(X)}.


np(maría).
np(juan).
np(héctor).
np(irene).


%VERBOS
verbo(v(X)) --> [X],{v(X)}.

v(ama).
v(come).
v(estudia).
v(es).
v(toma).
v(recoge).
v(lee).
v(comen).
v(beben).
v(bebe).
v(prefiere).
v(canta).
v(salta).
v(escala).
v(sirve).
v(escribir).
v(cazó).
v(vimos).

%ADJETIVOS
adjetivo(adj(X))--> [X],{adj(X)}.

adj(roja).
adj(negro).
adj(grande).
adj(gris).
adj(pequeño).
adj(rápida).
adj(rápido).
adj(fácil).
adj(raro).
adj(harto).
adj(fritas).
adj(alta).
adj(lento).
adj(moreno).
%ADVERBIOS
adverbio(adv(X))--> [X],{adv(X)}.

adv(bien).
adv(mal).
adv(deprisa).
adv(asi).
adv(pequeño).
adv(rápida).
adv(rápido).
adv(fácil).
adv(solamente).
adv(potente).

%INTENSIFICADORES
intensificador(int(X))--> [X],{int(X)}.

%adverbios de cantidad
int(muy).
int(tan).
int(bastante).
int(extremadamente).
%adverbios exclamativos
int(cuán).
int(qué).
%locución adverbial cuantitativa
%int(un poco).

%COMPLEMENTOS DEL ADJETIVO
complemento_adjetivo(comp_adj(X))--> [X],{comp_adj(X)}.

comp_adj('de todo').
comp_adj('de esperanza').
comp_adj('de sí mismo').

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

%PREPOSICIONES
conjuncion(conj(X)) --> [X],{conj(X)}.
conj(y).
conj(e).
conj(ni).
conj(pero).
conj(que).
conj(mientras).
conj(aunque).
conj(mientras).
/*
EJEMPLOS
oracion([el,hombre,come,una,manzana],[]).
oracion([la,mujer,come,manzanas],[]).
oracion([maría,come,una,manzana,roja],[]).
oracion([juan,ama,a,maría],[]).
*/
