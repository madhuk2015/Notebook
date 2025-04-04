--!jinja

/*-----------------------------------------------------------------------------
Hands-On Lab: Intro to Data Engineering with Notebooks
Script:       deploy_notebooks.sql
Author:       Jeremiah Hansen
Last Updated: 6/11/2024
-----------------------------------------------------------------------------*/

-- See https://docs.snowflake.com/en/LIMITEDACCESS/execute-immediate-from-template

-- Create the Notebooks
use schema DEV_SCHEMA;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"{{DB}}"."DEV_SCHEMA"."{{DB}}_notebook_1"')
    FROM '@"DEMO_DB"."PUBLIC"."snowflake_extensions"/branches/{{branch}}/notebook_1/'
    QUERY_WAREHOUSE = '{{WH}}'
    MAIN_FILE = 'sample_code.ipynb';

ALTER NOTEBOOK "{{DB}}"."DEV_SCHEMA"."{{DB}}_notebook_1" ADD LIVE VERSION FROM LAST;
