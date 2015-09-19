<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="Formacao.aspx.cs" Inherits="GestINEE.Formacoes.Formacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('[data-toggle="popover"]').popover()
            })

            //var HA = 0;

            //$(".HorasAulas").each(function () {
            //    HA = HA + parseInt($(this).html());
            //})

            //console.log(HA);
            //$('#HorasAulas').text(HA);


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Perfil de Formação
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="panel panel-primary">
        <div role="tabpanel">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-2x fa-info-circle"></i>Informação</a></li>
                <li role="presentation"><a href="#Participantes" aria-controls="Participantes" role="tab" data-toggle="tab"><i class="fa fa-2x fa-graduation-cap "></i>Participantes</a></li>
                <li role="presentation"><a href="#Formadores" aria-controls="Formadores" role="tab" data-toggle="tab"><i class="fa fa-2x fa-users"></i>Formadores</a></li>
                <li role="presentation"><a href="#Temas" aria-controls="Temas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-th-list"></i>Temas</a></li>
                <%--<li role="presentation"><a href="#Estudantes" aria-controls="Estudantes" role="tab" data-toggle="tab"><i class="fa fa-2x fa-child"></i>Estudantes</a></li>--%>
                <%--<li role="presentation"><a href="#Estatisticas" aria-controls="Estatisticas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-bar-chart-o"></i>Estatisticas</a></li>--%>
            </ul>
            <!-- Nav tabs -->

            <%--<div class="panel-body">--%>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="Info">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:FormView ID="fvInfo" runat="server" DataKeyNames="Id_Formacao" DataSourceID="SqlDataSourceInfo">
                            <ItemTemplate>
                                <%--Id_Formacao:
                                        <asp:Label ID="Id_FormacaoLabel" runat="server" Text='<%# Eval("Id_Formacao") %>' />--%>
                                <p>
                                    <b>Nome da Formação:</b>
                                    <%--<br />--%>
                                    <asp:Label ID="NomeFormacaoLabel" runat="server" Text='<%# Bind("NomeFormacao") %>' />
                                </p>
                                <p>
                                    <b>Tipo de Formação:</b>
                                    <%--<br />--%>
                                    <asp:Label ID="TipoFormacaoLabel" runat="server" Text='<%# Bind("TipoFormacao") %>' />
                                </p>
                                <p>
                                    <b>Periodo da Formação:</b>
                                    <asp:Label ID="PeriodoFormacaoLabel" runat="server" Text='<%# Bind("PeriodoFormacao") %>' />

                                </p>
                                <p>

                                    <b>Data de Inicio:</b>
                                    <asp:Label ID="DataInicioLabel" runat="server" Text='<%# Bind("DataInicio","{0:D}") %>' />
                                    <b style="margin-left: 20px;">Data de Fim:</b>
                                    <asp:Label ID="DataFimLabel" runat="server" Text='<%# Bind("DataFim","{0:D}") %>' />
                                </p>
                                <p>
                                    <b>Participantes:</b>
                                    <asp:Label ID="QuantParticipantesLabel" runat="server" Text='<%# Bind("QuantParticipantes") %>' />
                                    <%--<b style="margin-left: 20px">Temas:</b>
                                    <asp:Label ID="Label2" runat="server" Text="0" CssClass="Temas"></asp:Label>
                                    <b style="margin-left: 20px">Horas Aulas:</b>
                                    <asp:Label ID="Label1" runat="server" Text="0" CssClass="HorasAulas"></asp:Label>--%>
                                </p>
                                <%--<br />--%>
                                <%-- Completa:
                                <asp:CheckBox ID="CompletaCheckBox" runat="server" Checked='<%# Bind("Completa") %>' Enabled="false" />
                                <br />--%>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSourceInfo" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Formacao.Id_Formacao, Tb_Formacao.NomeFormacao, Tb_TipoFormacao.TipoFormacao, Tb_PeriodoFormacao.PeriodoFormacao, Tb_Formacao.DataInicio, Tb_Formacao.DataFim, Tb_Formacao.QuantParticipantes, Tb_Formacao.Completa FROM Tb_Formacao INNER JOIN Tb_TipoFormacao ON Tb_Formacao.Id_TipoFormacao = Tb_TipoFormacao.Id_TipoFormacao INNER JOIN Tb_PeriodoFormacao ON Tb_Formacao.Id_PeriodoFormacao = Tb_PeriodoFormacao.Id_PeriodoFormacao WHERE (Tb_Formacao.Id_Formacao = @Id_Formacao)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Id_Formacao" QueryStringField="Id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    
                    <div class="panel-footer">
                        <asp:Button ID="btnEditarInfo" runat="server" Text="Editar Informação" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModalEdit" />
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Participantes">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">

                        <asp:ListView ID="lvParticipantes" runat="server" DataSourceID="SqlDataSourceParticipantes" DataKeyNames="Id_Funcionario">
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>
                                            <p>
                                                <b style="color: red">Sem convidados.
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <a tabindex="0"
                                            class="btn btn-default "
                                            role="button"
                                            data-toggle="popover"
                                            data-trigger="hover"
                                            data-html="true"
                                            title="Detalhes Funcionario"
                                            data-content="<img style='width:100px' src='<%# Eval("PathPic") %>'/> <p margin-botton=0px;> <b>Email:</b> <%# Eval("Email") %></p><p style='margin-top=0px;'><b>Telefone:</b><%# Eval("TelfPrim") %>/<%# Eval("TelfSecu") %></p>">Detalhes</a>
                                    <td>
                                        <asp:Label Text='<%# Eval("NomeFuncionario") %>' runat="server" ID="NomeFuncionarioLabel" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("NumAgente") %>' runat="server" ID="NumAgenteLabel" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server" style="width: 100%">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                <tr runat="server" style="">
                                                    <th runat="server" style="width: 50px"></th>
                                                    <th runat="server">Nome do Funcionario</th>
                                                    <th runat="server" style="width: 80px">Nº Agente</th>
                                                    <%-- <th runat="server">PathPic</th>
                                                    <th runat="server">TelfPrim</th>
                                                    <th runat="server">TelfSecu</th>
                                                    <th runat="server">Email</th>--%>
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

                        <asp:SqlDataSource runat="server" ID="SqlDataSourceParticipantes" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Funcionario.Id_Funcionario, Tb_Funcionario.NomeFuncionario, Tb_Funcionario.NumAgente, Tb_Funcionario.PathPic, Tb_Funcionario.TelfPrim, Tb_Funcionario.TelfSecu, Tb_Funcionario.Email FROM Tb_ConvidadoFormacao INNER JOIN Tb_Funcionario ON Tb_ConvidadoFormacao.Id_Funcionario = Tb_Funcionario.Id_Funcionario WHERE (Tb_ConvidadoFormacao.Id_Formacao = @Id_Formacao) ORDER BY Tb_Funcionario.NomeFuncionario">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Formacao"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="panel-footer">
                        <a class="btn btn-primary" href='<%="/Formacoes/Participantes.aspx?Id="+Request.QueryString["Id"].ToString() %>'>Editar Participantes</a>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Formadores">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtFormador" runat="server" placeholder="Nome do Formador" ValidationGroup="For" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnAddFormador" runat="server" Text="Vincular" CssClass="btn btn-default" OnClick="btnAddFormador_Click" Width="100%" ValidationGroup="For" />
                                    </div>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="" ControlToValidate="txtFormador" ValidationGroup="For" ForeColor="Red"></asp:RequiredFieldValidator>
                                <hr />
                                <asp:ListView ID="lvFormadores" runat="server" DataSourceID="SqlDataSourceFormadores" DataKeyNames="Id_FormadorFormacao" OnItemCommand="lvFormadores_ItemCommand">
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>
                                                    <p>
                                                        <b style="color: red">Nenhum Formador vinculado.
                                                        </b>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>

                                    <ItemTemplate>
                                        <tr style="vertical-align: central">
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("Id_FormadorFormacao") %>' CommandName="Del" ToolTip="Eliminar Formador" />
                                            </td>
                                            <td>
                                                <asp:Label Text='<%# Eval("FormadorFormacao") %>' runat="server" ID="FormadorFormacaoLabel" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" style="width: 100%">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                        <tr runat="server" style="">
                                                            <th runat="server" style="width: 50px"></th>
                                                            <th runat="server">Formador</th>
                                                        </tr>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style=""></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label Text='<%# Eval("Id_FormadorFormacao") %>' runat="server" ID="Id_FormadorFormacaoLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("FormadorFormacao") %>' runat="server" ID="FormadorFormacaoLabel" /></td>
                                        </tr>
                                    </SelectedItemTemplate>
                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSourceFormadores" runat="server" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT [Id_FormadorFormacao], [FormadorFormacao] FROM [Tb_FormadorFormacao] WHERE ([Id_Formacao] = @Id_Formacao)" InsertCommand="AddFormador" InsertCommandType="StoredProcedure" DeleteCommand="DelFormador" DeleteCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:Parameter Name="Id_Formador" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Formacao" QueryStringField="Id" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtFormador" Name="Formador" PropertyName="Text" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="Id" Name="Id_Formacao" Type="Int32"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <%--<div class="panel-footer"></div>--%>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Temas">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                        <asp:UpdatePanel runat="server" ID="upTemas">
                            <ContentTemplate>
                                <asp:ListView ID="lvTemas" runat="server" DataSourceID="SqlDataSourceTema" DataKeyNames="Id_TemaFormacao" OnItemCommand="lvTemas_ItemCommand">


                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>
                                                    <p>
                                                        <b style="color: red">Nenhum tema vinculado.
                                                        </b>
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>

                                    <ItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Button ID="Button1" runat="server" Text="X" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("Id_TemaFormacao") %>' CommandName="Del" ToolTip="Eliminar Tema" />

                                                <%--                                                <asp:Label Text='<%# Eval("Id_TemaFormacao") %>' runat="server" ID="Id_TemaFormacaoLabel" /></td>--%>
                                            <td>
                                                <asp:Label Text='<%# Eval("TemaFormacao") %>' runat="server" ID="TemaFormacaoLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("HorasAulas") %>' runat="server" ID="HorasAulasLabel" /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" style="width: 100%">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                        <tr runat="server" style="">
                                                            <th runat="server" style="width: 30px"></th>
                                                            <th runat="server">Tema</th>
                                                            <th runat="server" style="width: 50px">HorasAulas</th>
                                                        </tr>
                                                        <tr runat="server" id="itemPlaceholder"></tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style=""></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <tr style="">
                                            <td>
                                                <asp:Label Text='<%# Eval("Id_TemaFormacao") %>' runat="server" ID="Id_TemaFormacaoLabel" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("TemaFormacao") %>' runat="server" ID="TemaFormacaoLabel" CssClass="Temas" /></td>
                                            <td>
                                                <asp:Label Text='<%# Eval("HorasAulas") %>' runat="server" ID="HorasAulasLabel" ClassCss="HorasAulas"/></td>
                                        </tr>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="panel-footer">
                        <a class="btn btn-primary" data-toggle="modal" data-target="#myModalAddTema">Adicionar Tema</a>
                    </div>
                </div>
                <%-- <div role="tabpanel" class="tab-pane fade" id="Estudantes">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;"></div>
                            <div class="panel-footer"></div>
                        </div>--%>
                <%--<<div role="tabpanel" class="tab-pane fade" id="Estatisticas">
                    <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;"></div>
                    div class="panel-footer"></div>
                </div>--%>
            </div>
        </div>

        <!-- Tab panes -->

    </div>


    <div class="modal fade" id="myModalAddTema" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="fuelux">
                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta o nome do tema." ControlToValidate="txtTema" Font-Bold="True" Text="*" ForeColor="Red" ValidationGroup="Tema"></asp:RequiredFieldValidator>
                                    </i>
                                    <asp:TextBox ID="txtTema" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Tema" MaxLength="200" ValidationGroup="Tema"></asp:TextBox>
                                </div>
                                <br />

                                <b>Horas Aulas</b>
                                <div class="spinbox" data-initialize="spinbox" id="mySpinbox">

                                    <asp:TextBox ID="txtHorasTema" runat="server" CssClass="form-control input-mini spinbox-input" Width="50px">1</asp:TextBox>
                                    <div class="spinbox-buttons btn-group btn-group-vertical">
                                        <button type="button" class="btn btn-default spinbox-up btn-xs">
                                            <span class="glyphicon glyphicon-chevron-up"></span><span class="sr-only">Increase</span>
                                        </button>
                                        <button type="button" class="btn btn-default spinbox-down btn-xs">
                                            <span class="glyphicon glyphicon-chevron-down"></span><span class="sr-only">Decrease</span>
                                        </button>
                                    </div>
                                </div>
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" Font-Bold="True" ForeColor="Red" ValidationGroup="Tema" />

                            </div>
                        </div>

                        <asp:SqlDataSource ID="SqlDataSourceTema" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_TemaFormacao], [TemaFormacao], [HorasAulas] FROM [Tb_TemaFormacao] WHERE ([Id_Formacao] = @Id_Formacao)" InsertCommand="AddTema" InsertCommandType="StoredProcedure" DeleteCommand="DelTema" DeleteCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:Parameter Name="Id_TemaFormacao" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                <asp:QueryStringParameter Name="Id_Formacao" QueryStringField="Id" Type="Int32" />
                                <asp:ControlParameter ControlID="txtTema" Name="TemaFormacao" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtHorasTema" Name="HorasAluas" PropertyName="Text" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="Id" Name="Id_Formacao" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>

                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                    <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <asp:Button ID="btnGuardarTema" runat="server" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="Tema" OnClick="btnGuardarTema_Click" />
                </div>


            </div>
        </div>
    </div>



</asp:Content>
