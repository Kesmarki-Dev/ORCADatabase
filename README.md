# ORCADatabase
Maven subproject to deploy and manage database changes to the ORCA project.

Usage:

1) Update database:

`mvn liquibase:update -Dliquibase.connectionString="jdbc:sqlserver://localhost;database=indecs_dev;trustServerCertificate=true" -Dliquibase.username=<myuser> -Dliquibase.password=<mypass>
`

2) Drop database contents (schemas and objects - dbo schema will remain):

`mvn sql:execute@dropAll -Dliquibase.connectionString="jdbc:sqlserver://localhost;database=indecs_dev;trustServerCertificate=true" -Dliquibase.username=<myuser> -Dliquibase.password=<mypass>
`
