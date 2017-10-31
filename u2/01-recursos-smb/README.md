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

# **falta captura de los usuarios de samba dentro de cdrom**

Creamos el usuario smbguest y modificamos la shell (/bin/false).

![img](./imagenes/captura3.png)

### 1.3 Crear las carpetas para los futuros recursos compartidos.

* Creamos la carpeta public.d con usuario propietario supersamba, grupo propietario todos y permisos 775.

* Creamos la carpeta castillo.d con usuario propietario supersamba, grupo propietario soldados y permisos 770.

* Creamos la carpeta barco.d con usuario propietario supersamba, grupo propietario piratas y permisos 770.

![img](./imagenes/captura7.png)

### 1.4 Configurar el servidor Samba
