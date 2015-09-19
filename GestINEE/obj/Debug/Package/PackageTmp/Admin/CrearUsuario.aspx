<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="GestINEE.Admin.CrearUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Criar Novo Usuario
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome do Usuario." ControlToValidate="txtNome" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </i>
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Usuario" MaxLength="50"></asp:TextBox>
                    </div>
                    <br />

                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta o Email." ControlToValidate="txtEmail" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Endereço de Email errado." ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </i>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Email" placeholder="Email" MaxLength="50"></asp:TextBox>
                    </div>
                    <br />

                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta o Nº Telefonico." ControlToValidate="txtTelf" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numero de Telefone Invalido" ControlToValidate="txtTelf" ValidationExpression="9\d{8}" Font-Bold="True" ForeColor="Red">*</asp:RegularExpressionValidator>
                        </i>
                        <asp:TextBox ID="txtTelf" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Phone" placeholder="Numero telefonico" MaxLength="9"></asp:TextBox>
                    </div>
                    <br />

                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta a Senha." ControlToValidate="txtPass1" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="A Senha dever ter minimo 6 caracteres." Font-Bold="True" Text="*" ForeColor="Red" ControlToValidate="txtPass1" ValidationExpression=".{6}.*"></asp:RegularExpressionValidator>
                        </i>
                        <asp:TextBox ID="txtPass1" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Password" placeholder="Senha" MaxLength="50"></asp:TextBox>
                    </div>
                    <br />
                    <div class="inner-addon right-addon">
                        <i class="glyphicon">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Falta confirmar a Senha." ControlToValidate="txtPass2" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As Senhas deven ser iguais." Font-Bold="True" Text="*" ForeColor="Red" ControlToCompare="txtPass1" ControlToValidate="txtPass2"></asp:CompareValidator>
                        </i>
                        <asp:TextBox ID="txtPass2" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Password" placeholder="Confirmar Senha" MaxLength="50"></asp:TextBox>
                    </div>

                    <br />
                    
                </div>
                <div class="panel-footer" style="text-align: right">
                    <asp:Button ID="btnCrear" runat="server" Text="Crear Usuario" CssClass="btn btn-primary" OnClick="btnCrear_Click" />
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
        </div>
    </div>
</asp:Content>
