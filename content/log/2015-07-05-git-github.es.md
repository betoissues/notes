+++
title =      "Empezar a utilizar Git con GitHub"
subtitle =   "¿Deseas nuevas habilidades como desarrollador? Esta herramienta de control de versiones se ha vuelto imprescindible hoy día."
description = "Git es fundamental para cualquier desarrollador o escritor hoy día, por eso he hecho esta guía básica sobre su uso como controlador de versiones junto con GitHub."
date =       2015-07-05 
slug = "git-github"
aliases = [
	"2015/07/git-github",
	"/es/blog/git-github"
]
+++

Debido al tutorial sobre estructuras de datos en C++, donde compartí­ el código fuente utilizando la herramienta de [GitHub](http://github.com), muchos han estado pidiéndome que les muestre cómo comenzar a utilizar la herramienta git y en qué consiste la misma; así­ que a eso dedicaré la entrada de hoy.

Para poder explicarte el porqué de utilizar este software, comenzaré por mostrarte en qué consiste tanto Git como GitHub y que puedas identificar por tu propia cuenta las ventajas que tiene utilizar este sistema.

<!-- more -->

## Git

[![git-logo-black](/img/2015/07/Git-Logo-Black.png)](/img/2015/07/Git-Logo-Black.png)

[**Git**](http://git-scm.com) es un sistema de control de versiones. Es decir, que es una herramienta que nos permite visualizar y manejar nuestro código de manera ordenada, eficiente y eficaz.

Hoy dí­a, un sinnúmero de desarrolladores lo utilizan para su proyectos, ya que permite el trabajo en software de manera colaborativa sin perder el rastro del proyecto principal; dando la oportunidad a cada individuo de crear *ramas* para trabajar en secciones del programa de forma independiente e integrar posteriormente los cambios sin perder progreso.

## GitHub

[![github-logo](/img/2015/07/GitHub_Logo-300x123.png)](/img/2015/07/GitHub_Logo.png)

[**GitHub**](http://github.com) es un sitio web especializado para alojamiento de proyectos que utilizan el sistema de control de versiones Git. Dentro de GitHub se pueden encontrar *repositorios* (así­ llamados los proyectos) de una gran cantidad de software libre y de código abierto, así­ como repositorios privados a los que únicamente tienen acceso los miembros de empresas para su utilización.

- - - - - -

Ahora que ya tienes un idea de en qué consisten Git y GitHub es hora de iniciar en este sencillo trayecto del control de versiones.

## Comenzando con GitHub
- Lo primero que vamos a hacer es registrar nuestra cuenta en la página de [GitHub](https://github.com). En mi caso, ya la tení­a creada, así­ que puedes visitarla en el siguiente [enlace](https://github.com/AlbertoCG).

- Ahora descargaremos la versión de Git correspondiente a nuestro sistema operativo de la sección de [descargas](http://git-scm.com/downloads). Los ejemplos que mostraré serán utilizando Linux; pero aparte de la instalación, no difiere mucho en cuanto a cómo se trabaja.La diferencia simplemente es que en Windows se estará utilizando un Git Shell y en Linux la terminal.  

  Aclarando también que existen clientes para utilizar Git con interfaz gráfica, pero hoy lo mostraré mediante lí­nea de comandos para explicar su uso. Igualmente dejaré algunos clientes al final de la entrada por si se desean utilizar.

- Ya que hemos instalado Git, le daremos la configuración inicial para utilizarlo con GitHub. Para ello, vamos a ejecutar la Terminal(en el caso de Linux o un Git Shell en el caso de Windows) y escribiremos lo siguiente:

```bash
git config --global user.name "NOMBRE"
git config --global user.email "CORREO"
```

  Las palabras *NOMBRE* y *CORREO* entre comillas, serán reemplazadas por nuestro usuario y el correo que utilizamos respectivamente. Ya con esto, tenemos configurado lo básico.

- Ahora vamos a crear un repositorio con la opción que nos brinda GitHub en su página y luego pasaremos a *clonar* el repositorio existente para comenzar a trabajar con él desde tu computador. Para esta entrada, el repositorio ya estaba creado, así­ que procederé a *clonarlo*.

  *Nótese que sólo mostraré como trabajar en un repositorio propio y posteriormente enseñaré a trabajar con las ramas y así­ poder modificar repositorios de otros. Es decir, que con esta entrada podrás actualizar tus propios repositorios y mantener actualizada tu copia de alguno ajeno.*

  Clonar es crear una copia del repositorio para su uso fuera de lí­nea.

  Tomaremos como punto de partida mi repositorio sobre [estructuras de datos](https://github.com/AlbertoCG/EstructurasDeDatos). Para hacer esto, nos dirigimos a la página del repositorio y copiamos el enlace que aparece en la sección derecha, como en la imagen a continuación.
[![clone-link](/img/2015/07/clone-link.png)](/img/2015/07/clone-link.png)

  Ahora abrimos nuestra Terminal* en la carpeta que deseemos clonar el proyecto y escribimos esta lí­nea.

  ```bash
  git clone https://github.com/AlbertoCG/EstructurasDeDatos.git
  ```

  Verás que se crean las carpetas del proyecto y ya tienes una copia en tu sistema. Por lo general, las carpetas *.git* y el archivo *.gitignore* están ocultos, pero yo los tengo para que sean mostrados por defecto. No te preocupes si no puedes verlos.

  [![git-clone](/img/2015/07/git-clone-300x153.png)](/img/2015/07/git-clone.png)  
**README.md** es el archivo que se muestra al entrar a la página del repositorio y se utiliza para mostrar información general del mismo.

  De ahora en adelante estaremos utilizando mucho el comando `git status` para ver el estado de nuestros archivos.

- Continuando con esto, crearemos un nuevo archivo llamado *ejemplo.txt* para demostrarte cómo subir las modificaciones que hagamos al repositorio en GitHub. Si escribimos *git status* recibiremos un mensaje como este, expresando que han habido cambios, pero que no se han actualizado en el proyecto.  
[![git-status](/img/2015/07/git-status-1-300x53.png)](/img/2015/07/git-status-1.png)  
Para arreglar esto escribiremos:

```bash
git add ejemplo.txt
```

  Así, nuestros archivos estarán en una etapa de 'listos para actualizar el proyecto'. Ya entonces actualizamos el proyecto escribiendo:  

```bash
git commit -m "Subiendo ejemplo.txt"
```  

  [![git-add-commit](/img/2015/07/git-add-commit-300x86.png)](/img/2015/07/git-add-commit.png)

- Ya nuestros cambios están listos para ser subidos al repositorio en línea; pero antes debemos hacer algo muy importante que consiste en crear el canal de subida para nuestro proyecto.Esto realiza de la siguiente manera (git remote add [shortname] [url]):  

```bash
git remote add origin https://github.com/AlbertoCG/EstructurasDeDatos
```  

  Y al ver los cambios, tendremos que lo que realicemos en la rama origin/master serán cambios que se sincronicen con el repositorio que especificamos con su URL.  

 Nos quedarí­a configurado de la siguiente manera:[![git-remote](/img/2015/07/git-remote-300x26.png)](/img/2015/07/git-remote.png)

- Ahora que tenemos nuestro canal de subida configurado, vamos a subir los cambios con el comando *push* que 'empuja' los cambios al servidor:  

```bash
git push origin master
```

[![git-push](/img/2015/07/git-push-300x86.png)](/img/2015/07/git-push.png)  
Verás que solicita nuestro usuario de GitHub y posteriormente la contraseña.Las palabras origin y master significan que los cambios que realizamos en origin, se actualizan en la rama principal (master) de nuestro repositorio en lí­nea.

  Finalmente tendremos la notificación de los cambios en la página del repositorio y nuestro *git status* nos dirá que no han habido cambios.

  [![repo-page](/img/2015/07/repo-page-300x94.png)](/img/2015/07/repo-page.png)

### Mantener actualizado tu repositorio

Modifiqué el archivo ejemplo.txt desde la página de GitHub, es decir, que nuestro repositorio local está desactualizado. De esto nos damos cuenta escribiendo:

```bash
git fetch
```

Donde se muestran las modificaciones que se han realizado. Pero con un sencillo

```bash
git pull
```

Se actualizan nuestros archivos con las últimas modificaciones.  
[![git-pull](/img/2015/07/git-pull.png)](/img/2015/07/git-pull.png)

- - - -

Con esto ya debe ser suficiente para que puedas descargar los repositorios públicos de otros y trabajar de manera individual en tu propio repositorio. Las instrucciones más avanzadas para trabajar con Git, como las ramas y el 'staging' te las mostraré más adelante.

Por ahora, te comparto una hoja con los comandos más utilizados en Git y sus funciones, gracias a GitHub.

~~GitHub Cheatsheet~~ (Removido)

También como prometí, algunos clientes con interfaz gráfica para Git son:

- [GitHub para Mac](http://mac.github.com/)
- [GitHub para Windows](http://windows.github.com/)
- [gitg](https://wiki.gnome.org/Apps/Gitg/)

Una lista más completa la puedes encontrar en la [página de git](http://www.git-scm.com/downloads/guis).

Gracias por leer, espero que haya sido de ayuda. Cualquier duda, sólo pregunta.
