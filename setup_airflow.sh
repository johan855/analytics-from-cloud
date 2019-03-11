#Run Airflow container
docker pull puckel/docker-airflow

#Sequential executor:
docker run -d -p 8080:8080 -e LOAD_EX=y puckel/docker-airflow webserver
