<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CompletarEncarregado.aspx.cs" Inherits="GestINEE.Cadastros.CompletarEncarregado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Completar Encarregado de Educação
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Informação Pessoal
                </div>
                <div class="panel-body">
                    <asp:FormView ID="fvEncarregado" runat="server" DataKeyNames="Id_Encarregado" DataSourceID="SqlDataSourceEncarregado" Width="100%">
                        <ItemTemplate>
                            <b>Encarregado Nº:</b>
                            <asp:Label ID="Id_EncarregadoLabel" runat="server" Text='<%# Eval("Id_Encarregado") %>' />
                            <br />
                            <b>Nome:</b>
                            <asp:Label ID="NomeEncarregadoLabel" runat="server" Text='<%# Bind("NomeEncarregado") %>' />
                            <br />
                            <b>Data de Nascimento:</b>
                            <asp:Label ID="DataNascLabel" runat="server" Text='<%# Bind("DataNasc", "{0:D}") %>' />
                            <strong style="margin-left: 30px">Municipio:</strong>
                            <asp:Label ID="MunicipioNascLabel" runat="server" Text='<%# Bind("MunicipioNasc") %>' />
                            <strong style="margin-left: 30px">Provincia:</strong>
                            <asp:Label ID="ProvinciaNascLabel" runat="server" Text='<%# Bind("ProvinciaNasc") %>' />
                            <br />
                            <strong>Genero:</strong>
                            <asp:Label ID="Id_GeneroLabel" runat="server" Text='<%# Eval("Genero") %>' />
                            <hr />
                            <strong>Local de Trabalho:</strong>
                            <asp:Label ID="LocalTrabalhoLabel" runat="server" Text='<%# Bind("LocalTrabalho") %>' />
                            <br />
                            <strong>Funcao: </strong>
                            <asp:Label ID="FuncaoLabel" runat="server" Text='<%# Bind("Funcao") %>' />


                            <strong style="margin-left: 10px">Telefono do Trabalho:</strong>
                            <asp:Label ID="TelfTrabalhoLabel" runat="server" Text='<%# Bind("TelfTrabalho") %>' />
                            <hr />

                            <strong>Morada: </strong>
                            <asp:Label ID="EnderecoLabel" runat="server" Text='<%# Bind("Endereco") %>' />
                            ,<asp:Label ID="MunicipioLabel" runat="server" Text='<%# Bind("Municipio") %>' />
                            ,<asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Bind("Provincia") %>' />.
                            
                            <br />
                            <b>Telefones</b>
                            <asp:Label ID="TelfPrinLabel" runat="server" Text='<%# Bind("TelfPrin") %>' />

                            <asp:Label ID="TelfSecuLabel" runat="server" Text='<%# Bind("TelfSecu") %>' />
                            <br />
                            <b>Email:</b>
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                            <hr />
                            <b>Observações:</b>
                            <br />
                            <asp:Label ID="ObsLabel" runat="server" Text='<%# Bind("Obs") %>' />


                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceEncarregado" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Encarregado.Id_Encarregado, Tb_Encarregado.NomeEncarregado, Tb_Encarregado.DataNasc, Tb_Encarregado.Id_MunicipioNasc, Tb_Encarregado.Funcao, Tb_Encarregado.LocalTrabalho, Tb_Encarregado.TelfTrabalho, Tb_Encarregado.Endereco, Tb_Encarregado.Id_Municipio, Tb_Encarregado.TelfPrin, Tb_Encarregado.TelfSecu, Tb_Encarregado.Email, Tb_Encarregado.Obs, Tb_ProvinciaNasc.Provincia AS ProvinciaNasc, Tb_MunicipioNasc.Municipio AS MunicipioNasc, Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Genero.Genero FROM Tb_Encarregado INNER JOIN Tb_Municipio ON Tb_Encarregado.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia INNER JOIN Tb_Municipio AS Tb_MunicipioNasc ON Tb_Encarregado.Id_MunicipioNasc = Tb_MunicipioNasc.Id_Municipio INNER JOIN Tb_Provincia AS Tb_ProvinciaNasc ON Tb_MunicipioNasc.Id_Provincia = Tb_ProvinciaNasc.Id_Provincia INNER JOIN Tb_Genero ON Tb_Encarregado.Id_Genero = Tb_Genero.Id_Genero WHERE (Tb_Encarregado.Id_Encarregado = @Id_Encarregado)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_Encarregado" QueryStringField="Id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="panel-heading">
                    Estudantes Vinculados
                </div>
                <div class="panel-body">
                    <asp:ListView ID="lvEstudantes" runat="server" DataSourceID="SqlDataSourceEstudantes">
                        <EmptyDataTemplate>
                            <span>Nenhum Estudante vinculado.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style=""><b>Estudante:</b>
                            <asp:Label ID="NomeEstudanteLabel" runat="server" Text='<%# Eval("NomeEstudante") %>' />
                                <br />
                                <b>Data de Nascimento:</b>
                            <asp:Label ID="DataNascLabel" runat="server" Text='<%# Eval("DataNasc","{0:d}") %>' />
                                <br />
                                <b>Genero:</b>
                            <asp:Label ID="GeneroLabel" runat="server" Text='<%# Eval("Genero") %>' />
                                <br />
                                <b>Parentesco:</b>
                            <asp:Label ID="ParentescoLabel" runat="server" Text='<%# Eval("Parentesco") %>' />
                                <hr />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceEstudantes" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Estudante.NomeEstudante, Tb_Estudante.DataNasc, Tb_Genero.Genero, Tb_Parentesco.Parentesco FROM Tb_Parentesco INNER JOIN Tb_ParentescoEncarregado ON Tb_Parentesco.Id_Parentesco = Tb_ParentescoEncarregado.Id_Parentesco INNER JOIN Tb_Estudante ON Tb_ParentescoEncarregado.Id_Estudante = Tb_Estudante.Id_Estudante INNER JOIN Tb_Genero ON Tb_Estudante.Id_Genero = Tb_Genero.Id_Genero WHERE (Tb_ParentescoEncarregado.Id_Encarregado = @Id_Encarregado)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_Encarregado" QueryStringField="Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Opções
                </div>
                <div class="panel-body">
                    <input id="Button1" type="button" value="Vincular Estudante" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModalVinculo" />
                    <%--<asp:Button ID="Button5" runat="server" Text="Terminar Cadastro" CssClass="btn btn-primary form-control" data-toggle="modal" data-target="#myModalVinculo" />--%>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalVinculo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="input-group">
                                <span class="input-group-addon">Parentesco</span>
                                <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceParentesco" DataTextField="Parentesco" DataValueField="Id_Parentesco" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceParentesco" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddDefFuncionario" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Tb_Parentesco]"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtNomeEstudante" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Estudante" MaxLength="50"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtar" CssClass="btn btn-primary" />
                                </div>
                            </div>

                            <br />
                            <asp:GridView ID="gvEstudante" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Nº" DataSourceID="SqlDataSourceEstudante" GridLines="Vertical" OnRowCommand="gvEstudante_RowCommand" Width="100%">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Nº") %>' CommandName="Vincular" CssClass="btn btn-primary" Text="Vincular" />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nº" InsertVisible="False" SortExpression="Nº" Visible="False">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Nº") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Nº") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Nome" SortExpression="Nome">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Nome") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Data de Nascimento" SortExpression="Data de Nascimento">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[Data de Nascimento]") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("[Data de Nascimento]", "{0:d}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                            <asp:SqlDataSource ID="SqlDataSourceEstudante" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddParentescoEncarregado" InsertCommandType="StoredProcedure" SelectCommand="FiltrarEstudante" SelectCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:Parameter Name="Id_Estudante" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Encarregado" QueryStringField="Id" Type="Int32" />
                                    <asp:ControlParameter Name="Id_Parentesco" Type="Int32" ControlID="ddlParentesco" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNomeEstudante" Name="NomeEstudante" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <%--<asp:Button ID="btnVincularEstudante" runat="server" Text="Guardar" CssClass="btn btn-primary"  />--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
