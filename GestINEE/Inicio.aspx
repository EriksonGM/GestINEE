<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="GestINEE.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Inicio
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <h2 style="text-align: center">Seja bem-vindo a GestINEE</h2>
    <h3 style="text-align: center">Sistema de Gestão Integrada do Instituto Nacional para Educação Especial.</h3>
    <br />
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel panel-heading">Informação de Usuario</div>
                <div class="panel panel-body">
                    <b>Nome de Usuario:</b> <%=GestINEE.Reg.NomeUsuario(WebMatrix.WebData.WebSecurity.CurrentUserId)%><br />
                    <b>Data de Criação:</b><%= WebMatrix.WebData.WebSecurity.GetCreateDate(WebMatrix.WebData.WebSecurity.CurrentUserName).ToLongDateString() %><br />
                    <b>Ultima Modificação da Senha:</b><%= WebMatrix.WebData.WebSecurity.GetPasswordChangedDate(WebMatrix.WebData.WebSecurity.CurrentUserName).ToLongDateString() %>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel panel-heading">Permições de Acesso</div>
                <div class="panel panel-body">
                    <table class="table table-hover" style="width: 100%;">
                        <%--<thead>
                            <tr>
                                <th>Modulos</th>
                            </tr>
                        </thead>--%>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Cadastro")) %>'>
                            <td>Modulo de Cadastramentos</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Editor")) %>'>
                            <td>Modulo de Editor</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Patrimonio")) %>'>
                            <td>Modulo de Patrimonio</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Funcionario")) %>'>
                            <td>Modulo de Funcionarios</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Formacoes")) %>'>
                            <td>Modulo de Formações</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Estatistica")) %>'>
                            <td>Modulo de Estatistica</td>
                        </tr>
                        <tr class='<%=Acesso(Roles.IsUserInRole("Admin")) %>'>
                            <td>Modulo de Gestão</td>
                        </tr>
                    </table>
                    <%--<table >
                        <!-- On rows -->
                        <tr class="active">...</tr>
                        <tr class="success">...</tr>
                        <tr class="warning">...</tr>
                        <tr class="danger">...</tr>
                        <tr class="info">...</tr>
                    </table>--%>
                </div>
            </div>
        </div>
        <%--<div class="col-md-6">

        </div>--%>
        <%--<div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel panel-heading">Dados do Usuario</div>

                <div class="panel panel-body">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-green set-icon">
                            <i class="fa fa-bars"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">30 Registos Criados</p>
                            <p class="text-muted"></p>
                        </div>
                    </div>

                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-blue set-icon">
                            <i class="fa fa-bell-o"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">240 New</p>
                            <p class="text-muted">Notifications</p>
                        </div>
                    </div>

                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-brown set-icon">
                            <i class="fa fa-rocket"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">3 Orders</p>
                            <p class="text-muted">Pending</p>
                        </div>
                    </div>
                </div>--%>


            </div>


        </div>
        <div class="col-md-6">
        </div>
    </div>
    <%-- <div class="row">
        <div class="col-md-5">
        </div>
        <div class="col-md-3">
        </div>
        <div class="col-md-4">
        </div>
    </div>--%>
</asp:Content>
