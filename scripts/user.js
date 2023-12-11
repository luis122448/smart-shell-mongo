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