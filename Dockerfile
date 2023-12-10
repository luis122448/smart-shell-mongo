FROM mongo
LABEL luis122448 <luis122448gmail.com>

# Opcional: Define un directorio para persistir datos de MongoDB en el contenedor
VOLUME /data/db

# Opcional: Expone el puerto por defecto de MongoDB (27017)
EXPOSE 27017

# Comando que se ejecutará al iniciar el contenedor
CMD ["mongod"]
