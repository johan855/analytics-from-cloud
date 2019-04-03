import os
import sys
import logging
import requests
from decimal import *

sys.path.append(os.path.join(str(os.getenv("HOME")), 'python_scripts'))

import global_configuration
from helpers.database.lib import db_connection as db

logger = logging.getLogger('get articles')
logger.setLevel(logging.DEBUG)
if not logger.handlers:
    logger.setLevel(logging.DEBUG)
    handler = logging.StreamHandler()
    formatter = logging.Formatter('%(asctime)s-%(name)s-%(levelname)s-%(message)s')
    handler.setFormatter(formatter)
    logger.addHandler(handler)

con_yml_dict = {
    'db_user': global_configuration.DwhPsql.db_user,
    'db_passwd': global_configuration.DwhPsql.db_passwd,
    'db_name': global_configuration.DwhPsql.db_name,
    'db_host': global_configuration.DwhPsql.db_host
}

db_conn = db.DBconnection(config_path=con_yml_dict, schema='tipboard')
session = db_conn.get_session()


def get_growth_yoy():
    query = """
            query
            """
    query_response = session.execute(query).fetchall()
    growth_value = str(round(query_response[0][0], 4)*100)
    current_value = int(query_response[0][1])
    last_year_value = int(query_response[0][2])
    return growth_value, last_year_value, current_value


def get_tipboard_key():
    return tipboard_key

if __name__ == "__main__":
    domain = 'http://localhost:7272/'
    endpoint = 'api/v0.1/{0}/push'
    api_key = get_tipboard_key()
    url = domain + endpoint.format(api_key)

    growth_value, last_year_value, current_value = get_growth_yoy()
    data = {
        'tile': 'simple_percentage',
        'key': 'growth',
        'data': '{' + '"title": "Title",\
        "subtitle": "Subtitle",\
        "big_value": "{0}%",\
        "left_value": "",\
        "right_value": "",\
        "left_label":  "",\
        "right_label": ""'.format(growth_value) + '}'
            }

    response = requests.post('http://localhost:7272/api/v0.1/{0}/push'.format(api_key), data=data)
    session.close()
    if response.status_code != 200:
        logger.info('Http Error: {0}'.format(response.__dict__))
        exit(1)