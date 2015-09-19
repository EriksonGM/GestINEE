--Create DataBase DBGestINEE1

--Use DBGestINEE1

-- Drop DataBase DBGestINEE1

Create Table Tb_Usuario
(
Id_Usuario Int Not Null Identity Primary Key,
Nome varchar(50) Not Null,
Email varchar(50) Not Null Unique,
Telefone varchar(9) Unique,
)

go

Create Table Tb_Reg
(
Id_Reg BigInt Not Null Identity Primary Key,
Id_Usuario Int Not Null Foreign Key References Tb_Usuario (Id_Usuario),
Data Datetime Not Null Default GetDate(),
Reg varchar(200) Not Null
)
go

Create Proc FiltrarUsuario
@NomeUsuario varchar(50)
as 
Begin
Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeUsuario)) + '%';

Select Id_Usuario,Nome,Email from Tb_Usuario Where Nome like @Nome or Email like @Nome
End
go

Create Table Tb_Def
(
Id_Def Int Not NUll Identity Primary Key,
Def varchar(50) Not Null Unique 
)
go

Create Proc AddDef
@Id_Usuario Int,
@Def varchar(50)
as
Begin

Insert Into Tb_Def values (@Def)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro da Deficiência: '+@Def+' com exito.')
End
go

Create Proc UpdDef
@Id_Usuario Int,
@Id_Def int,
@Def varchar(50)
as
Begin

Declare @OldDef varchar(50) = (Select Def from Tb_Def Where Id_Def = @Id_Def)

Update Tb_Def Set Def = @Def Where Id_Def = @Id_Def

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização da Deficiência: '+@OldDef+ ' para '+@Def+' com exito.')

End
go

Create Table Tb_ClasifDef
(
Id_ClasifDef Int Not Null Identity Primary Key,
Id_Def Int Not NUll Foreign Key References Tb_Def (Id_Def),
ClasifDef varchar(50)
)
go

Create Proc AddClasifDef
@Id_Usuario Int,
@Id_Def Int,
@ClasifDef varchar(50)
as
Begin
Insert Into Tb_ClasifDef values (@Id_Def,@ClasifDef)

Declare @Def varchar(50) = (Select Def from Tb_Def Where Id_Def = @Id_Def)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro da Classificação: '+@ClasifDef + ' para a Deficiência: '+@Def+'.')
End
go

Create Proc UpdClasifDef
@Id_Usuario Int,
@Id_ClasifDef Int,
@Id_Def int,
@ClasifDef varchar(50)
as
Begin
Declare @OldDef varchar(50) = (SELECT Tb_Def.Def FROM Tb_Def INNER JOIN Tb_ClasifDef ON Tb_Def.Id_Def = Tb_ClasifDef.Id_Def WHERE (Tb_ClasifDef.ClasifDef = @ClasifDef))
Declare @Def varchar(50) = (Select Def from Tb_Def Where Id_Def = @Id_Def)

Declare @OldClasifDef varchar(50) =(SELECT ClasifDef FROM Tb_ClasifDef WHERE (Id_ClasifDef = @Id_ClasifDef))

Update Tb_ClasifDef set Id_Def = @Id_Def, ClasifDef = @ClasifDef Where Id_ClasifDef = @Id_ClasifDef

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização da Classificação: '+@OldDef+'->'+@OldClasifDef + ' para '+@Def+'->'+@ClasifDef+'.')
End
go

Create Table Tb_NatuDef
(
Id_NatuDef Int Not Null Identity Primary Key,
NatuDef varchar(20) Not Null 
)
Insert Into Tb_NatuDef values ('Peri-Natal')
Insert Into Tb_NatuDef values ('Natal')
Insert Into Tb_NatuDef values ('Pos-Natal')
go

Create Table Tb_EntiAval
(
Id_EntiAval Int Not Null Identity Primary Key,
EnviAval varchar(50) Not Null
)
Insert Into Tb_EntiAval values ('INEE')
Insert Into Tb_EntiAval values ('Ministerio de Saude')
Insert Into Tb_EntiAval values ('Ministerio de Educação')
go

Create Table Tb_Genero
(
Id_Genero Int Not Null Identity Primary Key,
Genero varchar(10) Not Null Unique
)

Insert Into Tb_Genero values ('Femenino')
Insert Into Tb_Genero values ('Masculino')
go

Create Table Tb_TipoDoc
(
Id_TipoDoc Int Not Null Identity Primary Key,
TipoDoc varchar(20) Not Null Unique
)
Insert Into Tb_TipoDoc values ('Cedula')
Insert Into Tb_TipoDoc values ('BI')
Insert Into Tb_TipoDoc values ('Passaporte')
go

Create Table Tb_TipoAtendimento
(
Id_TipoAtendimento Int Not Null Identity Primary Key,
TipoAtendimento varchar(20) Not Null Unique
)
Insert Into Tb_TipoAtendimento values ('Sem Atendimento')
Insert Into Tb_TipoAtendimento values ('Escolar')
Insert Into Tb_TipoAtendimento values ('Hospitalar')
Insert Into Tb_TipoAtendimento values ('Residencial')
Insert Into Tb_TipoAtendimento values ('Penitenciario')
Insert Into Tb_TipoAtendimento values ('Creche')
go

Create Table Tb_Provincia
(
Id_Provincia Int Not Null Identity Primary Key,
Provincia varchar(20) Not Null Unique
)
Insert Into Tb_Provincia Values('Bengo')
Insert Into Tb_Provincia Values('Benguela')
Insert Into Tb_Provincia Values('Bié')
Insert Into Tb_Provincia Values('Cabinda')
Insert Into Tb_Provincia Values('Cuando Cubango')
Insert Into Tb_Provincia Values('Cunene')
Insert Into Tb_Provincia Values('Huambo')
Insert Into Tb_Provincia Values('Huíla')
Insert Into Tb_Provincia Values('Kwanza-Norte')
Insert Into Tb_Provincia Values('Kwanza-Sul')
Insert Into Tb_Provincia Values('Luanda')
Insert Into Tb_Provincia Values('Lunda-Norte')
Insert Into Tb_Provincia Values('Lunda-Sul')
Insert Into Tb_Provincia Values('Malanje')
Insert Into Tb_Provincia Values('Moxico')
Insert Into Tb_Provincia Values('Namibe')
Insert Into Tb_Provincia Values('Uíge')
Insert Into Tb_Provincia Values('Zaire')
Insert Into Tb_Provincia Values('Outra')
go

Create Table Tb_Municipio
(
Id_Municipio Int Not Null Identity(1,1) Primary Key,
Id_Provincia Int Not Null Foreign Key References Tb_Provincia(Id_Provincia),
Municipio varchar(30) Not Null Unique
)
go

Create Proc AddMunicipio
@Provincia varchar(20),
@Municipio varchar(20)
as
begin
Declare @Id_Provincia int = (Select Id_Provincia From Tb_Provincia Where Provincia = @Provincia)

Insert Into Tb_Municipio (Id_Provincia,Municipio) values (@Id_Provincia,@Municipio)

Print 'Municipio '+ @Municipio +' Cadastrado com exito'
end

go

Exec AddMunicipio 'Bengo','Caxito'
Exec AddMunicipio 'Bengo','Ambriz'
Exec AddMunicipio 'Bengo','Bula Atumba'
Exec AddMunicipio 'Bengo','Dande'
Exec AddMunicipio 'Bengo','Dembos'
Exec AddMunicipio 'Bengo','Nambuangongo'
Exec AddMunicipio 'Bengo','Pango Aluquém'

--Caxito,Ambriz, Bula Atumba, Dande, Dembos, Nambuangongo, Pango Aluquém,

Exec AddMunicipio 'Benguela','Benguela'
Exec AddMunicipio 'Benguela','Balombo'
Exec AddMunicipio 'Benguela','Baía Farta'
Exec AddMunicipio 'Benguela','Bocoio'
Exec AddMunicipio 'Benguela','Caimbambo'
Exec AddMunicipio 'Benguela','Catumbela'
Exec AddMunicipio 'Benguela','Chongoroi'
Exec AddMunicipio 'Benguela','Cubal'
Exec AddMunicipio 'Benguela','Ganda'
Exec AddMunicipio 'Benguela','Lobito'

--Balombo, Baía Farta, Benguela, Bocoio, Caimbambo, Catumbela,Chongoroi, Cubal, Ganda, Lobito

Exec AddMunicipio 'Bié','Andulo'
Exec AddMunicipio 'Bié','Camacupa'
Exec AddMunicipio 'Bié','Catabola'
Exec AddMunicipio 'Bié','Chinguar'
Exec AddMunicipio 'Bié','Chitembo'
Exec AddMunicipio 'Bié','Cuemba'
Exec AddMunicipio 'Bié','Cunhinga'
Exec AddMunicipio 'Bié','Kuito'
Exec AddMunicipio 'Bié','Nharea'

--Andulo, Camacupa, Catabola, Chinguar, Chitembo, Cuemba, Cunhinga, Kuito, Nharea

Exec AddMunicipio 'Cabinda','Belize'
Exec AddMunicipio 'Cabinda','Buco-Zau'
Exec AddMunicipio 'Cabinda','Cabinda'
Exec AddMunicipio 'Cabinda','Cacongo'

--Belize, Buco-Zau, Cabinda, Cacongo

Exec AddMunicipio 'Cuando Cubango','Calai'
Exec AddMunicipio 'Cuando Cubango','Cuangar'
Exec AddMunicipio 'Cuando Cubango','Cuchi'
Exec AddMunicipio 'Cuando Cubango','Cuito Cuanavale'
Exec AddMunicipio 'Cuando Cubango','Dirico'
Exec AddMunicipio 'Cuando Cubango','Mavinga'
Exec AddMunicipio 'Cuando Cubango','Menongue'
Exec AddMunicipio 'Cuando Cubango','Nancova'
Exec AddMunicipio 'Cuando Cubango','Rivungo'

--Calai, Cuangar, Cuchi, Cuito Cuanavale, Dirico, Mavinga, Menongue, Nancova, Rivungo

Exec AddMunicipio 'Cunene','Cahama'
Exec AddMunicipio 'Cunene','Cuanhama'
Exec AddMunicipio 'Cunene','Curoca'
Exec AddMunicipio 'Cunene','Cuvelai'
Exec AddMunicipio 'Cunene','Namacunde'
Exec AddMunicipio 'Cunene','Ombadja'

--Cahama, Cuanhama, Curoca, Cuvelai, Namacunde, Ombadja

Exec AddMunicipio 'Huambo','Bailundo'
Exec AddMunicipio 'Huambo','Catchiungo'
Exec AddMunicipio 'Huambo','Caála'
Exec AddMunicipio 'Huambo','Ekunha'
Exec AddMunicipio 'Huambo','Huambo'
Exec AddMunicipio 'Huambo','Londuimbale'
Exec AddMunicipio 'Huambo','Longonjo'
Exec AddMunicipio 'Huambo','Mungo'
Exec AddMunicipio 'Huambo','Tchicala-Tcholoanga'
Exec AddMunicipio 'Huambo','Tchindjenje'
Exec AddMunicipio 'Huambo','Ucuma'

--Bailundo, Catchiungo, Caála, Ekunha, Huambo, Londuimbale, Longonjo, Mungo, Tchicala-Tcholoanga, Tchindjenje, Ucuma

Exec AddMunicipio 'Huíla','Caconda'
Exec AddMunicipio 'Huíla','Cacula Caluquembe'
Exec AddMunicipio 'Huíla','Gambos'
Exec AddMunicipio 'Huíla','Chibia'
Exec AddMunicipio 'Huíla','Chicomba'
Exec AddMunicipio 'Huíla','Chipindo'
Exec AddMunicipio 'Huíla','Cuvango'
Exec AddMunicipio 'Huíla','Humpata'
Exec AddMunicipio 'Huíla','Jamba'
Exec AddMunicipio 'Huíla','Lubango'
Exec AddMunicipio 'Huíla','Matala'
Exec AddMunicipio 'Huíla','Quilengues'
Exec AddMunicipio 'Huíla','Quipungo'

--Caconda,Cacula Caluquembe, Gambos, Chibia, Chicomba, Chipindo, Cuvango, Humpata, Jamba, Lubango, Matala, Quilengues, Quipungo

Exec AddMunicipio 'Kwanza-Norte','Ambaca'
Exec AddMunicipio 'Kwanza-Norte','Banga'
Exec AddMunicipio 'Kwanza-Norte','Bolongongo'
Exec AddMunicipio 'Kwanza-Norte','Cambambe'
Exec AddMunicipio 'Kwanza-Norte','Cazengo'
Exec AddMunicipio 'Kwanza-Norte','Golungo Alto'
Exec AddMunicipio 'Kwanza-Norte','Gonguembo'
Exec AddMunicipio 'Kwanza-Norte','Lucala'
Exec AddMunicipio 'Kwanza-Norte','N´dalatando'
Exec AddMunicipio 'Kwanza-Norte','Quiculungo'
Exec AddMunicipio 'Kwanza-Norte','Samba Caju'

--Ambaca, Banga, Bolongongo, Cambambe, Cazengo, Golungo Alto, Gonguembo, Lucala, Quiculungo, Samba Caju
Exec AddMunicipio 'Kwanza-Sul','Sumbe'
Exec AddMunicipio 'Kwanza-Sul','Amboim'
Exec AddMunicipio 'Kwanza-Sul','Cassongue'
Exec AddMunicipio 'Kwanza-Sul','Conda'
Exec AddMunicipio 'Kwanza-Sul','Ebo'
Exec AddMunicipio 'Kwanza-Sul','Libolo'
Exec AddMunicipio 'Kwanza-Sul','Mussende'
Exec AddMunicipio 'Kwanza-Sul','Porto Amboim'
Exec AddMunicipio 'Kwanza-Sul','Quibala'
Exec AddMunicipio 'Kwanza-Sul','Quilenda'
Exec AddMunicipio 'Kwanza-Sul','Seles'
Exec AddMunicipio 'Kwanza-Sul','Waku Kungo'

-- Amboim, Cassongue, Conda, Ebo, Libolo, Mussende, Porto Amboim, Quibala, Quilenda, Seles, Sumbe, Waku Kungo
Exec AddMunicipio 'Luanda','Belas'
Exec AddMunicipio 'Luanda','Cacuaco'
Exec AddMunicipio 'Luanda','Cazenga'
Exec AddMunicipio 'Luanda','Ícolo e Bengo'
Exec AddMunicipio 'Luanda','Luanda'
Exec AddMunicipio 'Luanda','Quiçama'
Exec AddMunicipio 'Luanda','Viana'

--Belas, Cacuaco, Cazenga, Ícolo e Bengo, Luanda, Quiçama, Viana,

Exec AddMunicipio 'Lunda-Norte','Lucapa'
Exec AddMunicipio 'Lunda-Norte','Cambulo'
Exec AddMunicipio 'Lunda-Norte','Capenda-Camulemba'
Exec AddMunicipio 'Lunda-Norte','Caungula'
Exec AddMunicipio 'Lunda-Norte','Chitato'
Exec AddMunicipio 'Lunda-Norte','Cuango'
Exec AddMunicipio 'Lunda-Norte','Cuílo'
Exec AddMunicipio 'Lunda-Norte','Lubalo'
Exec AddMunicipio 'Lunda-Norte','Xá-Muteba'

--Lucapa, Cambulo, Capenda-Camulemba, Caungula, Chitato, Cuango, Cuílo, Lubalo, Lucapa, Xá-Muteba

Exec AddMunicipio 'Lunda-Sul','Saurimo'
Exec AddMunicipio 'Lunda-Sul','Cacolo'
Exec AddMunicipio 'Lunda-Sul','Dala'
Exec AddMunicipio 'Lunda-Sul','Muconda'


--Cacolo, Dala, Muconda, Saurimo

Exec AddMunicipio 'Malanje','Cacuso'
Exec AddMunicipio 'Malanje','Calandula'
Exec AddMunicipio 'Malanje','Cambundi-Catembo'
Exec AddMunicipio 'Malanje','Cangandala'
Exec AddMunicipio 'Malanje','Caombo'
Exec AddMunicipio 'Malanje','Cuaba Nzogo'
Exec AddMunicipio 'Malanje','Cunda-Dia-Baze'
Exec AddMunicipio 'Malanje','Luquembo'
Exec AddMunicipio 'Malanje','Malanje'
Exec AddMunicipio 'Malanje','Marimba'
Exec AddMunicipio 'Malanje','Massango'
Exec AddMunicipio 'Malanje','Mucari'
Exec AddMunicipio 'Malanje','Quela'
Exec AddMunicipio 'Malanje','Quirima'

--Cacuso, Calandula, Cambundi-Catembo, Cangandala, Caombo, Cuaba Nzogo, Cunda-Dia-Baze, Luquembo, 
--Malanje, Marimba, Massango, Mucari, Quela, Quirima

Exec AddMunicipio 'Moxico','Luena Alto'
Exec AddMunicipio 'Moxico','Zambeze'
Exec AddMunicipio 'Moxico','Bundas'
Exec AddMunicipio 'Moxico','Camanongue'
Exec AddMunicipio 'Moxico','Léua'
Exec AddMunicipio 'Moxico','Luau'
Exec AddMunicipio 'Moxico','Luchazes'
Exec AddMunicipio 'Moxico','Lumeje'
Exec AddMunicipio 'Moxico','Moxico'


--Luena	Alto, Zambeze, Bundas, Camanongue, Léua, Luau, Luacano, Luchazes, Lumeje, Moxico

Exec AddMunicipio 'Namibe','Bibala'
Exec AddMunicipio 'Namibe','Camucuio'
Exec AddMunicipio 'Namibe','Namibe'
Exec AddMunicipio 'Namibe','Tômbua'
Exec AddMunicipio 'Namibe','Virei'

--Namibe, Bibala, Camucuio, Namibe, Tômbua, Virei

Exec AddMunicipio 'Uíge','Alto Cauale'
Exec AddMunicipio 'Uíge','Ambuíla'
Exec AddMunicipio 'Uíge','Bembe'
Exec AddMunicipio 'Uíge','Buengas'
Exec AddMunicipio 'Uíge','Damba'
Exec AddMunicipio 'Uíge','Macocola'
Exec AddMunicipio 'Uíge','Mucaba'
Exec AddMunicipio 'Uíge','Negage'
Exec AddMunicipio 'Uíge','Puri'
Exec AddMunicipio 'Uíge','Quimbele'
Exec AddMunicipio 'Uíge','Quitexe'
Exec AddMunicipio 'Uíge','Sanza Pombo'
Exec AddMunicipio 'Uíge','Songo'
Exec AddMunicipio 'Uíge','Uíge'
Exec AddMunicipio 'Uíge','Zombo'

--Exec AddMunicipio 'Uíge','Uíge',	Alto Cauale, Ambuíla, Bembe, Buengas, Damba, Macocola, Mucaba, Negage, Puri, Quimbele, Quitexe, 
--Sanza Pombo, Songo, Uíge, Zombo

Exec AddMunicipio 'Zaire','Cuimba'
Exec AddMunicipio 'Zaire','M´Banza Kongo'
Exec AddMunicipio 'Zaire','N´Zeto'
Exec AddMunicipio 'Zaire','Soyo'
Exec AddMunicipio 'Zaire','Tomboco'


--Cuimba, M'Banza Kongo, Noqui, N'Zeto, Soyo, Tomboco

Exec AddMunicipio 'Outra','Outro'
go

Create Table Tb_TipoEquipamento
(
Id_TipoEquipamento Int Not Null Identity Primary Key,
TipoEquipamento varchar(30) Not Null Unique
)
go

Create Proc AddTipoEquipamento
@Id_Usuario Int,
@TipoEquipamento varchar(30)
as
Begin

Insert Into Tb_TipoEquipamento values (@TipoEquipamento)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro do Tipo de Equipamento: '+@TipoEquipamento + ' com exito.')

End
go

Create Proc UpdTipoEquipamento
@Id_Usuario Int,
@Id_TipoEquipamento Int,
@TipoEquipamento varchar(30)
as
Begin

Declare @OldTipoEquipamento varchar(30) = (Select TipoEquipamento from Tb_TipoEquipamento Where Id_TipoEquipamento = @Id_TipoEquipamento)

Update Tb_TipoEquipamento set TipoEquipamento = @TipoEquipamento Where Id_TipoEquipamento = @Id_TipoEquipamento

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização do Tipo de Equipamento: '+ @OldTipoEquipamento + ' para ' + @TipoEquipamento + ' com exito.' )

End
go

Create Table Tb_MarcaEquipamento
(
Id_MarcaEquipamento Int Not Null Identity Primary Key,
MarcaEquipamento varchar(30) Not Null Unique
)
go

Create Proc AddMarcaEquipamento
@Id_Usuario Int,
@MarcaEquipamento varchar(30)
as
Begin

Insert Into Tb_MarcaEquipamento values (@MarcaEquipamento)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro da Marca de Equipamento: '+@MarcaEquipamento + ' com exito.')

End
go

Create Proc UpdMarcaEquipamento
@Id_Usuario Int,
@Id_MarcaEquipamento Int,
@MarcaEquipamento varchar(30)
as
Begin

Declare @OldMarcaEquipamento varchar(30) = (Select MarcaEquipamento from Tb_MarcaEquipamento Where Id_MarcaEquipamento = @Id_MarcaEquipamento)

Update Tb_MarcaEquipamento set MarcaEquipamento = @MarcaEquipamento Where Id_MarcaEquipamento = @Id_MarcaEquipamento

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização da Marca de Equipamento: '+ @OldMarcaEquipamento + ' para ' + @MarcaEquipamento + ' com exito.' )

End
go

Create Table Tb_ModeloEquipamento
(
Id_ModeloEquipamento Int Not Null Identity Primary Key,
Id_TipoEquipamento Int Not Null Foreign Key References Tb_TipoEquipamento (Id_TipoEquipamento),
Id_MarcaEquipamento Int Not Null Foreign Key References Tb_MarcaEquipamento (Id_MarcaEquipamento),
ModeloEquipamento varchar(50) Not Null
)
go

Create Proc AddModeloEquipamento
@Id_Usuario Int,
@Id_TipoEquipamento Int,
@Id_MarcaEquipamento Int,
@ModeloEquipamento varchar(50)
as
Begin

Insert Into Tb_ModeloEquipamento(Id_TipoEquipamento,Id_MarcaEquipamento,ModeloEquipamento) values (@Id_TipoEquipamento,@Id_MarcaEquipamento,@ModeloEquipamento)

Declare @MarcaEquipamento varchar(30) = (Select MarcaEquipamento from Tb_MarcaEquipamento Where Id_MarcaEquipamento = @Id_MarcaEquipamento)

Declare @TipoEquipamento varchar(30) = (Select TipoEquipamento from Tb_TipoEquipamento Where Id_TipoEquipamento = @Id_TipoEquipamento)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro do Modelo: ['+@TipoEquipamento + '->' + @MarcaEquipamento + '->' + @ModeloEquipamento + '] com exito.')

End
go

Create Proc UpdModeloEquipamento
@Id_Usuario Int,
@Id_ModeloEquipamento Int,
@Id_TipoEquipamento Int,
@Id_MarcaEquipamento Int,
@ModeloEquipamento varchar(50)
as
Begin

Declare @OldTipo varchar(30) = (SELECT Tb_TipoEquipamento.TipoEquipamento FROM Tb_TipoEquipamento INNER JOIN Tb_ModeloEquipamento ON Tb_TipoEquipamento.Id_TipoEquipamento = Tb_ModeloEquipamento.Id_TipoEquipamento WHERE (Tb_ModeloEquipamento.Id_ModeloEquipamento = @Id_ModeloEquipamento))

Declare @OldMarca varchar(30) = (SELECT Tb_MarcaEquipamento.MarcaEquipamento FROM Tb_ModeloEquipamento INNER JOIN Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento WHERE (Tb_ModeloEquipamento.Id_ModeloEquipamento = @Id_ModeloEquipamento))

Declare @OldModelo varchar(50) = (Select ModeloEquipamento from Tb_ModeloEquipamento Where Id_ModeloEquipamento = @Id_ModeloEquipamento)

Declare @MarcaEquipamento varchar(30) = (Select MarcaEquipamento from Tb_MarcaEquipamento Where Id_MarcaEquipamento = @Id_MarcaEquipamento)

Declare @TipoEquipamento varchar(30) = (Select TipoEquipamento from Tb_TipoEquipamento Where Id_TipoEquipamento = @Id_TipoEquipamento)

Update Tb_ModeloEquipamento set Id_TipoEquipamento = @Id_TipoEquipamento, Id_MarcaEquipamento = @Id_MarcaEquipamento,ModeloEquipamento = @ModeloEquipamento Where Id_ModeloEquipamento = @Id_ModeloEquipamento

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização do Modelo de Equipamento ['+@OldTipo + '->' + @OldMarca + '->' + @OldModelo + '] para ['+ @TipoEquipamento + '->' + @MarcaEquipamento + '->' +@ModeloEquipamento + '] com exito.')

End
go
-------------------------------------------------------------//Escola//----------------------------------------------------------------------

Create Table Tb_TipoEnsino
(
Id_TipoEnsino Int Not Null Identity Primary Key,
TipoEnsino varchar(50) Not Null Unique
)

Insert into Tb_TipoEnsino values ('Geral')
Insert into Tb_TipoEnsino values ('Técnico-Profesional')

Create Table Tb_Escola
(
Id_Escola Int Not Null Identity Primary Key,
NomeEscola varchar(100) Not Null Unique,
Numero varchar(10) Not Null Unique,
Especialidade varchar(50) Not Null,
Id_TipoEnsino Int Not Null Foreign Key References Tb_TipoEnsino(Id_TipoEnsino),
Endereco varchar(100) Not Null,
Id_Municipio Int Not Null foreign Key References Tb_Municipio(Id_Municipio),
Email varchar(50),
TelfPrincipal varchar(9) Not Null,
TelfSecundario varchar(9)
)

go

Create Proc AddEscola
@Id_Usuario Int,
@NomeEscola varchar(100),
@Numero varchar(10),
@Especialidade varchar(50),
@Id_TipoEnsino Int,
@Endereco varchar(50),
@Id_Municipio Int,
@Email varchar(50),
@TelfPrincipal varchar(9),
@TelfSecundario varchar(9),
@Id_Escola Int OutPut
as
Begin

Insert Into Tb_Escola
(NomeEscola,Numero,Especialidade,Id_TipoEnsino,Endereco,Id_Municipio,Email,TelfPrincipal,TelfSecundario)
values
(@NomeEscola,@Numero,@Especialidade,@Id_TipoEnsino,@Endereco,@Id_Municipio,@Email,@TelfPrincipal,@TelfSecundario)

Insert Into Tb_Reg(Id_Usuario, Reg) values (@Id_Usuario,'Escola: '+@NomeEscola+' cadastrada.')

Set @Id_Escola = (Select IDENT_CURRENT('Tb_Escola'))

End
go


Create Proc FiltrarEscola
@Nome varchar(50),
@FiltrarProvincia bit,
@Id_Provincia Int,
@FiltrarMunicipio bit,
@Id_Municipio Int
as
Begin
	Declare @NomeEscola varchar(50) = '%' +LTRIM(RTRIM(@Nome)) + '%';

	If @FiltrarMunicipio = 1 and @FiltrarProvincia = 1
		Begin
			SELECT        Tb_Escola.Id_Escola, Tb_Escola.NomeEscola, Tb_Escola.Numero, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Escola INNER JOIN
									 Tb_Municipio ON Tb_Escola.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Escola.Id_Municipio = @Id_Municipio) AND (Tb_Escola.NomeEscola LIKE @NomeEscola)
		End
	Else If @FiltrarProvincia = 1
		Begin
			SELECT        Tb_Escola.Id_Escola, Tb_Escola.NomeEscola, Tb_Escola.Numero, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Escola INNER JOIN
									 Tb_Municipio ON Tb_Escola.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Escola.NomeEscola LIKE @NomeEscola) AND (Tb_Provincia.Id_Provincia = @Id_Provincia)
		End
	Else
		Begin
			SELECT        Tb_Escola.Id_Escola, Tb_Escola.NomeEscola, Tb_Escola.Numero, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Escola INNER JOIN
									 Tb_Municipio ON Tb_Escola.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Escola.NomeEscola LIKE @NomeEscola)
		End
End
go

--Drop Table Tb_TipoEduc
Create Table Tb_TipoSala
(
Id_TipoSala Int Not Null Identity Primary Key,
TipoSala varchar(20) Not Null
)
Insert Into Tb_TipoSala values ('Inclução')
Insert Into Tb_TipoSala values ('Especial')
go

--Drop Table Tb_NivelEduc
Create Table Tb_ClasseSala
(
Id_ClasseSala Int Not Null Identity Primary Key,
ClasseSala varchar(20) Not NUll Unique
)
Insert Into Tb_ClasseSala values ('Pre-Escolar')
Insert Into Tb_ClasseSala values ('1ra Classe')
Insert Into Tb_ClasseSala values ('2da Classe')
Insert Into Tb_ClasseSala values ('3ra Classe')
Insert Into Tb_ClasseSala values ('4ta Classe')
Insert Into Tb_ClasseSala values ('5ta Classe')
Insert Into Tb_ClasseSala values ('6ta Classe')
Insert Into Tb_ClasseSala values ('7ma Classe')
Insert Into Tb_ClasseSala values ('8va Classe')
Insert Into Tb_ClasseSala values ('9na Classe')
Insert Into Tb_ClasseSala values ('10ma Classe')
Insert Into Tb_ClasseSala values ('11ra Classe')
Insert Into Tb_ClasseSala values ('12da Classe')
Insert Into Tb_ClasseSala values ('Sala AEE')

go
--drop table Tb_Sala
Create Table Tb_Sala
(
Id_Sala Int Not Null Identity Primary Key,
NomeSala varchar(20) Not Null,
Id_Escola int Not Null Foreign Key References Tb_Escola(Id_Escola),
Id_TipoSala Int Not NUll Foreign Key References Tb_TipoSala(Id_TipoSala),
Id_ClasseSala Int Not Null Foreign Key References Tb_ClasseSala (Id_ClasseSala),
)
go

Create Proc AddSala
@Id_Usuario Int,
@NomeSala Varchar(20),
@Id_Escola Int,
@Id_TipoSala Int,
@Id_ClasseSala Int
as
Begin

Declare @NomeEscola varchar(100) = (Select NomeEscola from Tb_Escola where Id_Escola = @Id_Escola)

Insert Into Tb_Sala (Id_Escola,Id_TipoSala,Id_ClasseSala,NomeSala) values (@Id_Escola,@Id_TipoSala,@Id_ClasseSala,@NomeSala)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro da Sala: '+@NomeSala + ' na Escola: '+ @NomeEscola)

End

go



-----------------------------------------------------------------//Estudante//------------------------------------------------------------
Create Table Tb_Estudante
(
Id_Estudante Int Not Null Identity Primary Key,
NomeEstudante varchar(50) Not Null,
NomePai varchar(50) default '-',
NomeMae varchar(50) default '-',
DataNasc date not null,
Id_MunicipioNasc Int Not Null Foreign Key References Tb_Municipio( Id_Municipio),
Id_Genero INt Not Null Foreign Key References Tb_Genero (Id_Genero),
Altura Int Not Null,
Peso Int Not NUll,
Id_TipoDoc Int Not Null Foreign Key References Tb_TipoDoc (Id_TipoDoc),
NumDoc varchar(14) Not Null default 'SEM NÚMERO',
Morada varchar(200) default 'Nenhuma morada especificada.',
Id_Municipio Int Not Null Foreign Key References Tb_Municipio( Id_Municipio),
TelfPrim varchar(9) Not Null,
TelfSecu varchar(9),
Email varchar(50),
Id_TipoAtendimento Int Not Null Foreign Key References Tb_TipoAtendimento(Id_TipoAtendimento),
PathPic varchar(100) Not Null Default('/Deposit/Pic/anonimo.jpg'),
Obs varchar(1000),
Completo bit Not Null  default 0
)
go


Create Proc AddEstudante
@Id_Usuario Int,
@NomeEstudante varchar(50),
@NomePai varchar(50),
@NomeMae varchar(50),
@DataNasc date,
@Id_MunicipioNasc Int,
@Id_Genero Int,
@Altura Int,
@Peso Int,
@Id_TipoDoc Int,
@NumDoc varchar(14),
@Morada varchar(200),
@Id_Municipio Int,
@TelfPrim varchar(9),
@TelfSecu varchar(9),
@Email varchar(50),
@Id_TipoAtendimento Int,
@Obs varchar(1000),
@Id_Estudante int output
as
Begin
INSERT INTO Tb_Estudante
           (NomeEstudante
           ,NomePai
           ,NomeMae
           ,DataNasc
           ,Id_MunicipioNasc
           ,Id_Genero
           ,Altura
           ,Peso
           ,Id_TipoDoc
           ,NumDoc
           ,Morada
           ,Id_Municipio
           ,TelfPrim
           ,TelfSecu
           ,Email
           ,Id_TipoAtendimento
           ,Obs)
     VALUES
           (@NomeEstudante
           ,@NomePai
           ,@NomeMae
           ,@DataNasc
           ,@Id_MunicipioNasc
           ,@Id_Genero
           ,@Altura
           ,@Peso
           ,@Id_TipoDoc
           ,@NumDoc
           ,@Morada
           ,@Id_MunicipioNasc
           ,@TelfPrim
           ,@TelfSecu
           ,@Email
           ,@Id_TipoAtendimento
           ,@Obs)

		   Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Estudante '+@NomeEstudante + ' cadastro iniciado.')

		   Set @Id_Estudante = (Select IDENT_CURRENT('Tb_Estudante')) 

		   Return @Id_Estudante
End
go

--Exec UpdPicEstudante

Create Proc UpdPicEstudante
@Id_Usuario Int,
@Id_Estudante Int,
@PathPic varchar(100)
as
Begin

Update Tb_Estudante set PathPic = @PathPic Where Id_Estudante = @Id_Estudante

declare @NomeEstudante varchar(500) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização da Fotografia do Estudante: '+ @NomeEstudante + ' com exito.')

End
go

Create Table Tb_DefEstudante
(
Id_DefFuncionario Int Not Null Identity Primary Key,
Id_Estudante Int Not Null Foreign Key References Tb_Estudante(Id_Estudante),
Id_ClasifDef Int Not Null Foreign Key References Tb_ClasifDef (Id_ClasifDef),
Id_NatuDef Int Not Null Foreign Key References Tb_NatuDef (Id_NatuDef),
Id_EntiAval Int Not Null Foreign Key References Tb_EntiAval (Id_EntiAval)
)
go

Create Proc AddDefEstudante
@Id_Usuario int,
@Id_Estudante Int,
@Id_ClasifDef Int,
@Id_NatuDef Int,
@Id_EntiAval Int
as
Begin
Insert Into Tb_DefEstudante values (@Id_Estudante,@Id_ClasifDef,@Id_NatuDef,@Id_EntiAval)

Declare @D varchar(50) = (Select ClasifDef from Tb_ClasifDef where Id_ClasifDef = @Id_ClasifDef)

Declare @NomeEstudante varchar(50) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

Insert INto Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Estudante: '+@NomeEstudante + ' -> Nova Deficiência: '+@D+'.')
End
go


--Create Proc DeleteSala
--@UserID uniqueidentifier,
--@Id_Sala Int
--as
--Begin

--Declare @NomeSala varchar(20) = (Select NomeSala from Tb_Sala Where Id_Sala = @Id_Sala)

--Declare @NomeEscola varchar(100) = (Select NomeEscola from Tb_Escola inner join Tb_Sala on Tb_Escola.Id_Escola = Tb_Sala.Id_Escola Where Id_Sala = @Id_Sala)

--DELETE FROM [Tb_Sala] WHERE [Id_Sala] = @Id_Sala

--Insert Into Tb_Reg(UserID,Reg) values (@UserID,'Eliminada sala: '+ @NomeSala + ' da escola: ' + @NomeEscola + '.')
--End

--go

--Create Proc UpdateSala
--@UserID Uniqueidentifier,
--@NomeSala Varchar(20),
--@Id_TipoEduc Int,
--@Id_NivelEduc Int,
--@Id_Sala Int
--as
--Begin

--Declare @OldNomeSala varchar(20) = (Select NomeSala from Tb_Sala Where Id_Sala = @Id_Sala)

--Declare @NomeEscola varchar(100) = (Select NomeEscola from Tb_Escola inner join Tb_Sala on Tb_Escola.Id_Escola = Tb_Sala.Id_Escola Where Id_Sala = @Id_Sala)

--Update Tb_Sala set NomeSala = @NomeSala, Id_NivelEduc = @Id_NivelEduc, Id_TipoEduc = @Id_TipoEduc Where Id_Sala = @Id_Sala

--Insert Into Tb_Reg(UserId,Reg) values (@UserID,'Atualização da Sala: ' +@OldNomeSala +' da escola: ' + @NomeEscola + '.')

--End

--go

Create Table Tb_VincEstudanteSala
(
Id_VincEstudanteSala Int Not Null Identity Primary Key,
Id_Estudante Int Not Null Foreign Key References Tb_Estudante ( Id_Estudante ),
Id_Sala Int Not Null Foreign Key References Tb_Sala (Id_Sala)
)

go

Create Proc AddVincEstudanteSala
@Id_Usuario Int,
@Id_Estudante Int,
@Id_Sala Int
as
Begin

Insert Into Tb_VincEstudanteSala(Id_Estudante,Id_Sala) values (@Id_estudante,@Id_Sala)

Declare @NomeEstudante varchar(100) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

Declare @NomeEscola varchar(100) = (select NomeEscola from Tb_Escola inner join tb_Sala on Tb_Escola.Id_Escola = Tb_Sala.Id_Escola Where Id_Sala = @Id_Sala)

Declare @NomeSala varchar(20) = (Select NomeSala from Tb_Sala Where  Id_Sala = @Id_Sala)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Estudante: '+ @NomeEstudante + ' vinculado a Sala: '+ @NomeSala +' da Escola: '+@NomeEscola)

End

go

Create Proc FiltrarEstudante
@NomeEstudante varchar(50)
as 
Begin
Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeEstudante)) + '%';

SELECT  TOP 50     Tb_Estudante.Id_Estudante AS Nº, Tb_Estudante.NomeEstudante AS Nome, Tb_Estudante.DataNasc AS [Data de Nascimento], Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Estudante.Completo
FROM            Tb_Provincia INNER JOIN
                         Tb_Municipio ON Tb_Provincia.Id_Provincia = Tb_Municipio.Id_Provincia INNER JOIN
                         Tb_Estudante ON Tb_Municipio.Id_Municipio = Tb_Estudante.Id_Municipio
WHERE        (Tb_Estudante.NomeEstudante LIKE @Nome)
ORDER BY Nome
End

-------------------------------------------------------------//Instituições//----------------------------------------------------------------
Create Table Tb_Instituicao
(
Id_Instituicao Int Not Null Identity Primary Key,
NomeInstituicao varchar(100) not Null,
Endereco varchar(150) default 'Não especificado.',
Id_Municipio Int Not NUll foreign Key References Tb_Municipio (Id_Municipio),
Email varchar(50) default 'Não especificado.',
TelefPrincipal varchar(12) default 'Desconhecido',
TelefSecundario varchar(12) default 'Desconhecido',
)

go

Create Proc AddInstituicao
@Id_Usuario Int,
@NomeInstituicao varchar(100),
@Endereco varchar(150),
@Id_Municipio Int,
@Email varchar(50),
@TelfPrincipal varchar(12),
@TelfSecundario varchar(12),
@Id_Instituicao Int OutPut
as
Begin

INSERT INTO Tb_Instituicao
           ([NomeInstituicao]
           ,[Endereco]
           ,[Id_Municipio]
           ,[Email]
           ,[TelefPrincipal]
           ,[TelefSecundario])
     VALUES
           (@NomeInstituicao
           ,@Endereco
           ,@Id_Municipio
           ,@Email
           ,@TelfPrincipal
           ,@TelfSecundario)

INSERT INTO [dbo].[Tb_Reg]
           ([Id_Usuario]
           ,[Reg])
     VALUES
           (@Id_Usuario
           ,'Instituição: '+@NomeInstituicao +' -> cadastrada com exito.')

		   Set @Id_Instituicao = (Select IDENT_CURRENT('Tb_Instituicao')) 
End
go

Create Proc UpdInstituicao
@Id_Usuario Int,
@NomeInstituicao varchar(100),
@Endereco varchar(150),
@Email varchar(50),
@TelfPrincipal varchar(12),
@TelfSecundario varchar(12),
@Id_Instituicao Int
as
Begin

UPDATE [dbo].[Tb_Instituicao]
   SET [NomeInstituicao] = @NomeInstituicao
      ,[Endereco] = @Endereco
      ,[Email] = @Email
      ,[TelefPrincipal] = @TelfPrincipal
      ,[TelefSecundario] = @TelfSecundario
 WHERE Id_Instituicao = @Id_Instituicao

INSERT INTO [dbo].[Tb_Reg]
           ([Id_Usuario]
           ,[Reg])
     VALUES
           (@Id_Usuario
           ,'Instituição: '+@NomeInstituicao +' -> actualizada com exito.')

End
go
--Drop Proc FiltrarInstituicao
Create Proc FiltrarInstituicao
@Nome varchar(50),
@FiltrarProvincia bit,
@Id_Provincia Int,
@FiltrarMunicipio bit,
@Id_Municipio Int
as
Begin
	Declare @NomeInstituicao varchar(50) = '%' +LTRIM(RTRIM(@Nome)) + '%';

	If @FiltrarMunicipio = 1 and @FiltrarProvincia = 1
		Begin
			SELECT        Tb_Instituicao.Id_Instituicao, Tb_Instituicao.NomeInstituicao, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Instituicao INNER JOIN
									 Tb_Municipio ON Tb_Instituicao.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Instituicao.NomeInstituicao LIKE @NomeInstituicao)AND(Tb_Instituicao.Id_Municipio = @Id_Municipio) 
		End
	Else If @FiltrarProvincia = 1
		Begin
			SELECT        Tb_Instituicao.Id_Instituicao, Tb_Instituicao.NomeInstituicao, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Instituicao INNER JOIN
									 Tb_Municipio ON Tb_Instituicao.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Instituicao.NomeInstituicao LIKE @NomeInstituicao) AND (Tb_Provincia.Id_Provincia = @Id_Provincia)
		End
	Else
		Begin
			SELECT        Tb_Instituicao.Id_Instituicao, Tb_Instituicao.NomeInstituicao, Tb_Provincia.Provincia, Tb_Municipio.Municipio
			FROM            Tb_Instituicao INNER JOIN
									 Tb_Municipio ON Tb_Instituicao.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
									 Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
			WHERE        (Tb_Instituicao.NomeInstituicao LIKE @NomeInstituicao)
		End
End
go

--Exec FiltrarInstituicao 'nac',0,1,0,1
-------------------------------------------------------------//Funcionario//-----------------------------------------------------------------
Create Table Tb_Funcionario
(
Id_Funcionario Int Not Null Identity Primary Key,
NomeFuncionario varchar(100) Not Null,
DataNasc Date Not Null,
Id_MunicipioNasc Int Not Null Foreign Key References Tb_Municipio (Id_Municipio),
Id_Genero Int Not Null Foreign Key References Tb_Genero (Id_Genero),
Endereco varchar(150) Default 'Nenhum Definido',
Id_Municipio Int Not Null Foreign Key References Tb_Municipio (Id_Municipio),
Email varchar(50),
NumAgente varchar(10) Unique Not Null,
TelfPrim varchar(9) Not Null,
TelfSecu varchar(9),
Obs varchar(2000),
PathPic varchar(100) Not Null Default('\Deposit\Pic\anonimo.jpg'),
Completo bit Not Null Default 0
)
go
--Alter Table Tb_Funcionario add NAgente varchar(10)
--EXEC sp_RENAME 'Tb_Funcionario.NAgente' , 'NumAgente', 'COLUMN'
go

Create Proc AddFuncionario
@Id_Usuario Int,
@NomeFuncionario varchar(100),
@DataNasc Date,
@Id_MunicipioNasc Int,
@Id_Genero Int,
@Endereco varchar(150),
@Id_Municipio Int,
@Email varchar(50),
@TelfPrim varchar(9),
@TelfSecu varchar(9),
@Obs varchar(2000),
@Id_Funcionario Int Output,
@NumAgente varchar(10)
as
Begin

Insert Into Tb_Funcionario
(NomeFuncionario,DataNasc,Id_MunicipioNasc,Id_Genero,Endereco,Id_Municipio,Email,TelfPrim,TelfSecu,Obs,NumAgente)
values
(@NomeFuncionario,@DataNasc,@Id_MunicipioNasc,@Id_Genero,@Endereco,@Id_Municipio,@Email,@TelfPrim,@TelfSecu,@Obs, @NumAgente)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro do Funcionario: '+@NomeFuncionario + ' com exito.')

Set @Id_Funcionario = (Select IDENT_CURRENT('Tb_Funcionario'))

End
go

Create Proc UpdPicFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@PathPic varchar(100)
as
Begin

Update Tb_Funcionario set PathPic = @PathPic Where Id_Funcionario = @Id_Funcionario

declare @NomeFuncionario varchar(500) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Actualização da Fotografia do Funcionario: '+ @NomeFuncionario + ' com exito.')

End
go

Create Table Tb_DocFuncionario
(
Id_DocFuncionario Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null Foreign Key References Tb_Funcionario(Id_Funcionario),
Id_TipoDoc Int Not Null Foreign Key References Tb_TipoDoc (Id_TipoDoc),
NumDoc varchar(14) Not Null,
DataInicio Date Not Null,
DataFim Date,
PathDoc varchar(100)
)
go

Create Proc AddDocFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@Id_TipoDoc Int,
@NumDoc varchar(14),
@DataInicio Date,
@DataFim Date,
@PathDoc varchar(100)
as
Begin

Insert Into Tb_DocFuncionario 
(Id_Funcionario,Id_TipoDoc,NumDoc,DataInicio,DataFim,PathDoc)
values
(@Id_Funcionario,@Id_TipoDoc,@NumDoc,@DataInicio,@DataFim,@PathDoc)

Declare @Documento varchar(20) = (Select TipoDoc from Tb_TipoDoc where Id_TipoDoc = @Id_TipoDoc)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario =@Id_Funcionario)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Vinculado novo '+@Documento +' ao Funcionario '+@NomeFuncionario+'.')

End
go

Create Table Tb_DefFuncionario
(
Id_DefFuncionario Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null Foreign Key References Tb_Funcionario(Id_Funcionario),
Id_ClasifDef Int Not Null Foreign Key References Tb_ClasifDef (Id_ClasifDef),
Id_NatuDef Int Not Null Foreign Key References Tb_NatuDef (Id_NatuDef),
Id_EntiAval Int Not Null Foreign Key References Tb_EntiAval (Id_EntiAval)
)
go

Create Proc AddDefFuncionario
@Id_Usuario int,
@Id_Funcionario Int,
@Id_ClasifDef Int,
@Id_NatuDef Int,
@Id_EntiAval Int
as
Begin
Insert Into Tb_DefFuncionario values (@Id_Funcionario,@Id_ClasifDef,@Id_NatuDef,@Id_EntiAval)

Declare @D varchar(50) = (Select ClasifDef from Tb_ClasifDef where Id_ClasifDef = @Id_ClasifDef)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Insert INto Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Funcionario: '+@NomeFuncionario + ' -> Nova Deficiência: '+@D)
End
go

Create Table Tb_NivelAcademico
(
Id_NivelAcademico Int Not Null Identity(1,1) Primary Key,
NivelAcademico Varchar(25) Not Null
)

Insert Into Tb_NivelAcademico(NivelAcademico) values('Nenhum')
Insert Into Tb_NivelAcademico(NivelAcademico) values('Ensino Base')
Insert Into Tb_NivelAcademico(NivelAcademico) values('Técnico Medio')
Insert Into Tb_NivelAcademico(NivelAcademico) values('Licenciado')
Insert Into Tb_NivelAcademico(NivelAcademico) values('Mestrado')
Insert Into Tb_NivelAcademico(NivelAcademico) values('Doutorado')
go

Create Table Tb_NAcaFuncionario
(
Id_NAcaFuncionario Int Not NUll Identity Primary Key,
Id_Funcionario Int Not NUll Foreign Key References Tb_Funcionario (Id_Funcionario),
Id_NivelAcademico Int Not Null Foreign Key References Tb_NivelAcademico(Id_NivelAcademico),
Especialidade varchar(50) Not Null
)
go

Create Proc AddNAcaFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@Id_NivelAcademico Int,
@Especialidade varchar(50)
as
Begin
Insert Into Tb_NAcaFuncionario (Id_Funcionario,Id_NivelAcademico,Especialidade)
values (@Id_Funcionario,@Id_NivelAcademico,@Especialidade)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Insert Into Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Funcionario: '+ @NomeFuncionario + '-> Novo nivel academico.')
End
go
-------------
Create Table Tb_GrupoPessoal
(
Id_GrupoPessoal Int Not Null Identity Primary Key,
GrupoPessoal varchar(80) Unique Not Null
)

Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Direcção e Chefia')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Técnico Superior')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Técnico')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Técnico Médio')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Administrativo')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Auxiliar')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Investigador')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Professor de II Ciclo do Ensino Secundário Diplomado')
Insert Into Tb_GrupoPessoal(GrupoPessoal) values('Professor de I Ciclo do Ensino Secundário Diplomado')


--Select * from Tb_GrupoPessoal
go


Create Table Tb_TipoLaboral
(
Id_TipoLaboral Int Not Null Identity(1,1) Primary Key,
TipoLaboral varchar(20) Not Null Unique 
)

Insert Into Tb_TipoLaboral(TipoLaboral) values ('Administrativo')
Insert Into Tb_TipoLaboral(TipoLaboral) values ('Academico')
--select * from Tb_TipoLaboral
go

Create Table Tb_CatLaboral
(
Id_CatLaboral Int Not Null Identity Primary Key,
Id_TipoLaboral Int Not Null Foreign Key References Tb_TipoLaboral(Id_TipoLaboral),
Id_GrupoPessoal Int Not Null Foreign Key References Tb_GrupoPessoal (Id_GrupoPessoal),
CatLaboral varchar(100) Not Null
)
go

Create Proc AddCatLaboral
@TipoLaboral varchar(20),
@GrupoPessoal varchar(80),
@Categoria varchar(100)
as
Begin
Declare @Id_TipoLaboral Int = (Select Id_TipoLaboral from Tb_TipoLaboral where TipoLaboral = @TipoLaboral)
Declare @Id_GrupoPessoal Int = (Select Id_GrupoPessoal from Tb_GrupoPessoal Where GrupoPessoal = @GrupoPessoal)

Insert Into Tb_CatLaboral (Id_TipoLaboral,Id_GrupoPessoal,CatLaboral) values (@Id_TipoLaboral,@Id_GrupoPessoal,@Categoria)
End
go

Exec AddCatLaboral 'Administrativo','Direcção e Chefia','Director(a) Geral'
Exec AddCatLaboral 'Administrativo','Direcção e Chefia','Director(a) Geral Adjunto(a)'
Exec AddCatLaboral 'Administrativo','Direcção e Chefia','Chefe de Departamento'
--
Exec AddCatLaboral 'Administrativo','Técnico','Especialista Principal'
Exec AddCatLaboral 'Administrativo','Técnico','Especialista de 1ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico','Especialista de 2ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico','Técnico de 1ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico','Técnico de 2ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico','Técnico de 3ª Classe'
--
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio Príncipal de 1ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio Príncipal de 2ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio Príncipal de 3ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio de 1ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio de 2ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Médio','Técnico Médio de 3ª Classe'
--
Exec AddCatLaboral 'Administrativo','Técnico Superior','Assessor Principal'
Exec AddCatLaboral 'Administrativo','Técnico Superior','Primeiro Assessor'
Exec AddCatLaboral 'Administrativo','Técnico Superior','Assessor'
Exec AddCatLaboral 'Administrativo','Técnico Superior','Técnico Superior Principal'
Exec AddCatLaboral 'Administrativo','Técnico Superior','Técnico Superior 1ª Classe'
Exec AddCatLaboral 'Administrativo','Técnico Superior','Técnico Superior 2ª Classe'
--
Exec AddCatLaboral 'Administrativo','Administrativo','Oficial Administrativo Principal'
Exec AddCatLaboral 'Administrativo','Administrativo','Primeiro Oficial'
Exec AddCatLaboral 'Administrativo','Administrativo','Segundo Oficial'
Exec AddCatLaboral 'Administrativo','Administrativo','Terceiro Oficial'
Exec AddCatLaboral 'Administrativo','Administrativo','Aspirante'
Exec AddCatLaboral 'Administrativo','Administrativo','Escrituário-Dactilógrafo'
Exec AddCatLaboral 'Administrativo','Administrativo','Motorista de Ligeiros Profissional'
--
Exec AddCatLaboral 'Administrativo','Auxiliar','Auxiliar Administrativo Principal'
Exec AddCatLaboral 'Administrativo','Auxiliar','Auxiliar de Limpeza Principal'
--
Exec AddCatLaboral 'Academico','Investigador','Investigador Principal'
Exec AddCatLaboral 'Academico','Investigador','Investigador Auxiliar'
Exec AddCatLaboral 'Academico','Investigador','Investigador Coordenador'
Exec AddCatLaboral 'Academico','Investigador','Assistente de Investigação'
Exec AddCatLaboral 'Academico','Investigador','Estagiário de Investigação'
--
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 1º Escalão'
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 2º Escalão'
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 3º Escalão'
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 4º Escalão'
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 5º Escalão'
Exec AddCatLaboral 'Academico','Professor de I Ciclo do Ensino Secundário Diplomado','Prof. I Ciclo Ensino Sec. Diplomado 6º Escalão'
--
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 1º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 2º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 3º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 4º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 5º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 6º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 7º Escalão'
Exec AddCatLaboral 'Academico','Professor de II Ciclo do Ensino Secundário Diplomado','Prof. II Ciclo Ensino Sec. Diplomado 8º Escalão'
--
Drop Proc AddCatLaboral
--
--Select * from Tb_CatLaboral

--Drop Table Tb_InstFuncionario
Create Table Tb_InstFuncionario
(
Id_InstFuncionario Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null Foreign Key References Tb_Funcionario (Id_Funcionario),
Id_Instituicao Int Not Null Foreign Key References Tb_Instituicao (Id_Instituicao),
Id_CatLaboral Int Not Null Foreign Key References Tb_CatLaboral (Id_CatLaboral)
)
go

Create Proc AddInstFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@Id_Instituicao Int,
@Id_CatLaboral Int
as
Begin
Insert Into Tb_InstFuncionario (Id_Funcionario,Id_Instituicao,Id_CatLaboral) values (@Id_Funcionario,@Id_Instituicao,@Id_CatLaboral)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Declare @NomeInstituicao varchar(50) = (Select NomeInstituicao from Tb_Instituicao Where Id_Instituicao = @Id_Instituicao)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario, 'Funcionario: ' + @NomeFuncionario + ' vinculado a ' + @NomeInstituicao + '.')
End
go

Create Table Tb_EscoFuncionario
(
Id_InstFuncionario Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null Foreign Key References Tb_Funcionario (Id_Funcionario),
Id_Escola Int Not Null Foreign Key References Tb_Escola (Id_Escola),
Id_CatLaboral Int Not Null Foreign Key References Tb_CatLaboral (Id_CatLaboral)
)
go

Create Proc AddEscoFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@Id_Escola Int,
@Id_CatLaboral Int
as
Begin
Insert Into Tb_EscoFuncionario (Id_Funcionario,Id_Escola,Id_CatLaboral) values (@Id_Funcionario,@Id_Escola,@Id_CatLaboral)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Declare @NomeEscola varchar(50) = (Select NomeEscola from Tb_Escola Where Id_Escola = @Id_Escola)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario, 'Funcionario: ' + @NomeFuncionario + ' vinculado a ' + @NomeEscola + '.')
End
go

Create Table Tb_Entidade
(
Id_Entidade Int NOt Null IDentity Primary Key,
Entidade varchar(15)
)

Insert Into Tb_Entidade values ('Escola')
Insert Into Tb_Entidade values ('Instituição')

go

Create Proc CardFiltrarNome
@Id_Entidade Int,
@Id_Funcionario Int
as
Begin
	If (@Id_Entidade = 1)
		Begin
			SELECT        Tb_Escola.Id_Escola AS Id_Entidade, Tb_Escola.NomeEscola AS NomeEntidade
			FROM            Tb_Escola INNER JOIN
									 Tb_EscoFuncionario ON Tb_Escola.Id_Escola = Tb_EscoFuncionario.Id_Escola
			WHERE        (Tb_EscoFuncionario.Id_Funcionario = @Id_Funcionario)
		End
	else if(@Id_Entidade = 2)
		Begin
			SELECT        Tb_Instituicao.Id_Instituicao AS Id_Entidade, Tb_Instituicao.NomeInstituicao AS NomeEntidade
			FROM            Tb_InstFuncionario INNER JOIN
									 Tb_Instituicao ON Tb_InstFuncionario.Id_Instituicao = Tb_Instituicao.Id_Instituicao
			WHERE        (Tb_InstFuncionario.Id_Funcionario = @Id_Funcionario)
		End
End
go

Create Proc CardFiltrarFuncao
@Id_Entidade Int,
@Id_Entidade2 Int,
@Id_Funcionario Int
as
Begin
	If (@Id_Entidade = 1)
		Begin
			SELECT        Tb_CatLaboral.Id_CatLaboral, Tb_CatLaboral.CatLaboral
			FROM            Tb_EscoFuncionario INNER JOIN
									 Tb_CatLaboral ON Tb_EscoFuncionario.Id_CatLaboral = Tb_CatLaboral.Id_CatLaboral
			WHERE        (Tb_EscoFuncionario.Id_Funcionario = @Id_Funcionario) AND (Tb_EscoFuncionario.Id_Escola = @Id_Entidade2)
		End
	else if(@Id_Entidade = 2)
		Begin
			SELECT        Tb_CatLaboral.Id_CatLaboral, Tb_CatLaboral.CatLaboral
		FROM            Tb_InstFuncionario INNER JOIN
								 Tb_CatLaboral ON Tb_InstFuncionario.Id_CatLaboral = Tb_CatLaboral.Id_CatLaboral
		WHERE        (Tb_InstFuncionario.Id_Funcionario = @Id_Funcionario) AND (Tb_InstFuncionario.Id_Instituicao = @Id_Entidade2)
		End
End
go

Create Proc FiltrarFuncionario
@NomeFuncionario varchar(20)
as
Begin

Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeFuncionario)) + '%';

SELECT        TOP (50) Tb_Funcionario.Id_Funcionario, Tb_Funcionario.NomeFuncionario, Tb_Funcionario.Email, Tb_Funcionario.TelfPrim, Tb_Funcionario.PathPic, Tb_Funcionario.Completo, Tb_Provincia.Provincia, 
                         Tb_Municipio.Municipio
FROM            Tb_Funcionario INNER JOIN
                         Tb_Municipio ON Tb_Funcionario.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
                         Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia
WHERE        (Tb_Funcionario.NomeFuncionario LIKE @Nome)

End
go


Create Proc EndFuncionario
@Id_Usuario Int,
@Id_Funcionario Int
as
Begin
Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Update Tb_Funcionario set Completo = 1 Where Id_Funcionario = @Id_Funcionario

insert Into Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Funcionario: '+ @NomeFuncionario + '-> cadastro finalizado.')

End
go

Create Proc LoadFichaFuncionario
@Id_Funcionario Int
as
BEgin
SELECT        Tb_Funcionario.Id_Funcionario, Tb_Funcionario.NomeFuncionario, Tb_Funcionario.DataNasc, Tb_MunicipioNasc.Municipio AS MunicipioNasc, Tb_ProvinciaNasc_1.Provincia AS ProvinciaNasc, 
                         Tb_Genero.Genero, Tb_Funcionario.Endereco, Tb_Municipio.Municipio, Tb_Provincia.Provincia, Tb_Funcionario.Email, Tb_Funcionario.NumAgente, Tb_Funcionario.TelfPrim, Tb_Funcionario.TelfSecu, 
                         Tb_Funcionario.Obs, Tb_Funcionario.PathPic
FROM            Tb_Funcionario INNER JOIN
                         Tb_Genero ON Tb_Funcionario.Id_Genero = Tb_Genero.Id_Genero INNER JOIN
                         Tb_Municipio ON Tb_Funcionario.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN
                         Tb_Municipio AS Tb_MunicipioNasc ON Tb_Funcionario.Id_MunicipioNasc = Tb_MunicipioNasc.Id_Municipio INNER JOIN
                         Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN
                         Tb_Provincia AS Tb_ProvinciaNasc_1 ON Tb_MunicipioNasc.Id_Provincia = Tb_ProvinciaNasc_1.Id_Provincia
WHERE        (Tb_Funcionario.Id_Funcionario = @Id_Funcionario)
End

go

Exec LoadFichaFuncionario 1
--------------------------------------------------------------//Encarregado//-------------------------------------------------------------

Create Table Tb_Encarregado
(
Id_Encarregado Int Identity Primary Key,
NomeEncarregado varchar(50) not null,
DataNasc Date not null,
Id_MunicipioNasc Int not null Foreign Key References Tb_Municipio(Id_Municipio),
Id_Genero Int Not Null Foreign Key References Tb_Genero(Id_Genero),
Funcao varchar(50),
LocalTrabalho varchar(50),
TelfTrabalho varchar(9),
Endereco varchar(60) Not Null,
Id_Municipio Int Not Null Foreign Key References Tb_Municipio(Id_Municipio),
TelfPrin varchar(9) Not Null,
TelfSecu varchar(9),
Email varchar(50),
Obs varchar(500)
)

go

Create Proc AddEncarregado
@Id_Usuario Int,
@NomeEncarregado varchar(50),
@DataNasc date,
@Id_MunicipioNasc Int,
@Id_Genero Int,
@Funcao varchar(50),
@LocalTrabalho varchar(50),
@TelfTrabalho varchar(9),
@Endereco varchar(60),
@Id_Municipio int,
@TelfPrin varchar(9),
@TelfSecu varchar(9),
@Email varchar(50),
@Obs varchar(500),
@Id_Encarregado Int Output
as
Begin

INSERT INTO [Tb_Encarregado]
           ([NomeEncarregado]
           ,[DataNasc]
           ,[Id_MunicipioNasc]
           ,[Id_Genero]
           ,[Funcao]
           ,[LocalTrabalho]
           ,[TelfTrabalho]
           ,[Endereco]
           ,[Id_Municipio]
           ,[TelfPrin]
           ,[TelfSecu]
           ,[Email]
           ,[Obs])
     VALUES
           (@NomeEncarregado
           ,@DataNasc
           ,@Id_MunicipioNasc
           ,@Id_Genero
           ,@Funcao
           ,@LocalTrabalho
           ,@TelfTrabalho
           ,@Endereco
           ,@Id_Municipio
           ,@TelfPrin
           ,@TelfSecu
           ,@Email
           ,@Obs)

		   Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Cadastro do Encarregado: '+@NomeEncarregado)

		   Set @Id_Encarregado = (Select IDENT_CURRENT('Tb_Encarregado'))
End
go

Create Table Tb_Parentesco
(
Id_Parentesco Int Not Null Identity Primary Key,
Parentesco varchar(20) Not Null Unique
)

Insert Into Tb_Parentesco values ('Pai/Mâe')
Insert Into Tb_Parentesco values ('Avo')
Insert Into Tb_Parentesco values ('Tio/Tia')
Insert Into Tb_Parentesco values ('Primo/Prima')
Insert Into Tb_Parentesco values ('Irmão/Irmã')
Insert Into Tb_Parentesco values ('Sem Parentesco')
go

Create Table Tb_ParentescoEncarregado
(
Id_ParentescoEncarregado Int Not Null Identity Primary Key,
Id_Encarregado Int Not Null Foreign Key references Tb_Encarregado (Id_Encarregado),
Id_Estudante Int Not Null Foreign Key References Tb_Estudante(Id_Estudante),
Id_Parentesco Int Not Null Foreign Key References Tb_Parentesco(Id_Parentesco)
)
go

Create Proc FiltrarEncarregado
@NomeEncarregado varchar(50)
as
Begin
Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeEncarregado)) + '%';
SELECT     top 50   Id_Encarregado,NomeEncarregado
FROM            Tb_Encarregado
WHERE
NomeEncarregado Like @Nome
End
go

Create Proc AddParentescoEncarregado
@Id_Usuario Int,
@Id_Estudante Int,
@Id_Encarregado Int,
@Id_Parentesco Int
as
Begin

INSERT INTO [dbo].[Tb_ParentescoEncarregado]
           ([Id_Encarregado]
           ,[Id_Estudante]
           ,[Id_Parentesco])
     VALUES
           (@Id_Encarregado
           ,@Id_Estudante
           ,@Id_Parentesco)

Insert Into Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Viculado Encarregado Nº:'+CONVERT(varchar(10),@Id_Encarregado) + ' a Estudante Nº:'+CONVERT(varchar(10),@Id_Estudante)+'.')
End
go

Create Proc CompletarEstudante
@Id_Usuario Int,
@Id_Estudante Int
as
Begin
Update Tb_Estudante set Completo = 1 where Id_Estudante =@Id_Estudante

Declare @NomeEstudante varchar(100) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Estudante '+@NomeEstudante+' completado com exito.')
End
go

Create Proc EditEstudante


go

--
----Insert Into Tb_Parentesco values ('')
--go
--Create Proc AtualizarEncarregado
--@UserID Uniqueidentifier,
--@Id_Encarregado int,
--@NomeEncarregado varchar(50),
--@DataNasc date,
--@Id_MunicipioNasc Int,
--@Id_Genero Int,
--@Id_TipoDoc Int,
--@DocNum varchar(18),
--@DataEmisao date,
--@DataValidade date,
--@Profissao varchar(50),
--@LocalTrabalho varchar(50),
--@TelfTrabalho varchar(9),
--@Endereco varchar(60),
--@Id_Municipio Int,
--@TelfPrincipal varchar(9),
--@TelfSecundario varchar(60),
--@EmailContacto varchar(50),
--@Obs varchar(500)
--as
--Begin

--UPDATE [dbo].[Tb_Encarregado]
--   SET [NomeEncarregado] = @NomeEncarregado
--      ,[DataNasc] = @DataNasc
--      ,[Id_MunicipioNasc] = @Id_MunicipioNasc
--      ,[Id_Genero] = @Id_Genero
--      ,[Id_TipoDoc] = Id_TipoDoc
--      ,[DocNum] = @DocNum
--      ,[DataEmissao] = @DataEmisao
--      ,[DataValidade] = @DataValidade
--      ,[Profissao] = @Profissao
--      ,[LocalTrabalho] = @LocalTrabalho
--      ,[TelfTrabalho] = @TelfTrabalho
--      ,[Endereco] = @Endereco
--      ,[Id_Municipio] = @Id_Municipio
--      ,[TelfPrincipal] = @TelfPrincipal
--      ,[TelfSecundario] = @TelfSecundario
--      ,[EmailContacto] = @EmailContacto
--      ,[Obs] = @Obs
-- WHERE 
-- Id_Encarregado = @Id_Encarregado
 
  
--  Insert Into Tb_Reg(UserId,Reg) values (@UserId,'Atualização do Encarregado Nº: '+ CONVERT(varchar(10),@Id_Encarregado) +'.')

--End





--Create Proc UpdateEncarregado
--@UserID Uniqueidentifier,
--@Id_Estudante Int,
--@Id_Encarregado Int,
--@Id_Parentesco 
--as
--Begin

--End 
--go
--Create Proc UpdateVincEstudanteEncarregado
--@UserID uniqueidentifier,
--@Id_Estudante Int,
--@Id_Encarregado Int,
--@Id_Parentesco Int
--as
--Begin

--Declare @NomeEstudante varchar(100) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

--Declare @NomeEncarregado varchar(50) = (Select NomeEncarregado from Tb_Encarregado Where Id_Encarregado =@Id_Encarregado)
 
--Update Tb_VinculoEstudanteEncarregado set Id_Encarregado = @Id_Encarregado, Id_Parentesco = @Id_Parentesco Where Id_Estudante = @Id_Estudante

--Insert Into Tb_Reg(UserId,Reg) values (@UserID,'Assignado: '+@NomeEncarregado + ' como novo encarregado de educação de : '+@NomeEstudante+'.')
--End
--go
--------------------------------------------------------------//Equipamento//-------------------------------------------------------------
Create Table Tb_EstadoEquipamento
(
Id_EstadoEquipamento Int Not NUll Identity Primary Key,
EstadoEquipamento varchar(20) Not Null Unique
)

Insert Into Tb_EstadoEquipamento values ('Funcional')
Insert Into Tb_EstadoEquipamento values ('Avariado')
Insert Into Tb_EstadoEquipamento values ('Fora de Uso')
Insert Into Tb_EstadoEquipamento values ('Em Reparação')

--Select * from Tb_EstadoEquipamento
go

Create Table Tb_Equipamento
(
Id_Equipamento Int Not Null Identity Primary Key,
Id_ModeloEquipamento Int Not Null Foreign Key References Tb_ModeloEquipamento(Id_ModeloEquipamento),
Id_EstadoEquipamento Int Not Null Foreign Key References Tb_EstadoEquipamento(Id_EstadoEquipamento),
AnoFabrico Int,
AnoAdqui Int,
NumSerie varchar(20),
Custo Money Not Null Default 0,
Fornecedor varchar(50) Not Null default 'Nenhuma Informação Disponivel',
COD varchar(17) Not Null,
)
go

Create Proc AddEquipamento
@Id_Usuario int,
@Id_Modelo Int,
@AnoFabrico Int,
@AndAdqui Int,
@Id_EstadoEquipamento Int,
@NumSerie varchar(20),
@Custo Int,
@Fornecedor varchar(30),
@Id_Equipamento Int Output
as
Begin

Declare @COD Varchar(17) = 'INEE' + Right('000000000000'+ Convert(varchar(13), IDENT_CURRENT('Tb_Equipamento') +1 ),9)

INSERT INTO [dbo].[Tb_Equipamento]
           (
		   [Id_ModeloEquipamento]
           ,[AnoFabrico]
           ,[AnoAdqui]
           ,[Id_EstadoEquipamento]
		   ,[NumSerie]
           ,[Custo]
           ,[Fornecedor]
		   ,[COD])
     VALUES
           (@Id_Modelo
           ,@AnoFabrico
           ,@AndAdqui
           ,@Id_EstadoEquipamento
		   ,@NumSerie
		   ,@Custo
           ,@Fornecedor
		   ,@COD)

		   Insert INto Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº ' + @COD + ' cadastrado com exito.')

		   Set @Id_Equipamento = (Select Id_Equipamento from Tb_Equipamento where COD = @COD)

End
go

Create Proc FiltrarEquipamento
@FiltroCOD varchar(20),
@FiltarEstado bit,
@Id_Estado Int,
@CustoMin money,
@CustoMax money
as
Begin

Declare @NumCOD varchar(20)= '%' +LTRIM(RTRIM(@FiltroCOD)) + '%';
if @FiltarEstado = 1
	Begin
	SELECT    top 100    Tb_Equipamento.Id_Equipamento,Tb_Equipamento.COD, Tb_TipoEquipamento.TipoEquipamento, Tb_MarcaEquipamento.MarcaEquipamento, Tb_ModeloEquipamento.ModeloEquipamento, Tb_EstadoEquipamento.EstadoEquipamento, 
                         Tb_Equipamento.NumSerie, Tb_Equipamento.Custo
FROM            Tb_Equipamento INNER JOIN
                         Tb_EstadoEquipamento ON Tb_Equipamento.Id_EstadoEquipamento = Tb_EstadoEquipamento.Id_EstadoEquipamento INNER JOIN
                         Tb_ModeloEquipamento ON Tb_Equipamento.Id_ModeloEquipamento = Tb_ModeloEquipamento.Id_ModeloEquipamento INNER JOIN
                         Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento INNER JOIN
                         Tb_TipoEquipamento ON Tb_ModeloEquipamento.Id_TipoEquipamento = Tb_TipoEquipamento.Id_TipoEquipamento
WHERE        (Tb_Equipamento.Id_EstadoEquipamento = @Id_Estado) AND (Tb_Equipamento.Custo BETWEEN @CustoMin AND @CustoMax) AND ((Tb_Equipamento.NumSerie like @NumCOD) or (Tb_Equipamento.COD like @NumCOD) )
	End
else
	Begin
	SELECT    top 100    Tb_Equipamento.Id_Equipamento,Tb_Equipamento.COD, Tb_TipoEquipamento.TipoEquipamento, Tb_MarcaEquipamento.MarcaEquipamento, Tb_ModeloEquipamento.ModeloEquipamento, Tb_EstadoEquipamento.EstadoEquipamento, 
                         Tb_Equipamento.NumSerie, Tb_Equipamento.Custo
FROM            Tb_Equipamento INNER JOIN
                         Tb_EstadoEquipamento ON Tb_Equipamento.Id_EstadoEquipamento = Tb_EstadoEquipamento.Id_EstadoEquipamento INNER JOIN
                         Tb_ModeloEquipamento ON Tb_Equipamento.Id_ModeloEquipamento = Tb_ModeloEquipamento.Id_ModeloEquipamento INNER JOIN
                         Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento INNER JOIN
                         Tb_TipoEquipamento ON Tb_ModeloEquipamento.Id_TipoEquipamento = Tb_TipoEquipamento.Id_TipoEquipamento
WHERE         (Tb_Equipamento.Custo BETWEEN @CustoMin AND @CustoMax) AND ((Tb_Equipamento.NumSerie like @NumCOD) or (Tb_Equipamento.COD like @NumCOD) )
	End
End
go

Create Proc UpdateEstadoEquipamento
@Id_Usuario Int,
@Id_Equipamento Int,
@Id_Estado Int
as
Begin

Update Tb_Equipamento set Id_EstadoEquipamento = @Id_Estado Where Id_Equipamento = @Id_Equipamento

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

Declare @Estado varchar(20) = (Select EstadoEquipamento from Tb_EstadoEquipamento Where Id_EstadoEquipamento = @Id_Estado)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº ' + @COD + ' actualizado como '+@Estado+'.')
End

Create Table Tb_EquipamentoEscola
(
Id_EquipamentoEscola Int Not Null Identity Primary Key,
Id_Escola Int Not Null References Tb_Escola (Id_Escola),
Id_Equipamento Int Not Null References Tb_Equipamento (Id_Equipamento),
Data DateTime Not Null Default GetDate()
)
go

Create Proc AddEquipamentoEscola
@Id_Usuario Int,
@Id_Escola Int,
@Id_Equipamento Int
as
Begin

Insert Into Tb_EquipamentoEscola(Id_Equipamento,Id_Escola) values (@Id_Equipamento,@Id_Escola)

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

Declare @NomeEscola varchar(50) = (Select NomeEscola from Tb_Escola Where Id_Escola = @Id_Escola)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº '+@COD + ' atribuido a Escola  '+@NomeEscola+'.')
End
go


Create Table Tb_EquipamentoInstituicao
(
Id_EquipamentoInstituicao Int Not Null Identity Primary Key,
Id_Instituicao Int Not Null References Tb_Instituicao (Id_Instituicao),
Id_Equipamento Int Not Null References Tb_Equipamento (Id_Equipamento),
Data DateTime Not Null Default GetDate()
)
go

Create Table Tb_EquipamentoEstudante
(
Id_EquipamentoEstudante Int Not Null Identity Primary Key,
Id_Estudante Int Not Null References Tb_Estudante (Id_Estudante),
Id_Equipamento Int Not Null References Tb_Equipamento (Id_Equipamento),
Data DateTime Not Null Default GetDate()
)
go

Create Proc AddEquipamentoEstudante
@Id_Usuario Int,
@Id_Estudante Int,
@Id_Equipamento Int
as
Begin

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

Declare @NomeEstudante varchar(50) = (Select NomeEstudante from Tb_Estudante Where Id_Estudante = @Id_Estudante)

Insert Into Tb_EquipamentoEstudante(Id_Estudante,Id_Equipamento) values (@Id_Estudante,@Id_Equipamento)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº '+@COD + ' atribuido ao Estudante  '+@NomeEstudante+'.')

End
go

Create Table Tb_EquipamentoFuncionario
(
Id_EquipamentoFuncionario Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null References Tb_Funcionario (Id_Funcionario),
Id_Equipamento Int Not Null References Tb_Equipamento (Id_Equipamento),
Data DateTime Not Null Default GetDate()
)

go

Create Proc AddEquipamentoFuncionario
@Id_Usuario Int,
@Id_Funcionario Int,
@Id_Equipamento Int
as
Begin

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

Declare @NomeFuncionario varchar(50) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Insert Into Tb_EquipamentoFuncionario(Id_Funcionario,Id_Equipamento) values (@Id_Funcionario,@Id_Equipamento)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº '+@COD + ' atribuido ao Funcionario  '+@NomeFuncionario+'.')

End
go

Create Proc EliminarVinculoEsquipamento
@Id_Usuario Int,
@Id_Equipamento Int
as
Begin

Delete From Tb_EquipamentoEscola where Id_Equipamento = @Id_Equipamento;

Delete From Tb_EquipamentoEstudante where Id_Equipamento = @Id_Equipamento;

Delete From Tb_EquipamentoInstituicao where Id_Equipamento = @Id_Equipamento;

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

Delete From Tb_EquipamentoFuncionario where Id_Equipamento = @Id_Equipamento; --Actualizar quando crear a tabela de vinculo com o funcionario.

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Equipamento Nº '+ @COD+' reassignado ao Stock.')

End

go


Create Proc HistorialEquipamento
@Id_Equipamento Int
as
Begin

Declare @COD varchar(17) = (Select COD from Tb_Equipamento Where Id_Equipamento = @Id_Equipamento)

SELECT        Tb_Reg.Id_Reg, Tb_Usuario.Nome, Tb_Reg.Data, Tb_Reg.Reg
FROM            Tb_Reg INNER JOIN
                         Tb_Usuario ON Tb_Reg.Id_Usuario = Tb_Usuario.Id_Usuario Where Reg like '%'+@COD+'%'
End
--Create Table Tb_HistorialEquipamento
--(
--Id_Historial Int Not Null Identity Primary Key,
--Id_Equipamento Int Not Null References Tb_Equipamento (Id_Equipamento),
-----------------------------------------------------------------------//Formacoes//-------------------------------------------------------------

Create Table Tb_PeriodoFormacao
(
Id_PeriodoFormacao Int Not Null Identity Primary Key,
PeriodoFormacao varchar(20)
)

Insert Into Tb_PeriodoFormacao values ('Manhã')
Insert Into Tb_PeriodoFormacao values ('Manhã-Tarde')
Insert Into Tb_PeriodoFormacao values ('Tarde')
go


Create Table Tb_TipoFormacao
(
Id_TipoFormacao Int Not Null Identity Primary Key,
TipoFormacao varchar(20)
)

Insert Into Tb_TipoFormacao values ('Interna')
Insert Into Tb_TipoFormacao values ('Externa')

go


--Drop Table Tb_Localidade
--Create Table Tb_Localidade
--(
--Id_Localidade Int Not Null Identity Primary Key,
--Localidade varchar(20)
--)

--Insert Into Tb_Localidade values ('Provincial')
--Insert Into Tb_Localidade values ('Nacional')
--Insert Into Tb_Localidade values ('Internacional')

Create Table Tb_Formacao
(
Id_Formacao Int Not Null Identity Primary Key,
NomeFormacao varchar(100) Not Null,
Id_TipoFormacao Int Not Null Foreign Key References Tb_TipoFormacao,
Id_PeriodoFormacao Int Not Null Foreign Key References Tb_PeriodoFormacao(Id_PeriodoFormacao),
DataInicio Date Not Null,
DataFim Date Not Null,
QuantParticipantes int Not Null,
Completa bit Default 0
)
go

Create Proc AddFormacao
@Id_Usuario Int,
@NomeFormacao varchar(100),
@Id_TipoFormacao Int,
@Id_PeriodoFormacao Int,
@DataInicio Date,
@DataFim Date,
@Quantidade Int,
@Id_Formacao Int Output
as
Begin

INSERT INTO [dbo].[Tb_Formacao]
           ([NomeFormacao]
           ,[Id_TipoFormacao]
           ,[Id_PeriodoFormacao]
           ,[DataInicio]
           ,[DataFim]
           ,[QuantParticipantes])
     VALUES
           (@NomeFormacao
           ,@Id_TipoFormacao
           ,@Id_PeriodoFormacao
           ,@DataInicio
           ,@DataFim
           ,@Quantidade)


Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Formação: '+@NomeFormacao + ' cadastrada com exito.')

Set @Id_Formacao = (Select IDENT_CURRENT('Tb_Formacao')) 
End
go


Create Table Tb_TemaFormacao
(
Id_TemaFormacao Int Not Null Identity Primary key,
Id_Formacao Int Not Null Foreign Key References Tb_Formacao (Id_Formacao),
TemaFormacao varchar(200) Not Null,
HorasAulas int Not Null
)
go

Create Table Tb_FormadorFormacao
(
Id_FormadorFormacao Int Not Null Identity Primary Key,
Id_Formacao Int Not Null References Tb_Formacao(Id_Formacao),
FormadorFormacao varchar(100) Not Null
)
go

Create Table Tb_ConvidadoFormacao
(
Id_Convidado Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null References Tb_Funcionario (Id_Funcionario),
Id_Formacao Int Not Null References Tb_Formacao (Id_Formacao)
)
go

Create Proc AddFormador
@Id_Usuario Int,
@Id_Formacao Int,
@Formador varchar(100)
as
Begin

Declare @Formacao varchar(100) = (Select NomeFormacao from Tb_Formacao Where Id_Formacao = @Id_Formacao)

Insert Into Tb_FormadorFormacao values (@Id_Formacao,@Formador)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Formador: '+@Formador+' vinculado a Formação: '+@Formacao+'.')

End
go

Create Proc DelFormador
@Id_Usuario Int,
@Id_Formador Int
as
Begin
Declare @Formador varchar(100)  = (Select FormadorFormacao from Tb_FormadorFormacao Where Id_FormadorFormacao =@Id_Formador)

Declare @Formacao varchar(100) = (SELECT        Tb_Formacao.NomeFormacao
FROM            Tb_Formacao INNER JOIN
                         Tb_FormadorFormacao ON Tb_Formacao.Id_Formacao = Tb_FormadorFormacao.Id_Formacao
WHERE        (Tb_FormadorFormacao.Id_FormadorFormacao = @Id_Formador))

Delete from  Tb_FormadorFormacao Where Id_FormadorFormacao = @Id_Formador



Insert Into Tb_Reg (Id_Usuario,Reg) values (@Id_Usuario,'Formador: '+@Formador+' eliminado da Formação: '+@Formacao+'.')
End
go

Create Proc FiltarFormacao
@NomeFormacao varchar(50)
As
BEGIN

Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeFormacao)) + '%'

SELECT Id_Formacao, NomeFormacao, DataInicio, DataFim, QuantParticipantes FROM Tb_Formacao
WHERE Tb_Formacao.NomeFormacao Like @Nome


--HAVING (COUNT(Tb_Assig.Id_Estudante) = 0)

END
go

Create Proc AddTema
@Id_Usuario Int,
@Id_Formacao Int,
@TemaFormacao varchar(200),
@HorasAluas Int
as
Begin

Insert Into Tb_TemaFormacao(Id_Formacao,TemaFormacao,HorasAulas) values (@Id_Formacao,@TemaFormacao,@HorasAluas)

Declare @Formacao varchar(100) = (Select NomeFormacao from Tb_Formacao Where Id_Formacao = @Id_Formacao)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Tema: '+@TemaFormacao+' adicionado na formação: '+@Formacao+'.')

End
go

Create Proc DelTema
@Id_Usuario Int,
@Id_TemaFormacao Int
as
Declare @TemaFormacao varchar(200) = (Select TemaFormacao from Tb_TemaFormacao Where Id_TemaFormacao =@Id_TemaFormacao)

Declare @Formacao varchar(100) = (SELECT        Tb_Formacao.NomeFormacao
FROM            Tb_TemaFormacao INNER JOIN
                         Tb_Formacao ON Tb_TemaFormacao.Id_Formacao = Tb_Formacao.Id_Formacao
WHERE        (Tb_TemaFormacao.Id_TemaFormacao = @Id_TemaFormacao))

Delete From Tb_TemaFormacao Where Id_TemaFormacao =@Id_TemaFormacao

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Tema: '+@TemaFormacao+' eliminado da formação: '+@Formacao+'.')
go

Create Proc FiltrarConvidado
@Id_Formacao Int,
@NomeFuncionario varchar(30)
as
Begin
Declare @Nome varchar(50) = '%' +LTRIM(RTRIM(@NomeFuncionario)) + '%'

SELECT        Id_Funcionario, NomeFuncionario, NumAgente
FROM            Tb_Funcionario
WHERE        (NomeFuncionario like @Nome )and(Id_Funcionario NOT IN
                             (SELECT        Id_Funcionario
                               FROM            Tb_ConvidadoFormacao AS Tb_ConvidadoFormacao
                               WHERE        (Id_Formacao = @Id_Formacao)))
							   Order By NomeFuncionario Asc,NumAgente Asc, Id_Funcionario Asc
End
go

Create Proc AddConvidado
@Id_Usuario Int,
@Id_Formacao Int,
@Id_Funcionario Int
as
Begin

Declare @Formacao varchar(100) = (Select NomeFormacao from Tb_Formacao Where Id_Formacao = @Id_Formacao)

Declare @Funcionario varchar(100) = (Select NomeFuncionario from Tb_Funcionario Where Id_Funcionario = @Id_Funcionario)

Insert Into Tb_ConvidadoFormacao(Id_Formacao,Id_Funcionario) values (@Id_Formacao,@Id_Funcionario)

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Funcionario: '+@Funcionario+' convidado na formação: '+@Formacao);

End
go

Create Proc DelConvidado
@Id_Usuario Int,
@Id_Convidado Int
as
Begin

Declare @Formacao varchar(100) = ( SELECT        Tb_Formacao.NomeFormacao
FROM            Tb_ConvidadoFormacao INNER JOIN
                         Tb_Formacao ON Tb_ConvidadoFormacao.Id_Formacao = Tb_Formacao.Id_Formacao
WHERE        (Tb_ConvidadoFormacao.Id_Convidado = @Id_Convidado))

Declare @Funcionario varchar(100) =(SELECT        Tb_Funcionario.NomeFuncionario
FROM            Tb_ConvidadoFormacao INNER JOIN
                         Tb_Funcionario ON Tb_ConvidadoFormacao.Id_Funcionario = Tb_Funcionario.Id_Funcionario
WHERE        (Tb_ConvidadoFormacao.Id_Convidado = @Id_Convidado))

Delete from Tb_ConvidadoFormacao Where Id_Convidado = @Id_Convidado

Insert Into Tb_Reg(Id_Usuario,Reg) values (@Id_Usuario,'Funcionario: '++@Funcionario+' eliminado da formação: '+@Formacao);
End
go

----------------------------------------Notação Anual do Pessoal Administrativo-------------------------------------------------------
Create Table Tb_Val1NAPA
(
Id_Val1NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val1NAPA (D,V) values ('Pontual',10)
Insert Into Tb_Val1NAPA (D,V) values ('Atrasos Raros',7)
Insert Into Tb_Val1NAPA (D,V) values ('Atrasos Frequentes',3)
go

Create Table Tb_Val2NAPA
(
Id_Val2NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val2NAPA (D,V) values ('Dinâmico e com iniciativas',15)
Insert Into Tb_Val2NAPA (D,V) values ('Dinâmico só ma execução',12)
Insert Into Tb_Val2NAPA (D,V) values ('Diligente na execução',6)

go

Create Table Tb_Val3NAPA
(
Id_Val3NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val3NAPA (D,V) values ('Assiduo',10)
Insert Into Tb_Val3NAPA (D,V) values ('Raramente falta',7)
Insert Into Tb_Val3NAPA (D,V) values ('Falta algumas veces',3)
Insert Into Tb_Val3NAPA (D,V) values ('Falta sistematicamente',0)
go

Create Table Tb_Val4NAPA
(
Id_Val4NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val4NAPA (D,V) values ('Sobrecumpre tarefas',17)
Insert Into Tb_Val4NAPA (D,V) values ('Cumpre os prazos',12)
Insert Into Tb_Val4NAPA (D,V) values ('Cumpre dificilmente',8)
Insert Into Tb_Val4NAPA (D,V) values ('Não cumpre os prazos',0)
go

Create Table Tb_Val5NAPA
(
Id_Val5NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val5NAPA (D,V) values ('Exemplar',15)
Insert Into Tb_Val5NAPA (D,V) values ('Disciplinado',12)
Insert Into Tb_Val5NAPA (D,V) values ('Ocacionalmente indisciplinado',9)
Insert Into Tb_Val5NAPA (D,V) values ('Indisciplinado',0)
go

Create Table Tb_Val6NAPA
(
Id_Val6NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val6NAPA (D,V) values ('Trabalho de excelente qualidade',17)
Insert Into Tb_Val6NAPA (D,V) values ('Trabalho de boa qualidade',12)
Insert Into Tb_Val6NAPA (D,V) values ('Trabalho de razoável qualidade',8)
Insert Into Tb_Val6NAPA (D,V) values ('Trabalho de má qualidade',0)
go

Create Table Tb_Val7NAPA
(
Id_Val7NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val7NAPA (D,V) values ('Usa totalmente os meios e zela pela manutenção',17)
Insert Into Tb_Val7NAPA (D,V) values ('Usa bem os meios e não permite danificação',12)
Insert Into Tb_Val7NAPA (D,V) values ('Usa mal os meios',9)
Insert Into Tb_Val7NAPA (D,V) values ('Usa mal os meios e os danifica',0)
go

Create Table Tb_Val8NAPA
(
Id_Val8NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val8NAPA (D,V) values ('Excelente relação de trabalho',15)
Insert Into Tb_Val8NAPA (D,V) values ('Boas relações de trabalho',9)
Insert Into Tb_Val8NAPA (D,V) values ('Dificuldades de relacionamento',6)
Insert Into Tb_Val8NAPA (D,V) values ('Mau relacionamento',0)
go

Create Table Tb_Val9NAPA
(
Id_Val9NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val9NAPA (D,V) values ('Porte impecável',10)
Insert Into Tb_Val9NAPA (D,V) values ('Bom porte',7)
Insert Into Tb_Val9NAPA (D,V) values ('Pouca postura',3)
Insert Into Tb_Val9NAPA (D,V) values ('Desleixado',0)
go

Create Table Tb_Val10NAPA
(
Id_Val10NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val10NAPA (D,V) values ('Distribui tarefas, controla e apoia',17)
Insert Into Tb_Val10NAPA (D,V) values ('Distribui tarefas e controla',12)
Insert Into Tb_Val10NAPA (D,V) values ('Distribui tarefas',8)
Insert Into Tb_Val10NAPA (D,V) values ('Não distribui tarefas',0)
go

Create Table Tb_Val11NAPA
(
Id_Val11NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val11NAPA (D,V) values ('Persuacivo e exigente',15)
Insert Into Tb_Val11NAPA (D,V) values ('Não persuasivo e exigente',12)
Insert Into Tb_Val11NAPA (D,V) values ('Não persuasivo e não exigente',8)
Insert Into Tb_Val11NAPA (D,V) values ('Não persuasivo nem exigente',0)
go

Create Table Tb_Val12NAPA
(
Id_Val12NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val12NAPA (D,V) values ('Excelente adaptação',16)
Insert Into Tb_Val12NAPA (D,V) values ('Adaptação razoável',12)
Insert Into Tb_Val12NAPA (D,V) values ('Dificuldade de adaptação',8)
Insert Into Tb_Val12NAPA (D,V) values ('Não se adapta',0)
go

Create Table Tb_Val13NAPA
(
Id_Val13NAPA Int Not Null Identity Primary Key,
D varchar(50) Not Null Unique,
V Int Not Null
)
Insert Into Tb_Val13NAPA (D,V) values ('Excelente expressão escrita',15)
Insert Into Tb_Val13NAPA (D,V) values ('Fluente expressão escrita',12)
Insert Into Tb_Val13NAPA (D,V) values ('Razoável',10)
Insert Into Tb_Val13NAPA (D,V) values ('Deficiênte',6)
go


--

Create Table Tb_NAPA
(
Id_NAPA Int Not Null Identity Primary Key,
Id_Funcionario Int Not Null References Tb_Funcionario (Id_Funcionario),
Id_Val1NAPA Int Not Null References Tb_Val1NAPA (Id_Val1NAPA),
Id_Val2NAPA Int Not Null References Tb_Val2NAPA (Id_Val2NAPA),
Id_Val3NAPA Int Not Null References Tb_Val3NAPA (Id_Val3NAPA),
Id_Val4NAPA Int Not Null References Tb_Val4NAPA (Id_Val4NAPA),
Id_Val5NAPA Int Not Null References Tb_Val5NAPA (Id_Val5NAPA),
Id_Val6NAPA Int Not Null References Tb_Val6NAPA (Id_Val6NAPA),
Id_Val7NAPA Int Not Null References Tb_Val7NAPA (Id_Val7NAPA),
Id_Val8NAPA Int Not Null References Tb_Val8NAPA (Id_Val8NAPA),
Id_Val9NAPA Int Not Null References Tb_Val9NAPA (Id_Val9NAPA),
Id_Val10NAPA Int Not Null References Tb_Val10NAPA (Id_Val10NAPA),
Id_Val11NAPA Int Not Null References Tb_Val11NAPA (Id_Val11NAPA),
Id_Val12NAPA Int Not Null References Tb_Val12NAPA (Id_Val12NAPA),
Id_Val13NAPA Int Not Null References Tb_Val13NAPA (Id_Val13NAPA),
Aprec1 varchar(1000) Not Null Default 'Sem nenhuma descripção',
Aprec2 varchar(1000) Not Null Default 'Sem nenhuma descripção',
AntiServ varchar(50) Not Null Default 'Sem nenhuma descripção',
AntiCarr varchar(50) Not Null Default 'Sem nenhuma descripção',
AntiCate varchar(50) Not Null Default 'Sem nenhuma descripção',

)

--Create Table Tb_Estudante
--(
--Id_Estudante Int Not Null Identity Primary Key,
--NomeEstudante varchar(50) Not Null,
--NomePai varchar(50) Not Null,
--NomeMai varchar(50) Not Null,
--DataNasc date Not Null,
--Id_MunicipioNasc Int Not Null Foreign Key References Tb_Municipio (Id_Municipio),
--Id_Genero Int Not Null Foreign Key References Tb_Genero (Id_Genero),
--Altura Int Not Null,
--Peso Int Not Null,
--Id_TipoDoc Int Not Null Foreign Key References Tb_TipoDoc (Id_TipoDoc),
--NumDoc varchar(14) Not Null,
--Endereco varchar(100) Not Null,
--Id_Municipio Int Not Null Foreign Key References Tb_Municipio (Id_Municipio),
--Telf varchar(9),
--Email varchar(50),
--Id_TipoAtendimento Int Not Null Foreign Key References Tb_TipoAtendimento(Id_TipoAtendimento),
--Obs varchar(2000) default 'Sem Observações',
--PathPic varchar(100) 
--)

go
