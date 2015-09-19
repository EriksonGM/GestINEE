<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CrearFormacao.aspx.cs" Inherits="GestINEE.Formacoes.CrearFormacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Criar Formação
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel panel-body">
                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome da Formação." ControlToValidate="txtNomeFormacao" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </i>
                        <asp:TextBox ID="txtNomeFormacao" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Formação" MaxLength="50"></asp:TextBox>
                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">Tipo</span>
                                <asp:DropDownList ID="ddlTipoFormacao" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoFormacao" DataTextField="TipoFormacao" DataValueField="Id_TipoFormacao">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceTipoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoFormacao]" InsertCommand="AddFormacao" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceTipoFormacao_Inserted">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtNomeFormacao" Name="NomeFormacao" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="ddlTipoFormacao" Name="Id_TipoFormacao" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlPeriodoFormacao" Name="Id_PeriodoFormacao" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtDateInicio" DbType="Date" Name="DataInicio" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtDataFim" DbType="Date" Name="DataFim" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtParticipantes" Name="Quantidade" PropertyName="Text" Type="Int32" />
                                        <asp:Parameter Direction="InputOutput" Name="Id_Formacao" Type="Int32" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">Periodo</span>
                                <asp:DropDownList ID="ddlPeriodoFormacao" runat="server" CssClass="form-control" DataSourceID="SqlDataSourcePeriodoFormacao" DataTextField="PeriodoFormacao" DataValueField="Id_PeriodoFormacao">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourcePeriodoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_PeriodoFormacao]"></asp:SqlDataSource>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">Data de Inicio
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Inicio Invalida." Text="*" ControlToValidate="txtDateInicio" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Data de Inicio." ControlToValidate="txtDateInicio" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtDateInicio" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA-MM-DD" MaxLength="10" TextMode="Date"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">Data de Fim
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Data de Fim Invalida." Text="*" ControlToValidate="txtDateInicio" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta a Data de Fim." ControlToValidate="txtDateInicio" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </span>
                                <asp:TextBox ID="txtDataFim" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA-MM-DD" MaxLength="10" TextMode="Date"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Falta a Quantidade de participantes." ControlToValidate="txtParticipantes" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </i>
                                <asp:TextBox ID="txtParticipantes" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Participantes" MaxLength="9" TextMode="Number"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
                <div class="panel panel-footer">
                    <asp:Button ID="btnCrear" runat="server" Text="Crear Formação" CssClass="btn btn-primary" OnClick="btnCrear_Click" />
                </div>

            </div>
        </div>

        <div class="col-md-4">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
        </div>
    </div>
</asp:Content>
