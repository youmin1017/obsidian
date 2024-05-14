---
tags:
  - snippet
  - mssql
---
```sql
create proc judge.xp_extract_keywords  
    @segments KeywordExtractionSegments readonly  
as  
begin  
    set xact_abort on --指定當 Transact-SQL 陳述式產生執行階段錯誤時，SQL Server 是否自動回復目前的交易  
    begin try  
        begin transaction        commit transaction    end try    begin catch        if XACT_STATE() <> 0  
            begin  
                rollback transaction            end        select            ERROR_NUMBER() as ErrorNumber,  
            ERROR_MESSAGE() as ErrorMessage  
    end catch  
    set xact_abort offend  
go
```

