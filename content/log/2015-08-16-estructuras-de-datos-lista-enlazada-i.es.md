+++
title =      "Estructuras de datos - Parte II: Lista Enlazada Simple(I)"
subtitle =   "Implementación sencilla de una lista enlazada simple en C++."
description = "Las estructuras de datos son herramientas de código ampliamente utilizadas. En esta entrada se implementa una de las más sencillas, la lista enlazada, en el lenguaje C++."
date =       2015-08-16 
slug = "estructuras-de-datos-lista-enlazada-i"
aliases = [
	"2015/08/estructuras-de-datos-lista-enlazada-i",
	"/es/blog/estructuras-de-datos-lista-enlazada-i"
]
+++

Para continuar con las estructuras de datos, te presentaré de manera más formal la que mencioné anteriormente, y es, la lista enlazada.
<!-- more -->

Si estás aquí, en la segunda parte de la serie de Estructuras de Datos, asumiré que ya leíste la [entrada anterior](/2015/06/estructuras-de-datos-nodos/) y tienes conocimiento de los nodos; ya que serán necesarios para la creación de las listas.

## Listas Enlazadas
Suponiendo que ya tengas conocimientos previos de programación y sabes lo básico, debes haber por lo menos escuchado la palabra arreglo o vector. Sí, esa estructura en la que puedes almacenar diversa información organizándola con un índice. Resulta que lo que tenemos en un arreglo, es una lista; pero esta tiene una cantidad fija de campos.

Ahora imagina un arreglo que va añadiendo nuevos elementos a medida que los vamos requiriendo, sin necesidad de haber definido una cantidad exacta a utilizar. Y que a medida que sea crean nuevos elementos(ahora llamados nodos), se van ligando a través de punteros al siguiente y así sucesivamente. Quedamos ahora con una estructura dinámica denominada **lista enlazada**.
> De manera más formal, la lista enlazada es una estructura para almacenar información de manera lineal, asignando memoria de forma dinámica.

En el caso de esta entrada te mostraré una lista enlazada *simple*, es decir, que sus nodos sólo tendrán un campo de referencia al *nodo siguiente* y un campo para el *dato*(la cantidad puede variar según se necesite) y la lista tendrá una *cabecera*(nodo) que dará inicio a las referencias; terminando cuando el último elemento de la lista apunte a NULL(refiriéndos a que ya no existen más nodos).

### Creando la lista enlazada
Lo primero que vamos a hacer será crear una clase nueva llamada *ListaEnlazada*, suponiendo que ya hemos declarado la clase *Nodo* en nuestro código.

Lo principal que debe tener nuestra clase es el miembro privado *cabecera* que es un puntero a un objeto tipo Nodo. Prácticamente todas las operaciones que se realizarán posteriormente con la lista utilizarán este miembro para representar un extremo de la misma.

El código de la clase quedaría algo como:

```cpp
template<class T>
class ListaEnlazada{
private:
	Nodo<T>* cabecera;
public:
	ListaEnlazada(){
		cabecera = NULL;
	}
};
```

Por ahora, sólo hemos creado la cabecera y el método constructor que dará el valor nulo a cabecera cuando sea una lista nueva, ya que la misma no poseerá ningún nodo hasta que comencemos a poblarla.

### Poblando la lista
Para esto crearemos un método en la clase *ListaEnlazada* al cual llamaremos *anadirInicio*, que no devuelva ningún valor y que reciba un parámetro que será el dato a almacenar.

Dejaré el código para este método y lo explicaré debajo; ya que es aquí donde comienza a verse el dinamismo de este tipo de estructura.

```cpp
void anadirInicio(T dato){
		Nodo<T>* aux;
		aux = new Nodo<T>();
		aux->dato = dato;
		aux->siguiente = this->cabecera;
		cabecera = aux;
	}
```

Como pueden ver, el único parámetro que posee el método es para el dato que deseamos almacenar.

Dentro del cuerpo, comenzamos creando un nuevo Nodo al cual llamamos *aux*(por auxiliar) y luego le asignaremos un espacio en memoria como aparece en la tercera línea.

Este Nodo auxiliar almacenará de manera momentánea el dato que deseamos añadir; operación que se realiza al asignar el valor dato(del parámetro) al miembro dato de nuestro Nodo auxiliar.

El siguiente paso de este proceso es el más importante, ya que si no se realiza se perderá la referencia a la cabecera actual y por tanto, no habrá continuidad entre los nodos.  

```cpp
aux->siguiente = this->cabecera;
cabecera = aux;
```

Lo que hace la primera línea es **referenciar** al nodo cabecera actual de la lista. Al hacer esto, tenemos ligado el nodo auxiliar al cabecera diciendo que *cabecera* se encuentra siguiente a *aux*.

Como último, nuestra nueva cabecera será ahora el nodo auxiliar que a su vez hace referencia al nodo que antiguamente era la cabecera; por tanto, no se pierde su información.

*Si existen dudas sobre los nodos, recomiendo visitar la [entrada anterior](/2015/06/estructuras-de-datos-nodos/) sobre estructuras de datos.*

En nuestra función main escribiremos lo siguiente como prueba:  

```cpp
	ListaEnlazada<int> lista;

	lista.anadirInicio(5);
	lista.anadirInicio(4);
```

Así creamos una nueva lista enlazada que almacenará datos del tipo **int** y añadiremos los datos **5** y **4** en distintos nodos de la lista. Pero, ¿cómo nos damos cuenta de que hemos añadido estos nodos? Para eso vamos a ver el siguiente método.

### Imprimiendo la lista enlazada
Para imprimir los elementos de la lista sólo utilizaremos un ciclo while que evaluará si el miembro *siguiente* del nodo en el que nos encontramos es diferente de NULL. De ser nulo, significa que ya no hace referencia a ningún otro nodo, en otras palabras, es el final.

El método que añadiremos a la clase *ListaEnlazada* será llamado *imprimirInicio*, como aparece a continuación:  

```cpp
void imprimirInicio(){
		Nodo<T>* aux;
		aux = cabecera;
		while(aux != NULL){
			std::cout << "El dato en: " << aux << " es: " << aux->dato << std::endl;
			aux = aux->siguiente;
		};
	}
```

Para este método también utilizaremos un nodo auxiliar que representará el nodo en el que nos posicionamos actualmente. Comenzaremos a recorrer la lista desde la cabecera, por eso la línea:  

```cpp
aux = cabecera;
```

A partir de ahí comienza el ciclo que imprime la información del nodo actual y al final cambia el nodo auxiliar para que tome el valor del nodo siguiente al que nos encontrábamos.

Agregamos a la función main:  

```
lista.imprimirInicio();
```

Con un ejemplo como este y con los números 5 y 4(introducidos en este orden); al ejecutar recibiríamos:
![Salida del Programa](/img/2015/08/salida.png)

Una forma común como se puede representar la lista enlazada es  la siguiente:
![Diagrama de representación de lista enlazada](/img/2015/08/lista-enlazada-simple.png)

Si deseas ver el código completo, visita el [repositorio de Estructuras de Datos en GitHub](https://github.com/AlbertoCG/EstructurasDeDatos).

Más adelante estaré actualizando con otros métodos como la eliminación de nodos y explicaré el porqué de la palabra *Inicio* en los métodos creados en esta entrada.
