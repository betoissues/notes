+++
title = "Self-Hosted: Servidor XMPP con Prosody IM"
description = "Configuración de un servidor XMPP utilizando Prosody IM como alternativa de mensajería"
date = 2021-01-17
slug = "self-hosted-servidor-xmpp-prosody-im"
aliases = [
	"2021/01/self-hosted-servidor-xmpp-prosody-im",
	"/es/blog/self-hosted-servidor-xmpp-prosody-im"
]
+++

Tras los últimos acontecimientos en materia de privacidad, específicamente el caso WhatsApp, donde millones de personas migraron para probar distintas plataformas de mensajería instantánea, me encontré con XMPP.<!-- more -->

_Este artículo pertenece a la serie de [Self-Hosted](/log/2021-01-11-self-hosted-mis-alternativas.es.md)._

## XMPP

[XMPP](https://xmpp.org/) es un protocolo, es decir un estándar, para el intercambio de mensajes. XMPP no es una aplicación pero establece el fundamento para muchas otras[^xmpp-examples], entre ellas Fortnite, League of Legends y hasta WhatsApp que inició con esta tecnología.

Aunque XMPP sea un protocolo, existen múltiples implementaciones de servidores y clientes que siguen el estándar, con distintos niveles de soporte para las [extensiones](https://xmpp.org/extensions/) disponibles en XMPP, también conocidas como XEPs; las cuales se pueden revisar en la página de XMPP y definen distintas funcionalidades del protocolo.

_Los clientes o aplicaciones que utilizo para conectar a servidores XMPP actualmente son [Siskin IM (iOS)](https://siskin.im/) y [Gajim (Linux)](https://gajim.org/)._

Al existir un estándar de comunicación, múltiples servidores pueden interactuar entre sí, con lo que aplicado al objetivo de mensajería instantánea se obtiene una solución **decentralizada**[^decentralizacion] donde el que desee puede hospedar su propio servidor y unirse a la red de servidores XMPP.

## Prosody IM

El primer día que entré a XMPP fue registrándome en el servidor abierto de [Nixnet](https://nixnet.services/), pero inconforme por no entender bien el ecosistema de servidores XMPP decidí configurar el mío. Esto sucedió mientras escribía el artículo inicial de la serie.

Entre las múltiples elecciones de [servidores XMPP](https://xmpp.org/software/servers.html) disponibles, [Prosody IM](https://prosody.im/) fue el que captó más mi atención, teniendo como competencia principal a [ejabberd](https://www.ejabberd.im/).

Algunos de los motivos por los cuales decidí comenzar con Prosody IM fueron:

- Su sitio está muy completo, incluida la documentación.
- El soporte que me brindó la comunidad a través de su MUC[^muc] fue excelente.
- Bajo consumo de recursos del sistema.
- Buen soporte de XEPs a través de módulos.

## Configuración de Prosody IM

En este proceso asumo el uso de Ubuntu 20.04 como comenté en [mi artículo anterior](/log/2021-01-13-configuracion-inicial-servidor.es.md).

### Instalación

Para la instalación de Prosody comencé por utilizar el paquete incluido en la distribución:

```bash
sudo apt update
sudo apt install prosody prosody-modules
```

O para instalar prosody-modules manualmente

```bash
sudo apt install mercurial
hg clone https://hg.prosody.im/prosody-modules/ /ruta/a/prosody-modules
```

### Configuración del Firewall

En esta configuración utilicé `nginx` como reverse proxy para peticiones HTTP, esto permitirá compartir imágenes y otros archivos a través de XMPP. Y los puertos necesarios por defecto por XMPP son los `5222` y `5269` para la conexión con los clientes y otros servidores respectivamente.

Estos puertos pueden habilitarse con las siguientes reglas de `ufw`:

```bash
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 5222
sudo ufw allow 5269
```

### Certificados SSL con Let's Encrypt y Certbot

En mi caso, ya que estaré utilizando este servidor para otros servicios que probablemente tendré en subdominios tomé la decisión de crear un certificado "wildcard". Para poder hacer esto es necesario validar el certificado mediante DNS.

```bash
sudo apt install certbot
sudo certbot certonly --manual --preferred-challenges=dns \
-d 'dominio.tld','*.dominio.tld'
```

Este paso solicita la creación de múltiples registros `TXT` en el DNS, así que corresponde crearlos, esperar a que se propaguen y continuar.

### Configuración del Servidor XMPP

Lo primero es asegurarse de tener un respaldo del archivo por defecto de configuración, en caso de que algo salga mal. Este archivo se encuentra en `/etc/prosody/prosody.cfg.lua`.

Luego de esto se modifica el contenido del mismo con lo que se muestra explicado a continuación:

```lua
-- Usuarios administradores separados por coma
admins = { "admin@dominio.tld", "admin2@dominio.tld" }

-- Ruta en la que se hayan descargado los módulos en el paso de instalación.
-- Ruta predeterminada: /usr/local/lib/prosody-modules
plugin_paths = { "/usr/src/prosody-modules" }

modules_enabled = {
	"roster";
	"saslauth"; -- Para el inicio de sesión
	"tls"; -- Permite conexiones TLS c2s/s2s
	"dialback";
	"disco"; -- Descubrimiento de servicios del servidor
	"carbons"; -- Permite sincronizar múltiples clientes
	"pep"; -- Permite al usuario compartir su perfil
	"smacks"; -- XEP 0198: útil para cuando se está en móvil
	"private"; -- Almacenamiento privado (para marcadores de grupos, etc.)
	"blocklist"; -- Listas de bloqueo
	"vcard4"; -- Perfiles de usuario
	"vcard_legacy"; -- Para soporte y conversión de vCard y PEP
	"version"; -- Indica la versión del servidor
	"uptime"; -- Muestra el uptime del servidor
	"time"; -- Permite conocer la hora en el servidor
	"ping"; -- Responde a PING XMPP con PONG
	"mam"; -- Almacenamiento de mensajes. Permite mantener un historial
	"csi_simple"; -- Soporte para que los clientes indiquen el estado del usuario
	"cloud_notify"; -- En el caso de iOS permite las notificaciones push
	"admin_adhoc"; -- Administración de XMPP por comandos ad-hoc
	"bookmarks"; -- Sincroniza los grupos/MUCs
	"posix"; -- Importante para logs
	"server_contact_info"; -- Publica información de contacto para el servidor
}

modules_disabled = {}

-- No permitir registros
-- Cambiar a true en caso de desear nuevos registros de usuarios
allow_registration = false

-- Permitir conexiones de los siguientes orígenes
-- Utilizado para el reverse proxy de nginx
trusted_proxies = { "127.0.0.1", "::1", "192.168.1.1", }

-- No modificar si se ejecuta bajo Systemd
daemonize = false;
pidfile = "/run/prosody/prosody.pid";

-- Cifrado entre cliente-servidor y servidor-servidor.
c2s_require_encryption = true
s2s_require_encryption = true
s2s_secure_auth = false

authentication = "internal_hashed"

-- Tiempo de expiración de mod_mam para los mensajes archivados
archive_expires_after = "1w" -- Una semana

log = {
	info = "/var/log/prosody/prosody.log";
	error = "/var/log/prosody/prosody.err";
	-- Syslog:
	{ levels = { "error" }; to = "syslog";  };
}

certificates = "/etc/prosody/certs"
-- No es necesario para configurar con reverse proxy
-- Especifica el certificado del servidor http interno
https_certificate = "/etc/prosody/certs/dominio.tld.crt"

VirtualHost "dominio.tld"
	certificate = "/etc/prosody/certs/dominio.tld.crt"

-- Permite conocer funcionalidades disponibles
disco_items = {
    {"uploads.dominio.tld", "file uploads"};
}

-- El componente necesario para compartir archivos a través de HTTP
Component "uploads.dominio.tld" "http_upload"
    -- Aquí especifico el puerto para que los clientes apunten al proxy
    -- Necesario si se quieren tener otros servicios bajo el puerto 443
    http_external_url = "https://uploads.dominio.tld:443"

Include "conf.d/*.cfg.lua"
```

Hay varios puntos que tener en cuenta respecto a la configuración:

- Es necesario modificar la configuración para que utilice el dominio correcto.
- Para tener los certificados en las rutas especificadas es necesario ejecutar el comando `sudo prosodyctl --root cert import /etc/letsencrypt/live`, que crea una copia de los certificados generados por Let's Encrypt. Más información sobre cómo configurar los certificados puede encontrarse [aquí](https://prosody.im/doc/certificates).
- Esta configuración asume que `https://uploads.dominio.tld` apunta a `nginx` como reverse proxy para que no sea necesario dejar abiertos los puertos HTTP de Prosody. También es posible cambiar los puertos de Prosody con `http_ports`[^http].
- Esta es una configuración básica y no se está haciendo uso de los backends de base de datos que permite Prosody, por lo que solo es recomendable para uso personal o de grupos pequeños.
- Existen otros módulos que se pueden habilitar según necesidad:
	- [Lista de módulos de Prosody IM](https://prosody.im/doc/modules)
	- [Módulos listados por XEP](https://prosody.im/doc/xeplist)
	- [Otros módulos](https://modules.prosody.im/)

Ahora con todo configurado, solo hace falta inicar el servidor, crear una cuenta nueva con estos comandos y conectar con nuestro cliente preferido:

```bash
sudo systemctl start prosody
sudo prosodyctl adduser usuario@dominio.tld
```

El servidor debe estar funcionando con la excepción de compartir archivos.

## Reverse Proxy con nginx

La configuración del reverse proxy de nginx la coloqué en un nuevo virtual host bajo `/etc/nginx/sites-available/uploads.dominio.tld`.

`/etc/nginx/sites-available/uploads.dominio.tld`

```
server {
    server_name uploads.dominio.tld;

    root /var/www/prosody/;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:5280;
    }

    location ~ /.well-known/acme-challenge {
        allow all;
    }

    listen [::]:443 ssl ipv6only=on;
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/dominio.tld/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/dominio.tld/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}

server {
        listen 80;
        listen [::]:80;
        server_name uploads.dominio.tld;

        if ($host = uploads.dominio.tld) {
                return 301 https://$host$request_uri;
        }

        return 404;
}
```

Las líneas más importantes son las de `proxy` que envían información del host al servidor HTTP de Prosody y hacen proxy del tráfico al puerto del mismo (`5280`).

Finalmente se habilita el virtual host con un symlink y se recarga la configuración de nginx:

```bash
sudo ln -s /etc/nginx/sites-available/uploads.dominio.tld \
/etc/nginx/sites-enabled/uploads.dominio.tld
sudo systemctl reload nginx
```

Al conectar al servidor ahora sí debe ser posible compartir archivos.

## Otras Tecnologías Consideradas

Estas son otras tecnologías que comencé a ver y/o prestar más atención con la ola de personas migrando de WhatsApp:

- Telegram: ya lo utilizaba por comunidades locales, aunque no sería mi alternativa preferida.
- Signal: entre las opciones centralizadas, me parece la menos peor.
- Matrix[^matrix]: otra plataforma de comunicación decentralizada, similar a XMPP.

- - -

Espero haya sido útil el artículo, a mí el simple hecho de conocer un poco más a fondo los distintos módulos y especificaciones de XMPP me hizo valorar más el potencial que tienen este tipo de soluciones.

Si quieres contactarme a través de XMPP también puedes hacerlo en ~~[beto@argonauts.space](xmpp:beto@argonauts.space)~~.

Gracias por leer.

- - -

[^xmpp-examples]: La página de XMPP cubre múltiples usos conocidos en distintas industrias, [lee más aquí](https://xmpp.org/uses/).

[^decentralizacion]: Más adelante estaré explicando un poco sobre decentralización en internet, mi punto de vista al respecto y cómo se puede saber más. Una fuente de recursos del tema sería [Decentralize.Today](https://dt.gl/tag/decentralization/).

[^muc]: Multi User Chat, un chat grupal o canal en XMPP.

[^http]: Documentación de HTTP de Prosody [https://prosody.im/doc/http](https://prosody.im/doc/http).

[^matrix]: Existen motivos tras la preferencia de XMPP sobre Matrix, entre ellos el tamaño de matrix.org en comparación a otros servidores de Matrix.

