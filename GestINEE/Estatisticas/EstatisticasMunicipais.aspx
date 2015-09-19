<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="EstatisticasMunicipais.aspx.cs" Inherits="GestINEE.Estatisticas.EstatisticasMunicipais" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Estatisticas Municipais
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                        <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMunicipio" DataTextField="Municipio" DataValueField="Id_Municipio" AutoPostBack="True">
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

            <hr />
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Grafico de Deficiências por Genero</div>
                        <div class="panel-body">
                            <asp:Chart ID="cCadastros" runat="server" DataSourceID="SqlDataSourceCadastros" Width="400px" Style="width: 100%">
                                <Series>
                                    <asp:Series Name="Series1" ChartType="StackedBar" XValueMember="Deficiências" YValueMembers="Femenino" IsValueShownAsLabel="false"></asp:Series>
                                    <asp:Series Name="Series2" ChartType="StackedBar" XValueMember="Deficiências" YValueMembers="Masculino"></asp:Series>

                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <Area3DStyle Enable3D="true" />
                                    </asp:ChartArea>
                                </ChartAreas>

                            </asp:Chart>
                            <asp:SqlDataSource ID="SqlDataSourceCadastros" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Def.Def AS Deficiências, SUM(CASE Tb_Estudante.Id_Genero WHEN 1 THEN 1 ELSE 0 END) AS Femenino, SUM(CASE Tb_Estudante.Id_Genero WHEN 2 THEN 1 ELSE 0 END) AS Masculino, SUM(Tb_ClasifDef.Id_ClasifDef) AS Total FROM Tb_Genero INNER JOIN Tb_Def INNER JOIN Tb_DefEstudante INNER JOIN Tb_ClasifDef ON Tb_DefEstudante.Id_ClasifDef = Tb_ClasifDef.Id_ClasifDef INNER JOIN Tb_Estudante ON Tb_DefEstudante.Id_Estudante = Tb_Estudante.Id_Estudante ON Tb_Def.Id_Def = Tb_ClasifDef.Id_Def ON Tb_Genero.Id_Genero = Tb_Estudante.Id_Genero INNER JOIN Tb_Municipio ON Tb_Estudante.Id_Municipio = Tb_Municipio.Id_Municipio WHERE (Tb_Municipio.Id_Municipio = @Id_Municipio) GROUP BY Tb_Def.Def WITH ROLLUP">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlMunicipio" PropertyName="SelectedValue" Name="Id_Municipio"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
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
                                                <table id="itemPlaceholderContainer" runat="server" border="0" class="table table-bordered table-hover" style="">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
