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

![img](./imagenes/ping-cliente-server.png)

![img](./imagenes/ping-cliente-cliente.png)




Cliente Windows

Añadimos en C:\Windows\System32\drivers\etc\hosts los equipos ssh-server13 y ssh-client13a.

![img](./imagenes/host-windows.png)

Hacemos ping a el servidor y al cliente linux.

![img](./imagenes/ping-windows.server.png)

![img](./imagenes/ping-windows-cliente.png)

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

Iniciamos sesión con el usuario adrian y ejecutamos ssh-keygen -t rsa.

![img](./imagenes/ssh-keygenclienta.png)

Ahora copiamos la clave pública del usuario adrian de la máquina ssh-client13a con ssh-copy-id

![img](./imagenes/añadirkeys.png)

#### Comprobación:

#### Linux

Entra directamente sin pedir contraseña.

![img](./imagenes/comprobarssh-cliente-a.png)

#### Windows

Entra y necesitas la contraseña.

![img](./imagenes/luis4-openssh-windows.png)

## 6. Uso de SSH como túnel para X

Instalamos una aplicación para probar el ssh como túnel en este caso geany.

![img](./imagenes/geany1.png)

Modificamos el fichero /etc/ssh/sshd_config *X11Fordwarding yes* para permitir la ejecución de aplicaciones gráficas.

![img](./imagenes/geany.png)

Ahora en el client13a comprobamos que geany no está instalado.

![img](./imagenes/app1.png)

Comprobamos que funciona.

![img](./imagenes/ssh-x-geany-1.png)

![img](./imagenes/ssh-x-geany-2.png)

## 7. Aplicaciones Windows nativas

Instalamos wine en el ssh-server13

    zypper install wine

Utilizamos el notepad como ejemplo.

![img](./imagenes/wine-notepad-3.png)

![img](./imagenes/wine-notepad-2.png)

![img](./imagenes/wine-notepad.png)

## 8. Restricciones de Uso

### Restricción sobre un usuario

Nos dirigimos al fichero /etc/ssh/sshd_config del servidor SSH y denegamos el usuario luis2.

![img](./imagenes/denyusers.png)

Comprobamos que no puede iniciar sesión con el usuario luis2.

![img](./imagenes/denyusers2.png)

### Restricción sobre una aplicación

Creamos un grupo llamado remoteapps y incluimos el usuario luis4 dentro del grupo.

![img](./imagenes/remoteapps.png)

Cambiar el grupo propietario de geany a remoteapps y añadimos los permisos para que los demás usuarios que no pertenezcan al grupo remoteapps no puedan utilizar geany.

![img](./imagenes/cambiarpermisos.png)

#### Comprobación:

![img](./imagenes/8.geany.png)

![img](./imagenes/8.1geany.png)

![img](./imagenes/8.3geany.png)
