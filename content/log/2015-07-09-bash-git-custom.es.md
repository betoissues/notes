+++
aliases = ['2015/07/bash-git-custom', '/es/blog/bash-git-custom']
date = 2015-07-09
description = 'Si utilizas Git mediante Terminal, llegó la hora de darle un empujoncito y mejorarlo con esta personalización.'
slug = 'bash-git-custom'
subtitle = '¿Ya conoces Git? Ahora dale estilo.'
title = 'Mi terminal bash personalizada para Git'
+++

Si ya leíste mi entrada anterior sobre [Git y GitHub](/2015/07/git-github/), lo utilizas y eres usuario de Linux, te comparto algunas líneas de la configuración de mi bash para facilitar el trabajo en Git desde la terminal.
<!-- more -->

## Características
- **Hora en que se ejecutó el último comando**
- **Muestra la rama del proyecto en la que te encuentras**
- **Notifica si ha sucedido algún cambio**
- **Sólo se muestra donde esté el archivo de git**

## Imágenes
![git-bash-normal](/img/2015/07/git-bash-normal.png)

*Se oculta la información automáticamente cuando se sale del directorio en que está el proyecto*

![git-bash-changes](/img/2015/07/git-bash-changes.png)

*Notifica si han ocurrido cambios desde el último comando*

## Código
Es sencillo, sólo añadir las siguientes líneas a `~/.bashrc`:
(Haz una copia de tu archivo ~/.bashrc si no estás seguro de lo que haces)

```bash
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

PS1='\[\033[0;31m\]\T\[\033[m\]\[\033[0;32m\]$(__git_ps1 " [%s]")\[\033[m\] \[\033[0;34m\]\u\[\033[0;32m\] ~\$ \[\033[m\]'
```

- - - -

Es importante tener en cuenta que git debe estar instalado.

Si ya tienes tu propia configuración, no dudes en compartirla. Espero sea de ayuda la que hoy te traje.
