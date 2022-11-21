from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id='bash_operator',
    schedule_interval="* 1 * * *",
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=['pandawans'],
) as dag:
    
    view_directory = BashOperator( 
        task_id="view_dir", 
        bash_command="pwd",
     )

    download_launches = BashOperator( 
        task_id="download_launches", 
        bash_command="curl -o /opt/airflow/datalake/bronze/launches.json -L 'https://ll.thespacedevs.com/2.0.0/launch/upcoming'",
     )

    notify = BashOperator(
        task_id="notify",
        bash_command='echo "There is $(ls /opt/airflow/datalake/bronze/ | wc -l) file."'
    )

    view_directory >> download_launches >> notify