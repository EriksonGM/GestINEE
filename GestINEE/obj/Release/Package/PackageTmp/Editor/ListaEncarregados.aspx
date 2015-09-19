<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaEncarregados.aspx.cs" Inherits="GestINEE.Editor.ListaEncarregados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista Geral de Encarregados de Educação
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="inner-addon right-addon">
        <i class="glyphicon glyphicon-search"></i>
        <asp:TextBox ID="txtNomeEncarregado" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Encarregado" MaxLength="20" AutoPostBack="True"></asp:TextBox>
    </div>
    <hr />

    <div class="btn-group">
        <!-- here is the asp.net button to make post back -->
        <asp:Button ID="Button1" runat="server" Text="Action" CssClass="btn btn-danger" />
        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <!-- here is the asp.net link button to make post back -->
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" >Action</asp:LinkButton></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
        </ul>
    </div>
</asp:Content>
