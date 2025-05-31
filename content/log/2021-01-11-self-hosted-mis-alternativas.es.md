+++
aliases = ['2021/01/self-hosted-0-mis-alternativas', '/es/blog/self-hosted-0-mis-alternativas']
date = 2021-01-11
description = 'El inicio de una serie donde comparto mi experiencia con alternativas open-source y self-hosted a múltiples servicios'
slug = 'self-hosted-0-mis-alternativas'
title = 'Self-Hosted 0: Mis alternativas de servicios'
+++
Este es el primer artículo que escribo de la serie **Self-hosted** en la cual me dedico a migrar múltiples servicios que utilizo a mis propios servidores. El fin de esta serie es aprender como funcionan estas herramientas/tecnologías, educarme un poco más en materia de administración de servidores y mejorar un poco control sobre mis datos.<!-- more -->

> Aprovecho la situación actual para publicar este artículo que aunque estaba a medias, he arreglado para presentar soluciones y alternativas que van más acordes a mis principios.

## Elección de un servidor

Primero lo primero para poder hacer [self-host](https://en.wikipedia.org/wiki/Self-hosting_(web_services)) lo que se necesita son servidores, y para esto hay dos alternativas que resultan las más comunes:

- Un laboratorio en casa (también conocido como [homelab](https://www.reddit.com/r/homelab))
- Pagar por servicios de VPS

### Laboratorio en casa

Consiste en tener en casa equipo dedicado para hospedar los servicios que se quieran acceder desde Internet. Esto puede ser muy sencillo, por ejemplo, con el uso de una [Raspberry Pi](https://www.raspberrypi.org/) tienes un servidor que sirve para múltiples sitios web y otro tipo de aplicaciones ligeras, dependiendo de la versión.

Sin embargo, tener un laboratorio en casa también puede conllevar otras preocupaciones como qué hacer en caso de fallas eléctricas o del proveedor de Internet.

Y aunque sería interesante tener un laboratorio en casa algún día, por ahora creo que lo más prudente en mi caso es no preocuparme tanto por ello. Si aún así lo estás considerando estos son algunos puntos clave que te ayudarán a decidir.

#### Beneficios

1. **El almacenamiento es más económico.**

	En especial utilizando HDDs, tan solo una búsqueda rápida en Amazon te presenta con [1TB por menos de 50$ (USD)](https://www.amazon.com/WD-Blue-1TB-Hard-Drive/dp/B0088PUEPK). De cualquier manera el precio por GB, así sea utilizando SSDs es más barato si compras los discos.

	Acá también se puede tener en consideración el tema de redundancia y respaldos, que toca configurar manualmente.

2. **Los datos te pertenecen.**

	Los proveedores de hosting y sus políticas de privacidad y protección de datos se rigen dependiendo tanto de la ubicación de sus centros de datos como de dónde está conformada la empresa, si te interesa la privacidad de tus datos, esta es la mejor opción.

3. **Conexión rápida a tus servidores.**

	Esto no necesita explicación, te estás conectando desde LAN. (No aplica fuera de casa)

#### Inconvenientes

1. **La seguridad de la red de tu hogar queda en tus manos.**

	Un tema delicado si eres principiante, ya que podrías quedar exponiendo otros dispositivos que se encuentren en tu red casera.

2. **Políticas de los proveedores de Internet.**

	Ya que en algunos casos está prohibido servir contenido con planes residenciales o tienen limitantes para servicios específicos, un caso común es el bloqueo de envío correos directamente desde tu homelab.

### Proveedor de Hosting (VPS)

La solución que creo es más común para el self-host es utilizar VPS, seguro habrás escuchado de [DigitalOcean](https://www.digitalocean.com/), yo actualmente utilizo [Vultr](https://www.vultr.com/).

Cuando se me ocurrió esta serie apenas estaba configurando los servicios en Vultr, sin embargo he estado buscando alternativas luego de varios meses en Vultr.

Ya que la mayoría de lo que estoy (estaré) hospedando no requiere de una conexión inmediata, quiero hacer la prueba con proveedores más económicos y ubicados en Europa, como muestra la recomendación de [Privacy Tools](https://privacytools.io/providers/hosting/) pero el precio que presentan es ridículo a mi parecer.

Me topé también con este artículo de los proveedores que utiliza [Nixnet](https://nixnet.services/blog/vps-providers/) (quienes utilizo actualmente para XMPP y Wallabag) y mencionan [netcup](https://netcup.eu/) y [BuyVM](https://buyvm.net/).

También existe [contabo](https://contabo.com/) que me compartieron directamente, el cual se ve prometedor por el almacenamiento de los planes.

Aún con todo esto, hace varios meses tengo en la mira probar [Hetzner](https://www.hetzner.com/), al igual que Amolith comenta en su artículo. Sus precios son competitivos, además de que sus servidores se encuentran en Alemania y Finlandia.

**¿Cuál proveedor utilizaré al final?**

La verdad todavía no lo sé, de momento mi idea es terminar con algún plan específico de almacenamiento para Syncthing y WebDAV, quizás incluya Radicale, otro servidor chico para lo relacionado al VPN y otro más grande con los demás servicios.

## ¿Qué mover a tu servidor?

Virtualmente puedes hospedar cualquier tipo de servicio en tu servidor, para eso existen listas como [Awesome Self-Hosted](https://github.com/awesome-selfhosted/awesome-selfhosted).

En mi caso, esta es la lista, la cual iré enlazando a medida que vaya subiendo los artículos respectivos a cada uno de los servicios. Como ya tengo varios corriendo, lo más probable es que redacte los artículos a medida que vaya migrando de proveedor.

### Servicios Activos

- **Radicale**: para la sincronización de mis contactos y calendarios a través de CardDAV y CalDAV, respectivamente.
- **wsgidav**: permite acceder a archivos con WebDAV, wsgidav facilita la administración de varios directorios y accesos; además de añadir una interfaz web para rutas que se deseen hacer públicas.
- **Syncthing**: en conjunto con wsgidav, lo utilizo para mantener sincronizados directorios específicos entre varios dispositivos.
- **Remark42**: es el servicio que maneja los comentarios de este blog.
- **Wireguard**: un servicio de VPN que resulta útil en ciertas ocasiones.
- **ZNC**: para mantener mi sesión de IRC abierta (pueden encontrarme como beto @ freenode). Normalmente utilizo weechat para conectar a ZNC.
- **The Lounge**: es una interfaz web para IRC, en caso de estar en algún dispositivo donde no tenga mi configuración de weechat. Probablemente lo remueva de la lista.
- **Miniflux**: aquí guardo y leo los feeds RSS de distintos blogs que sigo. También permite integración con Fever API así que aunque tiene una interfaz web que se bien en móvil, puedo utilizar clientes que soporten este estándar.
- **stagit**: es un frontend para repositorios de git que realmente no estoy utilizando en este momento, podría removerlo. De momento tener un git de respaldo en el servidor no está de más.

### Servicios por Añadir

- **Sitios estáticos**: este blog en algún momento lo moveré de Netlify.
- **Matrix / XMPP**: entre estos dos todavía tengo que decidir, de momento solo tengo habilitada una cuenta de XMPP para probar(~~`betoissues@nixnet.xyz` `beto@argonauts.space`~~). ~~En el caso de XMPP, estaría considerando utilizar [ejabberd](https://www.ejabberd.im/) y [Prosody IM](http://prosody.im/).~~ Me adelanté y quedé instalando Prosody como una prueba en Hetzner. [**Ver artículo**](/log/2021-01-17-self-hosted-servidor-xmpp-prosody-im.es.md)
- **Wallabag**: es un administrador de marcadores, actualmente lo utilizo más que todo para guardar enlaces para leer más tarde.
- **Mastodon**: no es realmente necesario, pero sería interesante configurar una instancia personal solo por tener la experiencia. Mi cuenta actual se encuentra en `@beto@gts.nixden.net`.
- **Pixelfed**: similar a lo que me sucede con Mastodon, pero en el caso de Pixelfed no poseo ninguna cuenta actualmente ya que los servidores que encontré no me convencieron.

- - -

**Última modificación: 17 de enero de 2020.**

- - -

Esto es, de cierta manera, un "evento abierto", por lo que cualquier recomendación es bienvenida y las consultas también.
