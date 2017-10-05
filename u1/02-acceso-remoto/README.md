# Conexiones remotas con VNC (OPENSUSE - WINDOWS)

## Instalación en Windows.

Configuramos la máquina con las configuraciones apropiadas.

* MAC

* IP

* Nombre de máquina

Necesitamos una máquina cliente y una servidor.

## Windows

Instalamos tightVNC Server desde la página oficial.

![img](./imagenes/windows-captura.png)

Una vez instalado nos aparecerá esta ventana y estará iniciado el servicio.

![img](./imagenes/windows-captura2.png)

Si el servicio no esta iniciado lo podremos inciar en inicio>tightVNC>start service.

![img](./imagenes/windows-configura3.png)

Una vez descargado e instalado iniciamos la máquina cliente e instalamos la tightVNC cliente.

![img](./imagenes/windows-cliente-vnc.png)

Abrimos el programa tightVNC-viewer y introducimos la ip y contraseña del tightVNC server.

![img](./imagenes/windows-viewer.png)

Comprobaciones :

![img](./imagenes/windows-comprobacion.png)


![img](./imagenes/windows-netstat.png)


![img](./imagenes/nmap-windows.png)

## OPENSUSE

Para instalar el servidor de vnc de opensuse nos dirigimos a yast y en el buscador escribimos vnc.

Entramos y instalamos con la siguiente configuración.

![img](./imagenes/opensuse1.1.png)

Cuando termine la instalación vamos a una terminal y ejecutamos el siguiente comando.

![img](./imagenes/opensuse1.png)

(Añadimos la contraseña que nosostros queramos.)

Ahora iniciamos nuestra máquina cliente y ejecutamos el siguiente comando para acceder al escritorio remoto.

![img](./imagenes/opensuse2.png)

## Comprobaciones:

![img](./imagenes/opensuse5.png)

![img](./imagenes/opensuse3.png)

![img](./imagenes/opensuse7.png)

![img](./imagenes/nmap-opensuse.png)

## Opensuse-Server / Windows-Cliente

![img](./imagenes/opensuse-windows-comp1.png)

![img](./imagenes/opensuse-windows-comp2.png)

## Windows-Server / Opensuse-Cliente

![img](./imagenes/windows-opensuse.png)

![img](./imagenes/netstat-nwindows.png)
