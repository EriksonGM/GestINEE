<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="MudarSenha.aspx.cs" Inherits="GestINEE.User.MudarSenha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Mudar Senha
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-3">
            <div class="inner-addon right-addon">
                <i class="glyphicon">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Senha Actual" ControlToValidate="txtOldPass" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </i>
                <asp:TextBox ID="txtOldPass" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Senha Actual" MaxLength="50" TextMode="Password"></asp:TextBox>
            </div>
            <br />
            <div class="inner-addon right-addon">
                <i class="glyphicon">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta a Senha Nova." ControlToValidate="txtNewPass1" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </i>
                <asp:TextBox ID="txtNewPass1" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nova Senha" MaxLength="50" TextMode="Password"></asp:TextBox>
            </div>
            <br />
            <div class="inner-addon right-addon">
                <i class="glyphicon">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta Confirmar a Senha." ControlToValidate="txtNewPass2" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As debem ser iguais." Font-Bold="True" Text="*" ForeColor="Red" ControlToCompare="txtNewPass1" ControlToValidate="txtNewPass2"></asp:CompareValidator>
                </i>
                <asp:TextBox ID="txtNewPass2" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Confirmação" MaxLength="50" TextMode="Password"></asp:TextBox>
            </div>
            <br />
            <asp:Button ID="btnOk" runat="server" Text="Actualizar Senha" CssClass="btn btn-primary form-control" OnClick="btnOk_Click" />
            <br />
            
        </div>
        <div class="col-md-4">
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Visible="False" Font-Bold="True"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" />
        </div>
    </div>
</asp:Content>
