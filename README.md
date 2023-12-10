![Logo del Projecto](./resources/logo.png)

# Despliegue Automatizado de Base de Datos Mongo con Docker

Este repositorio tiene como objetivo automatizar el despliegue de una base de datos Mongo en un contenedor de Docker, proporcionando una solución para el almacenamiento de archivos.
  
## Desplegando con DOCKER COMPOSE

1. **Clonar el Repositorio:**

    ```bash
        git clone https://github.com/yourusername/mongo-db-container.git
    ```

2. **Ingresar al directorio del proyecto**

    ```bash
        cd mongo-db-container
    ```

3. **Ejecutar el script de instalación**
    
    ```bash
        sudo bash dev-install.sh
    ```

4. **Defina las credenciales en el archivo .env**
    
    ```bash
        MONGO_USER=''
        MONGO_PASSWORD=''
        MONGO_DATABASE=''
    ```

5. **Crear (si no existe) el network**
    ```bash
        docker network create smart-shell-net
    ```

## Scripts

The `scripts/init.js` file contains initialization scripts for the MongoDB container. These scripts are run when the container is started. You can modify this file to set up initial collections, indexes, or seed data.

## Despliegue en Producción

Para el despliegue en producción se ha utilizado Docker y Docker Compose, puede revisar el archivo docker-compose.yml para conocer los detalles de la configuración.
Asimismo no se olvide de modificar las variables de entono, en asi archivo .env


## Verificacion del despliegue

1. **Conexion al CONTENEDOR**
    ```bash
        docker exec -it mongo-smart-shell bash
    ```

2. **Conexión a la BASE DE DATOS de Redis**
    ```bash
        mongo --username <username> --password <password> --authenticationDatabase <database> --host <ip_del_servidor>:<puerto>
    ```

3. **Auhenticando**
    ```bash
        use mi_basededatos
    ```

4. **Verificando conexion**
    ```bash
        db.createCollection("mi_coleccion")
    ```

5. **Informacion del servidor**
    ```bash
        db.mi_coleccion.insert({
        "nombre": "Ejemplo",
        "edad": 30,
        "email": "ejemplo@email.com"
        })
    ```

1. **Ejecutar el script de despliegue**
    
    ```bash
        db.mi_coleccion.find()
    ```

## Cadena de Conexion
 Configuracion para un proyecto de JAVA con SPRING BOOT (application.properties).
    ```properties
        # Configuración de Mongo
        spring.redis.host=${REDIS_HOST:localhost}
        spring.redis.port=${REDIS_PORT:6379}
        spring.redis.password=${REDIS_PASSWORD:mysecurepassword}
    ```

## Contribuciones
Las contribuciones son bienvenidas. Siéntete libre de mejorar este proyecto, agregar nuevas características o corregir problemas identificados. Para contribuir, crea un Pull Request o abre un Issue.

## Licencia
Este proyecto está bajo la licencia MIT License.