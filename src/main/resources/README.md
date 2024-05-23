1. list all gen.object children
2. foreach (table)
   1. if (Entity)
   2. not (Entity)
      1. remove identity from PK
      2. remove ObjectID column, set ID to objectID
      2. drop columns duplicated in child, set parent values to childs'
      3. 
3. f 

--

## Migrációs terv

### Adatbázis

Genobject:

a) sima genobject, nem entity

- genobjectre FK törlés
- tárgy táblára mutató FK-k törlése
- objectID oszlop törlés (ID oszlop beállítása az ObjectID volt ertekere)
- redundans mezok torlese (audit)
- FK-k visszarakasa (tárgy tábla gyermek tablaira)

b) entity

c) FK-val hivatkozik a gen.object-re

d) FK-val hivatkozik a gen.object valamelyik gyermekére  (nem entity)

e) FK-val hivatkozik entity-re

f) FK-val hivatkozik entity gyermekere


---

Hiányzó ObjectID FK-k:

;WITH ForeignKeysCTE(FK_NAME,[schema_name],[table],[column],[referenced_table],[referenced_column]) AS
(
SELECT  obj.name AS FK_NAME,
sch.name AS [schema_name],
tab1.name AS [table],
col1.name AS [column],
tab2.name AS [referenced_table],
col2.name AS [referenced_column]
FROM sys.foreign_key_columns fkc
INNER JOIN sys.objects obj
ON obj.object_id = fkc.constraint_object_id
INNER JOIN sys.tables tab1
ON tab1.object_id = fkc.parent_object_id
INNER JOIN sys.schemas sch
ON tab1.schema_id = sch.schema_id
INNER JOIN sys.columns col1
ON col1.column_id = parent_column_id AND col1.object_id = tab1.object_id
INNER JOIN sys.tables tab2
ON tab2.object_id = fkc.referenced_object_id
INNER JOIN sys.columns col2
ON col2.column_id = referenced_column_id AND col2.object_id = tab2.object_id
)
select O.[table_schema], O.table_name, F.FK_NAME from
(SELECT
table_name, table_schema
FROM INFORMATION_SCHEMA.columns
WHERE column_name='ObjectID'
group by table_name, table_schema) as O left outer join
(select [table],FK_NAME from ForeignKeysCTE where [referenced_table]='Object' and [column]='ObjectID') as F
on [table]=table_name
where FK_NAME is null
order by table_schema, table_name;

COM,Meeting,
COM,MeetingDebtCase,
COM,MeetingParticipant,
CRM,ContractItem,
CRM,ContractSigner,
DCS,Solution,
DCS,SolutionType,
DCS,StrategyType,
FIN,CalculationInvoice,
FIN,InvoiceLine,
GEN,File,
GEN,Storage,
IFC,AddressRegister,
IFC,ContractItem,
ORG,TaskGroupOperationSetObject_View,
ORG,TaskUser,
PRT,Balance,
PRT,BalanceRow,
PRT,Party,

--

Hiányzó EntityID fk-k

;WITH ForeignKeysCTE(FK_NAME,[schema_name],[table],[column],[referenced_table],[referenced_column]) AS
(
SELECT  obj.name AS FK_NAME,
sch.name AS [schema_name],
tab1.name AS [table],
col1.name AS [column],
tab2.name AS [referenced_table],
col2.name AS [referenced_column]
FROM sys.foreign_key_columns fkc
INNER JOIN sys.objects obj
ON obj.object_id = fkc.constraint_object_id
INNER JOIN sys.tables tab1
ON tab1.object_id = fkc.parent_object_id
INNER JOIN sys.schemas sch
ON tab1.schema_id = sch.schema_id
INNER JOIN sys.columns col1
ON col1.column_id = parent_column_id AND col1.object_id = tab1.object_id
INNER JOIN sys.tables tab2
ON tab2.object_id = fkc.referenced_object_id
INNER JOIN sys.columns col2
ON col2.column_id = referenced_column_id AND col2.object_id = tab2.object_id
)
select O.[table_schema], O.table_name, F.FK_NAME from
(SELECT
table_name, table_schema
FROM INFORMATION_SCHEMA.columns
WHERE column_name='EntityID'
group by table_name, table_schema) as O left outer join
(select [table],FK_NAME from ForeignKeysCTE where [referenced_table]='Entity' and [column]='EntityID') as F
on [table]=table_name
where FK_NAME is null
order by table_schema, table_name;


COM,MeetingParticipant
CRM,ContractSigner
IFC,InkassoSyncSendAddress
IFC,InkassoSyncSendDebtor
IFC,InkassoSyncSendDocument
IFC,InkassoSyncSendEvent
IFC,InkassoSyncSendPhone

---

```puml
@startuml
state New
@enduml
```