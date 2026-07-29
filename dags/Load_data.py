import os
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine('postgresql://admin:adminpassword@127.0.0.1:5433/ecommerce_db')


data_folder = '.'


for filename in os.listdir(data_folder):
    if filename.endswith('.csv'):
        file_path = os.path.join(data_folder, filename)


        table_name = filename.replace('.csv', '').lower()

        print(f"⏳ Ładowanie pliku {filename} do tabeli '{table_name}'...")

        # Czytanie pliku CSV przez Pandas
        df = pd.read_csv(file_path)

        # Wypychanie danych do bazy PostgreSQL
        df.to_sql(table_name, engine, if_exists='replace', index=False)

        print(f"✅ Sukces: Tabela '{table_name}' została załadowana! (Wierszy: {len(df)})")

print("🎉 Wszystkie dane są już w bazie. Hurtownia danych gotowa do pracy!")