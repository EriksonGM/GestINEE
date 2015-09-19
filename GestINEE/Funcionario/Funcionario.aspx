<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Funcionario.aspx.cs" Inherits="GestINEE.Funcionario.Funcionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Perfil de Funcionario 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="panel panel-primary">

        <div role="tabpanel">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-2x fa-info-circle"></i>Informação Pessoal</a></li>
                <li role="presentation"><a href="#Forma" aria-controls="Forma" role="tab" data-toggle="tab"><i class="fa fa-2x fa-graduation-cap"></i>Formações</a></li>
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
                <%-- <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>--%>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Info">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:FormView ID="fvInfo" runat="server" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceInfo" Width="100%">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PathPic") %>' Style="float: right" />
                                <p style="margin-bottom:-5px;">
                                    <b>Nome:</b>
                                    <asp:Label Text='<%# Bind("NomeFuncionario") %>' runat="server" ID="NomeFuncionarioLabel" />
                                    <b style="margin-left: 20px">Nº de Agente:</b>
                                    <asp:Label Text='<%# Bind("NumAgente") %>' runat="server" ID="NumAgenteLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Data de Nascimento:</b>
                                    <asp:Label Text='<%# Bind("DataNasc","{0:D}") %>' runat="server" ID="DataNascLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Municipio de Nascimento:</b>

                                    <asp:Label Text='<%# Bind("MunicipioNasc") %>' runat="server" ID="MunicipioNascLabel" />
                                    <b style="margin-left: 20px">Provincia:</b>
                                    <asp:Label Text='<%# Bind("ProvinciaNasc") %>' runat="server" ID="ProvinciaNascLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Genero:</b>
                                    <asp:Label Text='<%# Bind("Genero") %>' runat="server" ID="GeneroLabel" /><br />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Endereco:</b>
                                    <asp:Label Text='<%# Bind("Endereco") %>' runat="server" ID="EnderecoLabel" />,
                                <asp:Label Text='<%# Bind("Municipio") %>' runat="server" ID="MunicipioLabel" />,
                                <asp:Label Text='<%# Bind("Provincia") %>' runat="server" ID="ProvinciaLabel" />.
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Email:</b>
                                    <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Telefone Principal:</b>
                                    <asp:Label Text='<%# Bind("TelfPrim") %>' runat="server" ID="TelfPrimLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Telefone Secundario:</b>
                                    <asp:Label Text='<%# Bind("TelfSecu") %>' runat="server" ID="TelfSecuLabel" />
                                </p>
                                <p style="margin-bottom: -5px;">
                                    <b>Observações:</b>
                                    <asp:Label Text='<%# Bind("Obs") %>' runat="server" ID="ObsLabel" />
                                </p>
                                

                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceInfo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Funcionario.NomeFuncionario, Tb_Funcionario.DataNasc, Tb_MunicipioNasc.Municipio AS MunicipioNasc, Tb_ProvinciaNasc.Provincia AS ProvinciaNasc, Tb_Genero.Genero, Tb_Funcionario.Endereco, Tb_Municipio.Municipio, Tb_Provincia.Provincia, Tb_Funcionario.Email, Tb_Funcionario.NumAgente, Tb_Funcionario.TelfPrim, Tb_Funcionario.TelfSecu, Tb_Funcionario.Obs, Tb_Funcionario.PathPic, Tb_Funcionario.Completo, Tb_Funcionario.Id_Funcionario FROM Tb_Funcionario INNER JOIN Tb_Genero ON Tb_Funcionario.Id_Genero = Tb_Genero.Id_Genero INNER JOIN Tb_Municipio ON Tb_Funcionario.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Municipio AS Tb_MunicipioNasc ON Tb_Funcionario.Id_MunicipioNasc = Tb_MunicipioNasc.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN Tb_Provincia AS Tb_ProvinciaNasc ON Tb_MunicipioNasc.Id_Provincia = Tb_ProvinciaNasc.Id_Provincia WHERE (Tb_Funcionario.Id_Funcionario = @Id_Funcionario)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Funcionario"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="panel-footer">
                        <a class="btn btn-primary">Editar</a>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Forma">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:ListView ID="lvFormacoes" runat="server" DataSourceID="SqlDataSourceFormacoes" DataKeyNames="Id_Formacao">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <p>
                                                <b style="color: red">Não tem participado em nenhuma formação.</b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <a class="btn btn-default" href='<%# "/Formacoes/Formacao.aspx?Id="+Eval("Id_Formacao") %>'>Detalhes</a>

                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("NomeFormacao") %>' runat="server" ID="NomeFormacaoLabel" />

                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DataInicio") %>' runat="server" ID="DataInicioLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DataFim") %>' runat="server" ID="DataFimLabel" /></td>

                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                <tr runat="server" style="">
                                                    <th runat="server" style="width: 50px"></th>
                                                    <th runat="server">NomeFormacao</th>
                                                    <th runat="server">DataInicio</th>
                                                    <th runat="server">DataFim</th>

                                                </tr>
                                                <tr runat="server" id="itemPlaceholder"></tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style=""></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Label Text='<%# Eval("NomeFormacao") %>' runat="server" ID="NomeFormacaoLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DataInicio") %>' runat="server" ID="DataInicioLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DataFim") %>' runat="server" ID="DataFimLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Id_Formacao") %>' runat="server" ID="Id_FormacaoLabel" /></td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceFormacoes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Formacao.NomeFormacao, Tb_Formacao.DataInicio, Tb_Formacao.DataFim, Tb_Formacao.Id_Formacao FROM Tb_ConvidadoFormacao INNER JOIN Tb_Formacao ON Tb_ConvidadoFormacao.Id_Formacao = Tb_Formacao.Id_Formacao WHERE (Tb_ConvidadoFormacao.Id_Funcionario = @Id_Funcionario)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Funcionario"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="panel-footer"></div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="messages">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;"></div>
                    <div class="panel-footer"></div>
                </div>
                <%--  <div role="tabpanel" class="tab-pane fade" id="settings">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;"></div>
                    <div class="panel-footer"></div>
                </div>--%>
            </div>

        </div>



    </div>
</asp:Content>
