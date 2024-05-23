alter table prt.Company drop column CreationDate;
alter table prt.Company drop column CreationTime;
alter table prt.Company drop column CreationUserName;
alter table prt.Company drop column LastModifiedDate;
alter table prt.Company drop column LastModifiedTime;
alter table prt.Company drop column LastModifiedUserName;
alter table prt.Company drop constraint [FK_CIS.Company_CIS.Entity_02];
alter table prt.Balance drop constraint [FK_CIS.Balance_CIS.Company_02];--
alter table prt.Employee drop constraint [FK_CIS.Employee_CIS.Company];--

alter table prt.Company drop constraint [PK_CIS.Company];
drop index [IXFK_CIS.Company_CIS.Entity] on prt.Company;
drop index [IXFK_CIS.Company_CIS.Entity_02] on prt.Company;

alter table prt.Company drop column ID;
alter table prt.Company add ID numeric(16) constraint [PK_CIS.Company] primary key;

go

alter table prt.Entity drop column CreationDate;
alter table prt.Entity drop column CreationTime;
alter table prt.Entity drop column CreationUserName;
alter table prt.Entity drop column LastModifiedDate;
alter table prt.Entity drop column LastModifiedTime;
alter table prt.Entity drop column LastModifiedUserName;

alter table prt.BankAccount drop constraint [FK_BankAccount_Entity_02];
alter table prt.BankAccount drop constraint [FK_BankAccount_Entity];--
alter table ast.AssetValuation drop constraint [FK_AssetValuation_Entity];--
alter table ifc.AccountingSystem drop constraint [FK_AccountingSystem_EntityID];--
alter table ast.Asset drop constraint [FK_Asset_Entity];--
alter table prt.Party drop constraint [FK_Party_Entity_02];--
alter table prt.Party drop constraint [FK_Party_Entity];--
alter table prt.AppUser drop constraint [FK_CIS.User_CIS.Entity];--
alter table dcs.Debtor drop constraint [FK_DCS.Debtor_CIS.Entity];--
alter table prt.Relation drop constraint [FK_Relation_Entity_02];--
alter table prt.Relation drop constraint [FK_Relation_Entity];--
alter table prt.Name drop constraint [FK_Name_Entity];--
alter table dcs.DebtCase drop constraint [FK_DebtCase_Code_07];--
alter table dcs.DebtCase drop constraint [FK_DebtCase_Entity];--
alter table prt.Address drop constraint [FK_Address_Entity];--
alter table prt.EntityRelation drop constraint [FK_EntityRelation_Entity_02];--
alter table prt.EntityRelation drop constraint [FK_EntityRelation_Entity];--
alter table prt.EntityNegativeEvent drop constraint [FK_EntityNegativeEvent_Entity];--
alter table prt.EntityIdentifier drop constraint [FK_EntityIdentifier_Entity];--
alter table ast.EntityAsset drop constraint [FK_EntityAsset_Entity];--
alter table prt.Customer drop constraint [FK_Customer_Entity];--
alter table com.Interaction drop constraint [FK_Interaction_Entity_02];--
alter table com.Interaction drop constraint [FK_Interaction_Entity];--
alter table prt.Contact drop constraint [FK_Contact_Entity];--
alter table prt.Person drop constraint [FK_Person_Entity];--


alter table prt.Entity drop constraint [PK_CIS.Entity];

alter table prt.Entity drop column ID;
alter table prt.Entity add ID numeric(16) constraint [PK_CIS.Entity] primary key;

go