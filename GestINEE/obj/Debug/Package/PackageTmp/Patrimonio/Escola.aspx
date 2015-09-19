<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Escola.aspx.cs" Inherits="GestINEE.Patrimonio.Escola" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        /*.panel-body {
            min-height: 300px;
            max-height: 800px;
            overflow-y: auto;
        }*/
    </style>

    <script src="../assets/js/highcharts.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Perfil de Escola
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="panel panel-primary">
        <div role="tabpanel">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-2x fa-info-circle"></i>Informação</a></li>
                <li role="presentation"><a href="#Funcionarios" aria-controls="Funcionarios" role="tab" data-toggle="tab"><i class="fa fa-2x fa-users"></i>Funcionarios</a></li>
                <li role="presentation"><a href="#Equipamentos" aria-controls="Equipamentos" role="tab" data-toggle="tab"><i class="fa fa-2x fa-desktop"></i>Equipamentos</a></li>
                <li role="presentation"><a href="#Salas" aria-controls="Salas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-th-list"></i>Salas</a></li>
                <li role="presentation"><a href="#Estudantes" aria-controls="Estudantes" role="tab" data-toggle="tab"><i class="fa fa-2x fa-child"></i>Estudantes</a></li>
                <%--                <li role="presentation"><a href="#Estatisticas" aria-controls="Estatisticas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-bar-chart-o"></i>Estatisticas</a></li>--%>
            </ul>
            <!-- Nav tabs -->

            <%--<div class="panel-body">--%>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Info">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:FormView ID="fvInfo" runat="server" DataKeyNames="Id_Escola" DataSourceID="SqlDataSourceInfo" Width="100%">
                            <ItemTemplate>
                                <%--<div style="float:right; width:300px;height:200px;border: solid red 1px;">
                                    <cc1:gmap id="GMap1" runat="server" maptype="Normal" />
                                </div>--%>
                                <p>
                                    <b>Nome da Escola:</b>
                                    <asp:Label Text='<%# Bind("NomeEscola") %>' runat="server" ID="NomeEscolaLabel" />
                                </p>
                                <p>
                                    <b>Numero:</b>
                                    <asp:Label Text='<%# Bind("Numero") %>' runat="server" ID="NumeroLabel" />
                                    <b style="margin-left: 25px">Especialidade:</b>
                                    <asp:Label Text='<%# Bind("Especialidade") %>' runat="server" ID="EspecialidadeLabel" />
                                    <b style="margin-left: 25px">Tipo de Ensino:</b>
                                    <asp:Label Text='<%# Bind("TipoEnsino") %>' runat="server" ID="TipoEnsinoLabel" /><br />

                                </p>
                                <p>
                                    <b>Endereço:</b>
                                    <asp:Label Text='<%# Bind("Endereco") %>' runat="server" ID="EnderecoLabel" />
                                    ,<asp:Label Text='<%# Bind("Municipio") %>' runat="server" ID="MunicipioLabel" />
                                    ,<asp:Label Text='<%# Bind("Provincia") %>' runat="server" ID="ProvinciaLabel" />
                                    .
                                </p>
                                <p>
                                    <b>Email:</b>
                                    <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" />
                                </p>
                                <p>
                                    <b>Telefones:</b>
                                    <asp:Label Text='<%# Bind("TelfPrincipal") %>' runat="server" ID="TelfPrincipalLabel" />
                                    &nbsp;-&nbsp;
                                <asp:Label Text='<%# Bind("TelfSecundario") %>' runat="server" ID="TelfSecundarioLabel" />

                                </p>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceInfo" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Escola.Id_Escola, Tb_Escola.NomeEscola, Tb_Escola.Numero, Tb_Escola.Especialidade, Tb_TipoEnsino.TipoEnsino, Tb_Escola.Endereco, Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Escola.Email, Tb_Escola.TelfPrincipal, Tb_Escola.TelfSecundario FROM Tb_Escola INNER JOIN Tb_TipoEnsino ON Tb_Escola.Id_TipoEnsino = Tb_TipoEnsino.Id_TipoEnsino INNER JOIN Tb_Municipio ON Tb_Escola.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia WHERE (Tb_Escola.Id_Escola = @Id_Escola)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Escola"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="panel-footer">
                        <asp:Button ID="btnEditarInfo" runat="server" Text="Editar Informação" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModalEdit" />
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Funcionarios">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <%--<asp:GridView ID="gvFuncionarios" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_InstFuncionario" DataSourceID="SqlDataSourceFuncionarios" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                               
                                <asp:BoundField DataField="Id_InstFuncionario" HeaderText="Id_InstFuncionario" InsertVisible="False" ReadOnly="True" SortExpression="Id_InstFuncionario" Visible="False" />
                                <asp:TemplateField HeaderText="Nome do Funcionario" SortExpression="NomeFuncionario">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# "~/Funcionario/Funcionario.aspx?Id=" +Eval("Id_Funcionario") %>' Text='<%# Eval("NomeFuncionario") %>' Enabled='<%# Roles.IsUserInRole("Funcionario") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Categoria ou Função" SortExpression="CatLaboral">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CatLaboral") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                        </asp:GridView>--%>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:ListView ID="lvFuncionario" runat="server" DataSourceID="SqlDataSourceFuncionarios">
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>
                                                    <p>
                                                        <b style="color: red">Nenhum funcionario vinculado.</b>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>

                                    <ItemTemplate>
                                        <tr style="">
                                            <td>
                                                <a class="btn btn-default" ><i class="fa fa-info-circle"></i></a>

                                                <%--<asp:Label Text='<%# Eval("Id_InstFuncionario") %>' runat="server" ID="Id_InstFuncionarioLabel" />--%>
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeFuncionarioLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("CatLaboral") %>' runat="server" ID="CatLaboralLabel" /></td>
                                            <%-- <td>
                                        <asp:Label Text='<%# Eval("Id_Funcionario") %>' runat="server" ID="Id_FuncionarioLabel" />

                                    </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" style="width: 100%">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                        <tr runat="server" style="">
                                                            <th runat="server" style="width: 50px"></th>
                                                            <th runat="server">Nome do Funcionario</th>
                                                            <th runat="server">Categoria Laboral</th>
                                                            <%--<th runat="server">Id_Funcionario</th>--%>
                                                        </tr>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="">
                                                    <asp:DataPager runat="server" ID="DataPager1" PageSize="25">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                                            <asp:NumericPagerField></asp:NumericPagerField>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                                        </Fields>
                                                    </asp:DataPager>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>

                                </asp:ListView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSourceFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Funcionario.NomeFuncionario, Tb_CatLaboral.CatLaboral, Tb_Funcionario.Id_Funcionario, Tb_EscoFuncionario.Id_Escola FROM Tb_CatLaboral INNER JOIN Tb_EscoFuncionario ON Tb_CatLaboral.Id_CatLaboral = Tb_EscoFuncionario.Id_CatLaboral INNER JOIN Tb_Funcionario ON Tb_EscoFuncionario.Id_Funcionario = Tb_Funcionario.Id_Funcionario WHERE (Tb_EscoFuncionario.Id_Escola = @Id_Escola) ORDER BY Tb_Funcionario.NomeFuncionario">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_Escola" QueryStringField="Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <%--<div class="panel-footer"></div>--%>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Equipamentos">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:ListView ID="lvEquipamentos" runat="server" DataSourceID="SqlDataSourceEquipamentos" DataKeyNames="Id_Equipamento">

                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <p>
                                                <b style="color: red; text-align: center">Nenhum Equipamento vinculado.</b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <a class="btn btn-default btn-sm" href='<%# "/Patrimonio/Equipamento.aspx?Id=" + Eval("Id_Equipamento").ToString() %>'><i class="fa fa-info-circle"></i></a>

                                        <td>
                                            <asp:Label Text='<%# Eval("COD") %>' runat="server" ID="CODLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("NumSerie") %>' runat="server" ID="NumSerieLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("TipoEquipamento") %>' runat="server" ID="TipoEquipamentoLabel" /></td>

                                    <td>
                                        <asp:Label Text='<%# Eval("MarcaEquipamento") %>' runat="server" ID="MarcaEquipamentoLabel" />
                                        &nbsp;
                                        <asp:Label Text='<%# Eval("ModeloEquipamento") %>' runat="server" ID="ModeloEquipamentoLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("EstadoEquipamento") %>' runat="server" ID="EstadoEquipamentoLabel" /></td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                <tr runat="server" style="">
                                                    <th runat="server" style="width: 50px"></th>
                                                    <th runat="server">COD</th>
                                                    <th runat="server">NumSerie</th>
                                                    <th runat="server">Tipo</th>
                                                    <%--<th runat="server">MarcaEquipamento</th>--%>
                                                    <th runat="server">Modelo</th>
                                                    <th runat="server">Estado</th>


                                                </tr>
                                                <tr runat="server" id="itemPlaceholder"></tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="">
                                            <asp:DataPager runat="server" ID="DataPager2">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>

                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceEquipamentos" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Equipamento.Id_Equipamento, Tb_Equipamento.COD, Tb_Equipamento.NumSerie, Tb_TipoEquipamento.TipoEquipamento, Tb_MarcaEquipamento.MarcaEquipamento, Tb_ModeloEquipamento.ModeloEquipamento, Tb_EstadoEquipamento.EstadoEquipamento FROM Tb_Equipamento INNER JOIN Tb_EquipamentoEscola ON Tb_Equipamento.Id_Equipamento = Tb_EquipamentoEscola.Id_Equipamento INNER JOIN Tb_EstadoEquipamento ON Tb_Equipamento.Id_EstadoEquipamento = Tb_EstadoEquipamento.Id_EstadoEquipamento INNER JOIN Tb_ModeloEquipamento ON Tb_Equipamento.Id_ModeloEquipamento = Tb_ModeloEquipamento.Id_ModeloEquipamento INNER JOIN Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento INNER JOIN Tb_TipoEquipamento ON Tb_ModeloEquipamento.Id_TipoEquipamento = Tb_TipoEquipamento.Id_TipoEquipamento WHERE (Tb_EquipamentoEscola.Id_Escola = @Id_Escola)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Escola"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <%--<div class="panel-footer">
                    </div>--%>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Salas">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:UpdatePanel runat="server" ID="upSalas">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-4" style="height: 34px">
                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta o Nome da Sala." ControlToValidate="txtNomeSala" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="AddSala"></asp:RequiredFieldValidator>
                                            </i>
                                            <asp:TextBox ID="txtNomeSala" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Sala" MaxLength="50" ValidationGroup="AddSala"></asp:TextBox>

                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">Tipo</span>
                                            <asp:DropDownList ID="ddlTipoEduc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoSala" DataTextField="TipoSala" DataValueField="Id_TipoSala">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceTipoSala" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoSala]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">Classe</span>
                                            <asp:DropDownList ID="ddlClasseSala" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceClasseSala" DataTextField="ClasseSala" DataValueField="Id_ClasseSala">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceClasseSala" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_ClasseSala] ORDER BY [Id_ClasseSala]" InsertCommandType="StoredProcedure" InsertCommand="AddSala">
                                                <InsertParameters>
                                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                                    <asp:ControlParameter ControlID="txtNomeSala" Name="NomeSala" PropertyName="Text" Type="String" />
                                                    <asp:QueryStringParameter Name="Id_Escola" QueryStringField="Id" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlTipoEduc" Name="Id_TipoSala" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlClasseSala" Name="Id_ClasseSala" PropertyName="SelectedValue" Type="Int32" />
                                                </InsertParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnAddSala" runat="server" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="AddSala" OnClick="btnAddSala_Click" Width="100%" />
                                    </div>
                                </div>
                                <hr />
                                <asp:ListView ID="lvSalas" runat="server" DataSourceID="SqlDataSourceSalas" DataKeyNames="Id_Sala" OnItemCommand="lvSalas_ItemCommand">

                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>
                                                    <p><b style="color: red">Nenhuma sala cadastrada.</b></p>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>

                                    <ItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="Estudantes" CommandArgument='<%# Eval("Id_Sala") %>' CommandName="Info" CssClass="btn btn-default" />
                                                <%--<asp:Label Text= runat="server" ID="Id_SalaLabel" />--%>
                                            </td>

                                            <td>
                                                <asp:Label Text='<%# Eval("NomeSala") %>' runat="server" ID="NomeSalaLabel" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("TipoSala") %>' runat="server" ID="TipoSalaLabel" />

                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("ClasseSala") %>' runat="server" ID="ClasseSalaLabel" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" style="width: 100%">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                        <tr runat="server" style="">
                                                            <th runat="server"></th>
                                                            <th runat="server">Nome da Sala</th>
                                                            <th runat="server">Tipo de Sala</th>
                                                            <th runat="server">Classe</th>
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

                                </asp:ListView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:SqlDataSource ID="SqlDataSourceSalas" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Sala.Id_Sala, Tb_Sala.NomeSala, Tb_TipoSala.TipoSala, Tb_ClasseSala.ClasseSala FROM Tb_Sala INNER JOIN Tb_TipoSala ON Tb_Sala.Id_TipoSala = Tb_TipoSala.Id_TipoSala INNER JOIN Tb_ClasseSala ON Tb_Sala.Id_ClasseSala = Tb_ClasseSala.Id_ClasseSala WHERE (Tb_Sala.Id_Escola = @Id_Escola)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Id_Escola" QueryStringField="Id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <%--<div class="panel-footer">
                        <a class="btn btn-primary" data-toggle="modal" data-target="#myModalAddTurma">Criar nova Sala</a>
                    </div>--%>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Estudantes">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:ListView ID="lvEstudantes" runat="server" DataSourceID="SqlDataSourceEstudantes" DataKeyNames="Id_Estudante">

                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <p>
                                                <b style="color: red">Nenhum estudante cadastrado.</b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <a class="btn btn-default"><i class="fa fa-info-circle"></i></a>
                                    </td>
                                    <%--<asp:Label Text='<%# Eval("Id_Estudante") %>' runat="server" ID="Id_EstudanteLabel" /></td>--%>
                                    <td>
                                        <asp:Label Text='<%# Eval("NomeEstudante") %>' runat="server" ID="NomeEstudanteLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Genero") %>' runat="server" ID="GeneroLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("DataNasc","{0:D}") %>' runat="server" ID="DataNascLabel" /></td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                <tr runat="server" style="">
                                                    <th runat="server" style="width: 50px;"></th>
                                                    <th runat="server">Nome</th>
                                                    <th runat="server">Genero</th>
                                                    <th runat="server">Data de Nascimento</th>
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

                        </asp:ListView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Estudante.NomeEstudante, Tb_Genero.Genero, Tb_Estudante.DataNasc FROM Tb_Estudante INNER JOIN Tb_VincEstudanteSala ON Tb_Estudante.Id_Estudante = Tb_VincEstudanteSala.Id_Estudante INNER JOIN Tb_Sala ON Tb_VincEstudanteSala.Id_Sala = Tb_Sala.Id_Sala INNER JOIN Tb_Genero ON Tb_Estudante.Id_Genero = Tb_Genero.Id_Genero WHERE (Tb_Sala.Id_Escola = @Id_Escola) ORDER BY Tb_Estudante.NomeEstudante">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Escola"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <%--<div class="panel-footer"></div>--%>
                </div>
                <%-- <div role="tabpanel" class="tab-pane fade" id="Estatisticas">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                      
                            <asp:Literal ID="ltrChart" runat="server"></asp:Literal>
                        
                    </div>
                    <div class="panel-footer"></div>
                </div>--%>
            </div>
        </div>
    </div>
    <%--    -----------------------------------------------------------Modal--------------------------------------------------------%>
    <div class="modal fade" id="myEstudanteSala" role="dialog" aria-labelledby="myEstudanteSala" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upModalEstudanteSala" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:ListView ID="lvEstudantesSala" runat="server" DataSourceID="SqlDataSourceEstudantesSala" DataKeyNames="Id_Estudante">


                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>
                                                <p>
                                                    <b style="color: red">Nenhum estudante vinculado a esta sala.</b>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <%--<asp:Label Text='<%# Eval("Id_Estudante") %>' runat="server" ID="Id_EstudanteLabel" />--%>
                                            <a class="btn btn-default"><i class="fa fa-info-circle"></i></a>
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeEstudante") %>' runat="server" ID="NomeEstudanteLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("DataNasc") %>' runat="server" ID="GeneroLabel" />

                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Genero") %>' runat="server" ID="Label1" />

                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 50px"></th>
                                                        <th runat="server">Nome do Estudante</th>
                                                        <th runat="server">Data de Nascimento</th>
                                                        <th runat="server">Genero</th>
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

                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudantesSala" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Estudante.NomeEstudante, Tb_Genero.Genero, Tb_Estudante.DataNasc FROM Tb_Estudante INNER JOIN Tb_VincEstudanteSala ON Tb_Estudante.Id_Estudante = Tb_VincEstudanteSala.Id_Estudante INNER JOIN Tb_Genero ON Tb_Estudante.Id_Genero = Tb_Genero.Id_Genero WHERE (Tb_VincEstudanteSala.Id_Sala = @Id_Sala)">
                                <SelectParameters>
                                    <asp:Parameter Name="Id_Sala"></asp:Parameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
