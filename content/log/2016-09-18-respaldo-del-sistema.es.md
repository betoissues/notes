+++
aliases = ['2016/09/respaldo-del-sistema', '/es/blog/respaldo-del-sistema']
date = 2016-09-18
description = 'Copias de seguridad con tar, gzip y cronjobs en Linux.'
slug = 'respaldo-del-sistema'
title = 'Y tú, ¿ya respaldaste tus datos?'
+++

De acuerdo, escribir "todo lo que tienes" dentro de tu cerebro es algo que aún no encontramos forma de hacer, pero para los apasionados de las computadoras algo similar es su disco duro. Y si eres como yo, que quieres tener un respaldo de tus archivos constantemente este artículo es el indicado.<!-- more -->

En él te mostraré alternativas para archivar los ficheros, cómo automatizar las tareas de respaldo y un script que estoy trabajando para facilitarla. El tema vino a mi mente por un artículo de [z3bra](http://blog.z3bra.org/2014/09/backup-someone.html), otro miembro de la comunidad [nixers](https://nixers.net) en la que participo; sin embargo, estas técnicas ya deben ser bastante comunes para los sysadmin.

## Herramientas necesarias

- Alguna distribución de sistema Linux o Unix.
- El comando `tar` para archivar. También hay alternativas como `cpio`.
- Un compresor como `gzip` o tu favorito. (Opcional si utilizas `tar`).
- Un sitio donde almacenar el respaldo. Dependiendo del tamaño una memoria USB podría bastar.

## Generando el archivo de respaldo

(El respaldo de los archivos se estará realizando desde el directorio ~/ por lo que no es necesario acceso root)

```
. /home/acg
├── bin
├── dev
├── dotfiles
├── local
├── opt
├── rpmbuild
├── tmp
├── usr
└── var
```

*Además tengo doc, vid, msc y otros dentro de `~/usr`.*

__El proceso de creación de este archivo de respaldo consta de dos pasos.__

### Combinar los ficheros en un archivo único

El comando `tar` es conocido como un archivador, es decir que toma los ficheros que se le envíen y los convierte en un archivo único. A diferencia de un compresor este no intenta reducir el espacio que ocupa a menos que se le indique lo contrario.

Con el siguiente comando tomamos todo el contenido de `usr/img` y lo representamos un archivo, *img_backup.tar*
```bash
tar -cpf img_backup.tar usr/img
```

Lo que se encuentra después de '-' son conocidas como banderas u opciones que se toman en cuenta al ejecutar `ŧar`. Las utilizadas aquí fueron:

- **c**: indica que se realizará la acción de unir los ficheros encontrados en un sólo archivo.
- **p**: sirve para mantener los mismos permisos de archivos.
- **f**: señala que habrá un archivo de destino para el _.tar_. (Especificado por *img_backup.tar*)

Al final sólo se escribe el directorio que se quiere archivar.

### Comprimiendo para ocupar menos espacio

Esto se puede conseguir añadiendo la bandera **-z** al comando `tar`, pero para propósitos de este artículo utilizaré `gzip` y así tener clara la separación de lo que ocurre y que no haya conflictos con aquellos utilizado `cpio` u otros para el archivado.

El llamado a `gzip` es bastante sencillo mediante
```bash
gzip img_backup.tar
```

Esto comprimirá el archivo y le añadirá la extensión _.gz_. También se puede hacer uso de la bandera __-c__ para enviar el archivo comprimido a _stdout_ sin necesidad de modificar el original; bastante útil al momento de combinar `tar` o `cpio` con `gzip`.

```bash
tar -cp usr/img | gzip -c > img_backup.tar.gz
```

Como puedes ver omití la bandera **-f** de `tar` ya que estoy enviando la salida directamente a `gzip` para que sea comprimida, como indica '\|'.

El operador '>' escribe la salida _stdout_ de `gzip` directamente en un archivo con extensión _.tar.gz_ también conocido como _tar ball_.

## Facilitando el proceso

Claro que es tedioso tener que escribir todo esto cada vez que deseas respaldar algo. Una de las maneras de hacer esto más fácil es mediante _cronjobs_ que explicaré más a fondo en otro artículo. Además de que puedes combinarlo con un script que he estado trabajando para realizar respaldos de directorios específicos.

Se encuentra en GitHub bajo [betoissues/backup-tool](https://github.com/betoissues/backup-tool) con tareas comunes como respaldar mi música, videos, documentos y otros con fecha de respaldo. Además con unos ligeros cambios puedes personalizarlo para que trabaje de acuerdo a los directorios que utilizas.

```bash
* 2 * * 7 backup all
```
_Con esto hago un respaldo cada domingo a las 2am._

Por lo general cuando despierto muevo estas copias a un disco duro externo, pero estoy trabajando para que la herramienta detecte automáticamente si está montado el disco y haga la copia.

## ¿Cómo abrir un tar ball?

Como z3bra menciona, de nada sirve tener una copia de seguridad si después no podrás restaurarla. Así que termino el artículo mostrando el comando para descomprimir y expandir el archivo _.tar.gz_

```bash
tar -zxf img_backup.tar.gz
```

_Recuerda que puedes añadir la bandera -v para tener retroalimentación de lo que realiza el proceso._

- - - - -

{{ youtube(id="sLJp5wt5UEY", class="youtube-video") }}

_Claro que no podía hacer falta un video de backup-tool_

- - - - -

Espero que este artículo te ayude a no volver a perder información valiosa y a conocer algunos nuevos conceptos utilizados en la industria.
