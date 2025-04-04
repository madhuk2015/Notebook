--!jinja

/*-----------------------------------------------------------------------------
Hands-On Lab: Intro to Data Engineering with Notebooks
Script:       deploy_notebooks.sql
Author:       Jeremiah Hansen
Last Updated: 6/11/2024
-----------------------------------------------------------------------------*/

-- See https://docs.snowflake.com/en/LIMITEDACCESS/execute-immediate-from-template

-- Create the Notebooks
--USE SCHEMA {{env}}_SCHEMA;
use schema DEV_SCHEMA;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"{{DB}}"."DEV_SCHEMA"."{{DB}}_notebook_1"')
    FROM '@"DEMO_DB"."PUBLIC"."snowflake_extensions"/branches/"{{branch}}"/notebook_1/'
    QUERY_WAREHOUSE = '{{WH}}'
    MAIN_FILE = 'sample_code.ipynb';

ALTER NOTEBOOK "{{DB}}"."DEV_SCHEMA"."{{DB}}_notebook_1" ADD LIVE VERSION FROM LAST;
/*------------------------------
CREATE OR REPLACE NOTEBOOK IDENTIFIER('"DEMO_DB"."{{env}}_SCHEMA"."{{env}}_07_load_daily_city_metrics"')
    FROM '@"DEMO_DB"."INTEGRATIONS"."DEMO_GIT_REPO"/branches/"{{branch}}"/notebooks/07_load_daily_city_metrics/'
    QUERY_WAREHOUSE = 'DEMO_WH'
    MAIN_FILE = '07_load_daily_city_metrics.ipynb';

ALTER NOTEBOOK "DEMO_DB"."{{env}}_SCHEMA"."{{env}}_07_load_daily_city_metrics" ADD LIVE VERSION FROM LAST;
-----------------------------------*/
