![Logo del Projecto](./resources/logo.png)

# Despliegue Automatizado de Base de Datos Mongo con Docker

Este repositorio tiene como objetivo automatizar el despliegue de una base de datos Mongo en un contenedor de Docker, proporcionando una solución para el almacenamiento de archivos del proyecto Smart Shell.
  
## Configuracion del Entorno

1. **Clonar el Repositorio**

    ```bash
        git clone https://github.com/luis122448/smart-shell-mongo.git
    ```

2. **Ingresar al directorio del proyecto**

    ```bash
        cd smart-shell-mongo
    ```

3. **Ejecutar el script de instalación**
    
    ```bash
        sudo bash dev-install.sh
    ```

4. **Defina las credenciales en el archivo .env**
    ```bash
        nano .env
    ```
    
    ```env
        MONGO_USERNAME=''
        MONGO_PASSWORD=''
        MONGO_DATABASE=''
    ```

5. **Crear (si no existe) el network**
    ```bash
        sudo docker network create smart-shell-net
    ```

## Scripts

El directorio `scripts/init.js` contiene los scripts que se ejecutarán al iniciar el contenedor, en este caso se crea un usuario con permisos de administrador para la base de datos.

    ```javascript
        const password = process.env.MONGO_PASSWORD || "default_password"; // Obtener el password de la variable de entorno o utilizar uno por defecto
        db.createUser({
            user: "user-smart-shell",
            pwd: password,
            roles: [
                {
                    role: "readWrite",
                    db: "smart-shell"
                }
            ]
        });
    ```

## Despliegue en Producción

Para el despliegue en producción se ha utilizado Docker y Docker Compose, puede revisar el archivo docker-compose.yml para conocer los detalles de la configuración.
Asimismo no se olvide de modificar las variables de entono, en asi archivo .env

## Verificacion del despliegue

1. **Ingresando al contededor**
    ```bash
        sudo docker exec -it smart-shell-mongo bash
    ```

2. **Realizando conexion**
    ```bash
        mongosh --username <username> --password <password>
    ```

3. **Identificando la base de datos**
    ```bash
        use <database>
    ```

4. **Creando coleccion**
    ```bash
        db.createCollection("test")
    ```

5. **Insertar datos**
    ```bash
        db.test.insert({
        "nombre": "Ejemplo",
        "edad": 30,
        "email": "ejemplo@email.com"
        })
    ```

1. **Consultar datos**
    
    ```bash
        db.test.find()
    ```

## Cadena de Conexion
 Configuracion para un proyecto de JAVA con SPRING BOOT (application.properties).
    ```properties
        # Configuración de Mongo
        spring.data.mongodb.uri=mongodb://${MONGO_USERNAME}:${MONGO_PASSWORD}@localhost:27017/${MONGO_DATABASE}?retryWrites=true&w=majority
        spring.data.mongodb.database=${MONGO_DATABASE}
        spring.data.mongodb.username=${MONGO_USERNAME}
        spring.data.mongodb.password=${MONGO_PASSWORD}
    ```

## Contribuciones
Las contribuciones son bienvenidas. Siéntete libre de mejorar este proyecto, agregar nuevas características o corregir problemas identificados. Para contribuir, crea un Pull Request o abre un Issue.

## Licencia
Este proyecto está bajo la licencia MIT License.