+++
aliases = ['/2016/04/mis-dotfiles', '/es/blog/mis-dotfiles']
date = 2016-04-30
description = 'GNU Stow, mis dotfiles y algunos scripts que utilizo en mi día a día.'
slug = 'mis-dotfiles'
title = 'Mis dotfiles'
+++
Unix y sus sistemas derivados utilizan los que conocemos como *dotfiles*, "archivos punto u ocultos" en español, pero no planeo utilizar esa traducción barata; lo importante es la función que cumplen estos archivos. <!-- more -->Los dotfiles son los ficheros en los que generalmente se guarda la configuración de los programas a ejecutar. Otra característica de estos archivos o directorios es que si no tiene habilitada una opción para ver los ficheros ocultos, podrás pasarlos totalmente por alto; `$ ls -a` es un ejemplo para verlos. 

La intención de este artículo no es mostrar cómo funciona cada uno de los dotfiles, porque resulta que son muy diferentes en cuanto a sintaxis ya que depende del programa que vayan a configurar. En cambio, su función suele ser muy similar.

Quiero compartir el repositorio con mis dotfiles, donde podrán encontrar lo que utilizo para configurar mi entorno regular. Una práctica común es que se compartan en conjunto con algunos scripts (los que también están en mi repositorio).

[**dotfiles de acg**](https://github.com/betoissues/dotfiles)

*El repositorio está en GitHub, así que sólo basta un `$ git clone https://github.com/betoissues/dotfiles.git` para descargarlo.*

La estructura de este repositorio es algo similar a:

```
~/dotfiles
├── bash
├── dwm
├── dwm_patches
├── ncmpcpp
├── README.md
├── scripts
├── urxvt
├── vim
├── weechat
└── X
```

Donde cada uno de los directorios contiene los dotfiles pertinentes a la aplicación señalada, tomando como referencia el directorio **~**.

### Enlazando con GNU Stow

Si tomamos en cuenta la estructura de directorios anterior, los ficheros dentro de **X** son **.Xdefaults** y **.xinitrc**. Los cuales normalmente se encuentran en **~** del usuario.

Lo que hace **GNU Stow** es crear enlaces simbólicos de los ficheros dentro de la carpeta seleccionada tomando como punto de partida el directorio superior al que se ejecuta.

Esto facilita el trabajo de hacer los enlaces manualmente.

Para enlazar los dos archivos dentro de **X** a su respectiva posición, es necesario colocar el directorio **dotfiles** en **~/** y luego se vuelve tan sencilla como ejecutar `stow X` (stow [directorio]) y automáticamente se crearan los enlances como muestra a continuación.

```
~/.xinitrc -> dotfiles/X/.xinitrc
~/.Xdefaults -> dotfiles/X/.Xdefaults
```

### Ejemplos para otras aplicaciones

```
stow bash
stow mpd
stow ranger
```

Esta manera de administrar los dotfiles es bastante sencilla e increíblemente útil para migrar de máquina o utilizar alguna de tus configuraciones en otras.

En mis dotfiles decidí separarlos por aplicación (weechat, vim, urxvt, etc...), pero también se puede hacer con el directorio **~** entero si tienes diversos entornos que configurar.

Utilizar **GNU Stow** es sólo una opción, también puedes hacer uso de mis dotfiles de la manera que te resulte más cómoda.

## Los scripts

Dentro del directorio **scripts** se encuentran algunos BASH que utilizo en mi día a día. Estos se enlazan a **~/local/bin**, así que por defecto vas a necesitar agregarlo a tu variable **$PATH** o realizar un enlace manual al directorio que utilices.

Los scripts incluidos hasta la fecha son:

- **lock**: utiliza i3lock y scrot para bloquear la pantalla con un blur de la misma.
- **notif**: facilita algunas tareas con notificaciones y crea un *~/messages.log* en conjunto con weechat. Utiliza [twmn](https://github.com/sboli/twmn).
- **screener**: mis scrots con formato. Útil para usos específicos. 
- **startdwm**: inicia dwm en un loop. Para ver cambios luego de compilar.
- **status**: script de los [dotfiles de xero](http://code.xero.nu/dotfiles) para mostrar barras con información del sistema. Yo lo utilizo para mostrar el volumen en dwm.

- - - -

Te dejo una captura de pantalla con algunas cosas encontradas en mis dotfiles.

![dotfiles de acg](/img/2016/04/misDotfilesScreen.png)

- - - -

Muchas gracias por leer y espero que sean de provecho estos dotfiles.
