<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Participantes.aspx.cs" Inherits="GestINEE.Formacoes.Participantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Participantes da Formação
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-body" style="max-height: 500px; overflow-x: auto; height:500px">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon glyphicon-search"></i>
                                <asp:TextBox ID="txtNomeFuncionario" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Funcionario" MaxLength="20" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <hr />

                            <h3 style="text-align: center" runat="server" visible="false" id="Msg">
                                <b style="color:red;">Vagas para convidados esgotadas</b>
                            </h3>

                            <asp:ListView ID="lvParticipantes" runat="server" DataSourceID="SqlDataSourceParticipantes" DataKeyNames="Id_Funcionario" OnItemCommand="lvParticipantes_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhum resultado, tente novamente.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="btnConvidar" runat="server" Text="Convidar" CssClass="btn btn-default" CommandArgument='<%# Eval("Id_Funcionario") %>' CommandName="Add" />
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeFuncionarioLabel" />

                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NumAgente") %>' runat="server" ID="NumAgenteLabel" />

                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width:100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width:50px;"></th>
                                                        <th runat="server" >Nome do Funcionario</th>
                                                        <th runat="server" style="width:80px">Nº Agente</th>
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

                            <asp:SqlDataSource runat="server" ID="SqlDataSourceParticipantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarConvidado" SelectCommandType="StoredProcedure" DeleteCommand="AddConvidado" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure">
                                
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="Id" Name="Id_Formacao" Type="Int32"></asp:QueryStringParameter>
                                    <asp:ControlParameter ControlID="txtNomeFuncionario" PropertyName="Text" Name="NomeFuncionario" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-body" style="max-height: 500px; overflow-x: auto; height: 500px">
                            <p style="margin-top:-15px;margin-bottom:0px">
                                <b>Convidados: </b><%=Texto() %>
                                <a style="float:right" class="btn btn-primary" href='<%="/Formacoes/Formacao.aspx?Id="+Request.QueryString["Id"].ToString() %>'><i class="fa fa-reply"></i>&nbsp;Voltar</a>
                            </p>
                            <hr />
                            <asp:ListView ID="lvConvidados" runat="server" DataSourceID="SqlDataSourceConvidados" DataKeyNames="Id_Convidado" OnItemCommand="lvConvidados_ItemCommand">
                                
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhum Funcionario Convidado.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="btnEliminar" runat="server" Text="X" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("Id_Convidado") %>' CommandName="Del" />
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeFuncionarioLabel" /></td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NumAgente") %>' runat="server" ID="NumAgenteLabel" /></td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 20px;"></th>
                                                        <th runat="server">Nome do Funcionario</th>
                                                        <th runat="server" style="width: 80px">Nº Agente</th>
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
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceConvidados" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Funcionario.NomeFuncionario, Tb_Funcionario.NumAgente, Tb_ConvidadoFormacao.Id_Convidado FROM Tb_ConvidadoFormacao INNER JOIN Tb_Funcionario ON Tb_ConvidadoFormacao.Id_Funcionario = Tb_Funcionario.Id_Funcionario WHERE (Tb_ConvidadoFormacao.Id_Formacao = @Id_Formacao) ORDER BY Tb_Funcionario.NomeFuncionario" InsertCommandType="StoredProcedure" DeleteCommand="DelConvidado" DeleteCommandType="StoredProcedure" InsertCommand="AddConvidado">
                                
                                <DeleteParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Id_Convidado" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Formacao" QueryStringField="Id" Type="Int32" />
                                    <asp:Parameter Name="Id_Funcionario" Type="Int32" />
                                </InsertParameters>
                                
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="Id" Name="Id_Formacao"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
