<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="VisualizarRegisto.aspx.cs" Inherits="GestINEE.Admin.VisualizarRegisto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Visualizador de Registo
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

            <asp:GridView ID="gvRegisto" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Reg Nº" DataSourceID="SqlDataSourceReg" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="50" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Reg Nº" HeaderText="Reg Nº" InsertVisible="False" ReadOnly="True" SortExpression="Reg Nº">
                    <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Reg" HeaderText="Reg" SortExpression="Reg" />
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
            <asp:SqlDataSource ID="SqlDataSourceReg" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT TOP (1000) Tb_Reg.Id_Reg AS [Reg Nº], Tb_Usuario.Nome, Tb_Reg.Data, Tb_Reg.Reg FROM Tb_Reg INNER JOIN Tb_Usuario ON Tb_Reg.Id_Usuario = Tb_Usuario.Id_Usuario ORDER BY [Reg Nº] DESC"></asp:SqlDataSource>

</asp:Content>
