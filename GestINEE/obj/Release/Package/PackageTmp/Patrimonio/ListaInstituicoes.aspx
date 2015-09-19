<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="ListaInstituicoes.aspx.cs" Inherits="GestINEE.Patrimonio.ListaInstituicoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Lista Geral de Instituições
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="panel panel-primary">
                <div class="panel-body">
                    <div class="row">

                        <div class="col-md-4">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon glyphicon-search"></i>
                                <asp:TextBox ID="txtNomeEscola" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Escola" MaxLength="20" AutoPostBack="False"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <asp:CheckBox ID="chbFiltrarProvincia" runat="server" AutoPostBack="True" OnCheckedChanged="chbFiltrarProvincia_CheckedChanged" />
                                </span>
                                <asp:DropDownList ID="ddlProvincia" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceProvincia" DataTextField="Provincia" DataValueField="Id_Provincia" AutoPostBack="True" Enabled="False"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Provincia]"></asp:SqlDataSource>
                            </div>
                            <br />
                            <!-- /input-group -->
                        </div>

                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <asp:CheckBox ID="chbFiltrarMunicipio" runat="server" Enabled="False" />
                                </span>
                                <asp:DropDownList ID="ddlMunicipio" CssClass="form-control" runat="server" DataSourceID="SqlDataSourceMunicipio" DataTextField="Municipio" DataValueField="Id_Municipio" Enabled="False"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceMunicipio" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Municipio], [Municipio] FROM [Tb_Municipio] WHERE ([Id_Provincia] = @Id_Provincia)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlProvincia" Name="Id_Provincia" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <!-- /input-group -->
                        </div>

                        <div class="col-md-2">
                            <asp:Button ID="btnUpdate" runat="server" Text="Filtrar" CssClass="btn btn-primary form-control" />
                        </div>


                    </div>
                </div>
                <hr style="margin-top: -5px" />

                <div class="panel-body" style="margin-top: -20px">
                    <asp:GridView ID="gvEscolas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_Instituicao" DataSourceID="SqlDataSourceInstituicaoes" GridLines="Vertical" Width="100%">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Id_Instituicao" HeaderText="Id_Instituicao" InsertVisible="False" ReadOnly="True" SortExpression="Id_Instituicao" Visible="False" />
                            <asp:TemplateField HeaderText="Nome da Instituicao" SortExpression="NomeInstituicao">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("NomeInstituicao") %>' ForeColor="Black" PostBackUrl='<%# "/Patrimonio/Instituicao.aspx?Id="+ Eval("Id_Instituicao") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                            <asp:BoundField DataField="Municipio" HeaderText="Municipio" SortExpression="Municipio" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" Height="28px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceInstituicaoes" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarInstituicao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtNomeEscola" DefaultValue=" " Name="Nome" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="chbFiltrarProvincia" Name="FiltrarProvincia" PropertyName="Checked" Type="Boolean" />
                            <asp:ControlParameter ControlID="ddlProvincia" Name="Id_Provincia" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="chbFiltrarMunicipio" Name="FiltrarMunicipio" PropertyName="Checked" Type="Boolean" />
                            <asp:ControlParameter ControlID="ddlMunicipio" Name="Id_Municipio" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
