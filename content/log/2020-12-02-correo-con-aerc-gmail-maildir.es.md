+++
title = "Configuración de aerc offline y Gmail con Maildir"
description = "Configurar aerc, mbsync y msmtp como cliente de correo offline para Gmail"
date = 2020-12-02 
slug = "correo-aerc-offline-gmail-maildir"
aliases = [
	"2020/12/correo-aerc-offline-gmail-maildir",
	"/es/blog/correo-aerc-offline-gmail-maildir",
]
+++
Para los que no saben, siempre estoy buscando alternativas CLI (línea de comando) para mi uso cotidiano, el porqué puedo explicarlo en otro artículo. Entre tantas de soluciones, comencé a utilizar [**aerc**](https://aerc-mail.org/) hace algunos meses, un cliente para correo electrónico.<!-- more -->

A diferencia de __mutt__ que también he utilizado antes, `aerc` es muy sencillo de configurar y con el _wizard_ que trae para conexión, es fácil añadir cuentas nuevas. La primera vez que lo utilicé me pareció chévere, directo del wizard a sincronizar mis correos de Gmail con IMAP y pare de contar; similar a cualquier otro cliente de correos (ej. Thunderbird).

Como ya les contaré en otra serie de artículos, soy un poco inconforme (o desconfiado) con las soluciones que ofrecen las grandes empresas a través de internet, por lo que he intentando "independizarme" un poco. Uno de los pocos servicios que desafortunadamente utilizo es Gmail.

En mi camino a separarme un poco de Gmail y gracias a páginas en internet hablando al respecto, decidí configurar [**Maildir**](https://en.wikipedia.org/wiki/Maildir) en `aerc` para trabajar con mi correo localmente. Esto me permite acceder a mis correos sin necesidad de estar conectado a internet (a diferencia de IMAP) y si así lo deseo eliminar cualquier copia de mis correos que se encuentren en sus servidores.

A continuación los pasos (resumidos) que seguí para tener esta configuración.

## Configurar isync para obtener los correos

Para esto lo primero que necesito son mis correos, así que comencé por instalar [isync](https://isync.sourceforge.io/) (el ejecutable es `mbsync`), un programa que se conecta a través de IMAP y sincroniza una copia local utilizando Maildir, que consiste básicamente archivos de texto y directorios.

La configuración que coloqué es muy similar a la de [ArchWiki](https://wiki.archlinux.org/index.php/Isync), aunque con algunas opciones menos y con la diferencia de que separé en distintos canales mi inbox, la papelera y los mensajes enviados.

La configuración más importante es luego de obtener la autenticación; y consiste en el mapeo de las carpetas remotas con las de mi local. Gmail crea sus carpetas por defecto bajo [Gmail]/\*, lo cual resulta un poco incómodo para escribir e interactuar en general.

El mapeo quedó algo así (izquierda local, derecha remoto):
- Inbox: el INBOX por defecto de Gmail
- Mismo nombre que el remoto: todo excepto [Gmail]/\*, papelera y enviados
- sent: [Gmail]/Sent Mail
- trash: [Gmail]/Trash

```
MaildirStore personal-local
SubFolders Verbatim
Path ~/.mail/personal/
Inbox ~/.mail/personal/Inbox

Channel personal-inbox
Master :personal-remote:
Slave :personal-local:
Patterns * ![Gmail]* !trash !sent

Channel personal-sent
Master :personal-remote:"[Gmail]/Sent Mail"
Slave :personal-local:sent

Channel personal-trash
Master :personal-remote:"[Gmail]/Trash"
Slave :personal-local:trash

Group personal
Channel personal-inbox
Channel personal-sent
Channel personal-trash
```

Para mantener sincronizados los correos habilité las unidades de systemd que muestra la ArchWiki, al igual que el bonus de utilizar `goimapnotify` para ejecutar la sincronización cada vez que llega un correo. No es realmente necesario, pero de otra manera tendría que esperar los 5 minutos o ejecutarlo manual luego de mostrarse la notificación de correos que ya tengo en mi `polybar`; solo una comodidad.

Luego de tener esto configurado, fue necesario indicar a `aerc` que leyera los correos de Maildir en la ruta especificada según lo documentado en aerc-maildir(5). Esta línea va en `~/.config/aerc/account.conf`.

```
source = maildir://~/.mail/personal
```

_Como paréntesis, aerc-maildir(5) se refiere a aerc-maildir en la sección 5 del manual, la cual se puede acceder mediante `man aerc-maildir`_

## Enviando los correos con msmtp

Ya que la configuración para descargar los correos estaría separada de `aerc`, opté por también configurar [msmtp](https://marlam.de/msmtp/) como cliente SMTP, de esta manera podría utilizarlo directamente o con cualquier otro programa con el que desee enviar correos.

La configuración de `msmtp` no puede ser más sencilla que rellenar un archivo en `~/.config/msmtp/config` con la información necesaria del servidor SMTP.

Para enviar los correos desde `aerc` usando `msmtp`, nos basamos en la configuración de aerc-sendmail(5) y agregamos el valor de outgoing al `~/.config/aerc/accounts.conf`. Incluyo el resultado de configuración de la cuenta "Personal".

```
[Personal]
source = maildir://~/.mail/personal
outgoing = /usr/bin/msmtp
default  = Inbox
from     = Nombre de Muestra <mail@example.com>
copy-to  = sent
archive  = Storage
folders-sort = Inbox,sent,trash,Storage
```
(La ruta va a depender de donde hayas instalado msmtp)


## Algunas consideraciones


### Marcar como eliminados

Trabajar con un cliente de correo (`aerc` en este caso) y Gmail requiere tener en cuenta una mecánica no muy estándar por parte de Google; y es que marcar los correos como "eliminados" no los enviará a la papelera ni los removerá. 

En el caso de Gmail los mensajes marcados como "eliminados" son despojados de sus labels (etiquetas) y guardados en "[Gmail]/All Mail". Para poder eliminar los mensajes con un cliente de correo, es necesario moverlos a la carpeta "[Gmail]/Trash" ("trash" luego del mapeo); esto los eliminará de cualquiera otra carpeta y removerá los labels.

Esto es válido, por ejemplo, si utilizas la aplicación de correo que provee iOS por defecto. En la configuración de la cuenta debes poder elegir que sucede con estas acciones.

### Atraso en la actualización

Entre mis observaciones también tengo pendiente solucionar que mis mensajes movidos a la papelera siguen estando marcados como "No Leídos". Esto se debe a que luego de leerlos, el servidor remoto no se actualiza inmediatamente y al moverlos posteriormente a la papelera, siguen estando marcados como "No Leídos".

No es algo que me incomode, pero sí me gustaría asegurarme de que si muevo algo a la papelera es porque lo he leído, solo para prevenir errores.

## Próximos pasos

Lo siguiente que quiero hacer con mi configuración de correo es habilitar backups de Maildir, ya sea mensuales, semestrales o anuales y eliminarlos por completo de mi cuenta de Gmail.

Esto cumple 3 propósitos:

1. Recuperar espacio de mi inbox
2. "Creer" que realmente estoy eliminando mis correos de sus servidores
3. Facilidad de migración si en algún momento llego a configurar mi propio servidor de correo.

Otra cosa que me gustaría hacer, pero no estoy muy seguro de cómo todavía, es extraer los PDF adjuntos de ciertas carpetas de correo. Así no quedó con respaldo de documentos importantes en el correo (eso no es repaldo), sino que puedo moverlos a una ubicación más segura.

- - - - -
Gracias por haber leído y espero les haya sido de ayuda. Cualquier consulta al respecto, dejo el cuadro de comentarios debajo; también pueden contactarme en cualquier a mis redes sociales o correo.

Por cierto, ahora estoy utilizando un poco más Mastodon, así que si se animan pueden seguirme por allá también, donde publico más seguido en qué estoy cada día. Este es mi perfil [@betoissues@fosstodon.org](https://fosstodon.org/@betoissues)

- - - - -

_De ahora en adelante estaré haciendo más posts como este, compartiendo en lo que estoy en el momento y con un tono un poco más casual porque así siento que me consume menos escribir. Así que es probable que publique más seguido y los artículos sean al estilo "journal" o diario._
