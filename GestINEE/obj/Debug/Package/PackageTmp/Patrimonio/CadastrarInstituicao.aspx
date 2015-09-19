<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CadastrarInstituicao.aspx.cs" Inherits="GestINEE.Patrimonio.CadastrarInstituicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Cadastro de Instituição
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-8">
                    <div>
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome da Instituicao." ControlToValidate="txtNomeInstituicao" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </i>
                                    <asp:TextBox ID="txtNomeInstituicao" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Instituição" MaxLength="50"></asp:TextBox>
                                </div>

                                <br />


                                <div class="inner-addon right-addon">
                                    <i class="glyphicon"></i>
                                    <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Endereço" MaxLength="150"></asp:TextBox>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">Provincia</span>
                                            <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceProvincia" DataTextField="Provincia" DataValueField="Id_Provincia">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Provincia]"></asp:SqlDataSource>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">Municipio</span>
                                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMunicipio" DataTextField="Municipio" DataValueField="Id_Municipio">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Municipio], [Municipio] FROM [Tb_Municipio] WHERE ([Id_Provincia] = @Id_Provincia)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlProvincia" Name="Id_Provincia" PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <br />
                                </div>


                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta o Email." ControlToValidate="txtEmail" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Endereço de Email errado." ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                    </i>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Email" placeholder="Email" MaxLength="50"></asp:TextBox>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta o Numero Telefonico" ControlToValidate="txtTelfPrim" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfPrim" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                                            </i>
                                            <asp:TextBox ID="txtTelfPrim" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonico Principal" MaxLength="9"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>

                                    <div class="col-md-6">
                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfSecu" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                                            </i>
                                            <asp:TextBox ID="txtTelfSecu" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonio Secundario" MaxLength="9"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                </div>

                            </div>
                            <div class="panel-footer" style="text-align: right">
                                <%--<input id="Button1" type="button" value="Cadastrar" class="btn btn-primary" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#myModalConfirm"/>--%>
                                <asp:Button ID="btnConfirm" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnConfirm_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="myModalConfirm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <h4><i class="fa fa-warning"></i>&nbsp Deseja efectuar o cadastramento?</h4>
                        </div>
                        <div class="modal-footer">

                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            <asp:Button ID="btnGuardar" runat="server" Text="Confirmar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                            <asp:SqlDataSource ID="SqlDataSourceInstituicao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommandType="StoredProcedure" InsertCommand="AddInstituicao" OnInserted="SqlDataSourceInstituicao_Inserted">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtNomeInstituicao" Name="NomeInstituicao" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtEndereco" Name="Endereco" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="ddlMunicipio" Name="Id_Municipio" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTelfPrim" Name="TelfPrincipal" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtTelfSecu" Name="TelfSecundario" PropertyName="Text" Type="String" />
                                    <asp:Parameter Direction="InputOutput" Name="Id_Instituicao" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
