from datetime import datetime

from airflow import DAG
from airflow.operators.python import PythonOperator

with DAG(
    dag_id='python_operator',
    schedule_interval="*/5 * * * *",
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=['pandawans'],
) as dag:
    def print_context(ds):
        print(ds)
        return 'Olá pandawans'

    run_this = PythonOperator(
        task_id='print_the_context',
        python_callable=print_context,
    )