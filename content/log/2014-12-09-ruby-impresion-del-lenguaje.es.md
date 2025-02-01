+++
aliases = ['2014/12/ruby-impresion-del-lenguaje', '/es/blog/ruby-impresion-del-lenguaje']
date = 2014-12-09
description = '¿Conoces el lenguaje de programación Ruby? A continuación se enumeran 5 características a simple vista que lo han posicionado muy bien.'
slug = 'ruby-impresion-del-lenguaje'
subtitle = 'Reseña del lenguaje que poco a poco se hace lugar en internet.'
title = '¿Ruby? Primera impresión del lenguaje'
+++
Después de haber visto una gran cantidad de limitaciones en PHP y sentir incomodidad al migrar entre bases de datos de Access, SQLite y MySQL; decidí­ probar otro lenguaje para 'backend', por lo que comencé a estudiar Ruby.

No sería la primera vez que escucho del lenguaje Ruby, ya lo conocía por ser lenguaje de scripting para algunos motores de juego como RPG Maker, pero no conocía su potencial como herramienta para el desarrollo web.

Al iniciar con este lenguaje pude notar varias caracterí­sticas que llamaron mi atención y que voy a enlistar como las funcionalidades que más me han gustado.
<!-- more -->


## Sistema gem para la gestión de paquetes

Desde un entorno de desarrollo basado en la Terminal (como es mi caso en Ubuntu 14.04), el gestor 'gem' provee un gran potencial para la instalación de módulos, librerías o 'frameworks' para trabajar con Ruby. Los procesos de instalación se ven reducidos, o más bien automatizados, a simples lí­neas de código como:  

```bash
gem install
```


## Fácil declaración de variables de tipo automático

Ya estaba relacionado con las variables en las que no tení­a que definir el tipo, como sucede en JavaScript. En Ruby, estas declaraciones persisten; con la diferencia de que ya no es necesaria la utilización de la palabra reservada 'var'. Para utilizar una variable en este lenguaje, sólo es necesario definirla:

```ruby
nombre = "Alberto Castillo"
```

De esta manera, se identifica automáticamente el tipo; que podrí­a ser numérico, booleano o una cadena de texto.


## Lenguaje de muy alto nivel

Las similitudes que posee Ruby con el inglés ordinario lo hacen convertirse en un lenguaje bastante fácil de aprender, que no utiliza punto y coma o llaves innecesarias en lugares incómodos.

Su utilización es como estar hablando el inglés, pero sin dejar su gran potencia como lenguaje de programación escalable.


## Es Orientado a Objetos

La ventaja que veo yo con los lenguajes que son orientados a objetos, es que nos permiten crear objetos que tienen sus propias caracterí­sticas y que actúan de diversas maneras; lo que nos permite controlar mejor el comportamiento de nuestra aplicación. En Ruby, me ha fascinado la increí­ble sencillez con la que se pueden crear las clases de dichos objetos y sus métodos con la siguiente sintaxis.

```ruby
class MiClase
    def initialize() #Metodo constructor
    end

    def Metodo

    #Instrucciones para el metodo
    end
end
```


## Framework Ruby on Rails

Consiste en un framework que facilita la creación de aplicaciones web mediante la utilización de lenguajes regulares de diseño web combinados con Ruby, lo que lo convierte en una herramienta potente (tanto que Twitter lo utiliza) en conjunto con los módulos de CoffeeScript, SaSS y el ActiveRecord que permite el acceso y manipulación de bases de datos; ya sea SQLite o MySQL, utilizando una misma sintaxis.

Si lo que quieres es un framework que permita el fácil manejo de los recursos en el servidor y el manejo de un sitio web, aún con lo poco que he probado, recomiendo la utilización de Ruby on Rails.

- - - -

Seas un desarrollador de 'frontend' o 'backend', Ruby es un lenguaje que vale la pena aprender; ya que es tan escalable que se pueden hacer cosas sencillas en el 'backend' para complementar la interfaz; hasta grandes aplicaciones que permiten millones de solicitudes en cortos lapsos.

Gracias por haber leí­do. Espero haya sido de su agrado.
