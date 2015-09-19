<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaEquipamentos.aspx.cs" Inherits="GestINEE.Patrimonio.ListaEquipamentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        //$(function () {
        //    $('[data-toggle="tooltip"]').tooltip()
        //})

        $(function Popover() {
            $('[data-toggle="popover"]').popover()
        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista Geral de Equipamentos
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="inner-addon right-addon">
                        <i class="glyphicon glyphicon-search"></i>
                        <asp:TextBox ID="txtCOD" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Codigo o Numero de Serie" MaxLength="20" AutoPostBack="True"></asp:TextBox>
                    </div>
                    <br />
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <asp:CheckBox ID="chbFiltrarEstado" runat="server" />
                        </span>
                        <asp:DropDownList ID="ddlEstadoEquipamento" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceEstadoequipamento" DataTextField="EstadoEquipamento" DataValueField="Id_EstadoEquipamento"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceEstadoequipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_EstadoEquipamento]"></asp:SqlDataSource>
                    </div>
                    <br />
                    <!-- /input-group -->
                </div>
                <div class="col-md-2">
                    <div class="inner-addon right-addon">
                        <i class="glyphicon glyphicon-chevron-down"></i>
                        <asp:TextBox ID="txtCustoMin" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Custo Minimo" MaxLength="20"></asp:TextBox>
                    </div>
                    <br />
                </div>
                <div class="col-md-2">
                    <div class="inner-addon right-addon">
                        <i class="glyphicon glyphicon-chevron-up"></i>
                        <asp:TextBox ID="txtCustoMax" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Custo Maximo" MaxLength="20"></asp:TextBox>
                    </div>
                    <br />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Filtrar" CssClass="btn btn-primary form-control" />
                </div>
            </div>
        </div>
        <hr style="margin-top: -5px" />
        <%--<div class="panel-body">--%>
        <asp:ListView ID="lvEquipamentos" runat="server" DataSourceID="SqlDataSourceEquipamento" DataKeyNames="Id_Equipamento" OnItemDataBound="lvEquipamentos_ItemDataBound">


            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="" class='<%#Style(Eval("EstadoEquipamento").ToString()) %>'>
                    <td>
                        <a class="btn btn-default" href='<%# "/Patrimonio/Equipamento.aspx?Id="+Eval("Id_Equipamento") %>'><i class="fa fa-info-circle"></i></a>

                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("COD") %>' runat="server" ID="CODLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("TipoEquipamento") %>' runat="server" ID="TipoEquipamentoLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("MarcaEquipamento") %>' runat="server" ID="MarcaEquipamentoLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("ModeloEquipamento") %>' runat="server" ID="ModeloEquipamentoLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("EstadoEquipamento") %>' runat="server" ID="EstadoEquipamentoLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("NumSerie") %>' runat="server" ID="NumSerieLabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("Custo","{0:F}") %>' runat="server" ID="CustoLabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="width: 100%">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                <tr runat="server" style="" id="Row" >
                                    <th runat="server"></th>
                                    <th runat="server">COD</th>
                                    <th runat="server">Tipo</th>
                                    <th runat="server">Marca</th>
                                    <th runat="server">Modelo</th>
                                    <th runat="server">Estado</th>
                                    <th runat="server">Nº Serie</th>
                                    <th runat="server">Custo</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager runat="server" ID="DataPager1">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>


        <asp:SqlDataSource ID="SqlDataSourceEquipamento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarEquipamento" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCOD" Name="FiltroCOD" PropertyName="Text" Type="String" DefaultValue=" " />
                <asp:ControlParameter ControlID="chbFiltrarEstado" Name="FiltarEstado" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlEstadoEquipamento" Name="Id_Estado" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtCustoMin" DefaultValue="0" Name="CustoMin" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtCustoMax" DefaultValue="999999999" Name="CustoMax" PropertyName="Text" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--</div>--%>
    </div>
    <%--       </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
