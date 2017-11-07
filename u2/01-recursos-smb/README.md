# Instalación y configuración de servidor Samba

Necesitaremos las siguientes MVs:

* MV1: Un servidor GNU/Linux OpenSUSE con IP estática 172.18.13.31.

* MV2: Un cliente GNU/Linux OpenSUSE con IP estática 172.18.13.32.

* MV3: Un cliente Windows con IP estática 172.18.13.11.

## 1. Servidor Samba (MV1)

### 1.1 Preparativos

Comandos de comprobación:

![img](./imagenes/captura1)

### 1.2 Usuarios locales

Creamos los grupos *piratas*, *soldados* y *todos*. Creamos los usuarios *pirata1*, *pirata2*, *supersamba* (los añadimos al grupo *piratas*), *soldado1*, *soldado2* (los añadimos al grupo *soldados* junto con *supesamba*) y añadimos al grupo *todos* los usuarios que hemos creado anteriormente y el *smbguest*.

![img](./imagenes/captura4.png)

![img](./imagenes/captura5.png)

Ponemos los usuarios de samba dentro del grupo cdrom.

![img](./imagenes/captura61.png)

Creamos el usuario smbguest y modificamos la shell (/bin/false).

![img](./imagenes/captura3.png)

### 1.3 Crear las carpetas para los futuros recursos compartidos.

* Creamos la carpeta public.d con usuario propietario supersamba, grupo propietario todos y permisos 775.

* Creamos la carpeta castillo.d con usuario propietario supersamba, grupo propietario soldados y permisos 770.

* Creamos la carpeta barco.d con usuario propietario supersamba, grupo propietario piratas y permisos 770.

![img](./imagenes/captura7.png)

### 1.4 Configurar el servidor Samba

**Antes de cambiar la configuración hacemos una copia de seguridad del fichero de configuración**

![img](./imagenes/captura12.png)

![img](./imagenes/captura13.png)

Accedemos al yast y buscamos samba. Seguimos los pasos de la instalación.

![img](./imagenes/captura9.png)

![img](./imagenes/captura10.png)

Habilitamos el puerto de samba en el cortafuegos y el arranque automatico al iniciar la máquina.

![img](./imagenes/captura11.png)

### 1.5 Crear los recursos compartidos de Samba

Nos dirigimos al fichero de configuración :

    /etc/samba.smb.conf

Añadimos los recursos global,cdrom,public,castillo,barco con sus respectivas configuraciones.

![img](./imagenes/captura15.png)

**Comprobamos los resultados:**

![img](./imagenes/captura16.png)

![img](./imagenes/captura17.png)

### 1.6 Usuarios Samba

![img](./imagenes/captura18.png)

### 1.7 Reiniciar

Reiniciamos los servicios smb y nmb :

![img](./imagenes/captura19.png)

![img](./imagenes/captura21.png)

Comandos de comprobación :

![img](./imagenes/captura22.png)

![img](./imagenes/captura24.png)

## 2. Windows (MV3 smb-cli13b)

Configuramos el cliente Windows.(\etc\hosts)

![img](./imagenes/captura26.png)

![img](./imagenes/captura27.png)

### 2.1 Cliente Windows GUI

Accedemos a nuestro servidor desde "Red" - "\\ip-servidor"

Comandos de comprobación:

![img](./imagenes/captura28.png)

![img](./imagenes/captura31.png)

![img](./imagenes/captura29.png)

![img](./imagenes/captura30.png)

### 2.2 Cliente Windows comandos

Comandos de comprobación:

![img](./imagenes/captura39.png)

![img](./imagenes/captura38.png)

![img](./imagenes/captura40.png)

![img](./imagenes/captura41.png)

![img](./imagenes/captura43.png)

## 3. Cliente GNU/Linux (MV2 smb-cli31a)
