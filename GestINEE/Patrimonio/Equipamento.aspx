<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Equipamento.aspx.cs" Inherits="GestINEE.Patrimonio.Equipamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        .plinea {
            margin-bottom: 5px;
        }

        .panel-body {
            min-height: 300px;
            max-height: 1000px;
            overflow-y: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Ficha de Equipamento
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div role="tabpanel">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-info-circle fa-2x"></i>&nbsp Informação</a></li>
                        <li role="presentation"><a href="#Historial" aria-controls="Historial" role="tab" data-toggle="tab"><i class="fa fa-history fa-2x"></i>&nbsp Historial</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active in fade" id="Info">
                            <div class="panel-body">
                                <asp:FormView ID="fvEquipamento" runat="server" DataKeyNames="Id_Equipamento"
                                    DataSourceID="SqlDataSourceEquipamento" Width="100%" OnDataBound="fvEquipamento_DataBound">
                                    <ItemTemplate>
                                        <%-- Id_Equipamento:
                            <asp:Label ID="Id_EquipamentoLabel" runat="server" Text='<%# Eval("Id_Equipamento") %>' />
                            <br />--%>
                                        <h3 style="text-align: center">
                                            <asp:Label ID="CODLabel" runat="server" Text='<%# Bind("COD") %>' Font-Bold="True" />
                                        </h3>
                                        <p class="plinea">
                                            <b>Tipo:</b>
                                            <asp:Label ID="TipoEquipamentoLabel" runat="server" Text='<%# Bind("TipoEquipamento") %>' />
                                            &nbsp;&nbsp;
                                        <b>Marca:</b>
                                            <asp:Label ID="MarcaEquipamentoLabel" runat="server" Text='<%# Bind("MarcaEquipamento") %>' />
                                            &nbsp;&nbsp;
                                        <b>Modelo:</b>
                                            <asp:Label ID="ModeloEquipamentoLabel" runat="server" Text='<%# Bind("ModeloEquipamento") %>' />
                                        </p>
                                        <p class="plinea">
                                            <b>Estado do Equipamento:</b>
                                            <asp:Label ID="EstadoEquipamentoLabel" runat="server" Text='<%# Bind("EstadoEquipamento") %>' />
                                        </p>
                                        <p class="plinea">
                                            <b>Ano de Fabrico:</b>
                                            <asp:Label ID="AnoFabricoLabel" runat="server" Text='<%# Bind("AnoFabrico") %>' />
                                            &nbsp;&nbsp;
                                        <b>Ano de Adquisição:</b>
                                            <asp:Label ID="AnoAdquiLabel" runat="server" Text='<%# Bind("AnoAdqui") %>' />
                                            &nbsp;&nbsp;
                                        <b>Numero de Serie:</b>
                                            <asp:Label ID="NumSerieLabel" runat="server" Text='<%# Bind("NumSerie") %>' />
                                        </p>
                                        <p class="plinea">
                                            <b>Custo:</b>
                                            <asp:Label ID="CustoLabel" runat="server"
                                                Text='<%# Bind("Custo", "{0:N}") %>' />&nbsp;&nbsp;
                                        <b>Fornecedor:</b>
                                            <asp:Label ID="FornecedorLabel" runat="server" Text='<%# Bind("Fornecedor") %>' />
                                        </p>

                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceEquipamento" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:Conn %>"
                                    SelectCommand="SELECT Tb_Equipamento.Id_Equipamento, Tb_TipoEquipamento.TipoEquipamento, Tb_MarcaEquipamento.MarcaEquipamento, Tb_ModeloEquipamento.ModeloEquipamento, Tb_EstadoEquipamento.EstadoEquipamento, Tb_Equipamento.AnoFabrico, Tb_Equipamento.AnoAdqui, Tb_Equipamento.NumSerie, Tb_Equipamento.Custo, Tb_Equipamento.Fornecedor, Tb_Equipamento.COD FROM Tb_Equipamento INNER JOIN Tb_EstadoEquipamento ON Tb_Equipamento.Id_EstadoEquipamento = Tb_EstadoEquipamento.Id_EstadoEquipamento INNER JOIN Tb_ModeloEquipamento ON Tb_Equipamento.Id_ModeloEquipamento = Tb_ModeloEquipamento.Id_ModeloEquipamento INNER JOIN Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento INNER JOIN Tb_TipoEquipamento ON Tb_ModeloEquipamento.Id_TipoEquipamento = Tb_TipoEquipamento.Id_TipoEquipamento WHERE (Tb_Equipamento.Id_Equipamento = @Id_Equipamento)" UpdateCommandType="StoredProcedure" UpdateCommand="UpdateEstadoEquipamento" OnSelected="SqlDataSourceEquipamento_Selected">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" Type="Int32" />
                                        <asp:Parameter Name="Id_Estado" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Historial">
                            <div class="panel-body">
                                <asp:ListView ID="lvHistorial" runat="server" DataSourceID="SqlDataSourceHistorial" DataKeyNames="Id_Reg">
                                    
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td><p><b style="color:red">Sem Historial</b></p></td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                   
                                    <ItemTemplate>
                                        <tr style="">
                                            <%--<td>
                                                <asp:Label Text='<%# Eval("Id_Reg") %>' runat="server" ID="Id_RegLabel" /></td>--%>
                                            <td>
                                                <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="Id_UsuarioLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("Data") %>' runat="server" ID="DataLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("Reg") %>' runat="server" ID="RegLabel" /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" style="width:100%">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                        <tr runat="server" style="">
                                                            <%--<th runat="server">Id_Reg</th>--%>
                                                            <th runat="server">Usuario</th>
                                                            <th runat="server">Data</th>
                                                            <th runat="server">Reg</th>
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
                                <asp:SqlDataSource runat="server" ID="SqlDataSourceHistorial" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="HistorialEquipamento" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="Id" Name="Id_Equipamento" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <%--<div class="panel-footer"></div>--%>
                        </div>
                    </div>

                </div>


            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading">Opções de Equipamentos</div>
                <div class="panel-body">
                    <asp:FormView ID="fvOps" runat="server" DataSourceID="SqlDataSourceOps">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:FormView>
                    <!-- Single button -->
                    <%--<a class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalConfirm">Assignar Equipamento</a>
                    <a class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalConfirm">Alterar Estado</a>
                    <a class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalConfirm"></a>--%>

                    <!-- Large button group -->


                    <div class="btn-group btnspace" style="width: 100%">
                        <button class="btn btn-primary dropdown-toggle form-control" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-info-circle"></i>&nbsp; Actualizar Estado <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <asp:LinkButton ID="lkbFuncional" runat="server" OnClick="lkbFuncional_Click"><i class="fa fa-check-circle"></i>&nbsp; Definir Funcional</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="lkbAvariado" runat="server" OnClick="lkbAvariado_Click"><i class="fa fa-minus-circle"></i>&nbsp; Definir Avariado</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton ID="LkbEmReparacao" runat="server" OnClick="LkbEmReparacao_Click"><i class="fa fa-exclamation-circle"></i>&nbsp; Definir Em Reparação</asp:LinkButton>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <asp:LinkButton ID="lkbForaDeUso" runat="server" OnClick="lkbForaDeUso_Click"><i class="fa fa-times-circle"></i>&nbsp; Definir Fora de Uso</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <a runat="server" id="Estudante" class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalEstudante"><i class="fa fa-arrow-right"></i>&nbsp; Assignar a Estudante</a>
                    <a runat="server" id="Funcionario" class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalFuncionario"><i class="fa fa-arrow-right"></i>&nbsp; Assignar a Funcionario</a>
                    <a runat="server" id="Escola" class="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalEscola"><i class="fa fa-arrow-right"></i>&nbsp; Assignar a Escola</a>
                    <a runat="server" id="Instituicao" class="btn btn-primary form-control btnspace disabled"><i class="fa fa-arrow-right"></i>&nbsp; Assignar a Instituição</a>
                    <asp:LinkButton ID="lbDesvincular" runat="server" CssClass="btn btn-danger form-control btnspace" OnClick="lbDesvincular_Click"><i class="fa fa-ban"></i>&nbsp; Anular Assignações</asp:LinkButton>
                    <a class="btn btn-success form-control btnspace " href="/Patrimonio/ListaEquipamentos.aspx"><i class="fa fa-arrow-left"></i>&nbsp; Voltar</a>

                </div>

                <asp:SqlDataSource ID="SqlDataSourceOps" runat="server" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Id_Equipamento FROM Tb_EquipamentoEscola WHERE (Id_Equipamento = @Id_Equipamento) UNION SELECT Id_Equipamento FROM Tb_EquipamentoInstituicao WHERE (Id_Equipamento = @Id_Equipamento) UNION SELECT Id_Equipamento FROM Tb_EquipamentoEstudante WHERE (Id_Equipamento = @Id_Equipamento) UNION SELECT Id_Equipamento FROM Tb_EquipamentoFuncionario WHERE (Id_Equipamento = @Id_Equipamento)" OnSelected="SqlDataSourceOps_Selected" DeleteCommand="EliminarVinculoEsquipamento" DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                        <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Id" Name="Id_Equipamento"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalEstudante" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-2x fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Assignar a Estudante</b></h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtNomeEstudante" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Estudante" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <hr />
                            <asp:ListView ID="lvEstudante" runat="server" DataSourceID="SqlDataSourceEstudante" DataKeyNames="Nº" OnItemCommand="lvEstudante_ItemCommand">

                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>
                                                <p>
                                                    <b style="color:red">Nenhum Resultado</b>
                                                </p>

                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                               
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Vincular" CssClass="btn btn-default" CommandName="Vincular" CommandArgument='<%# Eval("Nº") %>'/>
                                            <asp:Label Text= runat="server" ID="NºLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                       <%-- <td>
                                            <asp:Label Text='<%# Eval("[Data de Nascimento]") %>' runat="server" ID="Data_de_NascimentoLabel" /></td>--%>
                                        <td>
                                            <asp:Label Text='<%# Eval("Provincia") %>' runat="server" ID="ProvinciaLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Municipio") %>' runat="server" ID="MunicipioLabel" /></td>
                                       <%-- <td>
                                            <asp:CheckBox Checked='<%# Eval("Completo") %>' runat="server" ID="CompletoCheckBox" Enabled="false" /></td>--%>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width:100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width:50px"></th>
                                                        <th runat="server">Nome</th>
                                                        <%--<th runat="server">Data de Nascimento</th>--%>
                                                        <th runat="server">Provincia</th>
                                                        <th runat="server">Municipio</th>
                                                        <%--<th runat="server">Completo</th>--%>
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
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudante" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarEstudante" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" InsertCommand="AddEquipamentoEstudante" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Id_Estudante" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNomeEstudante" PropertyName="Text" Name="NomeEstudante" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalFuncionario" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-2x fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Assignar a Funcionario</b></h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtFuncionario" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Funcionario" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <hr />
                            <asp:ListView ID="lvFuncionario" runat="server" DataSourceID="SqlDataSourceFuncionario" DataKeyNames="Id_Funcionario" OnItemCommand="lvFuncionario_ItemCommand">


                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>
                                                <p>
                                                    <b style="color: red">Nenhum Resultado</b>
                                                </p>

                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Vincular" CssClass="btn btn-default" CommandName="Vincular" CommandArgument='<%# Eval("Id_Funcionario") %>' />
                                            <asp:Label Text="" runat="server" ID="NºLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeLabel" /></td>

                                        <td>
                                            <asp:Label Text='<%# Eval("Provincia") %>' runat="server" ID="ProvinciaLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Municipio") %>' runat="server" ID="MunicipioLabel" /></td>
                                        <%-- <td>
                                            <asp:CheckBox Checked='<%# Eval("Completo") %>' runat="server" ID="CompletoCheckBox" Enabled="false" /></td>--%>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 50px"></th>
                                                        <th runat="server">Nome</th>
                                                        <%--<th runat="server">Data de Nascimento</th>--%>
                                                        <th runat="server">Provincia</th>
                                                        <th runat="server">Municipio</th>
                                                        <%--<th runat="server">Completo</th>--%>
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
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceFuncionario" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarFuncionario" SelectCommandType="StoredProcedure" InsertCommand="AddEquipamentoFuncionario" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Id_Funcionario" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtFuncionario" PropertyName="Text" Name="NomeFuncionario" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="modal fade" id="myModalConfirm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <h4><i class="fa fa-warning"></i>&nbsp Vincular a Escola</h4>
                            <hr />

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>--%>

    <div class="modal fade" id="myModalEscola" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Assignar a Escola</b></h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtNomeEscola" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Escola" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <br />

                            <asp:ListView ID="lvEscola" runat="server" DataSourceID="SqlDataSourceEscola" DataKeyNames="Id_Escola" OnItemCommand="lvEscola_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td><b style="color: red; text-align: center">Nenhum Resultado.</b></td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="btnVincularEscola" runat="server" Text="Vincular" CommandName="Vincular" CommandArgument='<%# Eval("Id_Escola") %>' CssClass="btn btn-default" />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeEscola") %>' runat="server" ID="NomeEscolaLabel" />
                                        </td>

                                        <td>
                                            <asp:Label Text='<%# Eval("Provincia") %>' runat="server" ID="ProvinciaLabel" />

                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("Municipio") %>' runat="server" ID="MunicipioLabel" />

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
                                                        <th runat="server">Nome da Escola</th>
                                                        <th runat="server">Provincia</th>
                                                        <th runat="server">Municipio</th>
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

                            <asp:SqlDataSource ID="SqlDataSourceEscola" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarEscola" SelectCommandType="StoredProcedure" InsertCommand="AddEquipamentoEscola" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Id_Escola" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Equipamento" QueryStringField="Id" Type="Int32" />
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
            </div>
        </div>
    </div>
</asp:Content>
