<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListarFormacoes.aspx.cs" Inherits="GestINEE.Formacoes.ListarFormacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista de Formações
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="inner-addon right-addon">
                <i class="glyphicon glyphicon-search"></i>
                <asp:TextBox ID="txtNomeFormacao" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Formação" MaxLength="20" AutoPostBack="True"></asp:TextBox>
            </div>
            <hr />
            <asp:ListView ID="lvFormacoes" runat="server" DataSourceID="SqlDataSourceFormacoes" DataKeyNames="Id_Formacao">


                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>Nenhuma formação filtrada.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <a href='<%# "/Formacoes/Formacao.aspx?Id="+ Eval("Id_Formacao").ToString() %>' class="btn btn-default btn-sm">Ver</a>                        </td>
                        <td>
                            <asp:Label ID="NomeFormacaoLabel" runat="server" Text='<%# Eval("NomeFormacao") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DataInicioLabel" runat="server" Text='<%# Eval("DataInicio","{0:D}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DataFimLabel" runat="server" Text='<%# Eval("DataFim","{0:D}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuantParticipantesLabel" runat="server" Text='<%# Eval("QuantParticipantes") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width: 100%">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server" style="width:50px"></th>
                                        <th runat="server">Nome da Formacao</th>
                                        <th runat="server" style="width: 160px;">Data de Inicio</th>
                                        <th runat="server" style="width: 160px;">Data de Fim</th>
                                        <th runat="server" style="width:100px">Participantes</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                

            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceFormacoes" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltarFormacao" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtNomeFormacao" DefaultValue=" " Name="NomeFormacao" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
