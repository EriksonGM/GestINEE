<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="GestaoEquipamentos.aspx.cs" Inherits="GestINEE.Admin.GestaoEquipamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Gestão de Equipamentos
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Tipos de Equipamentos</div>
                        <div class="panel-body">
                            <div class="input-group">
                                <asp:TextBox ID="txtNewTipo" runat="server" CssClass="form-control" placeholder="Novo Tipo de Equipamento" MaxLength="50" AutoCompleteType="Disabled"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnAddTipo" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClick="btnAddTipo_Click" />
                                </span>
                            </div>
                        </div>
                        <asp:GridView ID="gvTipoEquipamento" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_TipoEquipamento" DataSourceID="SqlDataSourceTipoEquipamento" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" AllowPaging="True" AllowSorting="True" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Editar" CssClass="btn btn-primary" />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id_TipoEquipamento" HeaderText="Id_TipoEquipamento" InsertVisible="False" ReadOnly="True" SortExpression="Id_TipoEquipamento" Visible="False" />
                                <asp:BoundField DataField="TipoEquipamento" HeaderText="Tipo de Equipamento" SortExpression="TipoEquipamento" />
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
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceTipoEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_TipoEquipamento, TipoEquipamento FROM Tb_TipoEquipamento ORDER BY TipoEquipamento" InsertCommand="AddTipoEquipamento" InsertCommandType="StoredProcedure" UpdateCommand="UpdTipoEquipamento" UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="txtNewTipo" Name="TipoEquipamento" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="gvTipoEquipamento" Name="Id_TipoEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="TipoEquipamento" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:FormView ID="fvEditTipoEquipamento" runat="server" DataSourceID="SqlDataSourceEditTipoEquipamento" Width="100%" OnItemCommand="fvEditTipoEquipamento_ItemCommand">
                            <ItemTemplate>
                                <div class="panel-footer">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtEditTipo" runat="server" CssClass="form-control" placeholder="Tipo de Equipamento a editar" MaxLength="50" AutoCompleteType="Disabled" Text='<%# Bind("TipoEquipamento") %>'></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnEditTipo" runat="server" Text="Guardar" CssClass="btn btn-default" CommandName="Guardar" />
                                        </span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSourceEditTipoEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [TipoEquipamento] FROM [Tb_TipoEquipamento] WHERE ([Id_TipoEquipamento] = @Id_TipoEquipamento)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvTipoEquipamento" Name="Id_TipoEquipamento" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>

                        </asp:SqlDataSource>

                    </div>
                </div>
                <div class="col-md-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Marcas de Equipamentos</div>
                        <div class="panel-body">
                            <div class="input-group">
                                <asp:TextBox ID="txtNewMarca" runat="server" CssClass="form-control" placeholder="Nova Marca de Equipamento" MaxLength="50"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnAddMarca" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClick="btnAddMarca_Click" />
                                </span>
                            </div>
                        </div>
                        <asp:GridView ID="gvMarcaEquipamento" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_MarcaEquipamento" DataSourceID="SqlDataSourceMarcaEquipamento" Width="100%" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Editar" CssClass="btn btn-primary" />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id_MarcaEquipamento" HeaderText="Id_MarcaEquipamento" InsertVisible="False" ReadOnly="True" SortExpression="Id_MarcaEquipamento" Visible="False" />
                                <asp:BoundField DataField="MarcaEquipamento" HeaderText="Marca de Equipamento" SortExpression="MarcaEquipamento" />
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
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceMarcaEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_MarcaEquipamento, MarcaEquipamento FROM Tb_MarcaEquipamento ORDER BY MarcaEquipamento" InsertCommand="AddMarcaEquipamento" InsertCommandType="StoredProcedure" UpdateCommand="UpdMarcaEquipamento" UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="txtNewMarca" Name="MarcaEquipamento" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="gvMarcaEquipamento" Name="Id_MarcaEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="MarcaEquipamento" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>


                        <asp:FormView ID="fvEditMarcaEquipamento" runat="server" DataSourceID="SqlDataSourceEditMarcaEquipamento" OnItemCommand="fvEditMarcaEquipamento_ItemCommand" Width="100%">
                            <ItemTemplate>
                                <div class="panel-footer">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtEditMarca" runat="server" CssClass="form-control" placeholder="Marca de Equipamento a editar." MaxLength="50" Text='<%# Bind("MarcaEquipamento") %>'></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnEditMarca" runat="server" Text="Guardar" CssClass="btn btn-default" CommandName="Guardar" />
                                        </span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSourceEditMarcaEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [MarcaEquipamento] FROM [Tb_MarcaEquipamento] WHERE ([Id_MarcaEquipamento] = @Id_MarcaEquipamento)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvMarcaEquipamento" Name="Id_MarcaEquipamento" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Modelos de Equipamentos</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlTipoEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoEquipamento" DataTextField="TipoEquipamento" DataValueField="Id_TipoEquipamento"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlMarcaEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMarcaEquipamento" DataTextField="MarcaEquipamento" DataValueField="Id_MarcaEquipamento"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtNewModelo" runat="server" CssClass="form-control" placeholder="Novo Modelo de Equipamento" MaxLength="50"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:Button ID="btnAddModelo" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClick="btnAddModelo_Click" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:GridView ID="gvModeloEquipamento" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_ModeloEquipamento" DataSourceID="SqlDataSourceModeloEquipamento" Width="100%" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Editar" CssClass="btn btn-primary" />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id_ModeloEquipamento" HeaderText="Id_ModeloEquipamento" InsertVisible="False" ReadOnly="True" SortExpression="Id_ModeloEquipamento" Visible="False" />
                                <asp:BoundField DataField="TipoEquipamento" HeaderText="Tipo de Equipamento" SortExpression="TipoEquipamento" />
                                <asp:BoundField DataField="MarcaEquipamento" HeaderText="Marca do Equipamento" SortExpression="MarcaEquipamento" />
                                <asp:BoundField DataField="ModeloEquipamento" HeaderText="Modelo do Equipamento" SortExpression="ModeloEquipamento" />
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
                        <asp:SqlDataSource ID="SqlDataSourceModeloEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_ModeloEquipamento.Id_ModeloEquipamento, Tb_TipoEquipamento.TipoEquipamento, Tb_MarcaEquipamento.MarcaEquipamento, Tb_ModeloEquipamento.ModeloEquipamento FROM Tb_MarcaEquipamento INNER JOIN Tb_ModeloEquipamento ON Tb_MarcaEquipamento.Id_MarcaEquipamento = Tb_ModeloEquipamento.Id_MarcaEquipamento INNER JOIN Tb_TipoEquipamento ON Tb_ModeloEquipamento.Id_TipoEquipamento = Tb_TipoEquipamento.Id_TipoEquipamento" InsertCommand="AddModeloEquipamento" InsertCommandType="StoredProcedure" UpdateCommand="UpdModeloEquipamento" UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlTipoEquipamento" Name="Id_TipoEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlMarcaEquipamento" Name="Id_MarcaEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="txtNewModelo" Name="ModeloEquipamento" PropertyName="Text" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:ControlParameter ControlID="gvModeloEquipamento" Name="Id_ModeloEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="Id_TipoEquipamento" Type="Int32" />
                                <asp:Parameter Name="Id_MarcaEquipamento" Type="Int32" />
                                <asp:Parameter Name="ModeloEquipamento" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:FormView ID="fvEditModeloEquipamento" runat="server" DataKeyNames="Id_ModeloEquipamento" DataSourceID="SqlDataSourceEditModeloEquipamento" Width="100%" OnItemCommand="fvEditModeloEquipamento_ItemCommand">
                            <ItemTemplate>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlEditTipo" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoEquipamento" DataTextField="TipoEquipamento" DataValueField="Id_TipoEquipamento" SelectedValue='<%# Bind("Id_TipoEquipamento") %>'></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:DropDownList ID="ddlEditMarca" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMarcaEquipamento" DataTextField="MarcaEquipamento" DataValueField="Id_MarcaEquipamento" SelectedValue='<%# Bind("Id_MarcaEquipamento") %>'></asp:DropDownList>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtEditModelo" runat="server" CssClass="form-control" placeholder="Modelo de Equipamento a editar" MaxLength="50" Text='<%# Bind("ModeloEquipamento") %>'></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button ID="btnEditModelo" runat="server" Text="Guardar" CssClass="btn btn-default" CommandName="Guardar" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSourceEditModeloEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_ModeloEquipamento] WHERE ([Id_ModeloEquipamento] = @Id_ModeloEquipamento)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvModeloEquipamento" Name="Id_ModeloEquipamento" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
