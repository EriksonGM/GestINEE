<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CadastrarEquipamento.aspx.cs" Inherits="GestINEE.Patrimonio.CadastrarEquipamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Cadastro Equipamento
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Tipo</span>
                                        <asp:DropDownList ID="ddlTipoEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoEquipamento" DataTextField="TipoEquipamento" DataValueField="Id_TipoEquipamento" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceTipoEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoEquipamento]"></asp:SqlDataSource>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Marca</span>
                                        <asp:DropDownList ID="ddlMarcaEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMarcaEquipamento" DataTextField="MarcaEquipamento" DataValueField="Id_MarcaEquipamento" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceMarcaEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_MarcaEquipamento.Id_MarcaEquipamento, Tb_MarcaEquipamento.MarcaEquipamento FROM Tb_ModeloEquipamento INNER JOIN Tb_MarcaEquipamento ON Tb_ModeloEquipamento.Id_MarcaEquipamento = Tb_MarcaEquipamento.Id_MarcaEquipamento WHERE (Tb_ModeloEquipamento.Id_TipoEquipamento = @Id_TipoEquipamento) GROUP BY Tb_MarcaEquipamento.MarcaEquipamento, Tb_MarcaEquipamento.Id_MarcaEquipamento">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlTipoEquipamento" Name="Id_TipoEquipamento" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Modelo
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Modelo do Equipamento" Text="*" ControlToValidate="ddlModeloEquipamento" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                        <asp:DropDownList ID="ddlModeloEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceModeloEquipamento" DataTextField="ModeloEquipamento" DataValueField="Id_ModeloEquipamento">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceModeloEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_ModeloEquipamento], [ModeloEquipamento] FROM [Tb_ModeloEquipamento] WHERE (([Id_TipoEquipamento] = @Id_TipoEquipamento) AND ([Id_MarcaEquipamento] = @Id_MarcaEquipamento))" InsertCommandType="StoredProcedure" InsertCommand="AddEquipamento" OnInserted="SqlDataSourceModeloEquipamento_Inserted">
                                            <InsertParameters>
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlModeloEquipamento" Name="Id_Modelo" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtAnoFabrico" Name="AnoFabrico" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtAnoAdqui" Name="AndAdqui" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlEstadoEquipamento" Name="Id_EstadoEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtCusto" Name="Custo" PropertyName="Text" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtFornecedor" Name="Fornecedor" PropertyName="Text" Type="String" />
                                                <asp:Parameter Direction="InputOutput" Name="Id_Equipamento" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtNumSerie" Name="NumSerie" PropertyName="Text" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlTipoEquipamento" Name="Id_TipoEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlMarcaEquipamento" Name="Id_MarcaEquipamento" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>

                                    <br />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ano de Fabrico invalido." ControlToValidate="txtAnoFabrico" ValidationExpression="\d{4}" ForeColor="Red">*</asp:RegularExpressionValidator></i>
                                <asp:TextBox ID="txtAnoFabrico" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Ano de Fabrico" MaxLength="4"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ano de Adquisição invalido." ControlToValidate="txtAnoAdqui" ValidationExpression="\d{4}" ForeColor="Red">*</asp:RegularExpressionValidator>
                                </i>
                                <asp:TextBox ID="txtAnoAdqui" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Ano de Adquisição" MaxLength="4" ValidationGroup="Aca"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">Estado</span>
                                <asp:DropDownList ID="ddlEstadoEquipamento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceEstado" DataTextField="EstadoEquipamento" DataValueField="Id_EstadoEquipamento">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEstado" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_EstadoEquipamento] ORDER BY [EstadoEquipamento] DESC"></asp:SqlDataSource>
                            </div>
                            <br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtNumSerie" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero de Serie" MaxLength="20" ValidationGroup="Aca"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtFornecedor" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Fornecedor" MaxLength="50" ValidationGroup="Aca"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-addon">Custo (Kz)</span>
                                <asp:TextBox ID="txtCusto" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                <span class="input-group-addon">.00</span>
                            </div>
                            <br />
                        </div>
                    </div>

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnCadastrar_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <h4>Deseja completar esta operação???</h4>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            <asp:Button ID="btnOk" runat="server" Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnOk_Click" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
