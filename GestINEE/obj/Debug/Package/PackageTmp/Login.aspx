<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GestINEE.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    
    <%--<div class="container">
        <div class="btn-group">
            <asp:Button ID="btnSubmit" class="btn-info" runat="server" Text="Submit"
                OnClick="btnSubmit_Click"></asp:Button>
        </div>
    </div>--%>


    <!-- Bootstrap Modal Dialog -->
    <div class="modal show" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="margin-top: 100px;">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                            <h3 class="modal-title text-center">
                                <span class="fa fa-lock"></span>&nbsp Autenticação Requerida
                            </h3>
                        </div>
                        <div class="modal-body" >
                            <asp:LoginView runat="server">
                                <LoggedInTemplate>
                                    <h4 class="modal-title" style="text-align:center; color:red;  margin-top:-20px;">Permições Insuficientes</h>
                                </LoggedInTemplate>
                            </asp:LoginView>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-user"></span></span>
                                <asp:TextBox class="form-control" placeholder="Nome de Usuario" ID="txtUsuario" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-asterisk"></span></span>
                                <asp:TextBox class="form-control" placeholder="Senha" ID="txtPass" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>

                            </div>
                            <h4 style="text-align:center; color:red;">
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                            </h>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnLogin" class="btn btn-primary" runat="server" Text="Entrar"  aria-hidden="true" OnClick="btnLogin_Click" Width="150px" />
                            <%--<button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>--%>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
