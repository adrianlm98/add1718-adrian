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

![img](./imagenes/lsblk.png)

![img](./imagenes/blkid.png)






Creamos los usuarios luis1,luis2,luis3,luis4.

![img](./imagenes/crear-usuarios.png)

Cliente GNU/Linux

Añadimos en /etc/hosts los equipos ssh-server13 y ssh-client13b.

![img](./imagenes/hosts-clientea.png)

Hacemos ping a el servidor y al cliente windows.

![img](./imagenes/)




Cliente Windows

Añadimos en C:\Windows\System32\drivers\etc\hosts los equipos ssh-server13 y ssh-client13a.

![img](./imagenes/)

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

### Conexión ssh

#### Cliente 1(linux)

Nos conectamos desde el client1 al servidor mediante ssh luis1@ssh-server13

![img](./imagenes/login-ssh-luis1-linux.png)

![img](./imagenes/login-ssh-luis2-linux.png)

$HOME/.ssh/known_hosts

![img](./imagenes/ssh.png)

#### Cliente 2(windows)

![img](./imagenes/luis1-windows.png)

![img](./imagenes/ssh-luis2.png)

## 3. Cambiamos las claves del servidor

Nos dirigimos a /etc/ssh

![img](./imagenes/ls-l-linux.png)

Modificamos el fichero sshd_config y dejamos una única linea : HostKey /etc/ssh/ssh_host_rsa_key,  las demás lineas que tengan HostKey la comentamos.

![img](./imagenes/sshd_config.png)

### Regenerar certificados

Vamos a renovar las claves públicas/privadas de nuestro servidor.

Nos dirigimos a ssh-server y escribimos el siguiente comando:

    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

(No añadimos ninguna contraseña)

![img](./imagenes/ssh-keygen.png)

Reiniciamos el servicio ssh-keygen y comprobamos que está activo una vez reiniciado.

![img](./imagenes/systemctlsshd.png)

## 4. Personalizar prompt Bash

Cambiamos el prompt de luis1 en /home/luis1/.bashrc al iniciar sesión por ssh.

![img](./imagenes/prompt.png)

Creamos un alias en /home/luis1/.alias y ponemos los siguiente

![img](./imagenes/alias.png)

#### Comprobación:

![img](./imagenes/comprobaralias.png)

## 5. Autenticación mediante claves públicas

Iniciamos sesión con el usuario adrian y ejecutamos
    ssh-keygen -t rsa
