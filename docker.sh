echo 'Permissão no arquivo docker'
sudo chmod 777 -R /var/run/docker.sock
echo 'Start Docker'
docker-compose start