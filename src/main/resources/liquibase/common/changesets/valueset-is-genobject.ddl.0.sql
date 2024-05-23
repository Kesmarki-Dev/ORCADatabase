alter table gen.ValueSet drop column CreationDate;
alter table gen.ValueSet drop column CreationTime;
alter table gen.ValueSet drop column CreationUserName;
alter table gen.ValueSet drop column LastModifiedDate;
alter table gen.ValueSet drop column LastModifiedTime;
alter table gen.ValueSet drop column LastModifiedUserName;

alter table gen.ValueSet drop constraint [FK_ValueSet_Object];
alter table gen.Code drop constraint [FK_Code_ValueSet];
alter table gen.Setting drop constraint [FK_Setting_ValueSet];
alter table org.ProcessVariable drop constraint [FK_ProcessVariable_ValueSet];
alter table org.ProcessDefinitionVariable drop constraint [FK_ProcessDefinitionVariable_ValueSet];
alter table org.ModuleParameter drop constraint [FK_ModuleParameter_ValueSet];
alter table mis.FormColumn drop constraint [FK_FormColumn_ValueSet];
alter table gen.FlexibleFormField drop constraint [FK_FlexibleFormField_ValueSet];
alter table gen.FlexibleFormFieldType drop constraint [FK_FlexibleFormFieldType_ValueSet];
alter table mis.Filter drop constraint [FK_Filter_ValueSet];
alter table fin.Dimension drop constraint [FK_Dimension_ValueSet];

drop index IXFK_ValueSet_Object on gen.ValueSet;
alter table gen.ValueSet drop column ObjectID;

alter table gen.ValueSet drop constraint [PK_ValueSet];
alter table gen.ValueSet drop column ID;
alter table gen.ValueSet add ID numeric(16) constraint [PK_ValueSet] primary key;

