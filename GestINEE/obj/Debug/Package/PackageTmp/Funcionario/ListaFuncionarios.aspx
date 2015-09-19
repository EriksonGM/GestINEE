<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaFuncionarios.aspx.cs" Inherits="GestINEE.Funcionario.ListaFuncionarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista Geral de Funcionarios
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-primary">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="panel-body">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon glyphicon-search"></i>
                                <asp:TextBox ID="txtNomeFuncionario" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Funcionario" MaxLength="20" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <hr />
                            <asp:GridView ID="gvFuncionario" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceFuncionario" GridLines="Vertical" Width="100%">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Fotografia" SortExpression="PathPic">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl='<%# Eval("PathPic") %>' ToolTip="Fotografia do Funcionario" Width="100px" />
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id_Funcionario" HeaderText="Id_Funcionario" InsertVisible="False" ReadOnly="True" SortExpression="Id_Funcionario" Visible="False" />
                                    <asp:TemplateField HeaderText="Informação" SortExpression="NomeFuncionario">
                                        <ItemTemplate>
                                            <b>Nome:</b>&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("NomeFuncionario") %>' NavigateUrl='<%# "/Funcionario/Funcionario.aspx?Id="+Eval("Id_Funcionario") %>'>HyperLink</asp:HyperLink>
                                            <br />
                                            <strong>Email:</strong>&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                            <br />
                                            <strong>Telefone:</strong>&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Eval("TelfPrim") %>'></asp:Label>
                                            <br />
                                            <strong>Estado do Perfil:</strong>&nbsp;
                                            <asp:Label ID="Label5" runat="server" Text='<%# EstadoPerfil(Eval("Completo")) %>' ForeColor='<%# ColorEstado(Eval("Completo")) %>' Font-Bold="True"></asp:Label>
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
                            <asp:SqlDataSource ID="SqlDataSourceFuncionario" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarFuncionario" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNomeFuncionario" Name="NomeFuncionario" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
