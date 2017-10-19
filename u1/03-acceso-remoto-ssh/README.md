# Acceso remoto SSH

Necesitamos 3 MVs:

- Un servidor GNU/Linux OpenSUSE
- Un cliente GNU/Linux OpenSUSE
- Un cliente Windows7


## 1. Preparativos

### Servidor

Configuramos el servidor con la configuración correspondiente.

Añadimos en /etc/hosts los equipos ssh-client13a y ssh-client13b.

![img](./imagenes/hosts-server.png)

Comandos de verificación:

![img](./imagenes/ipa.png)

![img](./imagenes/route-n.png)

![img](./imagenes/ping.png)

![img](./imagenes/host.png)

![img](./imagenes/pingclientea.png)

![img](./imagenes/clienteb.png)






Creamos los usuarios luis1,luis2,luis3,luis4.

![img](./imagenes/crear-usuarios.png)

Cliente GNU/Linux

Añadimos en /etc/hosts los equipos ssh-server13 y ssh-client13b.

![img](./imagenes/hosts-clientea.png)

Hacemos ping a el servidor y al cliente windows.

![img](./imagenes/)




Cliente Windows

Añadimos en C:\Windows\System32\drivers\etc\hosts los equipos ssh-server13 y ssh-client13a.

Hacemos ping a el servidor y al cliente linux.

![img](./imagenes/)

## 2. Instalación del servicio ssh-server13

    zypper install openssh

![img](./imagenes/inst-ssh.png)

### Comprobación

Comprobamos que el servidor está encendido con systemctl status sshd.

![img](./imagenes/activar-ssh.png)

También podemos comprobarlo mirando los procesos del sistema con ps -ef|grep sshd.

![img](./imagenes/ps.png)

Hacemos ping al servidor y utilizamos el comando nmap(si no lo tenemos los instalamos con zypper install nmap) para ver en que puerto está escuchando el servidor ssh(puerto 22 por defecto).

![img](./imagenes/ping-ssh.png)

![img](./imagenes/nmap.png)

![img](./imagenes/nmap1.png)

Si no aparece el ssh tendriamos que configurar el cortafuegos.
Añadiendo en la zona externa el servidor ssh.

![img](./imagenes/firewall-ssh.png)

Comprobamos que el servicio está escuchando en el puerto 22

![img](./imagenes/netstat.png)
