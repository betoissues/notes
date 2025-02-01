+++
title = "Google Chrome a Mozilla Firefox"
description = "Haciendo el cambio sin dejar rastro."
date = 2016-10-05 
slug = "chrome-a-firefox"
aliases = [
	"2016/10/chrome-a-firefox",
	"/es/blog/chrome-a-firefox"
]
+++
Decidí probar Firefox como alternativa más personalizable que Chrome o Chromium. Desearía decir que también por el consumo de memoria, pero inevitablemente los navegadores basados en WebKit tienden a tener un alto costo.<!-- more -->

Estos son los clásicos motivos por los cuales alguien hace el cambio a Firefox, pero además estuve viendo un documental en el que se muestra cómo surgió Firefox y la filosofía con la cual se concibió.

{{ youtube( id = "u404SLJj7ig", class = "youtube-video" ) }}

Sin más, les comparto la experiencia.

La primera pregunta que me hice fue '¿Qué voy a extrañar de Chrome?' y antes de darme cuenta estaba de vuelta a mi flujo de uso regular y hasta mejorado. Como sucedió esto, la lista de contras vs Chrome que tenía desapareció, así que compartiré las maravillas de Firefox y finalmente algunos detalles que puedes extrañar de Chrome y cómo arreglarlo.

## Versión de escritorio

### Configuración de banderas (about:config)

En Chrome existen secciones similares que permiten configurar algunas tecnologías y comportamientos que posee el navegador, pero la flexibilidad que te brinda Firefox al dirigirte a 'about:config' es inmensa en comparación. 

Recomiendo mucho revisar aquellas que inician con browser.\* ya que son las que más se perciben y podrían afectar un poco más el uso.

### Atajos de búsqueda

Este fue uno de mis problemas al intentar migrar a Firefox las veces anteriores. Si utilizas Chrome debes estar acostumbrado a poder hacer tus búsquedas desde la Omnibar con Omnisearch, lo que permite escribir parte del dominio y la tecla <tab> para hacer una búsqueda directa en el sitio.

No sé exactamente desde cuando, pero ahora al agregar un motor de búsqueda, Firefox te permite hacer algo similar asignando atajos o alias, que al separar por un espacio de los términos de búsqueda te permite obtener el mismo comportamiento que Omnisearch desde la barra de direcciones.

Por ejemplo, al tener habilitado el motor de búsqueda de YouTube y configurar 'yt' como alias en 'about:preferences#search' sólo necesitas escribir 'yt DEFCon 2016' para buscar videos de DEFCon 2016 directamente en YouTube.

> Dicho esto, ya no extraño la Omnibar.

### Temas personalizados

*¡Oh, gloriosa personalización!*

Además de las funcionalidades, soy fanático de la interfaz que me ofrece una aplicación. Me gusta que sea sencilla, con la información justa y que se adapte al resto de mi entorno. Ya conocía [UserStyles](https://userstyles.org) desde Chrome, mas no pude explotar una de las características que más me gusta, personalizar el estilo del navegador como tal.

Firefox + UserStyles me ha permitido dejar el navegador justo como lo deseaba. 

![Firefox UserStyles](/img/2016/10/firefox_userstyles.png)

*¿Pero dónde dejas los botones? La nueva pestaña, cerrar pestaña, el botón de inicio, atrás*

### Atajos de Vi con VimFX

Intento que todas las actividades que realizo en mi sistema se puedan hacer únicamente con el teclado y lo más parecido al editor de texto Vi(m).

Me desagradaba que mi navegador fuera la excepción (probé similares en Chrome y ninguna fue de mi agrado), hasta que me topé con VimFX para Firefox.

A diferencia de Vimperator, que probablemente varios conozcan, VimFX es menos invasivo y brinda la cantidad justa de atajos para el control de navegador; brindando también personalización a través de la configuración del add-on.

Aparte de la navegación básica (h, j, k, l, u, d, f) mis atajos favoritos en VimFX son:

- yy: copia la dirección de la página actual.
- P: abre lo copiado en el portapapeles en una pestaña nueva.
- gp: para colocar la página actual como pin/sticky.

## Aplicación móvil

Lo normal es que los teléfonos Android traigan un navegador Chrome si vienen con Google Apps instalados e inclusive muchos suelen utilizar el navegador por defecto. Honestamente, ese tipo de situaciones me estresa, si voy a tener una herramientas específica y tiene un equivalente en móvil definitivamente voy a utilizarlo.

Chrome para móvil es fantástico y bastante rápido, pero ahora que utilizo Firefox una migración era necesaria. Por suerte, ya no necesito una cuenta de Google para sincronizar mis marcadores y pestañas con el computador. Crear una cuenta Firefox te permite utilizar Sync y mantener la integración casi intacta, como sucede con Google.

### Velocidad

Las veces que he utilizado Firefox móvil he percibido que la velocidad con la que carga las páginas no es consistente y tiende a ser ligeramente más lenta que la de Chrome, sin embargo renderiza las páginas de forma correcta y sigue siendo más rápido que el navegador del sistema. Ligero precio a pagar por este cambio.

### Personalización

Lo que realmente me atrapó con la versión móvil de Firefox fue la capacidad de utilizar varias de los add-ons que utilizo en el escritorio. Aunque no utilizo todas, tener un AdBlocker o HTTPSEverywhere es bastante útil para un dispositivo móvil.

- - - -

Así es como llevo más de un mes utilizando únicamente Firefox y enncontré un flujo de trabajo cómodo que sigue la filosofía de libertad.

Muchas gracias por leer.

