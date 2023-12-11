# Verificar si el contenedor existe
if sudo docker ps -a | grep -q "smart-shell-mongo"; then
    # Si existe, eliminar el contenedor
    sudo docker rm -f smart-shell-mongo
fi

# Creando archivo .env para variables de entorno
touch .env

# Creando el directorio data/db para almacenar los datos de la base de datos
mkdir -p data

# Limpiando el directorio data ( Eliminar archivos de persistencia del contenedor )
rm -rf data/*