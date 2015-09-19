<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CompletarFuncionario.aspx.cs" Inherits="GestINEE.Cadastros.CompletarFuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 200px;
            font-weight: bold;
            text-align: right;
            height: 28px;
        }
    </style>

    <%--<script src="/assets/js/html2canvas.js" type="text/javascript"></script>--%>

    <style>
        #CartaoFuncionario {
            background-image: url('/assets/img/EmployeeCard.jpg');
            background-position: center;
            background-repeat: no-repeat;
            width: 944px;
            height: 590px;
        }

        .Contenido {
            float: left;
            width: 507px;
            /*border: 1px solid black;*/
            margin-top: 173px;
            margin-left: 68px;
            height: 334px;
        }

        #Foto {
            float: right;
            margin-right: 47px;
            margin-top: 80px;
        }
    </style>

    <script src="/assets/js/jquery.Jcrop.min.js"></script>
    <link rel="stylesheet" href="/assets/css/jquery.Jcrop.css" type="text/css" />

    <script type="text/javascript">


        $(document).ready(function () {
            $('#modalCam').on('shown.bs.modal', function (e) {
                //$("#canvas").hide();
                StartCam();
            });

            $('#modalCam').on('hidden.bs.modal', function (e) {
                //$("#canvas").hide();
                $("#video")[0].pause();
            });

        });

        var X;
        var Y;
        var W;
        var H;

        function CloseModal(msg) {
            $('#myModal').modal('hide');
            if (msg.length > 0) {
                alert(msg);
            }
        }

        function ShowModal() {
            $('#myModal').modal('show');
        }

        function StartCam() {
            var canvas = $("#canvas"),
            context = canvas[0].getContext("2d"),
            video = $("#video")[0],
            videoObj = { "video": true },
            errHandler = function (error) {
                console.log("Video capture error: ", error.code);

            };
            //------------------
            $('#video').Jcrop({
                onSelect: storeCoords,
                onChange: storeCoords,
                bgColor: 'black',
                bgOpacity: .3,
                setSelect: [80, 0, 200, 270],
                aspectRatio: 9 / 10,
                minSize: [432, 480],
                maxSize: [432, 480]
            });
            //--------------------------
            if (navigator.getUserMedia) { // Standard
                navigator.getUserMedia(videoObj, function (stream) {
                    video.src = stream;
                    video.play();

                }, errHandler);
            } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }
            else if (navigator.mozGetUserMedia) { // Firefox-prefixed
                navigator.mozGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }

            $("#btnCapture").click(function (e) {
                e.preventDefault();

                //var videos = document.querySelector('video');

                //var vh = videos.videoHeight;
                //var vw = videos.videoWidth;

                context.drawImage(video, X, Y, W, H, 0, 0, 189, 210);

                var canvas = document.querySelector('canvas');

                //var dataURL = canvas.toDataURL();

                var dataURL = canvas.toDataURL('image/jpeg', 1);

                $('#<%=hfImage.ClientID%>').val(dataURL);

                $('#<%=Pic.ClientID%>').attr('src', dataURL);

            });

        }

        function storeCoords(c) {
            X = c.x;
            Y = c.y;
            W = c.w;
            H = c.h;
        };

    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Completar cadastro de Funcionario
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Informação Pessoal
                        </div>
                        <div class="panel-body">
                            <asp:FormView ID="fvInfoPessoal" runat="server" Width="100%" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceInfoPessoal" OnDataBound="fvInfoPessoal_DataBound">
                                <ItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="auto-style1">&nbsp;</td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl='<%# Eval("PathPic") %>' Width="100px" Style="margin-bottom: 10px;" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Funcionario Nº:</td>
                                            <td>
                                                <asp:Label ID="Id_FuncionarioLabel" runat="server" Text='<%# Eval("Id_Funcionario") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Nome do Funcionario: </td>
                                            <td>
                                                <asp:Label ID="NomeFuncionarioLabel" runat="server" Text='<%# Bind("NomeFuncionario") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Data de Nascimento:</td>
                                            <td>
                                                <asp:Label ID="DataNascLabel" runat="server" Text='<%# Bind("DataNasc", "{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Provincia de Nascimento:</td>
                                            <td>
                                                <asp:Label ID="ProvinciaNascLabel" runat="server" Text='<%# Bind("ProvinciaNasc") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Municipio de Nascimento:</td>
                                            <td>
                                                <asp:Label ID="MunicipioNascLabel" runat="server" Text='<%# Bind("MunicipioNasc") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Genero:</td>
                                            <td>
                                                <asp:Label ID="GeneroLabel" runat="server" Text='<%# Bind("Genero") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Endereço:</td>
                                            <td>
                                                <asp:Label ID="EnderecoLabel" runat="server" Text='<%# Bind("Endereco") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Provincia:</td>
                                            <td>
                                                <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Bind("Provincia") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Municipio:</td>
                                            <td>
                                                <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Bind("Municipio") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Email:</td>
                                            <td>
                                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Telefone Principal:</td>
                                            <td>
                                                <asp:Label ID="TelfPrimLabel" runat="server" Text='<%# Bind("TelfPrim") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Telefone Secundario:</td>
                                            <td>
                                                <asp:Label ID="TelfSecuLabel" runat="server" Text='<%# Bind("TelfSecu") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">Obsevações:</td>
                                            <td>
                                                <asp:Label ID="ObsLabel" runat="server" Text='<%# Bind("Obs") %>' />
                                            </td>
                                        </tr>
                                    </table>

                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceInfoPessoal" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Funcionario.Id_Funcionario, Tb_Funcionario.NomeFuncionario, Tb_Funcionario.DataNasc, Tb_ProvinciaNasc.Provincia AS ProvinciaNasc, Tb_MunicipioNasc.Municipio AS MunicipioNasc, Tb_Genero.Genero, Tb_Funcionario.Endereco, Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Funcionario.Email, Tb_Funcionario.TelfPrim, Tb_Funcionario.TelfSecu, Tb_Funcionario.Obs, Tb_Funcionario.PathPic FROM Tb_Funcionario INNER JOIN Tb_Genero ON Tb_Funcionario.Id_Genero = Tb_Genero.Id_Genero INNER JOIN Tb_Municipio ON Tb_Funcionario.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN Tb_Municipio AS Tb_MunicipioNasc ON Tb_Funcionario.Id_MunicipioNasc = Tb_MunicipioNasc.Id_Municipio INNER JOIN Tb_Provincia AS Tb_ProvinciaNasc ON Tb_MunicipioNasc.Id_Provincia = Tb_ProvinciaNasc.Id_Provincia WHERE (Tb_Funcionario.Id_Funcionario = @Id_Funcionario) AND (Tb_Funcionario.Completo = 0)" InsertCommand="EndFuncionario" InsertCommandType="StoredProcedure" OnSelected="SqlDataSourceInfoPessoal_Selected" OnInserted="SqlDataSourceInfoPessoal_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="panel-heading">
                            Vinculos Laborais
                        </div>
                        <div class="panel-body">
                            <asp:ListView ID="lvVincInst" runat="server" DataSourceID="SqlDataSourceVincInst">
                                <EmptyDataTemplate>
                                    <span style="font-weight: bold; color:red">Nenhum vinculo laboral com Instituições.</span>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <span style=""><b>Categoria o Função:</b>
                                        <asp:Label ID="CatLaboralLabel" runat="server" Text='<%# Eval("CatLaboral") %>' />
                                        <br />
                                        <b>Instituição:</b>
                                        <asp:Label ID="NomeInstituicaoLabel" runat="server" Text='<%# Eval("NomeInstituicao") %>' />
                                        <br />
                                        <b>Provincia:</b>
                                        <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                                        &nbsp &nbsp
                                        <b>Municipio:</b>
                                        <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Eval("Municipio") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                                

                            </asp:ListView>
                            <%--<br />
                            <br />--%>
                            <asp:SqlDataSource ID="SqlDataSourceVincInst" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_CatLaboral.CatLaboral, Tb_Instituicao.NomeInstituicao, Tb_Provincia.Provincia, Tb_Municipio.Municipio FROM Tb_InstFuncionario INNER JOIN Tb_Instituicao ON Tb_InstFuncionario.Id_Instituicao = Tb_Instituicao.Id_Instituicao INNER JOIN Tb_Municipio ON Tb_Instituicao.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN Tb_CatLaboral ON Tb_InstFuncionario.Id_CatLaboral = Tb_CatLaboral.Id_CatLaboral WHERE (Tb_InstFuncionario.Id_Funcionario = @Id_Funcionario)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="lvVincEsco" runat="server" DataSourceID="SqlDataSourceVincEsco">
                                <EmptyDataTemplate>
                                    <span style="font-weight: bold; color: red">Nenhum vinculo laboral com Escolas.</span>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <span style=""><b>Categoria o Função:</b>
                                        <asp:Label ID="CatLaboralLabel" runat="server" Text='<%# Eval("CatLaboral") %>' />
                                        <br />
                                        <b>Escola:</b>
                                        <asp:Label ID="NomeInstituicaoLabel" runat="server" Text='<%# Eval("NomeEscola") %>' />
                                        <br />
                                        <b>Provincia:</b>
                                        <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Eval("Provincia") %>' />
                                        &nbsp &nbsp
                                        <b>Municipio:</b>
                                        <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Eval("Municipio") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                                

                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceVincEsco" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_CatLaboral.CatLaboral, Tb_Escola.NomeEscola, Tb_Provincia.Provincia, Tb_Municipio.Municipio FROM Tb_EscoFuncionario INNER JOIN Tb_Escola ON Tb_EscoFuncionario.Id_Escola = Tb_Escola.Id_Escola INNER JOIN Tb_Municipio ON Tb_Escola.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN Tb_CatLaboral ON Tb_EscoFuncionario.Id_CatLaboral = Tb_CatLaboral.Id_CatLaboral WHERE (Tb_EscoFuncionario.Id_Funcionario = @Id_Funcionario)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="panel-heading">
                            Deficiências
                        </div>
                        <div class="panel-body">
                            <asp:ListView ID="lvDef" runat="server" DataSourceID="SqlDataSourceDefFuncionario">
                                <EmptyDataTemplate>
                                    <span><b>Nunhuma Deficiência vinculada.</b></span>
                                </EmptyDataTemplate>


                                <ItemTemplate>
                                    <span style=""><b>Deficiência:</b>
                                        <asp:Label ID="DefLabel" runat="server" Text='<%# Eval("Def") %>' />
                                        <br />
                                        <b>Classificação:</b>
                                        <asp:Label ID="ClasifDefLabel" runat="server" Text='<%# Eval("ClasifDef") %>' />
                                        <br />
                                        <b>Natureza:</b>
                                        <asp:Label ID="NatuDefLabel" runat="server" Text='<%# Eval("NatuDef") %>' />
                                        <br />
                                        <b>Entidade Avaliadora:</b>
                                        <asp:Label ID="EnviAvalLabel" runat="server" Text='<%# Eval("EnviAval") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div style="" id="itemPlaceholderContainer" runat="server">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>

                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceDefFuncionario" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Def.Def, Tb_ClasifDef.ClasifDef, Tb_NatuDef.NatuDef, Tb_EntiAval.EnviAval FROM Tb_DefFuncionario INNER JOIN Tb_ClasifDef ON Tb_DefFuncionario.Id_ClasifDef = Tb_ClasifDef.Id_ClasifDef INNER JOIN Tb_Def ON Tb_ClasifDef.Id_Def = Tb_Def.Id_Def INNER JOIN Tb_EntiAval ON Tb_DefFuncionario.Id_EntiAval = Tb_EntiAval.Id_EntiAval INNER JOIN Tb_NatuDef ON Tb_DefFuncionario.Id_NatuDef = Tb_NatuDef.Id_NatuDef WHERE (Tb_DefFuncionario.Id_Funcionario = @Id_Funcionario)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="panel-heading">
                            Habilitações Literarias
                        </div>
                        <div class="panel-body">
                            <asp:ListView ID="lvNivelAcademico" runat="server" DataSourceID="SqlDataSourceNAca">
                                <EmptyDataTemplate>
                                    <b>Nenhuma Habilitação registada.</b>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <span style=""><b>Nivel Academico:</b>&nbsp
                                    <asp:Label ID="NivelAcademicoLabel" runat="server" Text='<%# Eval("NivelAcademico") %>' />
                                        <br />
                                        <b>Especialidade:</b>&nbsp
                                    <asp:Label ID="EspecialidadeLabel" runat="server" Text='<%# Eval("Especialidade") %>' />
                                        <br />
                                        <br />
                                    </span>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceNAca" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_NivelAcademico.NivelAcademico, Tb_NAcaFuncionario.Especialidade FROM Tb_NivelAcademico INNER JOIN Tb_NAcaFuncionario ON Tb_NivelAcademico.Id_NivelAcademico = Tb_NAcaFuncionario.Id_NivelAcademico WHERE (Tb_NAcaFuncionario.Id_Funcionario = @Id_Funcionario)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="panel-heading">
                            Documentos
                        </div>
                        <div class="panel-body">

                            <asp:ListView ID="lvDocFuncionarios" runat="server" DataSourceID="SqlDataSourceDocFuncionarios">

                                <EmptyDataTemplate>
                                    <span><b>Nenhum Documento vinculado</b></span>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <span style="">
                                        <b>Tipo de Documento:</b>&nbsp
                                        <asp:Label ID="TipoDocLabel" runat="server" Text='<%# Eval("TipoDoc") %>' />
                                        <br />
                                        <b>Numero do Documento:</b>&nbsp
                                        <asp:Label ID="NumDocLabel" runat="server" Text='<%# Eval("NumDoc") %>' />
                                        <br />
                                        <b>Data de Emissão:</b>&nbsp
                                        <asp:Label ID="DataInicioLabel" runat="server" Text='<%# Eval("DataInicio","{0:d}") %>' />
                                        <br />
                                        <b>Valido até:</b>&nbsp
                                        <asp:Label ID="DataFimLabel" runat="server" Text='<%# Eval("DataFim","{0:d}") %>' />
                                        <br />
                                        <b>Formato Digital:</b>&nbsp
                                        <a href='<%# "/Deposit/Doc/"+ Eval("PathDoc") %>' download="ArquivoGestINEE"><%# Eval("PathDoc") %></a>
                                        <br />
                                        <br />
                                    </span>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>

                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSourceDocFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_TipoDoc.TipoDoc, Tb_DocFuncionario.NumDoc, Tb_DocFuncionario.DataInicio, Tb_DocFuncionario.DataFim, Tb_DocFuncionario.PathDoc FROM Tb_DocFuncionario INNER JOIN Tb_TipoDoc ON Tb_DocFuncionario.Id_TipoDoc = Tb_TipoDoc.Id_TipoDoc WHERE (Tb_DocFuncionario.Id_Funcionario = @Id_Funcionario)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Opções
                        </div>
                        <div class="panel-body">

                            <asp:Button ID="Button3" runat="server" Text="Fazer Fotografia" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#modalCam" />

                            <%--<asp:Button ID="UpdatePic" runat="server" Text="Actualizar Foto" CssClass="btn btn-primary form-control btnspace" OnClick="UpdatePic_Click" />--%>

                            <asp:Button ID="AddDef" runat="server" Text="Adicionar Deficiência" Class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalDef" />

                            <asp:Button ID="AddNivel" runat="server" Text="Adicionar Habilitação" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalNiv" />

                            <asp:Button ID="VincularDoc" runat="server" Text="Adicionar Documento" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalDoc" />

                            <asp:Button ID="VinculoLaboral" runat="server" Text="Adicionar Vinculo Laboral" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalLab" />

<%--                            <asp:Button ID="PrintPasse" runat="server" Text="Imprimir Cartão" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalPrint" />--%>

                            <asp:Button ID="Button5" runat="server" Text="Terminar Cadastro" CssClass="btn btn-danger form-control" OnClick="Button5_Click" data-toggle="modal" data-target="#myModalFim" />

                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceUpdateFoto" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" UpdateCommand="UpdPicFuncionario" UpdateCommandType="StoredProcedure">
                <UpdateParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                    <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                    <asp:Parameter Name="PathPic" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="myModalFoto" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <%--    <asp:UpdatePanel ID="upModalFoto" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                   <ContentTemplate>--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Actualizar Fotografia:</b></h4>
                    <h4>
                        <asp:FileUpload ID="fuPic" runat="server" /></h4>
                    <br />

                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <asp:Button ID="btnUpdatePic" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnUpdatePic_Click" />
                </div>
            </div>
            <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
        </div>
    </div>

    <div class="modal fade" id="myModalDef" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="input-group">
                                <span class="input-group-addon">Deficiência</span>
                                <asp:DropDownList ID="ddlDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceDef" DataTextField="Def" DataValueField="Id_Def" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddDefFuncionario" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Tb_Def]">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlClasifDef" Name="Id_ClasifDef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlNatuDef" Name="Id_NatuDef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlEntiAval" Name="Id_EntiAval" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Classificação</span>
                                <asp:DropDownList ID="ddlClasifDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceClasifDef" DataTextField="ClasifDef" DataValueField="Id_ClasifDef" ValidationGroup="Def">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceClasifDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_ClasifDef], [ClasifDef] FROM [Tb_ClasifDef] WHERE ([Id_Def] = @Id_Def)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlDef" Name="Id_Def" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Natureza</span>

                                <asp:DropDownList ID="ddlNatuDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceNatuDef" DataTextField="NatuDef" DataValueField="Id_NatuDef" ValidationGroup="Def">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceNatuDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_NatuDef]"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Entidade Avaliadora</span>

                                <asp:DropDownList ID="ddlEntiAval" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceEntiAval" DataTextField="EnviAval" DataValueField="Id_EntiAval">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEntiAval" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_EntiAval]"></asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnVincularDef" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnVincularDef_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalNiv" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-body">

                            <div class="input-group">
                                <span class="input-group-addon">Nivel Academico</span>

                                <asp:DropDownList ID="ddlNivelAcademico" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceNivelAcademico" DataTextField="NivelAcademico" DataValueField="Id_NivelAcademico">
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="SqlDataSourceNivelAcademico" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_NivelAcademico.* FROM Tb_NivelAcademico" InsertCommand="AddNAcaFuncionario" InsertCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlNivelAcademico" Name="Id_NivelAcademico" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtEspecialidade" Name="Especialidade" PropertyName="Text" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>

                            </div>
                            <br />
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Especialidade." ControlToValidate="txtEspecialidade" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Aca"></asp:RequiredFieldValidator>
                                </i>
                                <asp:TextBox ID="txtEspecialidade" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Especialidade" MaxLength="50" ValidationGroup="Aca"></asp:TextBox>
                            </div>
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="Aca" />

                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <asp:Button ID="btnGuardarNiv" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardarNiv_Click" ValidationGroup="Aca" />
                </div>


            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>

                            <div class="input-group">
                                <span class="input-group-addon">Tipo de Documento</span>

                                <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoDoc" DataTextField="TipoDoc" DataValueField="Id_TipoDoc">
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="SqlDataSourceTipoDoc" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddDocFuncionario" SelectCommand="SELECT Id_TipoDoc, TipoDoc FROM Tb_TipoDoc" InsertCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlTipoDoc" Name="Id_TipoDoc" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtNumDoc" Name="NumDoc" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txtDataInicio" DbType="Date" Name="DataInicio" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtDataFim" DbType="Date" Name="DataFim" PropertyName="Text" />
                                        <asp:Parameter Name="PathDoc" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>

                            </div>
                            <br />
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta o Numero do Documento." ControlToValidate="txtNumDoc" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Doc"></asp:RequiredFieldValidator>
                                </i>
                                <asp:TextBox ID="txtNumDoc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero do Documento" MaxLength="14" ValidationGroup="Doc"></asp:TextBox>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Emitido
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Emissão Invalida." Text="*" ControlToValidate="txtDataInicio" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$" ValidationGroup="Doc"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta a Data de Emissão" ControlToValidate="txtDataInicio" Font-Bold="True" ForeColor="Red" ValidationGroup="Doc">*</asp:RequiredFieldValidator>
                                        </span>
                                        <asp:TextBox ID="txtDataInicio" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA-MM-DD" MaxLength="10" ValidationGroup="Doc" TextMode="Date"></asp:TextBox>

                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Valido até
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Data de Validade Invalida." Text="*" ControlToValidate="txtDataFim" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$" ValidationGroup="Doc"></asp:RegularExpressionValidator>
                                        </span>
                                        <asp:TextBox ID="txtDataFim" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA-MM-DD" MaxLength="10" ValidationGroup="Doc" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Copia digital</span>
                                <asp:FileUpload ID="fuDoc" runat="server" CssClass="form-control" />
                            </div>
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Doc" />

                        </ContentTemplate>

                    </asp:UpdatePanel>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnSaveDoc" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnSaveDoc_Click" ValidationGroup="Doc" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalLab" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>

                <div class="modal-body panel">
                    <div role="tabpanel">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#Escola" aria-controls="Info" role="tab" data-toggle="tab">Escola</a></li>
                            <li role="presentation"><a href="#Instituicao" aria-controls="Funcionarios" role="tab" data-toggle="tab">Instituição</a></li>
                        </ul>
                    </div>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="panel">
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon">Tipo</span>
                                    <asp:DropDownList ID="ddlTipoLaboral" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoLaboral" DataTextField="TipoLaboral" DataValueField="Id_TipoLaboral" AutoPostBack="True" OnSelectedIndexChanged="ddlTipoLaboral_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceTipoLaboral" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_TipoLaboral, TipoLaboral FROM Tb_TipoLaboral ORDER BY Id_TipoLaboral"></asp:SqlDataSource>
                                </div>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon">Grupo</span>
                                    <asp:DropDownList ID="ddlGrupoLaboral" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceGrupoLaboral" DataTextField="GrupoPessoal" DataValueField="Id_GrupoPessoal" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceGrupoLaboral" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_GrupoPessoal.Id_GrupoPessoal, Tb_GrupoPessoal.GrupoPessoal FROM Tb_GrupoPessoal INNER JOIN Tb_CatLaboral ON Tb_GrupoPessoal.Id_GrupoPessoal = Tb_CatLaboral.Id_GrupoPessoal WHERE (Tb_CatLaboral.Id_TipoLaboral = @Id_TipoLaboral) GROUP BY Tb_GrupoPessoal.GrupoPessoal, Tb_GrupoPessoal.Id_GrupoPessoal">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlTipoLaboral" Name="Id_TipoLaboral" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon">Categoria</span>
                                    <asp:DropDownList ID="ddlCatLaboral" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceCatLaboral" DataTextField="CatLaboral" DataValueField="Id_CatLaboral">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceCatLaboral" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_CatLaboral, CatLaboral, Id_TipoLaboral FROM Tb_CatLaboral WHERE (Id_GrupoPessoal = @Id_GrupoPessoal) AND (Id_TipoLaboral = @Id_TipoLaboral)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlGrupoLaboral" Name="Id_GrupoPessoal" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddlTipoLaboral" Name="Id_TipoLaboral" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="tab-content panel">
                        <div role="tabpanel" class="tab-pane active" id="Escola">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtNomeEscola" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Escola" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                    <br />
                                    <asp:GridView ID="gvEscola" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_Escola" DataSourceID="SqlDataSourceEscola" GridLines="Vertical" OnRowCommand="gvEscola_RowCommand" Width="100%">
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Vincular" Text="Vincular" CssClass="btn btn-primary" CommandArgument='<%# Bind("Id_Escola") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Id_Escola" HeaderText="Id_Escola" InsertVisible="False" ReadOnly="True" SortExpression="Id_Escola" Visible="False" />
                                            <asp:BoundField DataField="NomeEscola" HeaderText="NomeEscola" SortExpression="NomeEscola" />
                                            <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                                            <asp:BoundField DataField="Municipio" HeaderText="Municipio" SortExpression="Municipio" />
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceEscola" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarEscola" SelectCommandType="StoredProcedure" InsertCommand="AddEscoFuncionario" InsertCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                            <asp:Parameter Name="Id_Escola" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCatLaboral" Name="Id_CatLaboral" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtNomeEscola" Name="Nome" PropertyName="Text" Type="String" />
                                            <asp:Parameter DefaultValue="false" Name="FiltrarProvincia" Type="Boolean" />
                                            <asp:Parameter DefaultValue="0" Name="Id_Provincia" Type="Int32" />
                                            <asp:Parameter DefaultValue="false" Name="FiltrarMunicipio" Type="Boolean" />
                                            <asp:Parameter DefaultValue="0" Name="Id_Municipio" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                        <div role="tabpanel" class="tab-pane panel" id="Instituicao">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                <ContentTemplate>
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtNomeInstituicao" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Instituição" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                                    </div>
                                    <br />
                                    <asp:GridView ID="gvInstituicao" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSourceInstituicao" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="Id_Instituicao" Width="100%" OnRowCommand="gvInstituicao_RowCommand" EmptyDataText="Nenhum Instiuti">
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Vincular" Text="Vincular" CssClass="btn btn-primary" CommandArgument='<%# Bind("Id_Instituicao") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Id_Instituicao" HeaderText="Id_Instituicao" InsertVisible="False" ReadOnly="True" SortExpression="Id_Instituicao" Visible="False" />
                                            <asp:BoundField DataField="NomeInstituicao" HeaderText="Nome da Instituicao" SortExpression="NomeInstituicao" />
                                            <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                                            <asp:BoundField DataField="Municipio" HeaderText="Municipio" SortExpression="Municipio" />
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#000065" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSourceInstituicao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarInstituicao" SelectCommandType="StoredProcedure" InsertCommand="AddInstFuncionario" InsertCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                            <asp:ControlParameter ControlID="ddlCatLaboral" Name="Id_CatLaboral" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                            <asp:Parameter Name="Id_Instituicao" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtNomeINstituicao" Name="Nome" PropertyName="Text" Type="String" />
                                            <asp:Parameter DefaultValue="false" Name="FiltrarProvincia" Type="Boolean" />
                                            <asp:Parameter DefaultValue="0" Name="Id_Provincia" Type="Int32" />
                                            <asp:Parameter DefaultValue="false" Name="FiltrarMunicipio" Type="Boolean" />
                                            <asp:Parameter DefaultValue="0" Name="Id_Municipio" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="H1">Employee Details</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-9">
                            <video id="video" width="640" height="480" autoplay style="border: 2px solid #646566;"></video>
                            <br />
                        </div>
                        <div class="col-md-3">
                            <button id="btnCapture" class="btn btn-primary form-control" style="margin-bottom: 10px;">Capturar</button>
                            <br />
                            <asp:Image ID="Pic" runat="server" Width="189" Height="210" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" />
                            <br />
                            <canvas id="canvas" width="189" height="210" style="border: 2px solid #646566;" hidden="hidden"></canvas>
                            <asp:HiddenField ID="hfImage" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="Button1">Cancelar</button>
                    <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
