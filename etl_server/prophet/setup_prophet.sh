docker build -t ubuntu-prophet -f Dockerfile .
docker run -it --name prophet-docker ubuntu-prophet
#docker start prophet-docker && docker attach prophet-docker
