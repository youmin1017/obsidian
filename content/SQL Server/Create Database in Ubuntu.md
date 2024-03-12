---
tags:
  - mssql
---

## Installation

...

## Create New Database

**更改資料夾擁有者讓mssql能夠創建檔案**

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


### 資料庫中文

> *  筆劃順序用Chinese_Taiwan_Stroke_CI_AS
> *  注音順序用Chinese_Taiwan_Bopomofo_CI_AS
> Ref: [SQL Server - iT 邦幫忙::一起幫忙解決難題，拯救 IT 人的一天 (ithome.com.tw)](https://ithelp.ithome.com.tw/questions/10043601)