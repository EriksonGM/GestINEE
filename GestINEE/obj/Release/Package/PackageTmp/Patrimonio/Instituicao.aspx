<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Instituicao.aspx.cs" Inherits="GestINEE.Patrimonio.Instituicao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        .panel-body {
            min-height: 300px;
            max-height: 1000px;
            overflow-y: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Perfil de Instituição
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

        <div class="panel panel-default">
            <div role="tabpanel" >
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-info-circle"></i>Informação</a></li>
                    <li role="presentation"><a href="#Funcionarios" aria-controls="Funcionarios" role="tab" data-toggle="tab"><i class="fa fa-users"></i>Funcionarios</a></li>
                    <li role="presentation"><a href="#Equipamentos" aria-controls="Equipamentos" role="tab" data-toggle="tab"><i class="fa fa-desktop"></i>Equipamentos</a></li>
                    <%--<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>--%>
                </ul>
                <!-- Nav tabs -->

                <%--<div class="panel-body">--%>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active in fade" id="Info">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:FormView ID="fvInstituicao" runat="server" DataKeyNames="Id_Instituicao" DataSourceID="SqlDataSourceInfo" Width="100%">
                                    <ItemTemplate>
                                        <div class="panel-body">
                                            
                                            <p><b>Nome da Instituiçao:</b>
                                                <asp:Label ID="NomeInstituicaoLabel" runat="server" Text='<%# Bind("NomeInstituicao") %>' />
                                            </p>
                                            <p>
                                            <b>Endereco:</b>
                                            <asp:Label ID="EnderecoLabel" runat="server" Text='<%# Bind("Endereco") %>' />, &nbsp
                                            <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Bind("Municipio") %>' />, &nbsp   
                                            <asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Bind("Provincia") %>' />.
                                            </p>
                                            <p>
                                            <b>Email:</b>
                                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                            </p>
                                            <p>
                                            <b>Telefone Principal:</b>
                                            <asp:Label ID="TelefPrincipalLabel" runat="server" Text='<%# Bind("TelefPrincipal") %>' />
                                            </p>
                                            <p>
                                            <b>Telefone Secundario:</b>
                                            <asp:Label ID="TelefSecundarioLabel" runat="server" Text='<%# Bind("TelefSecundario") %>' />
                                            </p>
                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Instituicao.NomeInstituicao, Tb_Instituicao.Endereco, Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Instituicao.Email, Tb_Instituicao.TelefPrincipal, Tb_Instituicao.TelefSecundario, Tb_Instituicao.Id_Instituicao FROM Tb_Instituicao INNER JOIN Tb_Municipio ON Tb_Instituicao.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Provincia ON Tb_Municipio.Id_Provincia = Tb_Provincia.Id_Provincia WHERE (Tb_Instituicao.Id_Instituicao = @Id_Instituicao)" InsertCommand="UpdInstituicao" InsertCommandType="StoredProcedure" UpdateCommand="UpdInstituicao" UpdateCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:Parameter Name="NomeInstituicao" Type="String" />
                                        <asp:Parameter Name="Endereco" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="TelfPrincipal" Type="String" />
                                        <asp:Parameter Name="TelfSecundario" Type="String" />
                                        <asp:QueryStringParameter Name="Id_Instituicao" QueryStringField="Id" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Id_Instituicao" QueryStringField="Id" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:Parameter Name="NomeInstituicao" Type="String" />
                                        <asp:Parameter Name="Endereco" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="TelfPrincipal" Type="String" />
                                        <asp:Parameter Name="TelfSecundario" Type="String" />
                                        <asp:QueryStringParameter Name="Id_Instituicao" QueryStringField="Id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <div class="panel-footer">
                                    <asp:Button ID="btnEditarInfo" runat="server" Text="Editar Informação" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModalEdit" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Funcionarios">
                        <div class="panel-body">
                            <asp:GridView ID="gvFuncionarios" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_InstFuncionario" DataSourceID="SqlDataSourceFuncionarios" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" RowStyle-Height="28">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Opções">
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id_InstFuncionario" HeaderText="Id_InstFuncionario" InsertVisible="False" ReadOnly="True" SortExpression="Id_InstFuncionario" Visible="False" />
                                    <asp:TemplateField HeaderText="Nome do Funcionario" SortExpression="NomeFuncionario">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# "~/Funcionario/Funcionario.aspx?Id=" +Eval("Id_Funcionario") %>' Text='<%# Eval("NomeFuncionario") %>' Enabled='<%# Roles.IsUserInRole("Funcionario") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Categoria ou Função" SortExpression="CatLaboral">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CatLaboral") %>'></asp:Label>
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
                        </div>
                        <asp:SqlDataSource ID="SqlDataSourceFuncionarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_InstFuncionario.Id_InstFuncionario, Tb_Funcionario.NomeFuncionario, Tb_CatLaboral.CatLaboral, Tb_Funcionario.Id_Funcionario FROM Tb_CatLaboral INNER JOIN Tb_InstFuncionario ON Tb_CatLaboral.Id_CatLaboral = Tb_InstFuncionario.Id_CatLaboral INNER JOIN Tb_Funcionario ON Tb_InstFuncionario.Id_Funcionario = Tb_Funcionario.Id_Funcionario WHERE (Tb_InstFuncionario.Id_Instituicao = @Id_Instituicao)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Id_Instituicao" QueryStringField="Id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <%--<div class="panel-footer"></div>--%>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Equipamentos">
                    </div>
                    <%--<div role="tabpanel" class="tab-pane" id="settings">
                    </div>--%>
                </div>
            </div>

            <!-- Tab panes -->


        </div>
        <%--<div class="panel panel-primary">
                <div class="panel-heading"></div>
                <div class="panel-heading"></div>
            </div>--%>
       

        <div class="modal fade" id="myModalEdit" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                            </div>
                            <div class="modal-body">
                                <asp:FormView ID="fvUpdateInst" runat="server" DataKeyNames="Id_Instituicao" DataSourceID="SqlDataSourceInfo" Width="100%">
                                    <ItemTemplate>
                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome da Instituicao." ControlToValidate="txtNomeInstituicao" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                            </i>
                                            <asp:TextBox ID="txtNomeInstituicao" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Instituição" MaxLength="50" Text='<%# Bind("NomeInstituicao") %>' ValidationGroup="Info"></asp:TextBox>
                                        </div>

                                        <br />


                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon"></i>
                                            <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Endereço" MaxLength="150" Text='<%# Bind("Endereco") %>' ValidationGroup="Info"></asp:TextBox>
                                        </div>
                                        <br />
                                        <%--<div class="row">
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
                                        </div>--%>


                                        <div class="inner-addon right-addon">
                                            <i class="glyphicon">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta o Email." ControlToValidate="txtEmail" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Endereço de Email errado." ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Info">*</asp:RegularExpressionValidator>
                                            </i>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" AutoCompleteType="Disabled" TextMode="Email" placeholder="Email" MaxLength="50" Text='<%# Bind("Email") %>' ValidationGroup="Info"></asp:TextBox>
                                        </div>
                                        <br />

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="inner-addon right-addon">
                                                    <i class="glyphicon">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta o Numero Telefonico" ControlToValidate="txtTelfPrim" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfPrim" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{9}" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                                    </i>
                                                    <asp:TextBox ID="txtTelfPrim" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonico Principal" MaxLength="9" Text='<%# Bind("TelefPrincipal") %>' ValidationGroup="Info"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-6">
                                                <div class="inner-addon right-addon">
                                                    <i class="glyphicon">
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numero Telefonico Invalido." Text="*" ControlToValidate="txtTelfSecu" Font-Bold="True" ForeColor="Red" ValidationExpression="\d{9}" ValidationGroup="Info"></asp:RegularExpressionValidator>
                                                    </i>
                                                    <asp:TextBox ID="txtTelfSecu" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Numero Telefonio Secundario" MaxLength="9" Text='<%# Bind("TelefSecundario") %>' ValidationGroup="Info"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                        </div>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Info" />
                                    </ItemTemplate>
                                </asp:FormView>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                                <asp:Button ID="btnGuardar" runat="server" Text="Confirmar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                                <asp:SqlDataSource ID="SqlDataSourceInstituicao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommandType="StoredProcedure" InsertCommand="AddInstituicao"></asp:SqlDataSource>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    

</asp:Content>
