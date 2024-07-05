---
tags:
  - mssql
---

## Installation

...

## Create New Database

**更改資料夾擁有者讓mssql能夠創建檔案**

## Linux 

```bash
chown mssql /home/user/db/mssql
```

```sql
create DATABASE OD on
(
name = OD_data,
FILENAME = '/home/user/db/mssql/OD.mdf',
SIZE = 10,
filegrowth = 5
)
LOG ON
(
name = OD_log,
FILENAME = '/home/user/db/mssql/OD.ldf',
SIZE = 10,
filegrowth = 5
)
collate Chinese_Taiwan_Stroke_CI_AS -- 中文
go
```

## Windows

```sql
DECLARE @db           NVARCHAR(50) = 'BaaS'
DECLARE @db_base      NVARCHAR(150) = 'C:\database\' + @db + '\'
DECLARE @db_data_path NVARCHAR(150) = @db_base + @db + '.mdf'
DECLARE @db_log_path  NVARCHAR(150) = @db_base + @db + '.ldf'
DECLARE @db_data      NVARCHAR(150) = @db + '_data'
DECLARE @db_log       NVARCHAR(150) = @db + '_log'

DECLARE @query NVARCHAR(1000) = FORMATMESSAGE(
        N'create DATABASE %s on
(
name = ''%s'',
FILENAME = ''%s'',
SIZE = 10,
filegrowth = 5
)
LOG ON
(
name = ''%s'',
FILENAME = ''%s'',
SIZE = 10,
filegrowth = 5
)
collate Chinese_Taiwan_Stroke_CI_AS -- 中文'
    , @db, @db_data, @db_data_path, @db_log, @db_log_path)

SELECT @query as 'Query'

-- 確認無誤後再執行
-- EXEC (@query)
go
```

### 資料庫中文

> *  筆劃順序用Chinese_Taiwan_Stroke_CI_AS
> *  注音順序用Chinese_Taiwan_Bopomofo_CI_AS
> Ref: [SQL Server - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天 (ithome.com.tw)](https://ithelp.ithome.com.tw/questions/10043601)