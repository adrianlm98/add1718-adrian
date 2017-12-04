# Vagrant y VirtualBox
## 1. Instalación
Instalamos vagrant en la máquina real utilizando el siguiente comando:
apt-get install vagrant
Para comprobar la versión que tenemos instalada.

![img](./img/captura3.png)

## 2. Proyecto

Creamos un directo que utilizaremos para nuestro proyecto.

![img](./img/captura1.png)

Hacemos un vagrant init para crear el Vagrantfile y decirle a vagrant que este es el directorio que vamos a utilizar.

![img](./img/captura2.png)

## 2.1 Imagen, caja o box

Ahora obtenemos la imagen(caja,box) que vamos a utilizar para crear nuestra máquina.

![img](./img/captura4.png)

Ahora cambiamos la configuración del archivo vagrantfile eliminando las líneas comentadas para que sea más facil leerlo. Cambiamos config.vm.box = "base" por config.vm.box = "micaja13_ubuntu_precise32"

![img](./img/captura5.png)

![img](./img/captura6.png)

Creamos una copia de seguridad por si nos equivocamos podamos recuperar el archivo. Utilizamos el cp para copiar el archivo y cambiarle el nombre.

![img](./img/captura7.png)

## 2.2 Iniciar una nueva máquina

Iniciamos una nueva máquina virtuala usando el comando vagrant up:

![img](./img/captura9.png)

Utilizamos el comando vagrant ssh para conectarnos por ssh a la máquina virtual.

![img](./img/captura10.png)

## 3. Configuración del entorno virtual

Una vez conectados por ssh identificamos las carpetas compartidas dentro del entorno virtual.

![img](./img/captura11.png)

## 3.1 Redireccionamiento de los puertos

Instalamos apache.

![img](./img/captura12.png)

Modificamos el fichero vagrantfile y añadimos la siguiente línea de modo que el puerto 4567 del sistema anfitrión sea enrutado al puerto 80 del ambiente virtualizado.

![img](./img/captura13.png)

Luego hacemos un vagrant reload para recargar la configuración.

![img](./img/captura14.png)

Confirmamos que hay un servicio a la escucha en el puerto 4567, ejecutamos los siguiente comandos de la máquina real.

nmap -p 4500-4600 localhost

![img](./img/CAPTURA15.png)

netstat -ntap

![img](./img/captura16.png)

Comprobamos el acceso por navegador web.

![img](./img/captura17.png)

## 4. Suministro

Apagamos la máquina y la eliminamos con los siguientes comandos:

![img](./img/captura18.png)

## 4.1 Suministro mediante shell script

Creamos el siguiente scrip install_apache.sh dentro del proyecto.

![img](./img/captura19.png)

Modificamos vagrantfile y agregamos la siguiente línea.

![img](./img/captura20.png)

Volvemos a crear la MV.

![img](./img/captura21.png)

Para verificar que efectivamente el servidor Apache ha sido instalado e iniciado comprobamos via web la ip 127.0.0.1:4567

![img](./img/captura23.png)

## 4.2 Suministro mediante Puppet

Modificamos el archivo vagrantfile añadiendo la siguientes líneas.

![img](./img/captura25.png)

Creamos un fichero llamado default.pp en manifests con las siguiente líneas:

![img](./img/captura26.png)

Para aplicar los cambios  eliminamos la máquina y la volvemos a crear.

![img](./img/captura27.png)

## 5. Nuestra caja personalizada

## 5.1 Preparar la MV VirtualBox

Utilizamos una máquina reciclada y creamos el usuario vagrant para poder acceder a la máquina virtual por ssh.  Le agregamos una clave pública para autorizar el acceso sin clave desde vagrant.(Instalamos openssh-server si no lo tenemos instalado)

![img](./img/captura28.png)

![img](./img/captura29.png)

![img](./img/captura30.png)

![img](./img/captura31.png)

Ponemos la clave vagrant al usuario vagrant.

![img](./img/captura32.png)

Añadimos vagrant ALL=(ALL) NOPASSWD: ALL a /etc/sudoers.

![img](./img/captura33.png)

Nos aseguramos que tenemos instalado las VirtualBox Guest Additions con el siguiente comando:


![img](./img/carpeta34.png)

![img](./img/captura.png)

## 5.2 Crear la caja vagrant

Creamos una nueva carpeta mivagrant13conmicaja.

# FALTA

Ejecutamos vagrant init para crear el fichero de configuración nuevo.

Localizamos el nombre de nuestra máquina(ubuntu-mysql)

![img](./img/captura35.png)

Creamos la caja package.box a partir de la MV.

![img](./img/captura36.png)

Comprobamos que se ha creado la caja.

![img](./img/captura37.png)

![img](./img/captura38.png)

Añadimos la nueva caja que hemos creado como una nueva máquina virtual.

![img](./img/captura39.png)

Hacemos el vagrant init dentro de la carpeta de la nueva máquina y modificamos el vagrantfile que se crea para que utilice la nueva máquina.

![img](./img/captura40.png)

Iniciamos la máquina.

![img](./img/capt41.png)

Y nos conectamos por ssh con vagrant ssh.

![img](./img/captura44.png)
