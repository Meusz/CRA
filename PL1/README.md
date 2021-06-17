# PECL1 de Conocimiento y Razonamiento Automatizado 
### Mateusz Roman Kolakowski 23 de marzo de 2021

# ¿Quién es quién?

## Introducción
¿Quién es quién? es un juego de mesa consistente en dos tableros idénticos en los que aparece
un cierto número de personajes identificados por su nombre, cada uno con sus características
físicas particulares. Cada jugador recibe un personaje distinto y el contrario tiene que adivinarlo
mediante sencillas preguntas del tipo: ¿tiene los ojos azules?\n
Las preguntas se hacen por turnos y gana el que primero adivine el personaje del contrario.


## Personajes

Consideraremos los siguientes personajes con sus correspondientes características:

• Albert: chico, pelo negro, ropa roja, feliz, tiene gafas, ojos azules.
• Paul: chico, pelo rubio, ropa roja, triste, ojos marrones.
• Tom: chico, pelo negro, ropa verde, feliz, ojos marrones.
• Derek: chico, pelo negro, ropa verde, triste, ojos marrones.
• Richard: chico, pelo negro, ropa roja, feliz, ojos azules.
• Louis: chico, pelo negro, ropa roja, triste, ojos azules.
• Michael: chico, pelo rubio, ropa verde, feliz, tiene gafas, ojos marrones.
• Charles: chico, pelo negro, ropa verde, feliz, tiene gafas, ojos marrones.
• Sam: chico, pelo rubio, ropa roja, triste, ojos azules.
• Steve: chico, pelo negro, ropa roja, feliz, ojos marrones.
• Will: chico, pelo rubio, ropa verde, feliz, ojos azules.
• Anthony: chico, pelo rubio, ropa roja, feliz, tiene gafas, ojos marrones.
• Billy: chico, pelo rubio, ropa verde, triste, ojos azules.
• Henry: chico, pelo negro, ropa roja, triste, ojos marrones.
• Tiffany: chica, pelo negro, ropa verde, feliz, ojos marrones.
• Natalie: chica, pelo rubio, ropa roja, feliz, tiene gafas, ojos azules.
• Roxanne: chica, pelo rubio, ropa verde, feliz, ojos azules.
• Sarah: chica, pelo negro, ropa roja, triste, ojos marrones.
• Sabrina: chica, pelo negro, ropa verde, feliz, tiene gafas, ojos azules.
• Cindy: chica, pelo negro, ropa roja, feliz, ojos marrones.
• Emma: chica, pelo rubio, ropa verde, feliz, ojos marrones.


## Objetivos 
Implementar el ¿Quién es quién? teniendo en cuenta lo que sigue:

1. La solución propuesta debe basarse en el uso de listas para construir la Base de
Conocimiento del programa. Éstas tienen que relacionar de algún modo cada uno de los
personajes con su conjunto de características propias.
2. Para construir la Base de Conocimiento se pide aumentar en 3 el conjunto de
características de los personajes quedando su tipo a elección del grupo de alumnos.
3. Hay que definir un predicado de aridad cero (jugar) que incorpore la preparación del
juego y que, además, llame al predicado encargado de gestionar el desarrollo del juego.
4. Se contempla la posibilidad de que compita jugador contra ordenador y jugador contra
jugador.
5. Las preguntas que se pueden hacer serán las siguientes: ¿chico?, ¿chica?, ¿gafas?,
¿pelo rubio?, ¿pelo negro?, ¿ojos azules?, ¿ojos marrones?, ¿feliz?, ¿triste?, ¿ropa
roja? y ¿ropa verde? a las que habrá que añadir las referentes a las características
añadidas por cada grupo de alumnos.
6. Para mejorar la jugabilidad, el programa deberá mostrar por pantalla el subconjunto de
candidatos seleccionado en cada turno de juego.
7. En el caso de la opción de jugador contra ordenador, hay que implementar al menos
dos estrategias:
	a. La computadora almacena la lista de preguntas a hacer (evitando duplicidades) y escoge una al azar de entre las no realizadas hasta el momento.
	b. La computadora aplica un algoritmo que le permite ganar la partida con el mínimo número de preguntas posible.
8. Estas estrategias se implementarán en ficheros separados (a consultar según proceda).

Se valorará positivamente cualquier mejora del juego sobre lo expuesto anteriormente. Algunas ideas son las siguientes:

• Mejorar la interfaz de usuario con algún elemento de tipo ’ASCII art’.
• Aumentar el número de personajes dado.
• Cambiar el conjunto de personajes proporcionado por un conjunto de famosos,
deportistas, pokémons, etc. manteniendo el número de personajes y de características.
• Cualquier otra que cuente con el visto bueno del profesor.



