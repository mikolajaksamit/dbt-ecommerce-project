from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'mikolaj',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

with DAG(
    'dbt_ecommerce_pipeline',
    default_args=default_args,
    description='Automatyczna orkiestracja hurtowni danych dbt',
    schedule_interval='0 2 * * *',
    start_date=datetime(2026, 7, 25),
    catchup=False,
    tags=['dbt', 'ecommerce', 'analytics'],
) as dag:



    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/dbt_ecommerce && dbt run --profiles-dir .'
    )


    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='cd /opt/airflow/dbt_ecommerce && dbt test --profiles-dir .'
    )


    dbt_run >> dbt_test