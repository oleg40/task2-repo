## To add data from new ad platforms
into this MCDM (assuming your BigQuery account is all set up):
- add your .csv file with raw data to the seeds/ directory;
- execute dbt seed. This will create tables in your BigQuery dataset;
- create a new file in the staging/ directory with a name stg_%platform name%.sql;
- in that file, write a SQL query to transform raw data per the structure file located in seeds/mcdm_paid_ads_basic_performance_structure.csv. Your .csv file can be referenced as {{ ref('filename')}}. For example, select * from {{ ref('src_ads_amzn')}};
- update the SQL query in models/marts/int_unioned.sql to include your new "stg_" file;
- execute dbt run;
Done. You can find the MCDM view in BigQuery in the fct_joined view.