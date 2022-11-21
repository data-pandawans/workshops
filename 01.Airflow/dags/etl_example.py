from datetime import datetime
import pandas as pd

from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator


def _transform_data():
    df = pd.read_json('/opt/airflow/datalake/bronze/launches.json')
    df.drop(columns='previous', inplace=True)
    df.to_csv('/opt/airflow/datalake/silver/launches.csv', index=False)

def _acurate_data():
    df = pd.read_csv('/opt/airflow/datalake/silver/launches.csv')
    new_df = pd.DataFrame(df.count())
    new_df.columns = ['number_of_rows']
    new_df.to_csv('/opt/airflow/datalake/gold/launches.csv')

with DAG(
    dag_id='etl_example',
    schedule_interval="@hourly",
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=['pandawans'],
) as dag:

    extract_load_data = BashOperator( 
        task_id="extract_load_data", 
        bash_command="curl -o /opt/airflow/datalake/bronze/launches.json -L 'https://ll.thespacedevs.com/2.0.0/launch/upcoming'",
    )

    transform_data = PythonOperator(
        task_id='transform_data',
        python_callable=_transform_data,
    )

    acurate_data = PythonOperator(
        task_id='enrich_data',
        python_callable=_acurate_data,
    )

    extract_load_data >> transform_data >> acurate_data
    