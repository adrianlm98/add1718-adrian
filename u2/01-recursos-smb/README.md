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

Configuramos la máquina con el nombre smb-cli13a y añadimos en el fichero hosts las demás máquinas que utilizamos en la practica.

![img](./imagenes/captura35.png)

![img](./imagenes/captura36.png)

### 3.1 Cliente GNU/Linux GUI

Creamos carpetas/archivos en castillo y en barco.

**castillo**

![img](./imagenes/captura44.png)

**barco**

![img](./imagenes/captura45.png)

Comprobamos que el recurso public es de sólo lectura.

![img](./imagenes/captura47.png)

Comandos de comprobación:

![img](./imagenes/captura48.png)

![img](./imagenes/captura49.png)

### 3.2 Cliente GNU/Linux Comandos

Comprobamos el uso de la siguientes herramientas:

![img](./imagenes/captura50.png)

![img](./imagenes/captura51.png)

Creamos la carpeta castillo y la montamos.

![img](./imagenes/captura54.png)

Comandos de comprobación:

![img](./imagenes/captura56.png)

![img](./imagenes/captura57.png)

### 3.3 Montaje automático

Para que se monte automáticamente necesitamos ir a **/etc/fstab** y escribir la siguiente línea.

![img](./imagenes/captura60.png)

Reiniciamos la máquina y comprobamos que ya tenemos montada la carpeta al iniciar.

![img](./imagenes/captura59.png)

### 4. Preguntas para resolver

* ¿Las claves de los usuarios en GNU/Linux deben ser las mismas que las que usa Samba?

No, es recomendable que sean diferentes para aumentar la seguridad de nuestro servidor.


* ¿Puedo definir un usuario en Samba llamado soldado3, y que no exista como usuario del sistema?

No necesitamos que esté creado en el sistema para poder logearnos con los usuarios que hemos enlazado al samba.Lo que si se puede hacer es denegar el usuario para que solo pueda entrar al samba y no al sistema.



* ¿Cómo podemos hacer que los usuarios soldado1 y soldado2 no puedan acceder al sistema pero sí al samba? (Consultar /etc/passwd)

Añadiendo en yast o en /etc/passwd la shell como /bin/false del usuario que queramos degenar el inicio en el sistema.




* Añadir el recurso [homes] al fichero smb.conf según los apuntes. ¿Qué efecto tiene?

Creamos un recurso compartido llamado *homes* que incluirá configuración sobre ese recurso compartido en concreto. (El fichero está en /etc/samba/smb.conf)
