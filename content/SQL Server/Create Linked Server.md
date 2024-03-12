---
tags:
  - mssql
---

```sql
declare @linkedServerName nvarchar(255) = ''  
declare @remoteUser nvarchar(255) = ''  
declare @remotePassword nvarchar(255) = ''  
declare @remoteServerIP nvarchar(255) = ''  
exec sp_addlinkedserver  
     @server = @linkedServerName,  
     @srvproduct = N'SQL Server';  
  
exec sp_setnetname @linkedServerName, @remoteServerIP;  
exec sp_addlinkedsrvlogin  
     @rmtsrvname = @linkedServerName,  
     @useself = 'false',  
     @rmtuser = @remoteUser, @rmtpassword = @remotePassword;  
go  
  
sp_helpserver;  
  
select top 10 * from [Server].[Database].[Schema].[Table]

-- For drop linked server
-- declare @linkedServerName nvarchar(255) = 'IT108_Online'  
-- sp_dropserver @linkedServerName, 'droplogins';
```