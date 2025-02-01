+++
aliases = ['2015/06/estructuras-de-datos-nodos', '/es/blog/estructuras-de-datos-nodos']
date = 2015-06-19
description = 'Las estructuras de datos son herramientas de código ampliamente utilizadas. En esta entrada se implementa su unidad básica, el nodo, en el lenguaje C++.'
slug = 'estructuras-de-datos-nodos'
subtitle = 'Se describe la unidad básica de las estructuras de datos y se implementa en C++.'
title = 'Estructuras de datos - Parte I: Los Nodos'
+++

El día de hoy quiero compartir con ustedes un tema muy importante dentro de la programación y son, las estructuras de datos.

> ¿En qué consisten las estructuras de datos?

La verdad, puede definirse tan simple como "una manera de almacenar u organizar datos para su posterior uso".

Para iniciar, voy a comentarles sobre una estructura dinámica en particular, la lista enlazada, que es algo bastante parecido a los conocidos arreglos (arreglo[índice]); con la diferencia de que por ser dinámica y no estática, la cantidad máxima de valores o campos (que de ahora en adelante llamaremos nodos) que puede almacenar es variable.

<!-- more -->

## Los nodos

Antes de enseñarles lo que son las listas enlazadas, les comparto lo que son los **nodos**, ya que estos son los que conforman dichas listas y demás estructuras que veremos más adelante.

Un nodo es una estructura sencilla que almacena información y además hace referencia a algún otro nodo. De manera ejemplificada es como una carta o un correo electrónico que además del documento en sí, posee la dirección del remitente y la del receptor.

Para hacer este tipo de referencias en C++, utilizamos punteros(el dolor de cabeza de muchos); aunque es más sencillo de como se oye. Por eso, muy frecuentemente van a encontrar los nodos representados de la siguiente manera.

[![Nodo](/img/2015/06/nodo-300x88.png)](/img/2015/06/nodo.png)

*La idea es que el puntero(*) haga referencia a otro objeto del tipo Nodo y el campo de Dato almacene información*

En una declaración sencilla de la clase Nodo veríamos algo como esto:

```cpp
template<class T>
class Nodo {
private:
 Nodo<T>* siguiente;
 T dato;
public:
 Nodo(){
 siguiente = NULL;
}
friend class ListaEnlazada<T>;
};
```

Hasta aquí la descripción básica de lo que es un nodo. Les dejo un enlace al repositorio donde estaré trabajando las estructuras de datos y así ustedes podrán descargar y manipular libremente este código.

Link al Repositorio en GitHub: [Estructuras de Datos GitHub](https://github.com/AlbertoCG/EstructurasDeDatos)
