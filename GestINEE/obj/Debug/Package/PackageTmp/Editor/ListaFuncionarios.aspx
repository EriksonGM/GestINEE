<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaFuncionarios.aspx.cs" Inherits="GestINEE.Editor.ListaFuncionarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista Geral de Funcionarios
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="inner-addon right-addon">
                <i class="glyphicon glyphicon-search"></i>
                <asp:TextBox ID="txtNomeFuncionario" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Funcionario" MaxLength="20" AutoPostBack="True"></asp:TextBox>
            </div>
            <%--<hr />--%>

            <asp:ListView ID="lvFuncionarios" runat="server" DataSourceID="SqlDataSourceEstudantes" DataKeyNames="Id_Funcionario">

                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                <p>
                                    <b style="color: red">Sem resultados</b>
                                </p>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>


                <ItemTemplate>
                    <tr style="">
                        <td>
                            <a class="btn btn-default">Perfil</a>
                            <%--<asp:Label Text='<%# Eval("Nº") %>' runat="server" ID="NºLabel" /></td>--%>
                        <td>
                            <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeLabel" /></td>
                        
                        <td>
                            <asp:Label Text='<%# Eval("Provincia") %>' runat="server" ID="ProvinciaLabel" />

                        </td>
                        <td>
                            <asp:Label Text='<%# Eval("Municipio") %>' runat="server" ID="MunicipioLabel" />

                        </td>
                        <%-- <td>
                            <asp:CheckBox Checked='<%# Eval("Completo") %>' runat="server" ID="CompletoCheckBox" Enabled="false" />
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
                                        <th runat="server">Nome</th>
                                        
                                        <th runat="server" style="width: 150px">Provincia</th>
                                        <th runat="server" style="width: 150px">Municipio</th>
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
            <asp:SqlDataSource runat="server" ID="SqlDataSourceEstudantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarFuncionario" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtNomeFuncionario" PropertyName="Text" Name="NomeFuncionario" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
