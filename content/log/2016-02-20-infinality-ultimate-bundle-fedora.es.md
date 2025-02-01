+++
title = "Infinality Ultimate Bundle para Fedora"
description = "Infinality es un reemplazo para Cairo, Freetype y Fontconfig, para renderizar el texto en GNU/Linux."
date = 2016-02-20 
slug = "infinality-ultimate-bundle-fedora"
aliases = [
	"2016/02/20/infinality-ultimate-bundle-fedora",
	"/es/blog/infinality-ultimate-bundle-fedora"
]
+++
El último cambio que hice entre distribuciones de GNU/Linux fue entre Ubuntu y
Fedora. A simple vista, no noté mucha diferencia pues estoy utilizando GNOME 3,
pero en cuanto entré a algunas páginas y comencé a leer noté algo extraño. No en
lo que decía, sino en cómo se veía lo que leía. <!-- more -->

Entre Ubuntu y Fedora hay una clara diferencia de cómo se muestra el texto; ese
suavizado de Ubuntu no se ve en Fedora. Ahí es donde entra Infinality a hacer su
rescate.

Infinality reemplaza los paquetes de Cairo, Freetype o Fontconfig si están
instalados y mejora increíblemente la visualización del texto en GNU/Linux.

## Créditos

En este artículo te mostraré cómo instalarlo en Fedora 23, gracias a [Daniel
Renninghoff](https://danielrenninghoff.com/) que se tomó el trabajo de recopilar
las fuentes en su [repositorio de
GitHub](https://github.com/drenninghoff/infinality-ultimate-fedora); así que si
tienen algún reporte que dar al respecto, pueden enviárselo directamente o
notificarme para hacerle saber.

## Demostración Así se ve el texto después de instalar Infinality en Fedora 23.

[![Demostración de Infinality
Ultimate](/img/2016/02/infinality-demo.png)](/img/2016/02/infinality-demo.png)

Si quieres comparar con cómo se ve actualmente en tu sistema, puedes visitar
~~este sitio~~ (removido).

## Instalación

**Durante la instalación se estará utilizando la terminal. Si los comandos no
funcionan directamente, agrega 'sudo' al inicio de cada uno.**

Lo primero es instalar el repositorio con este comando.

```bash 
dnf install http://rpm.danielrenninghoff.com/fedora/23/noarch/infinality-ultimate-repo-23-2.noarch.rpm
```

Una vez instalado el repositorio, se necesita hacer el reemplazo de los paquetes
que actualmente renderizan el texto.

```bash
dnf install --allowerasing cairo-infinality-ultimate fontconfig-infinality-ultimate freetype-infinality-ultimate 
```

### Tipografías

Este paquetes reemplaza las tipografías existentes con versiones adecuadas para
Infinality; además incluye tipografías adicionales.

```bash 
dnf install --allowerasing ibfonts-meta-base ibfonts-meta-extended-ltibfonts-meta-extended 
```

#### Java

Para tener compatibilidad con Java, es necesario hacer el remplazo de su paquete.

```bash 
dnf install --allowerasing java-1.8.0-openjdk-infinality-ultimate-headless 
```

*Nota: Algunos programas como JetBrains utilizan la fuente desde su propio JRE.
Para solucionarlo, elimina el directorio JRE dentro de su instalación para
forzarlo a utilizar el del sistema.*

- - - - 
*Espero te haya funcionado y mejore tu experiencia en GNU/Linux. Gracias por leer.*
