<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="GerirUsuarios.aspx.cs" Inherits="GestINEE.Admin.GerirUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Gestão de Usuarios
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">

        <asp:UpdatePanel runat="server" ID="up">
            <ContentTemplate>
                <div class="col-md-8">
                    <div class="input-group">
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Filtrar por nome o email" AutoCompleteType="Disabled"></asp:TextBox>
                        <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                        <span class="input-group-btn">
                            <span class="fa fa-coffee"></span>
                            <asp:Button ID="Button1" runat="server" Text="Filtrar" CssClass="btn btn-default" />
                            <%--<button class="btn btn-default" type="button">Go!</button>--%>
                        </span>
                    </div>
                    <br />
                    <!-- /input-group -->
                    <asp:GridView ID="gvUsuarios" runat="server" DataSourceID="SqlDataSourceUsuarios" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Email" Width="100%" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged" AllowPaging="True" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Editar" CssClass="btn btn-primary" Width="100%" />
                                </ItemTemplate>
                                <ItemStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" InsertVisible="False" ReadOnly="True" SortExpression="Id_Usuario" Visible="False" />
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
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
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarUsuario" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUsuario" Name="NomeUsuario" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-4" runat="server" id="Panel" visible="false">
                    <div class="panel panel-primary">
                      <%--  <div class="panel-heading">Mudar Senha</div>
                        <div class="panel-body">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1">Senha</span>--%>
                                <%--<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">--%>
                               <%-- <asp:TextBox ID="txtPass1" placeholder="Username" aria-describedby="basic-addon1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon2">Confirmação</span>--%>
                                <%--<input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">--%>
                                <%--<asp:TextBox ID="txtPass2" placeholder="Username" aria-describedby="basic-addon2" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <asp:Button ID="Button3" runat="server" Text="Guardar" CssClass="btn btn-primary" />
                        </div>--%>
                        <div class="panel-heading">Permiçoes</div>
                        <div class="panel-body">
                            <asp:CheckBox ID="chbCadastro" runat="server" Text="&nbsp Modulo de Cadastramentos" /><br />
                            <asp:CheckBox ID="chbEditor" runat="server" Text="&nbsp Modulo de Editor de Cadastramentos" /><br />
                            <asp:CheckBox ID="chbPatrimonio" runat="server" Text="&nbsp Modulo de Patrimonio" /><br />
                            <asp:CheckBox ID="chbFuncionario" runat="server" Text="&nbsp Modulo de Funcionarios" /><br />
                            <asp:CheckBox ID="chbFormacoes" runat="server" Text="&nbsp Modulo de Formações" /><br />
                            <asp:CheckBox ID="chbEstatisticas" runat="server" Text="&nbsp Modulo de Estatisticas" /><br />
                            <asp:CheckBox ID="chbAdmin" runat="server" Text="&nbsp Modulo de Gestão" /><br />

                        </div>
                        <div class="panel-footer text-right">
                            <asp:Button ID="Button2" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" />
                        </div>
                        <div class="panel-heading">Opções</div>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
