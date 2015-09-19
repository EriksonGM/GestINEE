--Funcionarios
Delete from Tb_Reg
DBCC CHECKIDENT (Tb_Reg, RESEED,0)

Delete from Tb_ConvidadoFormacao
DBCC CHECKIDENT (Tb_ConvidadoFormacao, RESEED,0)

Delete from Tb_DefFuncionario
DBCC CHECKIDENT (Tb_DefFuncionario, RESEED,0)

Delete from Tb_DocFuncionario
DBCC CHECKIDENT (Tb_DocFuncionario, RESEED,0)

Delete from Tb_EscoFuncionario
DBCC CHECKIDENT (Tb_EscoFuncionario, RESEED,0)

Delete from Tb_InstFuncionario
DBCC CHECKIDENT (Tb_InstFuncionario, RESEED,0)

Delete from Tb_NAcaFuncionario
DBCC CHECKIDENT (Tb_NAcaFuncionario, RESEED,0)

Delete from Tb_Funcionario
DBCC CHECKIDENT (Tb_Funcionario, RESEED,0)

--Estudantes
Delete from Tb_DefEstudante
DBCC CHECKIDENT (Tb_DefEstudante, RESEED,0)

Delete from Tb_ParentescoEncarregado
DBCC CHECKIDENT (Tb_ParentescoEncarregado, RESEED,0)

Delete from Tb_VincEstudanteSala
DBCC CHECKIDENT (Tb_VincEstudanteSala, RESEED,0)

Delete from Tb_Estudante
DBCC CHECKIDENT (Tb_Estudante, RESEED,0)

Delete from Tb_Encarregado
DBCC CHECKIDENT (Tb_Encarregado, RESEED,0)

Select Count(*) from Tb_Estudante
Select Count(*) From Tb_Funcionario 