<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="NAPA.aspx.cs" Inherits="GestINEE.Funcionario.NAPA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <%--<link href="/assets/css/fuelux.min.css" rel="stylesheet">--%>
    <script type="text/javascript">
        $(document).ready(function () {

         //   $(".spinbox-input").html("0");

            //$('.step-pane').click(function () {
            //    $('#myWizard').wizard('next');
            //    console.log('Next');
            //});
        });
    </script>
    <%--                <div class="step-pane active sample-pane alert" data-step="1">
                    <h4>Informação</h4>

                    <asp:FormView ID="fvInfo" runat="server" Width="100%" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceInfo">
                        
                        <ItemTemplate>
                            
                            <img src='<%# Eval("PathPic") %>' style="float:left;margin-right:5px;"/>
                            <strong>Nome: </strong>
                            <asp:Label ID="NomeFuncionarioLabel" runat="server" Text='<%# Bind("NomeFuncionario") %>' />
                            <br />
                            <strong>Número de Agente: </strong>
                            <asp:Label ID="NumAgenteLabel" runat="server" Text='<%# Bind("NumAgente") %>' />
                            <br />
                            <strong>Data de Nascimento: </strong>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DataNasc", "{0:D}") %>'></asp:Label>
                            <br />
                            <strong>Email: </strong>
                            <asp:HyperLink ID="HyperLink1" runat="server" target="_top" NavigateUrl='<%# "mailto:" + Eval("Email") %>' Text='<%# Eval("Email") %>'></asp:HyperLink>
                            
                            
                            <br />
                            <strong>Telefones: </strong>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TelfPrim") %>'></asp:Label>
                            &nbsp;/&nbsp;
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TelfSecu") %>'></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_Funcionario, NomeFuncionario, PathPic, NumAgente, TelfPrim, TelfSecu, Email, DataNasc FROM Tb_Funcionario WHERE (Id_Funcionario = @Id_Funcionario)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="step-pane active sample-pane alert" data-step="2">
                    <h4>Puntualidade</h4>
                    <asp:RadioButtonList ID="rblVal1" runat="server" DataSourceID="Val1" DataTextField="D" DataValueField="Id_Val1NAPA" CssClass="rbl">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="Val1" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="Insert Into Tb_Val1NAPA (D,V) values ('Pontual',@V)" SelectCommand="SELECT [Id_Val1NAPA], [D] FROM [Tb_Val1NAPA]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="rbl1" Name="V" PropertyName="SelectedValue" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="rblVal1" ErrorMessage="Falta o Parametro Nº 1" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="3">
                    <h4>Dinâmismo e Iniciativa</h4>
                    <asp:RadioButtonList ID="rblVal2" runat="server" DataSourceID="Val2" DataTextField="D" DataValueField="Id_Val2NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val2" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val2NAPA], [D] FROM [Tb_Val2NAPA] ORDER BY [Id_Val2NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rblVal2" ErrorMessage="Falta o Parametro Nº 2" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="4">
                    <h4>Assiduidade</h4>
                    <asp:RadioButtonList ID="rblVal3" runat="server" DataSourceID="Val3" DataTextField="D" DataValueField="Id_Val3NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val3" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val3NAPA], [D] FROM [Tb_Val3NAPA] ORDER BY [Id_Val3NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rblVal3" ErrorMessage="Falta o Parametro Nº 3" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="5">
                    <h4>Cumprimento de Tarefas</h4>
                    <asp:RadioButtonList ID="rblVal4" runat="server" DataSourceID="Val4" DataTextField="D" DataValueField="Id_Val4NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val4" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val4NAPA], [D] FROM [Tb_Val4NAPA] ORDER BY [Id_Val4NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblVal4" ErrorMessage="Falta o Parametro Nº 4" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="6">
                    <h4>Disciplina</h4>
                    <asp:RadioButtonList ID="rblVal5" runat="server" DataSourceID="Val5" DataTextField="D" DataValueField="Id_Val5NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val5" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val5NAPA], [D] FROM [Tb_Val5NAPA] ORDER BY [Id_Val5NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rblVal5" ErrorMessage="Falta o Parametro Nº 5" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="7">
                    <h4>Competência Professional</h4>
                    <asp:RadioButtonList ID="rblVal6" runat="server" DataSourceID="Val6" DataTextField="D" DataValueField="Id_Val6NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val6" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val6NAPA], [D] FROM [Tb_Val6NAPA] ORDER BY [Id_Val6NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rblVal6" ErrorMessage="Falta o Parametro Nº 6" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="8">
                    <h4>Racionalização do uso e Manutenção dos meios</h4>
                    <asp:RadioButtonList ID="rblVal7" runat="server" DataSourceID="Val7" DataTextField="D" DataValueField="Id_Val7NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val7" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val7NAPA], [D] FROM [Tb_Val7NAPA] ORDER BY [Id_Val7NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rblVal7" ErrorMessage="Falta o Parametro Nº 7" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="9">
                    <h4>Relações de Trabalho</h4>
                    <asp:RadioButtonList ID="rblVal8" runat="server" DataSourceID="Val8" DataTextField="D" DataValueField="Id_Val8NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val8" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val8NAPA], [D] FROM [Tb_Val8NAPA] ORDER BY [Id_Val8NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rblVal8" ErrorMessage="Falta o Parametro Nº 8" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="10">
                    <h4>Apresentação e Compostura</h4>
                    <asp:RadioButtonList ID="rblVal9" runat="server" DataSourceID="Val9" DataTextField="D" DataValueField="Id_Val9NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val9" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val9NAPA], [D] FROM [Tb_Val9NAPA] ORDER BY [Id_Val9NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="rblVal9" ErrorMessage="Falta o Parametro Nº 9" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="11">
                    <h4>Capacidade para Dirigir</h4>
                    <asp:RadioButtonList ID="rblVal10" runat="server" DataSourceID="Val10" DataTextField="D" DataValueField="Id_Val10NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val10" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val10NAPA], [D] FROM [Tb_Val10NAPA] ORDER BY [Id_Val10NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblVal10" ErrorMessage="Falta o Parametro Nº 10" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="12">
                    <h4>Capacidade para Ensinar</h4>
                    <asp:RadioButtonList ID="rblVal11" runat="server" DataSourceID="Val11" DataTextField="D" DataValueField="Id_Val11NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val11" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val11NAPA], [D] FROM [Tb_Val11NAPA] ORDER BY [Id_Val11NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="rblVal11" ErrorMessage="Falta o Parametro Nº 11" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="13">
                    <h4>Adaptação Professional</h4>
                    <asp:RadioButtonList ID="rblVal12" runat="server" DataSourceID="Val12" DataTextField="D" DataValueField="Id_Val12NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val12" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val12NAPA], [D] FROM [Tb_Val12NAPA] ORDER BY [Id_Val12NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="rblVal12" ErrorMessage="Falta o Parametro Nº 12" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="14">
                    <h4>Expressão Escrita</h4>
                    <asp:RadioButtonList ID="rblVal13" runat="server" DataSourceID="Val13" DataTextField="D" DataValueField="Id_Val13NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val13" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val13NAPA], [D] FROM [Tb_Val13NAPA] ORDER BY [Id_Val13NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="rblVal13" ErrorMessage="Falta o Parametro Nº 13" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="15">
                    <h4>Trabalhos relevantes durante o período em apreciação</h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtT" runat="server" CssClass="form-control" placeholder="Trabalho a ser vinculado" MaxLength="1000"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAddT" runat="server" Text="Vincular" CssClass="btn btn-default" ValidationGroup="T" OnClick="btnAddT_Click" />

                                </div>
                            </div>
                            <asp:ListView ID="lvT" runat="server" OnItemCommand="lvT_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhum trabalho vinculado.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-default" ValidationGroup="T" CommandArgument='<%# Eval("Id") %>' CommandName="Del" />
                                        </td>
                                        <td style="vertical-align: central">
                                            <asp:Label ID="DLabel" runat="server" Text='<%# Eval("T") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 20px;"></th>
                                                        <th runat="server">Trabalho</th>
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


                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <div class="step-pane active sample-pane alert" data-step="16">
                    <h4>Missões Especificas relevantes durante o período em apreciação</h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtM" runat="server" CssClass="form-control" placeholder="Missões a ser vinculadas" MaxLength="1000"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAddM" runat="server" Text="Vincular" CssClass="btn btn-default" ValidationGroup="M" OnClick="btnAddM_Click" />

                                </div>
                            </div>
                            <asp:ListView ID="lvM" runat="server" OnItemCommand="lvM_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhuma missão vinculada.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-default" ValidationGroup="M" CommandArgument='<%# Eval("Id") %>' CommandName="Del" />
                                        </td>
                                        <td style="vertical-align: central">
                                            <asp:Label ID="MLabel" runat="server" Text='<%# Eval("M") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 20px;"></th>
                                                        <th runat="server">Missões Especificas</th>
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


                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>--%>

    <style>
        .Val {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }

        .auto-style1 {
            width: 131px;
            font-weight: bold;
            text-align: right;
        }
        .auto-style2 {
            width: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Notação Anual do Pessoal Administrativo
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">

    <div class="fuelux">
        <div class="wizard" data-initialize="wizard" id="myWizard">
            <div class="steps-container">
                <ul class="steps">
                    <li data-step="1" data-name="campaign" class="active"><span class="badge">i</span>Informação<span class="chevron"></span></li>
                    <li data-step="2"><span class="badge">1</span>Puntualidade<span class="chevron"></span></li>
                    <li data-step="3"><span class="badge">2</span>Dinâmismo e Iniciativa<span class="chevron"></span></li>
                    <li data-step="4"><span class="badge">3</span>Assiduidade<span class="chevron"></span></li>
                    <li data-step="5"><span class="badge">4</span>Cumprimento de Tarefas<span class="chevron"></span></li>
                    <li data-step="6"><span class="badge">5</span>Disciplina<span class="chevron"></span></li>
                    <li data-step="7"><span class="badge">6</span>Competência Professional<span class="chevron"></span></li>
                    <li data-step="8"><span class="badge">7</span>Racionalização do uso e Manutenção dos meios<span class="chevron"></span></li>
                    <li data-step="9"><span class="badge">8</span>Relações de Trabalho<span class="chevron"></span></li>
                    <li data-step="10"><span class="badge">9</span>Apresentação e Compostura<span class="chevron"></span></li>
                    <li data-step="11"><span class="badge">10</span>Capacidade para Dirigir<span class="chevron"></span></li>
                    <li data-step="12"><span class="badge">11</span>Capacidade para Ensinar<span class="chevron"></span></li>
                    <li data-step="13"><span class="badge">12</span>Adaptação Professional<span class="chevron"></span></li>
                    <li data-step="14"><span class="badge">13</span>Expressão Escrita<span class="chevron"></span></li>
                    <li data-step="15"><span class="badge">14</span>Trabalhos Relevantes<span class="chevron"></span></li>
                    <li data-step="16"><span class="badge">15</span>Missões Específicadas<span class="chevron"></span></li>
                    <li data-step="17"><span class="badge">16</span>Amtiguidade<span class="chevron"></span></li>
                    <%--<li data-step="14" data-name="template"><i class="fa fa-save"></i>&nbsp;Guardar<span class="chevron"></span></li>--%>
                </ul>
            </div>
            <div class="actions">
                <button type="button" class="btn btn-default btn-prev"><span class="glyphicon glyphicon-arrow-left"></span>Voltar</button>
                <button type="button" class="btn btn-default btn-next" id="Final" data-last="Finalizar">Avanzar<span class="glyphicon glyphicon-arrow-right"></span></button>
                <%--<asp:Button ID="btnConfirmar" runat="server" Text="Finalizar" CssClass="btn btn-success btn-next btnConfirmar" />--%>
            </div>
            <div class="step-content">


                <%--                <div class="step-pane active sample-pane alert" data-step="1">
                    <h4>Informação</h4>

                    <asp:FormView ID="fvInfo" runat="server" Width="100%" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceInfo">
                        
                        <ItemTemplate>
                            
                            <img src='<%# Eval("PathPic") %>' style="float:left;margin-right:5px;"/>
                            <strong>Nome: </strong>
                            <asp:Label ID="NomeFuncionarioLabel" runat="server" Text='<%# Bind("NomeFuncionario") %>' />
                            <br />
                            <strong>Número de Agente: </strong>
                            <asp:Label ID="NumAgenteLabel" runat="server" Text='<%# Bind("NumAgente") %>' />
                            <br />
                            <strong>Data de Nascimento: </strong>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DataNasc", "{0:D}") %>'></asp:Label>
                            <br />
                            <strong>Email: </strong>
                            <asp:HyperLink ID="HyperLink1" runat="server" target="_top" NavigateUrl='<%# "mailto:" + Eval("Email") %>' Text='<%# Eval("Email") %>'></asp:HyperLink>
                            
                            
                            <br />
                            <strong>Telefones: </strong>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("TelfPrim") %>'></asp:Label>
                            &nbsp;/&nbsp;
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TelfSecu") %>'></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_Funcionario, NomeFuncionario, PathPic, NumAgente, TelfPrim, TelfSecu, Email, DataNasc FROM Tb_Funcionario WHERE (Id_Funcionario = @Id_Funcionario)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="step-pane active sample-pane alert" data-step="2">
                    <h4>Puntualidade</h4>
                    <asp:RadioButtonList ID="rblVal1" runat="server" DataSourceID="Val1" DataTextField="D" DataValueField="Id_Val1NAPA" CssClass="rbl">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="Val1" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="Insert Into Tb_Val1NAPA (D,V) values ('Pontual',@V)" SelectCommand="SELECT [Id_Val1NAPA], [D] FROM [Tb_Val1NAPA]">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="rbl1" Name="V" PropertyName="SelectedValue" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="rblVal1" ErrorMessage="Falta o Parametro Nº 1" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="3">
                    <h4>Dinâmismo e Iniciativa</h4>
                    <asp:RadioButtonList ID="rblVal2" runat="server" DataSourceID="Val2" DataTextField="D" DataValueField="Id_Val2NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val2" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val2NAPA], [D] FROM [Tb_Val2NAPA] ORDER BY [Id_Val2NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rblVal2" ErrorMessage="Falta o Parametro Nº 2" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="4">
                    <h4>Assiduidade</h4>
                    <asp:RadioButtonList ID="rblVal3" runat="server" DataSourceID="Val3" DataTextField="D" DataValueField="Id_Val3NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val3" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val3NAPA], [D] FROM [Tb_Val3NAPA] ORDER BY [Id_Val3NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rblVal3" ErrorMessage="Falta o Parametro Nº 3" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="5">
                    <h4>Cumprimento de Tarefas</h4>
                    <asp:RadioButtonList ID="rblVal4" runat="server" DataSourceID="Val4" DataTextField="D" DataValueField="Id_Val4NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val4" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val4NAPA], [D] FROM [Tb_Val4NAPA] ORDER BY [Id_Val4NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblVal4" ErrorMessage="Falta o Parametro Nº 4" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="6">
                    <h4>Disciplina</h4>
                    <asp:RadioButtonList ID="rblVal5" runat="server" DataSourceID="Val5" DataTextField="D" DataValueField="Id_Val5NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val5" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val5NAPA], [D] FROM [Tb_Val5NAPA] ORDER BY [Id_Val5NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="rblVal5" ErrorMessage="Falta o Parametro Nº 5" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="7">
                    <h4>Competência Professional</h4>
                    <asp:RadioButtonList ID="rblVal6" runat="server" DataSourceID="Val6" DataTextField="D" DataValueField="Id_Val6NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val6" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val6NAPA], [D] FROM [Tb_Val6NAPA] ORDER BY [Id_Val6NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rblVal6" ErrorMessage="Falta o Parametro Nº 6" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="8">
                    <h4>Racionalização do uso e Manutenção dos meios</h4>
                    <asp:RadioButtonList ID="rblVal7" runat="server" DataSourceID="Val7" DataTextField="D" DataValueField="Id_Val7NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val7" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val7NAPA], [D] FROM [Tb_Val7NAPA] ORDER BY [Id_Val7NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="rblVal7" ErrorMessage="Falta o Parametro Nº 7" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="9">
                    <h4>Relações de Trabalho</h4>
                    <asp:RadioButtonList ID="rblVal8" runat="server" DataSourceID="Val8" DataTextField="D" DataValueField="Id_Val8NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val8" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val8NAPA], [D] FROM [Tb_Val8NAPA] ORDER BY [Id_Val8NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="rblVal8" ErrorMessage="Falta o Parametro Nº 8" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="10">
                    <h4>Apresentação e Compostura</h4>
                    <asp:RadioButtonList ID="rblVal9" runat="server" DataSourceID="Val9" DataTextField="D" DataValueField="Id_Val9NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val9" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val9NAPA], [D] FROM [Tb_Val9NAPA] ORDER BY [Id_Val9NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="rblVal9" ErrorMessage="Falta o Parametro Nº 9" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="11">
                    <h4>Capacidade para Dirigir</h4>
                    <asp:RadioButtonList ID="rblVal10" runat="server" DataSourceID="Val10" DataTextField="D" DataValueField="Id_Val10NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val10" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val10NAPA], [D] FROM [Tb_Val10NAPA] ORDER BY [Id_Val10NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rblVal10" ErrorMessage="Falta o Parametro Nº 10" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="12">
                    <h4>Capacidade para Ensinar</h4>
                    <asp:RadioButtonList ID="rblVal11" runat="server" DataSourceID="Val11" DataTextField="D" DataValueField="Id_Val11NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val11" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val11NAPA], [D] FROM [Tb_Val11NAPA] ORDER BY [Id_Val11NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="rblVal11" ErrorMessage="Falta o Parametro Nº 11" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="13">
                    <h4>Adaptação Professional</h4>
                    <asp:RadioButtonList ID="rblVal12" runat="server" DataSourceID="Val12" DataTextField="D" DataValueField="Id_Val12NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val12" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val12NAPA], [D] FROM [Tb_Val12NAPA] ORDER BY [Id_Val12NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="rblVal12" ErrorMessage="Falta o Parametro Nº 12" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="14">
                    <h4>Expressão Escrita</h4>
                    <asp:RadioButtonList ID="rblVal13" runat="server" DataSourceID="Val13" DataTextField="D" DataValueField="Id_Val13NAPA" CssClass="rbl"></asp:RadioButtonList>

                    <asp:SqlDataSource ID="Val13" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_Val13NAPA], [D] FROM [Tb_Val13NAPA] ORDER BY [Id_Val13NAPA]"></asp:SqlDataSource>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="rblVal13" ErrorMessage="Falta o Parametro Nº 13" CssClass="Val"></asp:RequiredFieldValidator>

                </div>
                <div class="step-pane active sample-pane alert" data-step="15">
                    <h4>Trabalhos relevantes durante o período em apreciação</h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtT" runat="server" CssClass="form-control" placeholder="Trabalho a ser vinculado" MaxLength="1000"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAddT" runat="server" Text="Vincular" CssClass="btn btn-default" ValidationGroup="T" OnClick="btnAddT_Click" />

                                </div>
                            </div>
                            <asp:ListView ID="lvT" runat="server" OnItemCommand="lvT_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhum trabalho vinculado.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-default" ValidationGroup="T" CommandArgument='<%# Eval("Id") %>' CommandName="Del" />
                                        </td>
                                        <td style="vertical-align: central">
                                            <asp:Label ID="DLabel" runat="server" Text='<%# Eval("T") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 20px;"></th>
                                                        <th runat="server">Trabalho</th>
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


                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <div class="step-pane active sample-pane alert" data-step="16">
                    <h4>Missões Especificas relevantes durante o período em apreciação</h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtM" runat="server" CssClass="form-control" placeholder="Missões a ser vinculadas" MaxLength="1000"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnAddM" runat="server" Text="Vincular" CssClass="btn btn-default" ValidationGroup="M" OnClick="btnAddM_Click" />

                                </div>
                            </div>
                            <asp:ListView ID="lvM" runat="server" OnItemCommand="lvM_ItemCommand">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhuma missão vinculada.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-default" ValidationGroup="M" CommandArgument='<%# Eval("Id") %>' CommandName="Del" />
                                        </td>
                                        <td style="vertical-align: central">
                                            <asp:Label ID="MLabel" runat="server" Text='<%# Eval("M") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 20px;"></th>
                                                        <th runat="server">Missões Especificas</th>
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


                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>--%>

                <%--<div class="step-pane active sample-pane alert" data-step="17">
                   
                    <h4>Antiguidade</h4>
                    <table style="width: 100%; height: 29px;">
                        <tr>
                            <td class="auto-style1">De serviço:</td>
                            <td class="auto-style2">
                                
                                <asp:TextBox ID="txtServ" runat="server" TextMode="Number" Width="40px" AutoCompleteType="Disabled" style="margin-left:5px;" Height="28px">0</asp:TextBox>
                                
                                <asp:DropDownList ID="ddlServ" runat="server" Height="28px">
                                    <asp:ListItem>Anos</asp:ListItem>
                                    <asp:ListItem>Meses</asp:ListItem>
                                    <asp:ListItem>Dias</asp:ListItem>
                                </asp:DropDownList>
                                
                            </td>
                            <td>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServ" ErrorMessage="Falta a antiguidade de serviço." ForeColor="Red" ValidationGroup="Val"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Na Carreira:</td>
                            <td class="auto-style2">
                                
                                <asp:TextBox ID="txtCarr" runat="server" TextMode="Number" Width="40px" AutoCompleteType="Disabled" Style="margin-left: 5px;" Height="28px">0</asp:TextBox>
                                
                                <asp:DropDownList ID="ddlCarr" runat="server" Height="28px">
                                    <asp:ListItem>Anos</asp:ListItem>
                                    <asp:ListItem>Meses</asp:ListItem>
                                    <asp:ListItem>Dias</asp:ListItem>
                                </asp:DropDownList>
                                
                            </td>
                            <td>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCarr" ErrorMessage="Falta a antiguidade na carreira." ForeColor="Red" ValidationGroup="Val"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Na Categoria:</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtCate" runat="server" TextMode="Number" Width="40px" AutoCompleteType="Disabled" Style="margin-left: 5px;" Height="28px">0</asp:TextBox>
                                <asp:DropDownList ID="ddlCate" runat="server" Height="28px">
                                    <asp:ListItem>Anos</asp:ListItem>
                                    <asp:ListItem>Meses</asp:ListItem>
                                    <asp:ListItem>Dias</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCate" ErrorMessage="Falta antiguidade na categoria." ForeColor="Red" ValidationGroup="Val"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>--%>
                <%-- <div class="step-pane active sample-pane alert" data-step="3">
                <h4>Choose Recipients</h4>
                <p>Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard. </p>
            </div>
            <div class="step-pane active sample-pane alert" data-step="4">
                <h4>Choose Recipients</h4>
                <p>Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard. </p>
            </div>
            <div class="step-pane active sample-pane alert" data-step="5">
                <h4>Design Template</h4>
                <p>Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley jÃ­cama salsify. </p>
            </div>--%>
            </div>

        </div>
    </div>

</asp:Content>
