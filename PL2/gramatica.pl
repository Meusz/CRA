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
oracion_compuesta(ocm(OC,C,O2)) --> oracion_coordinada(OC),conjuncion(C),oracion_compuesta(O2).
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
g_nominal(gn(D,N,CN)) --> determinante(D), nombre(N), c_nexo(CN).
g_nominal(gn(N,CN)) --> nombre(N), c_nexo(CN).
g_nominal(gn(N)) --> nombre_propio(N).


%Reglas

gn --> det, nombre.
gn --> det, nombre, gadj.
gn --> nombre, gadj.
gn --> det, nombre, cn.
gn --> nombre, cn.
gn --> nombre.
gn --> np.

%Grupo Verbal

g_verbal(gv(V,ATR)) --> verbo_ser(V), atributo(ATR).
g_verbal(gv(V,CD)) --> verbo(V), c_directo(CD).
g_verbal(gv(V,CI)) --> verbo(V), c_indirecto(CI).
g_verbal(gv(V,CD,CI)) --> verbo(V), c_indirecto(CD),c_directo(CI) .
g_verbal(gv(V,CI,CD)) --> verbo(V), c_indirecto(CI),c_directo(CD) .
g_verbal(gv(V,GADJ)) --> verbo(V), g_adjetival(GADJ).
g_verbal(gv(V,CC)) --> verbo(V), c_circunstancial(CC).
g_verbal(gv(V,CC1,CC2)) --> verbo(V), c_circunstancial(CC1), c_circunstancial(CC2).
g_verbal(gv(V,CC,GN)) --> verbo(V), c_circunstancial(CC), c_directo(GN).
g_verbal(gv(V)) --> verbo(V).


%Reglas

gv --> verbo, atr.
gv --> verbo, cd.
gv --> verbo, ci.
gv --> verbo, cd,ci.
gv --> verbo, ci,cd.
gv --> verbo, gadj.
gv --> verbo, cc.
gv --> verbo, cc,cc.
gv --> verbo, vv, cn.
gv --> verbo.

%Sintagma Preposicional
g_preposicional(gp(PREP,GN)) --> preposicion(PREP),g_nominal(GN).

gp --> prep, gn.

%Sintagma Adjetival
g_adjetival(gadj(ADJ)) --> adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ)) --> intensificador(INT), adjetivo(ADJ).
g_adjetival(gadj(INT,ADJ,COMP_ADJ)) --> intensificador(INT), adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).
g_adjetival(gadj(ADJ,COMP_ADJ)) --> adjetivo(ADJ), complemento_adjetivo(COMP_ADJ).


gadj --> int, adj.
gadj --> int, adj,comp_adj.
gadj --> adj,comp_adj.
gadj --> adj.

%Sintagma Adverbial
g_adverbial(gadv(ADV)) --> adverbio(ADV).
g_adverbial(gadv(INT,ADV)) --> intensificador(INT),adverbio(ADV).
g_adverbial(gadv(INT,ADV,GP)) --> intensificador(INT),adverbio(ADV), g_preposicional(GP).
g_adverbial(gadv(ADV,GP)) --> adverbio(ADV), g_preposicional(GP).

gadv --> adv.
gadv --> int,adv.
gadv --> int,adv,gp.
gadv --> adv, gp.


/*funciones a cada uno de los grupos gramaticales indicando si
funcionan como Complemento Directo, C. Indirecto, Atributo, C. Circunstancial, etc.*/

%COMPLEMENTO DIRECTO
c_directo(cd(CD)) --> g_nominal(CD).

cd --> gn.

%COMPLEMENTO INDIRECTO

c_indirecto(ci(CI)) --> g_preposicional(CI).
c_indirecto(ci(CI)) --> pronombre_personal(CI).

ci --> gprep.
ci --> pp.

%ATRIBUTO
atributo(atr(ATR)) --> g_nominal(ATR).
atributo(atr(ATR)) --> g_preposicional(ATR).
atributo(atr(ATR)) --> g_adverbial(ATR).
atributo(atr(ATR)) --> g_adjetival(ATR).

atr --> gn.
atr --> gp.
atr --> gadv.
atr --> gadj.

%C. Circunstancial
c_circunstancial(cc(CC)) --> cuantificador(CC).
c_circunstancial(cc(CC)) --> g_adverbial(CC).
c_circunstancial(cc(CC)) --> lugar(CC).
c_circunstancial(cc(DET,CC)) --> determinante(DET),lugar(CC).
c_circunstancial(cc(PREP,CC)) --> preposicion(PREP),lugar(CC).
c_circunstancial(cc(PREP,DET,CC)) --> preposicion(PREP),determinante(DET),lugar(CC).
c_circunstancial(cc(CC)) --> tiempo(CC).
c_circunstancial(cc(DET,CC)) --> determinante(DET),tiempo(CC).
c_circunstancial(cc(P,CC)) --> preposicion(P),tiempo(CC).
c_circunstancial(cc(P,DET,CC)) --> preposicion(P),determinante(DET),tiempo(CC).

cc --> cuan.
cc --> g_adv.
cc --> l.
cc --> det,l.
cc --> prep,l.
cc --> prep,det,l.
cc --> tiem.
cc --> det,tiem.
cc --> prep,tiem.
cc --> prep,det,tiem.

%Complemento del nexo
c_nexo(cn(CN)) --> g_preposicional(CN).

cn --> gp.

% LEXICO

%DETERMINANTES
determinante(det(X)) --> [X],{det(X)}.

det(el).
det(la).
det(las).
det(lo).
det(los).
det(las).
det(un).
det(uno).
det(una).
det(unos).
det(unas).
det(esta).
det(mi).

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
n(herramienta).
n(procesador).
n(textos).
n(documentos).
n(gato).
n(vecino).
n(escribir).

%Nombres propios

nombre_propio(np(X)) --> [X],{np(X)}.


np(maría).
np(juan).
np(héctor).
np(irene).

%lugares
lugar(l(X)) --> [X],{l(X)}.

l(rocódromo).
l(patio).
l(salón).
l(nave).
l(campo).

%Tiempos
tiempo(l(X)) --> [X],{tiem(X)}.

tiem(tardes).
tiem(ayer).



%VERBOS
verbo(v(X)) --> [X],{v(X)}.

v(ama).
v(come).
v(estudia).
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
v(cazó).
v(vimos).

verbo_ser(vs(X)) --> [X],{vs(X)}.

vs(es).
vs(era).
vs(son).
vs(está).
vs(están).

%ADJETIVOS
adjetivo(adj(X))--> [X],{adj(X)}.

adj(roja).
adj(rojas).
adj(negro).
adj(grande).
adj(gris).
adj(pequeño).
adj(rápida).
adj(rápido).
adj(ágil).
adj(fácil).
adj(raro).
adj(harto).
adj(fritas).
adj(alta).
adj(lento).
adj(moreno).
adj(potente).
adj(delicado).
%ADVERBIOS
adverbio(adv(X))--> [X],{adv(X)}.

adv(tarde).
adv(mucho).
adv(deprisa).
adv(mal).
adv(pequeño).
adv(ayer).
adv(solamente).


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

%PRONOMBRE PERSONAL
pronombre_personal(pp(X)) --> [X],{pp(X)}.
pp(me).
pp(te).
pp(se).
pp(nos).
pp(os).
pp(le).
pp(les).

%CUANTIFICADORES
cuantificador(cuan(X)) --> [X],{cuan(X)}.
cuan(muchos).
cuan(mucho).
cuan(demasiado).
cuan(bastantes).
cuan(muy).
cuan(más).

/*
EJEMPLOS
oracion([el,hombre,come,una,manzana],[]).
oracion([la,mujer,come,manzanas],[]).
oracion([maría,come,una,manzana,roja],[]).
oracion([juan,ama,a,maría],[]).
*/
