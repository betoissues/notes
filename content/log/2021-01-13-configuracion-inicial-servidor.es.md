+++
title = "Self-Hosted: Configuración Inicial del Servidor"
description = "Primeras tareas a realizar en la configuración de un servidor recién inicializado"
date = 2021-01-13
slug = "self-hosted-configuracion-inicial-servidor"
aliases = [
	"2021/01/self-hosted-configuracion-inicial-servidor",
	"/es/blog/self-hosted-configuracion-inicial-servidor"
]
+++
Como inicio de la serie [self-hosted](/2021/01/self-hosted-0-mis-alternativas/) el plan era comenzar con la instalación de los servicios directamente, pero ya que estaré también migrando a [Hetzner](https://www.hetzner.com) decidí hacer una lista de las tareas a realizar una vez inicializado el servidor.<!-- more -->

Por comodidad y replicar configuraciones existentes, el sistema operativo que estaré usando será Ubuntu 20.04 (no me ataquen), de igual manera las acciones se pueden tomar independientemente del SO.

Durante la creación del servidor me aseguro de configurar mi llave SSH para poder acceder con ella remotamente.

Una vez tengo acceso al servidor las acciones más sencillas y que siempre considero son:

- [Eliminar acceso SSH por contraseña y usuario root](#eliminar-acceso-ssh-por-contrasena-y-usuario-root)
- [Crear un usuario sin privilegios](#crear-un-usuario-administrativo)
- [Actualizar el servidor](#actualizar-el-servidor)
- [Configurar el firewall](#configurar-el-firewall)
- [Configurar fail2ban](#configurar-fail2ban)

## Eliminar acceso SSH por contraseña y usuario root

Para evitar el acceso por SSH como `root` cambio la configuración del servidor SSH para que no permita el acceso por contraseña ni el uso del usuario `root`.

Esto se realiza editando el archivo `/etc/ssh/sshd_config`, verificando que los valores de las siguientes opciones coincidan (recuerden usar vim como su editor por defecto):

```
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
PermitEmptyPasswords no
```

Una vez cambiadas las opciones, reinicio el servicio e intento conectar nuevamente.

```
# service sshd reload
```

_Código iniciado con # es ejecutado como root, mientras que el iniciado con $ es ejecutado sin privilegios_

No debería poder iniciar como `root`.

## Crear un usuario administrativo

Para las siguientes tareas y el resto de la configruación, creo un usuario administrativo que requiera de autenticación para ejecutar comandos como `root`, ya sea utilizando `sudo` o similares. Este usuario normalmente lo creo con un directorio en `/home`.

La creación básica la realizo con los comandos:
```
# useradd -m [user]
# usermod -aG sudo [user] # En caso de querer utilizar sudo con este usuario
```

A este usuario asigno mi llave pública en `~/.ssh/authorized_keys` y genero una contraseña con mi administrador de contraseñas para realizar tareas con `sudo`. Si pude acceder como `root`, utilizo el `authorized_keys` del mismo; funciona siempre y cuando vaya a usar la misma llave.

Una vez valido tener acceso con el usuario administrativo, cambio la contraseña de `root` a alguna generada y remuevo mis llaves SSH añadidas durante la configuración del servidor.


## Actualizar el servidor

Nunca está de más mantener nuestros sistemas actualizados y el mejor momento para actualizarlo es antes de instalar paquetes. Si actualizar en este estado rompe algo del sistema, creo que comenzaré a creer en la suerte; pero sí, es algo que no sucede con mucha regularidad.

Como es Ubuntu, la actualización se realiza con estos comandos:

```
sudo apt update
apt list --upgradable # Siempre reviso qué estoy por actualizar
sudo apt upgrade
```

Tanto bueno como malo, Hetzner incluye sus propios repositorios para algunos paquetes, siempre y cuando uses un SO de los que proveen por defecto. Si no lo deseas puedes removerlo de `/etc/apt/sources.list.d/hetzner-mirror.list`.

## Configurar el firewall

Antes de instalar paquetes e iniciar cualquier servicio que pueda exponer mi servidor, es muy importante configurar un firewall (o cortafuegos). Los comandos más comunes para configuración son `iptables` y `ufw`, yo utilizo el último por la facilidad con que se configura.

Inicialmente el firewall está desactivado y sin reglas, así que lo primero es bloquear todos los puertos, permitir el acceso por SSH y habilitar el firewall.

```
$ sudo ufw default deny
$ sudo ufw allow 22 # Puerto de SSH
$ sudo ufw enable
$ sudo ufw status # Con esto validamos las reglas activas
```

La dinámica es similar para cualquier otro servicio que se quiera habilitar utilizando `sudo ufw allow [puerto]`, que por defecto permite IPv4 e IPv6.

Si más adelante existe algún problema de conexión, probablemente es por falta de alguna regla en el firewall.

## Configurar fail2ban

[Fail2ban](https://www.fail2ban.org/wiki/index.php/Main_Page) es un software que funciona similar al `LIMIT` en un firewall, lo que restringe los intentos de conexión a un servicio específico.

Este software además agrega soporte a distintas aplicaciones como `apache2` y `nginx`, con lo que se pueden bloquear IPs basado en los logs de los servicios y hasta enviar reportes sobre estas incidencias a un correo electrónico.

Esta es una configuración sencilla y si no se requiere más, puede sustituirse con reglas del firewall. El caso más básico es limitar los intentos de acceso por SSH, baneando (bloqueando) por 10 minutos si se encuentran más de 5 intentos fallidos en su configuración por defecto.

Para habilitar el bloqueo de SSH agregamos el archivo `/etc/fail2ban/jail.local` con estas líneas:

```
[sshd]
enabled = true
port = 22
```

- - -

Existen otras medidas de seguridad para tomar y configuraciones como la de `ntp` que pueden resultar útiles durante la configuración inicial. Las medidas mencionadas arriba son solo un ejemplo y pueden variar según necesidad.

¿Y tú? ¿Qué tareas tienes en cuenta al momento de iniciar un servidor nuevo?
