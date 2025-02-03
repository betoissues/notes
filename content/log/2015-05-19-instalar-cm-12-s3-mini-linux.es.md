+++
aliases = ['2015/05/instalar-cm-12-s3-mini-linux', '/es/blog/instalar-cm-12-s3-mini-linux']
date = 2015-05-19
description = 'Tutorial de cómo se instala CyanogenMod en un S3 Mini desde Linux utilizando Heimdall.'
slug = 'instalar-cm-12-s3-mini-linux'
subtitle = 'Cómo utilizar la herramienta Heimdall para instalar CyanogenMod desde Linux.'
title = 'Instalar CM12 en S3 Mini desde Linux'
+++
En este tutorial quiero mostrarles los pasos a seguir para poder instalar el CyanogenMod 12 con el ROM de Lollipop en un S3 Mini (I8190L en mi caso). Para hacer esto, nos vamos a ayudar de la herramienta Heimdall, que es similar al Odin en Windows y además vamos a estar utilizando un ROM de la página [NovaFusion](http://novafusion.pl).

<!-- more -->

Para poder instalar de manera adecuada el ROM, vamos a necesitar "flashear" el dispositivo. Lo lograremos siguiendo estos pasos:

- Instala la herramienta **Heimdall** mediante tu administrador de paquetes favorito. En mi caso, utilizo **ArchLinux** y lo hice escribiendo en terminal:  

```bash
yaourt heimdall
```

 Y seleccionando el paquete #1 de la imagen.  
 [![yaourt heimdall](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-21-10-300x81.png)](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-21-10.png)  

- Luego hay que descargar la ROM que querramos instalar. Nos dirigimos a la [sección de descargas de NovaFusion](http://novafusion.pl/downloads/), seleccionamos nuestro dispositivo, luego CyanogenMod y la descargamos con la opción "odin" seleccionada en el listado a la derecha del nombre.  
La versión que yo descargué fue la *Lollipop 5.1.1 (CyanogenMod 12.1) 20150518 stable*, pero es probable que para ustedes haya una versión más reciente. Sólo sería cuestión de sustituir el nombre donde corresponda.  

- Ahora creamos una carpeta donde vamos a guardar los archivos descargados y la configuración para seguir con el procedimiento. Yo creé una carpeta llamada *S3 Mini* en mi Escritorio.

- Nuestro siguiente pasó será descomprimir el archivo*cm12.1_golden.nova.20150518.ODIN_TWRP.tar.md5.tar.gz* dentro de la carpeta *S3 Mini*. Veremos que dentro de la carpeta nos queda el archivo*cm12.1_goden.nova.2015.0518.ODIN_TWRP.tar.md5* (con extensión .md5), así que para extraerlo, buscamos el directorio en la terminal y escribimos:

```bash
tar -xf cm12.1_golden.nova.20150518.ODIN_TWRP.tar.md5
```

_Esto debe extraer el contenido del archivo .md5 en la misma carpeta. Los archivos que deberían encontrar son recovery.img, boot.img y system.img_

- Ahora procedemos a apagar el celular e iniciarlo en modo de descarga; esto se logra manteniendo presionado **VOL ABAJO + HOME + ENCENDIDO** hasta que inicie. Si se muestra una ventana de advertencia, simplemente presionamos **VOL ARRIBA** y nos deberá mostrar como si estuviese esperando para descargar algo.

- A partir de aquí, vamos a utilizar Heimdall tanto desde la terminal como su interfaz visual para ayudarnos un poco. Abrimos **Heimdall**, nos vamos a *Utilities* y luego hacemos click en *Detect*. En el cuadro inferior debe aparecer que el dispositivo ha sido detectado.

- Vamos a utilizar la herramienta de **Heimdall** mediante comandos ya que si utilizamos *Heimdall Frontend* nos pedirá un archivo *firmware.xml*(el cual no tenemos). Lo siguiente será obtener el archivo '.pit' correspondiente a nuestro teléfono.  
Para esto, abrimos la terminal que teníamos ya con la carpeta *S3 Mini* localizada y escribimos:  

```bash
PITFILE=samsung-s3-mini-GT-I8190L.pit
heimdall download-pit --output $PITFILE
```

[![Carpeta S3 Mini](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-53-10-300x75.png)](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-53-10.png)  
Donde lo que va al lado de **PITFILE=""** es el modelo del celular o nombre que deseen ponerle al archivo.  

- Volvemos a la herramienta visual de **Heimdall** y en la pestaña *Flash* hacemos click en **Browse** para abrir el archivo '.pit' que acabamos de guardar y posteriormente damos click a **Add**.  

- Al dar click en **Add** daremos un vistazo a los *Partition Name* de la lista de la izquierda, para encontrar los correspondientes a los archivos que descomprimimos en la carpeta *S3 Mini*. (recovery.img, boot.img y system.img)[![Heimdall](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-53-33-300x153.png)](/img/2015/05/Captura-de-pantalla-de-2015-05-19-16-53-33.png)  
En mi caso fue:  
**Partition Name** - **File**  
Kernel - boot.img  
Kernel2 - recovery.img  
SYSTEM - system.img

- Para finalizar escribimos lo siguiente en la terminal con los archivos y particiones obtenidas:  

```bash
heimdall flash --Kernel boot.img --Kernel2 recovery.img --SYSTEM system.img
```

Ahora su celular deberá estar reiniciando (puede tomar un rato) y podrán hacer uso de su nueva ROM sin problemas cuando termine de hacerlo.

Gracias por su atención y espero les haya sido de ayuda el tutorial.

**Nota 1:** Cada uno es responsable del daño que esto pueda ocasionar a su teléfono. Recuerden que al hacer esto, se puede perder la garantía del mismo.  

**Nota 2:** El procedimiento para actualizar de una versión de CM12 a otra de CM12, es distinto y se puede hacer mediante el inicio en modo de recuperación del celular.
