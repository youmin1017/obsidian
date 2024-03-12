---
tags:
  - python
  - pandas
---
> [!warning] 
> If you are using M series SOC, please read following note
> * [[Install pymssql in M Series macOS]] (Recommended)
> * [[Install pyodbc in M Series macOS]]

## Create Database Engine

### Config database credentials in `.env` file

```bash
# .env
DB_DRIVER_NAME = "mssql+pymssql"
DB_HOST = "xx.xx.xx.xx"
DB_PORT = "1433"
DB_NAME = ""
DB_USERNAME = ""
DB_PASSWORD = ""
DB_DRIVER = "ODBC Driver 18 for SQL Server"
```

### Load Environment Variables

There are two ways to load env

1. **Jupyter Notebook**

```python
%load_ext dotenv
%dotenv
```

2. **Python**

```python
from dotenv import load_dotenv

load_dotenv()
```

```python
from sqlalchemy import URL, create_engine

db_url_object = URL.create(
    drivername=os.getenv("DB_DRIVER_NAME", "mssql+pymssql"),
    username=os.getenv("DB_USERNAME"),
    password=os.getenv("DB_PASSWORD"),
    host=os.getenv("DB_HOST"),
    port=int(os.getenv("DB_PORT", 1433)),
    database=os.getenv("DB_NAME"),
)
engine = create_engine(db_url_object)
```

## Dataframe

### CSV to Dataframe

```python
data = pd.read_csv("C:\\Temp\\Sample.CSV", encoding="utf-8")
df = pd.DataFrame(data)
```

### Dataframe to SQL

```python
with engine.connect() as conn, conn.begin():
	df.to_sql("TableName", db, if_exists="replace", index=False)
data
```

### From SQL to dataframe

```python
with engine.connect() as conn, conn.begin():
    data = pd.read_sql_table("TableName", con=conn, schema="dbo")
data
```

