Analytics on a GCP setup (UNDER CONSTRUCTION)
==========================
This repo contains the necessary scripts to deploy an analytics platform on a GCP VM with Ubuntu 18.04.

Features:
---------
- PostgreSQL database
- ETL platform with Airflow
- Forecasting with FB Prophet.
- Live dashboard using Tipboard

Main workflow:
--------------
1) Extract a woocommerce shop orders list using custom Python extractors
2) Use Airflow to schedule and run the extractions
3) Store the data in a PostgreSQL DB
4) Use FBProphet to analyse the DB
5) Report findings through a Tipboard dashboard