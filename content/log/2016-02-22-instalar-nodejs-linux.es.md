+++
title = "Instalación de NodeJS en Linux"
description = "Se muestran diferentes alternativas para instalar NodeJS en el sistema."
date = 2016-02-22 
slug =  "instalar-nodejs-linux"
aliases = [
	"2016/02/instalar-nodejs-linux",
	"/es/blog/instalar-nodejs-linux"
]
+++
Una de las tecnologías web predominantes durante los últimos años ha sido
NodeJS, facilitando la creación de aplicaciones web y hasta de escritorio con el
framework de [Electron](https://github.com/atom/electron), entre otros.
<!-- more -->

[**NodeJS**](https://nodejs.org/en/) es un entorno de ejecución desarrollado con
la tecnología del motor V8 de JavaScript para Chrome. Según su página oficial,
NodeJS está dirigido a eventos, hace uso de funciones asíncronas y posee una
vasta biblioteca con paquetes para instalar (conocida como
[npm](https://www.npmjs.com/)).

## Instalando NodeJS Para este tutorial voy a estar utilizando Fedora 23, pero
NodeJS está disponible en otras plataformas como OS X o Windows (ambas con su
respectivo instalador).

### Forma 1. Desde el administrador de paquetes. Para instalar desde el
administrador de paquetes, simplemente abres la terminal y como root escribes:

```bash 
dnf install nodejs npm 
```

Con esto instalas tanto NodeJS como su gestor de paquetes (para instalar en
otros sistemas, referirse a la [página oficial de
NodeJS](https://nodejs.org/en/download/package-manager/)), que usaremos más
adelante en otros artículos.

Si utilizas este método será necesario que escribas `sudo` para hacer tareas de
forma global, si te resulta incómodo, también puedes instalarlo en un directorio
local con la siguiente o tercera alternativa.

### Forma 2. Mediante NVM. [NVM(Node Version
Manager)](https://github.com/creationix/nvm) administra diversas instalaciones
de NodeJS, para permitir el trabajo en proyectos con versiones distintas.

Su instalación es tan sencilla como escribir:

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash 
``` 
o si no tienes cUrl:

```bash 
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
```
pero en su repositorio también cuentan con la opción de hacerlo manual.

Usar NVM es bastante sencillo. Algunos de los comandos más utilizados son:

- `nvm install (version)`: instala una versión específica de NodeJS.
- `nvm use (version)`: selecciona con qué versión de NodeJS deseas trabajar.
- `nvm ls`: muestra un listado con las versiones instaladas. Agrega una llamada
  'system' si tenías alguna versión instalada antes de NVM.

[![Ejemplo de NVM](/img/2016/02/ejemplo-nvm.png)](/img/2016/02/ejemplo-nvm.png)

### Forma 3. Instalando en un directorio local, sin acceso global. La forma más
fácil de hacerlo es ejecutando el siguiente script publicado en un [Gist de
isaacs](https://gist.github.com/isaacs/579814):

```bash 
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc . ~/.bashrc 
mkdir ~/local 
mkdir ~/node-latest-install 
cd ~/node-latest-install 
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local 
make install 
curl https://www.npmjs.org/install.sh | sh 
```

Lo que este código hace es instalar NodeJS y npm en la carpeta '~/local',
permitiéndote realizar instalaciones globales sin utilizar `sudo` y sin entrar
en carpetas del sistema. Para esto, el script se encarga de cambiar el 'prefix'
en la configuración de la instalación y añadirlo al '$PATH' para poder ser
ejecutado sin problemas.

### Forma 4. Descarga e instalación manual. ¿De verdad llegaste hasta acá con las
tres alternativas disponibles arriba?

Si es así y te gusta complicarte, sólo te dejo el enlace a la [sección de
descargas](https://nodejs.org/en/download/) de NodeJS y el resto es pan
comido para ti.

- - - -

Espero que este artículo te haya sido de ayuda y lograras instalar NodeJS. No
dudes en dejar tu comentario si tienes alguna pregunta. Más adelante estaré
compartiendo un poco de desarrollo en NodeJS.
