#Run Airflow container
docker pull puckel/docker-airflow

#Sequential executor:
docker run -d -p 8080:8080 puckel/docker-airflow webserver

#Local executor
docker-compose -f docker-compose-LocalExecutor.yml up -d

#Celery executor
docker-compose -f docker-compose-CeleryExecutor.yml up -d