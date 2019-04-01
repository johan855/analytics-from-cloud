# airflow will be on ~/.local/bin/
export AIRFLOW_HOME=~/airflow
export SLUGIFY_USES_TEXT_UNIDECODE=yes
pip3 install apache-airflow

# initialize the database
airflow initdb

# start web server on port 8080
airflow webserver -p 8080

# start the scheduler
airflow scheduler

---------------------------------
#Run Airflow container
docker pull puckel/docker-airflow

#Sequential executor:
docker run -d -p 8080:8080 -e LOAD_EX=y puckel/docker-airflow webserver

---------------------------------
#Run Airflow container
docker pull puckel/docker-airflow

#Sequential executor:
docker run -d -p 8080:8080 -e LOAD_EX=y puckel/docker-airflow webserver
