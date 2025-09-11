# Automated MongoDB Database Deployment with Docker

This repository aims to automate the deployment of a MongoDB database in a Docker container, providing a solution for storing binary files for the Smart-Shell (Electronic Invoicing) and Platform-Training (Training Platform) projects.

## Related Repositories

### Current Repository
- [Smart-Shell-Mongo](https://github.com/luis122448/smart-shell-mongo)

### Related Repositories

Repositories related to the BACKEND and FRONTEND of the Smart-Shell and Platform-Training applications.
- [Smart-Shell-Angular](https://github.com/luis122448/smart-shell-angular)
- [Smart-Shell-SpringBoot](https://github.com/luis122448/smart-shell-springboot)
- [Platform-Training-Angular](https://github.com/luis122448/platform-training-angular)
- [Platform-Training-SpringBoot](https://github.com/luis122448/platform-training-springboot)

Repositories related to deployment automation.
- [Smart-Shell-Bash](https://github.com/luis122448/smart-shell-bash)

Repositories related to other databases of the Smart-Shell project.
- [Smart-Shell-Postgres](https://github.com/luis122448/smart-shell-postgres)
- [Smart-Shell-Redis](https://github.com/luis122448/smart-shell-redis)

## Environment Setup

1.  **Clone the Repository**

    ```bash
    git clone https://github.com/luis122448/smart-shell-mongo.git
    ```

2.  **Enter the project directory**

    ```bash
    cd smart-shell-mongo
    ```

3.  **Run the installation script**

    ```bash
    sudo bash install.sh
    ```

4.  **Define the credentials in the .env file**
    ```bash
    nano .env
    ```

    ```env
    MONGO_USERNAME=''
    MONGO_PASSWORD=''
    MONGO_DATABASE=''
    ```

5.  **Create the network (if it doesn't exist)**
    ```bash
    sudo docker network create smart-shell-net
    ```

## Scripts

The `init-scripts/00 - USER.js` directory contains the scripts that will be executed when the container starts. In this case, a user with administrator permissions is created for the database.

```javascript
const password = process.env.MONGO_PASSWORD || "default_password"; // Get the password from the environment variable or use a default one
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

## Production Deployment with Docker

For production deployment, Docker and Docker Compose have been used. You can review the `docker-compose.yml` file for configuration details.
Also, don't forget to modify the environment variables in your `.env` file.

## Deploying with Kubernetes

For a more robust and scalable deployment, you can use Kubernetes. The `kubernetes` directory contains the necessary manifests to deploy this application in a Kubernetes cluster.

For detailed instructions, please refer to the [Kubernetes Readme](./kubernetes/kubernetes-readme.md).

## Verifying the Deployment

### Installing `mongosh`

To connect to the MongoDB database, you will need the MongoDB Shell, `mongosh`. You can install it by following the official instructions for your operating system:

- [Install `mongosh` on Linux](https://www.mongodb.com/docs/mongodb-shell/install/#std-label-mdb-shell-install)
- [Install `mongosh` on Windows](https://www.mongodb.com/docs/mongodb-shell/install/#std-label-mdb-shell-install-windows)
- [Install `mongosh` on macOS](https://www.mongodb.com/docs/mongodb-shell/install/#std-label-mdb-shell-install-macos)

### Connecting to the database

1.  **Accessing the container**
    ```bash
    sudo docker exec -it smart-shell-mongo bash
    ```

2.  **Connecting to the database**
    ```bash
    mongosh --username <username> --password <password>
    ```

3.  **Identifying the database**
    ```bash
    use <database>
    ```

4.  **Creating a collection**
    ```bash
    db.createCollection("test")
    ```

5.  **Inserting data**
    ```bash
    db.test.insertOne({
        "name": "Example",
        "age": 30,
        "email": "example@email.com"
    })
    ```

6.  **Querying data**

    ```bash
    db.test.find()
    ```

## Connection String
Configuration for a JAVA project with SPRING BOOT (application.properties).

```bash
# Mongo Configuration
spring.data.mongodb.uri=mongodb://${MONGO_USERNAME}:${MONGO_PASSWORD}@localhost:27017/${MONGO_DATABASE}?retryWrites=true&w=majority
spring.data.mongodb.database=${MONGO_DATABASE}
spring.data.mongodb.username=${MONGO_USERNAME}
spring.data.mongodb.password=${MONGO_PASSWORD}
```

## Contributions
Contributions are welcome. Feel free to improve this project, add new features, or fix identified issues. To contribute, create a Pull Request or open an Issue.

## License
This project is under the MIT License.
