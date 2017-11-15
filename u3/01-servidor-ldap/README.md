# Servicio de directorio - LDAP - OpenSuse

## 1. Instalación del Servidor LDAP

Instalamos los paquetes necesarios para la instalación de LDAP.

![img](./imagenes/captura1.png)

Vamos a yast y abrimos el servidor de autenticación.

Añadimos las siguientes configuraciones:

![img](./imagenes/captura2.png)

![img](./imagenes/captura3.png)

![img](./imagenes/captura4.png)

Añadimos el DN base y el administrador como en la captura.

![img](./imagenes/captura6.png)

![img](./imagenes/captuar7.png)

No habilitamos la autenticación por kerberos (más adelante lo activaremos).

![img](./imagenes/captura9.png)

Cuando realicemos todos los pasos la configuración quedaría de la siguiente manera.

![img](./imagenes/captura11.png)

Comprobaciones:

![img](./imagenes/captura12.png)

![img](./imagenes/captura13.png)

![img](./imagenes/captura15.png)

![img](./imagenes/captura16.png)

![img](./imagenes/captura17.png)

## 2. Crear usuarios y grupos LDAP

Añadimos el filtro LDAP en  Usuarios y grupos. Creamos un grupo llamado piratas2 y le añadimos los usuarios pirata21 y pirata22 que hemos creado previamente.

![img](./imagenes/captura18.png)

![img](./imagenes/captura41.png)

Comando para consultar en la base de datos LDAP la información de un usuario en concreto.

![img](./imagenes/captura40.png)

## 3. Cliente LDAP

### Comprobación :

![img](./imagenes/captura20.png)

![img](./imagenes/captura21.png)

![img](./imagenes/captura22.png)

![img](./imagenes/captura23.png)

### 3.1 Instalar cliente LDAP

Instalamos el paquete **yast2-auth-client**.

![img](./imagenes/captura24.png)

Y lo configuramos como en la siguiente captura: 

![img](./imagenes/captura27.png)

![img](./imagenes/captura28.png)

### 3.2 Comprobamos desde el cliente

![img](./imagenes/captura29.png)

### 3.3 Autenticación

Desde una máquina remota entramos con el usuario pirata21.

![img](./imagenes/captura30.png)

![img](./imagenes/captura31.png)
