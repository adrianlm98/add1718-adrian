# Servidor de Impresión en Windows

## 1. Impresora compartida
### 1.1 Rol impresión

Instalamos rol/función de servidor de impresión en el servidor.
(Incluimos la impresión por internet)

Agregamos la características servicios de impresión y documentos.

![img](./imagenes/captura2.png)

Seleccionamos los servicios de rol:

- Servidor de impresión
- Impresión en internet

![img](./imagenes/captura3.png)

Tambien en los servicios de roles añadimos el servidor web.

![img](./imagenes/captura5.png)

![img](./imagenes/captura6.png)



### 1.2 Instalar impresora PDF

Instalamos PDFCreator de la página oficial . www.pdfcreator.es. Este programa no tiene autosave, pero tiene una carpeta por defecto para guardar los pdf que es Documentos.

![img](./imagenes/captura1.png)

### 1.3 Probar la impresora en local

Para probar la "impresora local" creamos un archivo con un editor de texto por ejemplo bloc de notas.

![img](./imagenes/captura6.1.png)

Después de "imprimir" el archivo se nos abre el PDFCreator para que digamos donde queremos guardar el pdf. Por defecto se abre en documentos.

![img](./imagenes/prueba.png)

Y una vez guardado automaticamente se nos abre el PDFcreator para mostrarnos el pdf.

![img](./imagenes/captura6.3.png)

### 1.4 Compartir por red

Compartimos la impresora en panel de control -> Dispositivos e impresoras  y la buscamos y la compartimos (botón derecho-> propiedades -> Compartir)

![img](./imagenes/captura7.png)

En el cliente buscamos el recurso de red del servidor \\172.18.13.22

![img](./imagenes/captura7.2.png)

Nos conectamos:

botón derecho -> conectar

## 2. Acceso web

No necesitamos instalar las características de impresión Web porque ya la hemos instalado previamente.

### 2.1 Configurar impresión web

En el cliente accedemos a la siguiente dirección web http://luis13s/printers y nos aparecerá un entorno para gestionar las impresora (cola de impresión, configuración...)

![img](./imagenes/captura10.png)

![img](./imagenes/captura9.png)

Para imprimir desde la red en esa impresora compartida utilizando la URL debemos seguir los siguientes pasos:

En propiedades copiamos el link *Nombre de red*

![img](./imagenes/captura10.2.png)

Después agregamos la impresora.

Panel de control -> dispositivos e impresión -> añadir impresora.

Seleccionamos una impresora compartida por nombre(Añadimos la URL que hemos copiado anteriormente):

![img](./imagenes/captura11.png)

![img](./imagenes/captura12.png)

Una vez echo esto se nos quedará dos impresoras enlazadas que en realidad es la misma pero enlazada de dos maneras diferentes (Una por recursos compartidos y la otra por impresora en red - URL)

![img](./imagenes/captura14.png)

### 2.2 Comprobar desde el navegador

Para realizar la prueba primero pausamos todos los trabajos que está realizando la impresora. Y añadimos un documento a "imprimir" .



![img](./imagenes/captura13.png)

Reanudamos la cola de impresión.

![img](./imagenes/captura15.png)

Y nos deberia aparecer el archivo abierto como pdf en el servidor o si usastes PDFcreator estará guardado en la carpeta documentos.

![img](./imagenes/captura16.png)

![img](./imagenes/captura17.png)
