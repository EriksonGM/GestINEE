<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="CadastrarEncarregado.aspx.cs" Inherits="GestINEE.Cadastros.CadastrarEncarregado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Cadastrar Encarregado
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="row">
        <div class="col-md-8">
            <div class="panel panel-primary">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="panel-body">
                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome do Encarregado." ControlToValidate="txtNomeEncarregado" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </i>
                                <asp:TextBox ID="txtNomeEncarregado" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Encarregado" MaxLength="50"></asp:TextBox>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-7">
                                    <div class="input-group">
                                        <span class="input-group-addon">Data Nascimento
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Nascimento Invalida." Text="*" ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Data de Nascimento." ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </span>
                                        <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA-MM-DD" MaxLength="10" TextMode="Date"></asp:TextBox>

                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <span class="input-group-addon">Genero</span>
                                        <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceGenero" DataTextField="Genero" DataValueField="Id_Genero">
                                        </asp:DropDownList>

                                        <asp:SqlDataSource ID="SqlDataSourceGenero" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Genero]"></asp:SqlDataSource>

                                    </div>
                                    <br />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Provincia Nascimento</span>
                                        <asp:DropDownList ID="ddlProvinciaNasc" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceProvincia" DataTextField="Provincia" DataValueField="Id_Provincia">
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <span class="input-group-addon">Municipio Nascimento</span>
                                        <asp:DropDownList ID="ddlMunicipioNasc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMunicipioNasc" DataTextField="Municipio" DataValueField="Id_Municipio">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceMunicipioNasc" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Municipio], [Municipio] FROM [Tb_Municipio] WHERE ([Id_Provincia] = @Id_Provincia)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlProvinciaNasc" Name="Id_Provincia" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                
                            </div>
                            <hr />
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtLocalTrabalho" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Local de Trabalho" MaxLength="50"></asp:TextBox>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtFuncaoTrabalho" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Função que ocupa" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <div class="col-md-6">
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfTrabalho" Font-Bold="True" ForeColor="Red" ValidationExpression="9\d{8}"></asp:RegularExpressionValidator>
                                        </i>
                                        <asp:TextBox ID="txtTelfTrabalho" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonico do Trabalho" MaxLength="9"></asp:TextBox>
                                    </div>
                                </div>
                               
                            </div>
                            <hr />
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Morada" MaxLength="150"></asp:TextBox>
                            </div>
                            <br />

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
                                        <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceMunicipio" DataTextField="Municipio" DataValueField="Id_Municipio">
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

                            <div class="inner-addon right-addon">
                                <i class="glyphicon">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta o Email." ControlToValidate="txtEmail" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Endereço de Email errado." ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </i>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Email" placeholder="Email" MaxLength="50"></asp:TextBox>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta o Numero Telefonico." ControlToValidate="txtTelfPrim" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfPrim" Font-Bold="True" ForeColor="Red" ValidationExpression="9\d{8}"></asp:RegularExpressionValidator>
                                        </i>
                                        <asp:TextBox ID="txtTelfPrim" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonico Principal" MaxLength="9"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <div class="col-md-6">
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfSecu" Font-Bold="True" ForeColor="Red" ValidationExpression="9\d{8}"></asp:RegularExpressionValidator>
                                        </i>
                                        <asp:TextBox ID="txtTelfSecu" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonio Secundario" MaxLength="9"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>

                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtObs" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Observações" MaxLength="2000" Height="150px" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="panel-footer" style="text-align: right;">
                    <asp:SqlDataSource ID="SqlDataSourceEncarregado" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddEncarregado" InsertCommandType="StoredProcedure" OnInserted="SqlDataSourceEncarregado_Inserted">
                        <InsertParameters>
                            <asp:Parameter Name="Id_Usuario" Type="Int32" />
                            <asp:ControlParameter ControlID="txtNomeEncarregado" Name="NomeEncarregado" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtDataNasc" DbType="Date" Name="DataNasc" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddlMunicipioNasc" Name="Id_MunicipioNasc" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlGenero" Name="Id_Genero" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtLocalTrabalho" Name="LocalTrabalho" PropertyName="Text" Type="String" DefaultValue="Sem especificações" />
                            <asp:ControlParameter ControlID="txtFuncaoTrabalho" Name="Funcao" PropertyName="Text" Type="String" DefaultValue="Sem especificações" />
                            <asp:ControlParameter ControlID="txtTelfTrabalho" Name="TelfTrabalho" PropertyName="Text" Type="String" DefaultValue="Sem Nº" />
                            <asp:ControlParameter ControlID="txtEndereco" Name="Endereco" PropertyName="Text" Type="String" DefaultValue="Sem especificações" />
                            <asp:ControlParameter ControlID="ddlMunicipio" Name="Id_Municipio" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtTelfPrim" Name="TelfPrin" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtTelfSecu" Name="TelfSecu" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtObs" Name="Obs" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                            <asp:Parameter Name="Id_Encarregado" Type="Int32" Direction="InputOutput" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnAddEstudante" runat="server" Text="Cadastrar Encarregado" CssClass="btn btn-primary" OnClick="btnAddEstudante_Click" />
                </div>
            </div>

        </div>


        <div class="col-md-4">
        </div>

        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                            </div>
                            <div class="modal-body">
                                <h4><i class="fa fa-warning"></i>&nbsp Deseja efectuar o cadastramento?</h4>
                            </div>
                            <div class="modal-footer">

                                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                <asp:Button ID="btnGuardar" runat="server" Text="Confirmar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>



</asp:Content>
