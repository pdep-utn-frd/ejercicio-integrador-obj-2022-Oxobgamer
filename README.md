# Mi Villano Objetoso 
 
[![Build Status](https://travis-ci.org/wollok/EjercicioIntegradorMiVillanoObjetoso.svg?branch=master)](https://travis-ci.org/wollok/EjercicioIntegradorMiVillanoObjetoso)


![](gru.jpg)

**En un vecindario encantador, rodeado por una cerca blanca y de rosales florecidos se destaca una casa negra con el césped muerto. Lo que desconocen los vecinos es que escondida bajo la vivienda hay una extensa guarida. Rodeado por un pequeño ejército de minions, vemos a Gru, el villano número uno, que ha decidido emprender el robo más grande de toda la historia. ¡Piensa robar la luna! Para Gru no hay nada que lo deleita más que hacer el mal; y, armado con un arsenal de rayos para encoger, rayos congelantes y vehículos para combatir en aire y tierra, él está preparado para derrotar a todos los que se interpongan en su camino.**

Se quiere modelar en objetos este mundo de fantasía en el que existen villanos que se dedican a hacer el mal. Los villanos, mediante un ejército de pequeñas criaturas amarillas, adorables y traviesas llamadas minions, realizan maldades en la ciudad donde viven. 

Los minions son originalmente amarillos, se alimentan de bananas y llevan armas de las que se conoce su nombre y potencia. Se consideran peligrosos cuando tienen más de 2 armas. Mediante la absorción del suero mutante se transforman en criaturas violetas, un tanto alocadas e impredecibles, por lo que pierden todas sus armas hasta el momento y se quedan con una banana menos. Los minions violetas luego pueden volver a tener armas y alimentarse con bananas como los amarillos, y se consideran siempre peligrosos. Cuando un minion violeta toma suero mutante, vuelve a ser la criatura amarilla de antes, perdiendo una banana, pero manteniendo las mismas armas que tuviese. 

El nivel de concentración de los minions se calcula como la potencia de su arma más potente más su cantidad de bananas, en el caso de los amarillos. En los violetas, equivale sencillamente a su cantidad de bananas, aunque tengan armas. 

### Equipando a los villanos 
Definir los siguientes métodos:

1. **nuevoMinion** Permite a un villano crear e incorporar nuevos minions, inicialmente amarillos, con 5 bananas y un rayo congelante de potencia 10.
2. **otorgarArma** Se le otorga al minion un arma en particular, que se agrega a las anteriores. 
3. **alimentar** Darle a un minion una cierta cantidad de bananas adicionales.
4. **nivelDeConcentracion** Devuelve el nivel de concentración de un minion.
5. **esPeligroso** Devuelve si un minion es peligroso.
Definir lo que sea necesario para hacer que un minion tome el suero mutante y suceda lo que tiene que suceder.

### Haciendo maldades
Los villanos, como es de imaginarse, realizan maldades entre las que se destacan los robos. Cuando un villano planifica una maldad, busca entre sus minions todos los que estén capacitados para hacerla y los asigna para participar de dicha maldad. De esta manera, un mismo minion puede participar de diferentes maldades o de ninguna. Las maldades, al realizarse, provocan cambios en la ciudad en la que vive el villano, excepto que la maldad no tuviese ningún minion asignado, caso en el debe generarse un error.

Se deben implementar las siguientes maldades:
1. **Congelar** Estas maldades se valen de todos los minions que tengan como arma un rayo congelante de cualquier potencia. Requiere un nivel de concentración establecido actualmente en 500, pero que podría modificarse. Al realizarla, disminuye la temperatura de la ciudad en 30 grados y premia a todos los minions que participaron de la maldad con 10 bananas.
2. **Robar** Para estas maldades sirven sólo los minions peligrosos con un nivel de concentración en particular según cuál sea el objetivo del robo. Al consumarse el robo, la ciudad deja de tener lo que fue robado.

Algunas cosas que se pueden robar son:
- **Pirámides** Al realizarse premia con 10 bananas a cada minion. Requiere un nivel de concentración de al menos la mitad de la altura de la pirámide.
- **Suero mutante** Requiere minions bien alimentados, que tengan al menos 100 bananas, y requiere un nivel de concentración mínimo de 23. Al realizarse, todos los minions consumen el suero mutante. 
- **La Luna** Requiere minions que tengan un rayo para encoger. Cualquier nivel de concentración es válido. Al realizarla, a todos los minions se les da un rayo congelante de potencia 10.

Nota: Al realizar una maldad, no hace falta volver a verificar que los minions asignados oportunamente hayan modificado sus características y eventualmente dejen de ser aptos para ella.

### Estadísticas
Al villano le interesa sacar estadísticas sobre las maldades, ya sea que estén realizadas o no.

1. Obtener el minion más útil de un villano, que es el que participó en más maldades.
2. Obtener los minions inútiles de un villano, que son los que no participaron en ninguna de sus maldades.

### ¡Nuevos requerimientos!
Para un nueva película de la saga se analizan cambios: 

1. ¿Qué pasaría si los minions pudieran ser de otro color, de manera que, por ejemplo, los minions violetas se transforman en verdes al tomar el suero mutante, y éstos en amarillos, y además siendo verdes hacen cosas diferentes? Indicar en el diagrama de clases cómo se modificaría la solución anterior para incorporar esta nueva situación, implementar los métodos necesarios (inventar el nuevo comportamiento) y justificar conceptualmente.
2. ¿Y si se estableciera que una vez que un minion amarillo pasa a violeta, es irreversible, y ya no puede volver a cambiar, por más suero mutante que tome?


