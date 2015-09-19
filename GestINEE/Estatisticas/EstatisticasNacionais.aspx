<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="EstatisticasNacionais.aspx.cs" Inherits="GestINEE.Estatisticas.EstatisticasNacionais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Estatisticas Nacionais
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Grafico de Deficiências por Genero</div>
                <div class="panel-body">
                    <asp:Chart ID="cCadastros" runat="server" DataSourceID="SqlDataSourceCadastros" Width="400px" Style="width: 100%; height:100%;" ImageStorageMode="UseImageLocation">
                        <Series>
                            <asp:Series Name="Series1" ChartType="StackedBar" XValueMember="Deficiências" YValueMembers="Femenino" IsValueShownAsLabel="True" Color="Pink"></asp:Series>
                            <asp:Series Name="Series2" ChartType="StackedBar" XValueMember="Deficiências" YValueMembers="Masculino" IsValueShownAsLabel="True"></asp:Series>

                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle  Enable3D="true" />
                            </asp:ChartArea>
                        </ChartAreas>

                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSourceCadastros" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Def.Def AS Deficiências, SUM(CASE Tb_Estudante.Id_Genero WHEN 1 THEN 1 ELSE 0 END) AS Femenino, SUM(CASE Tb_Estudante.Id_Genero WHEN 2 THEN 1 ELSE 0 END) AS Masculino, COUNT(Tb_ClasifDef.Id_ClasifDef) AS Total FROM Tb_Genero INNER JOIN Tb_Def INNER JOIN Tb_DefEstudante INNER JOIN Tb_ClasifDef ON Tb_DefEstudante.Id_ClasifDef = Tb_ClasifDef.Id_ClasifDef INNER JOIN Tb_Estudante ON Tb_DefEstudante.Id_Estudante = Tb_Estudante.Id_Estudante ON Tb_Def.Id_Def = Tb_ClasifDef.Id_Def ON Tb_Genero.Id_Genero = Tb_Estudante.Id_Genero GROUP BY Tb_Def.Def with rollup"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Tabela de Deficiências por Genero</div>
                <div class="panel-body">
                    <asp:ListView ID="lvDef" runat="server" DataSourceID="SqlDataSourceCadastros">

                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="DeficiênciasLabel" runat="server" Text='<%# Eval("Deficiências") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="FemeninoLabel" runat="server" Text='<%# Eval("Femenino") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MasculinoLabel" runat="server" Text='<%# Eval("Masculino") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Total") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" style="width: 100%">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-bordered table-hover">
                                            <tr runat="server" style="">
                                                <th runat="server">Deficiências</th>
                                                <th runat="server">Femenino</th>
                                                <th runat="server">Masculino</th>
                                                <th runat="server">Total</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>

                </div>
            </div>

        </div>
    </div>
    <hr />

   
</asp:Content>
