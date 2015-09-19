<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="GestaoDeficiencias.aspx.cs" Inherits="GestINEE.Admin.GestaoDeficiencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Gestão de Deficiências
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">Deficiências</div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="panel-body">

                            <div class="input-group">
                                <asp:TextBox ID="txtNewDef" runat="server" CssClass="form-control" placeholder="Nova Deficiência" MaxLength="50"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnAddDef" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClick="btnAddDef_Click" />
                                </span>
                            </div>

                        </div>
                        <asp:GridView ID="gvDef" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSourceDef" Width="100%" AllowPaging="True" DataKeyNames="Id_Def" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>

                                        <asp:Button ID="Button3" runat="server" CommandName="Select" CssClass="btn btn-primary" Text="Editar" />

                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id_Def" HeaderText="Id_Def" InsertVisible="False" ReadOnly="True" SortExpression="Id_Def" Visible="False" />
                                <asp:BoundField DataField="Def" HeaderText="Deficiência" SortExpression="Def" />
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
                        <div class="panel-footer">
                            <asp:FormView ID="fvDef" runat="server" DataKeyNames="Id_Def" DataSourceID="SqlDataSourceEditDef" OnItemCommand="fvDef_ItemCommand">
                                <ItemTemplate>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtDef" runat="server" CssClass="form-control" placeholder="Deficiência a Editar" Text='<%# Bind("Def") %>' MaxLength="50"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnEditarDef" runat="server" Text="Guardar" CssClass="btn btn-default" CommandName="Guardar" />
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceEditDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Def], [Id_Def] FROM [Tb_Def] WHERE ([Id_Def] = @Id_Def)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvDef" Name="Id_Def" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSourceDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Def]" InsertCommand="AddDef" InsertCommandType="StoredProcedure" UpdateCommand="UpdDef" UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="txtNewDef" Name="Def" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="gvDef" Name="Id_Def" PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="Def" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <!-- /input-group -->
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">Classificações de Deficiências</div>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="panel-body">
                            <div class="input-group">
                                <%--<input type="text" class="form-control" placeholder="Nova Area de Estudo">--%>

                                <asp:DropDownList ID="ddlDef" runat="server" CssClass="menu form-control" Width="40%" DataSourceID="SqlDataSourceDef" DataTextField="Def" DataValueField="Id_Def"></asp:DropDownList>

                                <asp:TextBox ID="txtClasifDef" runat="server" CssClass="form-control" placeholder="Nova Categoria" Width="50%" MaxLength="50"></asp:TextBox>

                                <span class="input-group-btn">
                                    <asp:Button ID="btnAddClasifDef" runat="server" Text="Cadastrar" CssClass="btn btn-default" Width="100px" OnClick="btnAddClasifDef_Click" />
                                </span>
                            </div>

                        </div>


                        <asp:GridView ID="gvClasifDef" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_ClasifDef" DataSourceID="SqlDataSourceClasifDef" Width="100%" AllowPaging="True" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button4" runat="server" CommandName="Select" CssClass="btn btn-primary" Text="Editar" />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id_ClasifDef" HeaderText="Id_ClasifDef" InsertVisible="False" ReadOnly="True" SortExpression="Id_ClasifDef" Visible="False" />
                                <asp:BoundField DataField="Id_Def" HeaderText="Id_Def" SortExpression="Id_Def" Visible="False" />
                                <asp:BoundField DataField="Def" HeaderText="Deficiência" SortExpression="Def" />
                                <asp:BoundField DataField="ClasifDef" HeaderText="Classificação" SortExpression="ClasifDef" />
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
                        <div class="panel-footer">
                            <asp:FormView ID="fvClasifDef" runat="server" DataKeyNames="Id_ClasifDef" DataSourceID="SqlDataSourceEditClasifDef" Width="100%" OnItemCommand="fvClasifDef_ItemCommand">


                                <ItemTemplate>
                                    <div class="input-group">
                                        <%--<input type="text" class="form-control" placeholder="Nova Area de Estudo">--%>

                                        <asp:DropDownList ID="ddlDef" runat="server" CssClass="menu form-control"  DataSourceID="SqlDataSourceDef" DataTextField="Def" DataValueField="Id_Def" SelectedValue='<%# Bind("Id_Def") %>' Width="40%"></asp:DropDownList>

                                        <asp:TextBox ID="txtClasifDef" runat="server" CssClass="form-control" placeholder="Nova Categoria" Width="50%" MaxLength="50" Text='<%# Bind("ClasifDef") %>'></asp:TextBox>

                                        <span class="input-group-btn">
                                            <asp:Button ID="btnAddClasifDef" runat="server" Text="Guardar" CssClass="btn btn-default" Width="100px" CommandName="Guardar" />
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlDataSourceEditClasifDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_ClasifDef] WHERE ([Id_ClasifDef] = @Id_ClasifDef)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvClasifDef" Name="Id_ClasifDef" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:SqlDataSource ID="SqlDataSourceClasifDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommandType="StoredProcedure" SelectCommand="SELECT Tb_ClasifDef.Id_ClasifDef, Tb_ClasifDef.Id_Def, Tb_Def.Def, Tb_ClasifDef.ClasifDef FROM Tb_Def INNER JOIN Tb_ClasifDef ON Tb_Def.Id_Def = Tb_ClasifDef.Id_Def" InsertCommand="AddClasifDef" UpdateCommand="UpdClasifDef" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlDef" Name="Id_Def" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtClasifDef" Name="ClasifDef" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                        <asp:ControlParameter ControlID="gvClasifDef" Name="Id_ClasifDef" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="Id_Def" Type="Int32" />
                        <asp:Parameter Name="ClasifDef" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
