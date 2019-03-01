docker run -d -p 8080:8080 puckel/docker-airflow webserver

#Set SQL Alchemy connection
AIRFLOW_CONN_POSTGRES_MASTER=postgres://johan855:password@pg-docker:5432/master