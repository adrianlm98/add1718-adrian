# Actividad 2: Docker

## 1. Instalación y primeras pruebas.

Ejecutamos como superusuario los siguientes comandos:

~~~
zypper in docker              # Instala docker
systemctl start docker        # Inicia el servicio
                              # "docker daemon" hace el mismo efecto
docker version                # Debe mostrar información del cliente y del servidor
usermod -a -G docker USERNAME # Añade permisos a nuestro usuario
~~~

![img](./img/captura1.png)

![img](./img/captura2.png)

Salimos de la sesión actual y volvemos a entrar.

Ejecutamos con nuestro usuario los siguientes comandos.

![img](./img/captura3.png)

## 2. Configuración de la red

Habilitar el acceso a la red externa a los contenedores.

En yast -> Dispositivos de red -> Encaminamiento -> Habilitar reenvío IPv4

![img](./img/captura4.png)

Cuando la red está gestionada por Network Manager, en lugar de usar YaST debemos editar el fichero /etc/sysconfig/SuSEfirewall2 y poner FW_ROUTE="yes".

## 3. Crear un contenedor manualmente
