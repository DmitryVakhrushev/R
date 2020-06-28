
##############################################################
#--------------- Connect to MS SQL Server -----------------------
##############################################################

# documentation --> print in R console -->  RShowDoc("RODBC", package="RODBC")

#------------------------------------------------------------------------------------
#-- !!! doesn't allow spaces around "=" sign --> "driver=SQL Server;server=DMITRYV\\SQLEXPRESS"
#-- !!! requires the full path [Database].[Schema].[Table] --> [bucky].[dbo].[items]
#------------------------------------------------------------------------------------

library(RODBC)

# Example 1
odbcDriverConnect("driver=SQL Server; server=DMITRYV\\SQLEXPRESS")
channel <- odbcDriverConnect("driver=SQL Server; server=DMITRYV\\SQLEXPRESS")
sqlQuery(channel,'select * from [bucky].[dbo].[items]')

# Example 2
channel <- odbcDriverConnect("driver=SQL Server;server=DMITRYV\\SQLEXPRESS")
sqlQuery(channel,'select * from information_schema.tables')
initdata <- sqlQuery(channel,'select * from [bucky].[dbo].[items]')
dim(initdata)

odbcClose(channel)

items <- data.frame(initdata)
class(items)
items

# Example 3
channel <- odbcDriverConnect("driver=SQL Server;server=DMITRYV\\SQLEXPRESS")
sqlQuery(channel,
                'SELECT TOP 5
                      [seller_id]
                     ,[Total] = SUM([item_cost])
                FROM [bucky].[dbo].[items]
                GROUP BY [seller_id]
                ')


##############################################################
#--------------- Connect to MySQL -----------------------
##############################################################

# We do not need to mention schema just database.tableName without [] as allows in SQL Server

-----------------------------------------
# Option 1: Using 'odbcDriverConnect' command
-----------------------------------------
library(RODBC)
# chMySQL <- odbcDriverConnect("driver=MySQL ODBC 5.2a Driver;server=localhost;uid=root;pwd=dimroot;DATABASE=bass;case=tolower")
chMySQL <- odbcDriverConnect("driver=MySQL ODBC 5.2a Driver;server=localhost;uid=root;pwd=dimroot")
sqlQuery(chMySQL, 'SELECT * FROM bass.newton')

odbcClose(chMySQL)


-----------------------------------------
# # Option 2: Using 'odbcConnect' command
-----------------------------------------
library(RODBC)
ch5 <- odbcConnect("bassConnection",uid="root",pwd="dimroot", case="tolower")
sqlQuery(ch5, 'SELECT * FROM bass.newton')



