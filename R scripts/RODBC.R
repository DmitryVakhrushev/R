

#---------------------------------------------------
setwd("C:\\Dim\\Google Drive\\RODBC and R scripst")
getwd()
#---------------------------------------------------

library(RODBC)
odbcDriverConnect("driver=SQL Server;server=A-DMVAKH-T61P\\DIMSQL")

# NOTES:
# NO spaces in the connection --> "driver=SQL Server;server=A-DMVAKH-T61P\\DIMSQL"
# "FROM" format: database.schema.table --> [WorkArea].[dbo].[TM_ETEX_Join_DNC_UniqueEmails]




#---------------------------------------------------------------------------
#-- Querring local A-DMVAKH-T61P\\DIMSQ
#---------------------------------------------------------------------------

channel <- odbcDriverConnect("driver=SQL Server;server=A-DMVAKH-T61P\\DIMSQL")
sqlQuery(channel,'select * from [books].[dbo].[royalties]')
#-----------------------------------------------


#---------------------------------------------------------------------------
#-- Querring CANCRMHOST
#---------------------------------------------------------------------------
library(RODBC)
ch_CANCRMHOST <- odbcDriverConnect("driver=SQL Server;server=CANCRMHOST")

sales <- sqlQuery(ch_CANCRMHOST,
                  'SELECT TOP 100
             [End Customer Organization ID]
            ,[Sales Date Key]
            ,[Product Family]
            ,[End Cust Purchase Amount LC]
            ,[End Cust Purchase Licenses]
         FROM [DWH].[dbo].[Fact_Sales]')

names(sales) <- gsub(" ", ".", names(sales)) # replacing all "spaces" with "."
str(sales)

sales$End.Cust.Purchase.Licenses
sales$End.Cust.Purchase.Amount.LC

hist(sales$End.Cust.Purchase.Licenses, col='red')
hist(sales$End.Cust.Purchase.Amount.LC, col='blue')

plot (sales$End.Cust.Purchase.Licenses, sales$End.Cust.Purchase.Amount.LC)
  
  


#---------------------------------------------------------------------------
#-- Querring CDNDATADEV
#---------------------------------------------------------------------------
odbcDriverConnect("driver=SQL Server;server=CDNDATADEV")
ch_CDNDATADEV <- odbcDriverConnect("driver=SQL Server;server=CDNDATADEV")

sqlQuery(ch_CDNDATADEV,
                 'SELECT TOP 5
                  [EmailAddress]
                 ,[SubscriberID]
                 ,[EventDate]
                 ,[EventType]
                 ,[UnSubFlag]
                 ,[BOB_Audience]
                 ,[UnSubDate]
                 FROM [WorkArea].[dbo].[TM_ETEX_Join_DNC_UniqueEmails]')












