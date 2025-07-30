import os
import duckdb
os.chdir("/Users/karthikdoguparthi/Downloads/Studies/Labmentix/UBER SUPPLY DEMAND GAPS/SQL")
con = duckdb.connect(database=':memory:')

with open("insights.sql", "r") as f:
    sql_script = f.read()

queries = [q.strip() for q in sql_script.split(';') if q.strip()]
for i, query in enumerate(queries, start=1):
    print(f"\nInsight {i-1}\n")
    result = con.execute(query).df()
    print(result)