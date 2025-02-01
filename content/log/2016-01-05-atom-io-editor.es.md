+++
title = "Convierte Atom.io en tu editor por defecto"
description = "Algunos puntos sobre Atom.io, el editor de texto de GitHub."
date = 2016-01-05 
slug = "atom-io-editor"
aliases = [
	"2016/01/atom-io-editor",
	"/es/blog/atom-io-editor"
]

[extra]
featured_image = '/img/2016/01/atom-io.png'
+++

NotePad++, Bloc de Notas, Geany, Visual Studio Code, Gedit, Sublime Text y hasta
Vim son algunos de los editores de texto que he probado desde que llegué al
mundo de los ordenadores; sin mencionar los IDEs que he dejado de utilizar por
motivos varios. A fin de cuentas, sólo los dos últimos se mantuvieron sobre el
límite aceptable y un tercero, Atom.io, pasó a ser mi elegido por defecto. 
<!-- more -->

[Atom.io](https://atom.io/) es un editor de texto soportado por la comunidad de
[GitHub](https://github.com) y por tanto, de código abierto. Ellos mismos lo
hacen llamar “el editor hackeable del siglo 21” pues desde su concepción la idea
ha sido que pueda ser modificado completamente a gusto del usuario y que al
mismo tiempo fuera de fácil uso sin configuración alguna.

Luego de haber utilizado Atom.io durante más de medio año, he encontrado varios
puntos por los cuales he decidido moverme de [Sublime
Text](http://www.sublimetext.com/) y otros editores.

## Es de código abierto Hay muchas maneras en las que esto puede ser algo
positivo, aunque la que más me ha ayudado es tener acceso rápido a una comunidad
de conocedores que están dispuestos a ayudar, a probar y a corregir lo que sea
necesario de forma activa.

A la vez, en su [repositorio de GitHub](https://github.com/atom/atom) tienes
acceso a los ‘issues’ para buscar rápidamente respuestas a temas que pueden
haber planteado otros usuarios y ver en qué estado se encuentran.


## Paleta de comandos

![Paleta de comandos](/img/2016/01/command-palette-atom-io.png)

No es única de Atom, pero aún así llega a ser muy útil cuando quieres acceder a
funciones que no tienen un atajo de teclado o bien no lo recuerdas. Con sólo
presionar Ctrl+Shift+P, se desplegará un menú con acciones y un buscador para
navegar por ellas.

## Buscador de archivos

![Buscador de archivos](/img/2016/01/file-browser-atom-io.png)

Con un concepto similar al anterior, presionando Ctrl+P, puedes buscar a través
de tu proyecto por archivos en específico por su nombre.

## Ver diferencias de Git e información relevante

![Indicador de estado](/img/2016/01/status-indicator-atom-io.png)

Por defecto podrás ver si hay diferencias entre los archivos y la última
modificación en Git. Además algunas extensiones harán aún mejor esta
funcionalidad.

En la barra de estado también permanecerá visible la rama en que estás
trabajando y las actualizaciones disponibles de paquetes.

## Gestor de paquetes y actualizaciones

![Gestor de paquetes](/img/2016/01/package-manager-atom-io.png)

Es verdad que Vim y Sublime tienen sus propios gestores, los que se vuelven un
poco más tediosos de configurar porque no vienen integrados al programa y no
funcionan con la misma fluidez.

En Atom, actualizar, instalar y desinstalar, es tan sencillo como buscar el
nombre (con el buscador incluído) del paquete y hacer click en el botón de la
tarea a realizar.

- - - -

Ahora que he mencionado las extensiones, no puedo dejarlo pasar sin mencionar
los paquetes que utilizo en mi configuración:

- [**Termrk**](https://atom.io/packages/termrk): despliega una terminal dentro
  de la ventana de trabajo de Atom.
- [**Aligner**](https://atom.io/packages/aligner) y
  [Aligner-Python](https://atom.io/packages/aligner-python): como dice el
  nombre, los utilizo para alinear mi código.
- [**Atom Beautify**](https://atom.io/packages/atom-beautify): para dar formato
  a código con el que no basta hacer espaciado.
- [**Atom Terminal**](https://atom.io/packages/atom-terminal): ejecuta la
  terminal en el directorio del proyecto. Esto cuando quiero acceder al mismo
  fuera de la ventana de Atom.
- [**Autocomplete-clang**](https://atom.io/packages/autocomplete-clang): de
  momento la mejor extensión de autocompletado que he encontrado para variantes
  de C.
- [**Autocomplete-python**](https://atom.io/packages/autocomplete-python):
  autocompletado en python.
- [**Build**](https://atom.io/packages/build): más que nada para hacer pruebas
  de ‘builds’ al guardar.
- [**Color-picker**](https://atom.io/packages/color-picker): resulta útil para
  escoger colores.
- [**Emmet**](https://atom.io/packages/emmet): herramienta muy famosa para el
  desarrollo web.
- [**Git-plus**](https://atom.io/packages/git-plus): facilita tareas de Git
  desde la paleta de comandos.
- **Linter**: con linter-gcc, linter-eslint y linter-python-pep8.
- [**Minimap**](https://atom.io/packages/minimap): visualiza el código de forma
  general.
- [**Pigments**](https://atom.io/packages/pigments): añade colores a los íconos
  dentro del proyecto.
- [**Trailing-spaces**](https://atom.io/packages/trailing-spaces): indica si
  existen espacios vacíos en el texto.
- [**Wordcount**](https://atom.io/packages/wordcount): como a veces escribo
  otras cosas además de código, me gusta poder saber el progreso en palabras que
  llevo.

- - - -

*Ahora que conoces algunos puntos a favor de Atom.io, ¿por qué no lo pruebas y
comentas qué tal?*

### *¿Cuál es tu editor de texto/código favorito?*
