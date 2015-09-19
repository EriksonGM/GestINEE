<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="EditorEstudante.aspx.cs" Inherits="GestINEE.Editor.EditorEstudante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script src="/assets/js/jquery.Jcrop.min.js"></script>
    <link rel="stylesheet" href="/assets/css/jquery.Jcrop.css" type="text/css" />

    <script type="text/javascript">


        $(document).ready(function () {
            $('#modalCam').on('shown.bs.modal', function (e) {
                //$("#canvas").hide();
                StartCam();
            });

            $('#modalCam').on('hidden.bs.modal', function (e) {
                //$("#canvas").hide();
                $("#video")[0].pause();
            });

        });

        var X;
        var Y;
        var W;
        var H;

        function CloseModal(msg) {
            $('#modalCam').modal('hide');
            if (msg.length > 0) {
                alert(msg);
            }
        }

        function ShowModal() {
            $('#modalCam').modal('show');
        }

        function StartCam() {
            var canvas = $("#canvas"),
            context = canvas[0].getContext("2d"),
            video = $("#video")[0],
            videoObj = { "video": true },
            errHandler = function (error) {
                console.log("Video capture error: ", error.code);

            };
            //------------------
            $('#video').Jcrop({
                onSelect: storeCoords,
                onChange: storeCoords,
                bgColor: 'black',
                bgOpacity: .3,
                setSelect: [80, 0, 200, 270],
                aspectRatio: 9 / 10,
                minSize: [432, 480],
                maxSize: [432, 480]
            });
            //--------------------------
            if (navigator.getUserMedia) { // Standard
                navigator.getUserMedia(videoObj, function (stream) {
                    video.src = stream;
                    video.play();

                }, errHandler);
            } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }
            else if (navigator.mozGetUserMedia) { // Firefox-prefixed
                navigator.mozGetUserMedia(videoObj, function (stream) {
                    video.src = window.URL.createObjectURL(stream);
                    video.play();
                }, errHandler);
            }

            $("#btnCapture").click(function (e) {
                e.preventDefault();

                context.drawImage(video, X, Y, W, H, 0, 0, 189, 210);

                var canvas = document.querySelector('canvas');

                var dataURL = canvas.toDataURL('image/jpeg', 1);

                $('#<%=hfImage.ClientID%>').val(dataURL);

                $('#<%=Pic.ClientID%>').attr('src', dataURL);

            });

        }

        function storeCoords(c) {
            X = c.x;
            Y = c.y;
            W = c.w;
            H = c.h;
        };

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Editar Estudante
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <div class="row">
        <div class="col-md-9">
            <%--<div class="panel panel-primary">
                <div class="panel panel-primary">
                    <div class="panel panel-heading">
                        Editar Informações Pessoais
                    </div>
                    <div class="panel-body">
                        <div class="inner-addon right-addon">
                            <i class="glyphicon">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome do Estudante." ControlToValidate="txtNomeEstudante" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </i>
                            <asp:TextBox ID="txtNomeEstudante" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Estudante" MaxLength="50"></asp:TextBox>
                        </div>
                        <br />
                        <div class="inner-addon right-addon">
                            <i class="glyphicon"></i>
                            <asp:TextBox ID="txtNomePai" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Pai" MaxLength="50"></asp:TextBox>
                        </div>
                        <br />
                        <div class="inner-addon right-addon">
                            <i class="glyphicon"></i>
                            <asp:TextBox ID="txtNomeMae" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Mãe" MaxLength="50"></asp:TextBox>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Data Nascimento<i class="glyphicon">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Nascimento Invalida." Text="*" ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Data de Nascimento." ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>

                                    </i>
                                    </span>
                                    <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA/MM/DD" MaxLength="10" TextMode="Date"></asp:TextBox>

                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
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
                            <br />
                        </div>
                        

                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Tipo de Atendimento</span>
                                    <asp:DropDownList ID="ddlTipoAtendimento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoAtendimento" DataTextField="TipoAtendimento" DataValueField="Id_TipoAtendimento">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSourceTipoAtendimento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoAtendimento]"></asp:SqlDataSource>

                                </div>
                                <br />
                            </div>
                            <div class="col-md-3">
                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Falta a Altura." ControlToValidate="txtAltura" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </i>
                                    <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Altura (Cm)" MaxLength="9"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-3">
                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Falta o Peso." ControlToValidate="txtPeso" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </i>
                                    <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Peso (Kg)" MaxLength="9"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Tipo de Documento</span>
                                    <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoDoc" DataTextField="TipoDoc" DataValueField="Id_TipoDoc">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceTipoDoc" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoDoc]"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-6">
                                <div class="inner-addon right-addon">
                                    <i class="glyphicon">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Falta a Número do Documento." ControlToValidate="txtNumDoc" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </i>
                                    <asp:TextBox ID="txtNumDoc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Número do Documento" MaxLength="14"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>




                        <div class="inner-addon right-addon">
                            <i class="glyphicon"></i>
                            <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Endereço" MaxLength="150"></asp:TextBox>
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
                    <div class="panel-footer" style="text-align: right;">
                        <asp:Button ID="btnAddEstudante" runat="server" Text="Cadastrar Estudante" CssClass="btn btn-primary" OnClick="btnAddEstudante_Click" />
                    </div>
                </div>
            </div>--%>

            <div class="panel panel-primary">
                <div role="tabpanel">
                    <ul class="nav nav-tabs nav-justified" role="tablist">
                        <li role="presentation" class="active"><a href="#Info" aria-controls="Info" role="tab" data-toggle="tab"><i class="fa fa-2x fa-info-circle"></i>Informação</a></li>
                        <li role="presentation"><a href="#Funcionarios" aria-controls="Funcionarios" role="tab" data-toggle="tab"><i class="fa fa-2x fa-users"></i>Funcionarios</a></li>
                        <li role="presentation"><a href="#Equipamentos" aria-controls="Equipamentos" role="tab" data-toggle="tab"><i class="fa fa-2x fa-desktop"></i>Equipamentos</a></li>
                        <li role="presentation"><a href="#Salas" aria-controls="Salas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-th-list"></i>Salas</a></li>
                        <li role="presentation"><a href="#Estudantes" aria-controls="Estudantes" role="tab" data-toggle="tab"><i class="fa fa-2x fa-child"></i>Estudantes</a></li>
                        <%--                <li role="presentation"><a href="#Estatisticas" aria-controls="Estatisticas" role="tab" data-toggle="tab"><i class="fa fa-2x fa-bar-chart-o"></i>Estatisticas</a></li>--%>
                    </ul>
                    <!-- Nav tabs -->

                    <%--<div class="panel-body">--%>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="Info">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                                <asp:FormView ID="fvEstudante" runat="server" DataKeyNames="Id_Estudante" DataSourceID="SqlDataSourceEstudante" Width="100%">
                                    <ItemTemplate>
                                        <div style="float: left; height: 80%">
                                            <b style="margin-right: 5px;">Número de Estudante:</b>
                                            <asp:Label ID="Id_EstudanteLabel" runat="server" Text='<%# Eval("Id_Estudante") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Nome:</b>
                                            <asp:Label ID="NomeEstudanteLabel" runat="server" Text='<%# Bind("NomeEstudante") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Nome do Pai:</b>
                                            <asp:Label ID="NomePaiLabel" runat="server" Text='<%# Bind("NomePai") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Nome da Mãe:</b>
                                            <asp:Label ID="NomeMaeLabel" runat="server" Text='<%# Bind("NomeMae") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Data de Nascimento:</b>
                                            <asp:Label ID="DataNascLabel" runat="server" Text='<%# Bind("DataNasc", "{0:d}") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Municipio de Nascimento:</b>
                                            <asp:Label ID="MunicipioNascLabel" runat="server" Text='<%# Bind("MunicipioNasc") %>' />
                                            <b style="margin-right: 5px; margin-left: 20px;">Provincia de:</b>
                                            <asp:Label ID="ProvinciaNascLabel" runat="server" Text='<%# Bind("ProvinciaNasc") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Genero:</b>
                                            <asp:Label ID="GeneroLabel" runat="server" Text='<%# Bind("Genero") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Altura:</b>
                                            <asp:Label ID="AlturaLabel" runat="server" Text='<%# Bind("Altura") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Peso:</b>
                                            <asp:Label ID="PesoLabel" runat="server" Text='<%# Bind("Peso")  %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Tipo de Documento:</b>
                                            <asp:Label ID="TipoDocLabel" runat="server" Text='<%# Bind("TipoDoc") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Número do Documento:</b>
                                            <asp:Label ID="NumDocLabel" runat="server" Text='<%# Bind("NumDoc") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Morada:</b>
                                            <asp:Label ID="MoradaLabel" runat="server" Text='<%# Bind("Morada") %>' />,<asp:Label ID="MunicipioLabel" runat="server" Text='<%# Bind("Municipio") %>' />,<asp:Label ID="ProvinciaLabel" runat="server" Text='<%# Bind("Provincia") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Telefone Principal</b>
                                            <asp:Label ID="TelfPrimLabel" runat="server" Text='<%# Bind("TelfPrim") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Telefone Alternativo</b>
                                            <asp:Label ID="TelfSecuLabel" runat="server" Text='<%# Bind("TelfSecu") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Email:</b>
                                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Tipo de Atendimento:</b>
                                            <asp:Label ID="TipoAtendimentoLabel" runat="server" Text='<%# Bind("TipoAtendimento") %>' />
                                            <br />
                                            <b style="margin-right: 5px;">Observações:</b>
                                            <asp:Label ID="ObsLabel" runat="server" Text='<%# Bind("Obs") %>' Width="100%" />
                                            <br />
                                        </div>
                                        <asp:Image ID="Image1" runat="server" Style="float: right" ImageUrl='<%# Eval("PathPic") %>' Width="200px" />
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSourceEstudante" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Estudante.NomeEstudante, Tb_Estudante.NomePai, Tb_Estudante.NomeMae, Tb_Estudante.DataNasc, Tb_ProvinciaNasc.Provincia AS ProvinciaNasc, Tb_MunicipioNasc.Municipio AS MunicipioNasc, Tb_Genero.Genero, Tb_Estudante.Altura, Tb_Estudante.Peso, Tb_TipoDoc.TipoDoc, Tb_Estudante.NumDoc, Tb_Estudante.Morada, Tb_Provincia.Provincia, Tb_Municipio.Municipio, Tb_Estudante.TelfPrim, Tb_Estudante.TelfSecu, Tb_Estudante.Email, Tb_TipoAtendimento.TipoAtendimento, Tb_Estudante.PathPic, Tb_Estudante.Obs FROM Tb_Municipio AS Tb_MunicipioNasc INNER JOIN Tb_Provincia INNER JOIN Tb_Genero INNER JOIN Tb_Estudante ON Tb_Genero.Id_Genero = Tb_Estudante.Id_Genero INNER JOIN Tb_TipoDoc ON Tb_Estudante.Id_TipoDoc = Tb_TipoDoc.Id_TipoDoc INNER JOIN Tb_Municipio ON Tb_Estudante.Id_Municipio = Tb_Municipio.Id_Municipio ON Tb_Provincia.Id_Provincia = Tb_Municipio.Id_Provincia ON Tb_MunicipioNasc.Id_Municipio = Tb_Estudante.Id_MunicipioNasc INNER JOIN Tb_Provincia AS Tb_ProvinciaNasc ON Tb_MunicipioNasc.Id_Provincia = Tb_ProvinciaNasc.Id_Provincia INNER JOIN Tb_TipoAtendimento ON Tb_Estudante.Id_TipoAtendimento = Tb_TipoAtendimento.Id_TipoAtendimento WHERE (Tb_Estudante.Id_Estudante = @Id_Estudante) AND (Tb_Estudante.Completo = 0)" UpdateCommand="CompletarEstudante" UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Id_Estudante" QueryStringField="Id" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:QueryStringParameter Name="Id_Estudante" QueryStringField="Id" />
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div class="panel-footer">
                                <a class="btn btn-primary" data-toggle="modal" data-target="#myModalEdit"><i class="fa fa-edit"></i>&nbsp; Editar Informação</a>
                                <%--<asp:LinkButton ID="btnEditarInfo" runat="server" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModalEdit" Text="Editar Informação">LinkButton</asp:LinkButton>--%>
                                <a class="btn btn-primary" data-toggle="modal" data-target="#modalCam"><i class="fa fa-camera"></i>&nbsp; Fazer Fotografia</a>

                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Funcionarios">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                            </div>
                            <%--<div class="panel-footer"></div>--%>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Equipamentos">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                            </div>
                            <%--<div class="panel-footer">
                    </div>--%>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Salas">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                                <asp:UpdatePanel runat="server" ID="upSalas">
                                    <ContentTemplate>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:SqlDataSource ID="SqlDataSourceSalas" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Sala.Id_Sala, Tb_Sala.NomeSala, Tb_TipoSala.TipoSala, Tb_ClasseSala.ClasseSala FROM Tb_Sala INNER JOIN Tb_TipoSala ON Tb_Sala.Id_TipoSala = Tb_TipoSala.Id_TipoSala INNER JOIN Tb_ClasseSala ON Tb_Sala.Id_ClasseSala = Tb_ClasseSala.Id_ClasseSala WHERE (Tb_Sala.Id_Escola = @Id_Escola)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="Id_Escola" QueryStringField="Id" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <%--<div class="panel-footer">
                        <a class="btn btn-primary" data-toggle="modal" data-target="#myModalAddTurma">Criar nova Sala</a>
                    </div>--%>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Estudantes">
                            <div class="panel-body" style="min-height: 300px; max-height: 1000px; overflow-y: auto;">
                            </div>
                            <%--<div class="panel-footer"></div>--%>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalEdit" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <asp:FormView ID="fvEditEst" runat="server" DataSourceID="SqlDataSourceEditEstudante" DataKeyNames="Id_Estudante">
                                <ItemTemplate>
                                    <%--Id_Estudante:
                                    <asp:Label Text='<%# Eval("Id_Estudante") %>' runat="server" ID="Id_EstudanteLabel" /><br />
                                    NomeEstudante:
                                    <asp:Label Text='<%# Bind("NomeEstudante") %>' runat="server" ID="NomeEstudanteLabel" /><br />
                                    NomePai:
                                    <asp:Label Text='<%# Bind("NomePai") %>' runat="server" ID="NomePaiLabel" /><br />
                                    NomeMae:
                                    <asp:Label Text='<%# Bind("NomeMae") %>' runat="server" ID="NomeMaeLabel" /><br />
                                    DataNasc:
                                    <asp:Label Text='<%# Bind("DataNasc") %>' runat="server" ID="DataNascLabel" /><br />
                                    Id_MunicipioNasc:
                                    <asp:Label Text='<%# Bind("Id_MunicipioNasc") %>' runat="server" ID="Id_MunicipioNascLabel" /><br />
                                    Id_Genero:
                                    <asp:Label Text='<%# Bind("Id_Genero") %>' runat="server" ID="Id_GeneroLabel" /><br />
                                    Altura:
                                    <asp:Label Text='<%# Bind("Altura") %>' runat="server" ID="AlturaLabel" /><br />
                                    Peso:
                                    <asp:Label Text='<%# Bind("Peso") %>' runat="server" ID="PesoLabel" /><br />
                                    Id_TipoDoc:
                                    <asp:Label Text='<%# Bind("Id_TipoDoc") %>' runat="server" ID="Id_TipoDocLabel" /><br />
                                    NumDoc:
                                    <asp:Label Text='<%# Bind("NumDoc") %>' runat="server" ID="NumDocLabel" /><br />
                                    Morada:
                                    <asp:Label Text='<%# Bind("Morada") %>' runat="server" ID="MoradaLabel" /><br />
                                    Id_Municipio:
                                    <asp:Label Text='<%# Bind("Id_Municipio") %>' runat="server" ID="Id_MunicipioLabel" /><br />
                                    TelfPrim:
                                    <asp:Label Text='<%# Bind("TelfPrim") %>' runat="server" ID="TelfPrimLabel" /><br />
                                    TelfSecu:
                                    <asp:Label Text='<%# Bind("TelfSecu") %>' runat="server" ID="TelfSecuLabel" /><br />
                                    Email:
                                    <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" /><br />
                                    Id_TipoAtendimento:
                                    <asp:Label Text='<%# Bind("Id_TipoAtendimento") %>' runat="server" ID="Id_TipoAtendimentoLabel" /><br />
                                    PathPic:
                                    <asp:Label Text='<%# Bind("PathPic") %>' runat="server" ID="PathPicLabel" /><br />
                                    Obs:
                                    <asp:Label Text='<%# Bind("Obs") %>' runat="server" ID="ObsLabel" /><br />
                                    Completo:
                                    <asp:CheckBox Checked='<%# Bind("Completo") %>' runat="server" ID="CompletoCheckBox" Enabled="false" /><br />
                                    ProvinciaNasc:
                                    <asp:Label Text='<%# Bind("ProvinciaNasc") %>' runat="server" ID="ProvinciaNascLabel" /><br />
                                    Id_Provincia:
                                    <asp:Label Text='<%# Bind("Id_Provincia") %>' runat="server" ID="Id_ProvinciaLabel" /><br />--%>

                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta o Nome do Estudante." ControlToValidate="txtNomeEstudante" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </i>
                                        <asp:TextBox ID="txtNomeEstudante" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Estudante" MaxLength="50" Text='<%# Bind("NomeEstudante") %>'></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtNomePai" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Pai" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtNomeMae" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Mãe" MaxLength="50"></asp:TextBox>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">Data Nascimento<i class="glyphicon">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Nascimento Invalida." Text="*" ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Data de Nascimento." ControlToValidate="txtDataNasc" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </i>
                                                </span>
                                                <asp:TextBox ID="txtDataNasc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA/MM/DD" MaxLength="10" TextMode="Date"></asp:TextBox>

                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-6">
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
                                        <br />
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">Tipo de Atendimento</span>
                                                <asp:DropDownList ID="ddlTipoAtendimento" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoAtendimento" DataTextField="TipoAtendimento" DataValueField="Id_TipoAtendimento">
                                                </asp:DropDownList>

                                                <asp:SqlDataSource ID="SqlDataSourceTipoAtendimento" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoAtendimento]"></asp:SqlDataSource>

                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-3">
                                            <div class="inner-addon right-addon">
                                                <i class="glyphicon">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Falta a Altura." ControlToValidate="txtAltura" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </i>
                                                <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Altura (Cm)" MaxLength="9"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-3">
                                            <div class="inner-addon right-addon">
                                                <i class="glyphicon">

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Falta o Peso." ControlToValidate="txtPeso" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </i>
                                                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Peso (Kg)" MaxLength="9"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">Tipo de Documento</span>
                                                <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceTipoDoc" DataTextField="TipoDoc" DataValueField="Id_TipoDoc">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSourceTipoDoc" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_TipoDoc]"></asp:SqlDataSource>
                                            </div>
                                            <br />
                                        </div>

                                        <div class="col-md-6">
                                            <div class="inner-addon right-addon">
                                                <i class="glyphicon">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Falta a Número do Documento." ControlToValidate="txtNumDoc" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </i>
                                                <asp:TextBox ID="txtNumDoc" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Número do Documento" MaxLength="14"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                    </div>

                                    <div class="inner-addon right-addon">
                                        <i class="glyphicon"></i>
                                        <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Endereço" MaxLength="150"></asp:TextBox>
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
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceEditEstudante" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="SELECT Tb_Estudante.Id_Estudante, Tb_Estudante.NomeEstudante, Tb_Estudante.NomePai, Tb_Estudante.NomeMae, Tb_Estudante.DataNasc, Tb_Estudante.Id_MunicipioNasc, Tb_Estudante.Id_Genero, Tb_Estudante.Altura, Tb_Estudante.Peso, Tb_Estudante.Id_TipoDoc, Tb_Estudante.NumDoc, Tb_Estudante.Morada, Tb_Estudante.Id_Municipio, Tb_Estudante.TelfPrim, Tb_Estudante.TelfSecu, Tb_Estudante.Email, Tb_Estudante.Id_TipoAtendimento, Tb_Estudante.PathPic, Tb_Estudante.Obs, Tb_Estudante.Completo, Tb_MunicipioNasc.Id_Provincia AS ProvinciaNasc, Tb_Municipio.Id_Provincia FROM Tb_Estudante INNER JOIN Tb_Municipio ON Tb_Estudante.Id_Municipio = Tb_Municipio.Id_Municipio INNER JOIN Tb_Municipio AS Tb_MunicipioNasc ON Tb_Estudante.Id_MunicipioNasc = Tb_MunicipioNasc.Id_Municipio WHERE (Tb_Estudante.Id_Estudante = @Id_Estudante)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="Id" Name="Id_Estudante" Type="Int32"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                        <div class="modal-footer">

                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            <asp:Button ID="Button3" runat="server" Text="Confirmar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <h4><i class="fa fa-warning"></i>&nbsp Deseja finalizar o cadastramento?</h4>
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

    <div class="modal fade" id="modalCam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <div class="row">

                        <div class="col-md-9">
                            <video id="video" width="640" height="480" autoplay style="border: 2px solid #646566;"></video>
                            <br />
                        </div>
                        <div class="col-md-3">
                            <button id="btnCapture" class="btn btn-primary form-control" style="margin-bottom: 10px;">Capturar</button>
                            <br />
                            <asp:Image ID="Pic" runat="server" Width="189" Height="210" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" />
                            <br />
                            <canvas id="canvas" width="189" height="210" style="border: 2px solid #646566;" hidden="hidden"></canvas>
                            <asp:HiddenField ID="hfImage" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="Button1">Cancelar</button>
                    <asp:Button ID="Button6" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" />
                </div>

                <asp:SqlDataSource ID="SqlDataSourceUpdateFoto" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" UpdateCommand="UpdPicEstudante" UpdateCommandType="StoredProcedure">
                    <UpdateParameters>
                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                        <asp:QueryStringParameter Name="Id_Estudante" QueryStringField="Id" Type="Int32" />
                        <asp:Parameter Name="PathPic" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEncarregado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static" data-keyboard="false">
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
                                <asp:DropDownList ID="ddlParentesco" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceParentesco" DataTextField="Parentesco" DataValueField="Id_Parentesco">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceParentesco" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddDefFuncionario" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Tb_Parentesco]"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="inner-addon right-addon">
                                <i class="glyphicon glyphicon-search"></i>
                                <asp:TextBox ID="txtNomeEncarregado" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome do Encarregado" MaxLength="20" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <hr />
                            <asp:ListView ID="lvEnca" runat="server" DataSourceID="SqlDataSourceEnca" DataKeyNames="Id_Encarregado" OnItemCommand="lvEnca_ItemCommand">

                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>Nenhum Resultado.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Button ID="Button2" runat="server" Text="Vincular" CssClass="btn btn-default" CommandName="Vincular" CommandArgument='<%# Eval("Id_Encarregado") %>' />
                                        </td>
                                        <td>
                                            <asp:Label Text='<%# Eval("NomeEncarregado") %>' runat="server" ID="NomeEncarregadoLabel" /></td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table runat="server" id="itemPlaceholderContainer" style="" border="0" class="table table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" style="width: 50px;"></th>
                                                        <th runat="server">NomeEncarregado</th>
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
                            </asp:ListView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSourceEnca" ConnectionString='<%$ ConnectionStrings:Conn %>' SelectCommand="FiltrarEncarregado" SelectCommandType="StoredProcedure" InsertCommandType="StoredProcedure" InsertCommand="AddParentescoEncarregado">
                                <InsertParameters>
                                    <asp:Parameter Name="Id_Usuario" Type="Int32"></asp:Parameter>
                                    <asp:QueryStringParameter QueryStringField="Id" Name="Id_Estudante" />
                                    <asp:Parameter Name="Id_Encarregado" Type="Int32"></asp:Parameter>
                                    <asp:ControlParameter Name="Id_Parentesco" Type="Int32" ControlID="ddlParentesco" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNomeEncarregado" PropertyName="Text" Name="NomeEncarregado" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                                <InsertParameters>
                                </InsertParameters>
                            </asp:SqlDataSource>


                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="modal-footer">
                    <a class="btn btn-danger" data-dismiss="modal">Cancelar</a>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalDef" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Vincular Deficiência</b></h4>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="input-group">
                                <span class="input-group-addon">Deficiência</span>
                                <asp:DropDownList ID="ddlDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceDef" DataTextField="Def" DataValueField="Id_Def" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" InsertCommand="AddDefEstudante" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [Tb_Def]">
                                    <InsertParameters>
                                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                        <asp:QueryStringParameter Name="Id_Estudante" QueryStringField="Id" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlClasifDef" Name="Id_ClasifDef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlNatuDef" Name="Id_NatuDef" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlEntiAval" Name="Id_EntiAval" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Classificação</span>
                                <asp:DropDownList ID="ddlClasifDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceClasifDef" DataTextField="ClasifDef" DataValueField="Id_ClasifDef" ValidationGroup="Def">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceClasifDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT [Id_ClasifDef], [ClasifDef] FROM [Tb_ClasifDef] WHERE ([Id_Def] = @Id_Def)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlDef" Name="Id_Def" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Natureza</span>

                                <asp:DropDownList ID="ddlNatuDef" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceNatuDef" DataTextField="NatuDef" DataValueField="Id_NatuDef" ValidationGroup="Def">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceNatuDef" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_NatuDef]"></asp:SqlDataSource>
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon">Entidade Avaliadora</span>

                                <asp:DropDownList ID="ddlEntiAval" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceEntiAval" DataTextField="EnviAval" DataValueField="Id_EntiAval">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEntiAval" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_EntiAval]"></asp:SqlDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnVincularDef" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnVincularDef_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalEscola" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Vincular Escola</b></h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="inner-addon right-addon">
                                <i class="glyphicon"></i>
                                <asp:TextBox ID="txtNomeEscola" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Nome da Escola" MaxLength="50" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <br />
                            <asp:GridView ID="gvEscola" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_Escola" DataSourceID="SqlDataSourceEscola" GridLines="Vertical" Width="100%" AllowPaging="True" PageSize="5">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Selecionar" CssClass="btn btn-primary" CommandArgument='<%# Bind("Id_Escola") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id_Escola" HeaderText="Id_Escola" InsertVisible="False" ReadOnly="True" SortExpression="Id_Escola" Visible="False" />
                                    <asp:BoundField DataField="NomeEscola" HeaderText="NomeEscola" SortExpression="NomeEscola" />
                                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                                    <asp:BoundField DataField="Municipio" HeaderText="Municipio" SortExpression="Municipio" />
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
                            <asp:SqlDataSource ID="SqlDataSourceEscola" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="FiltrarEscola" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtNomeEscola" Name="Nome" PropertyName="Text" Type="String" />
                                    <asp:Parameter DefaultValue="false" Name="FiltrarProvincia" Type="Boolean" />
                                    <asp:Parameter DefaultValue="0" Name="Id_Provincia" Type="Int32" />
                                    <asp:Parameter DefaultValue="false" Name="FiltrarMunicipio" Type="Boolean" />
                                    <asp:Parameter DefaultValue="0" Name="Id_Municipio" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <hr />
                            <asp:GridView ID="gvSalas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id_Sala" DataSourceID="SqlDataSourceSalas" GridLines="Vertical" Width="100%" OnRowCommand="gvSalas_RowCommand">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Vincular" Text="Vincular" CssClass="btn btn-primary" CommandArgument='<%# Bind("Id_Sala") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id_Sala" HeaderText="Id_Sala" InsertVisible="False" ReadOnly="True" SortExpression="Id_Sala" Visible="False" />
                                    <asp:BoundField DataField="NomeSala" HeaderText="Nome da Sala" SortExpression="NomeSala" />
                                    <asp:BoundField DataField="TipoSala" HeaderText="Tipo de Sala" SortExpression="TipoSala" />
                                    <asp:BoundField DataField="ClasseSala" HeaderText="Classe" SortExpression="ClasseSala" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Tb_Sala.Id_Sala, Tb_Sala.NomeSala, Tb_TipoSala.TipoSala, Tb_ClasseSala.ClasseSala FROM Tb_ClasseSala INNER JOIN Tb_Sala ON Tb_ClasseSala.Id_ClasseSala = Tb_Sala.Id_ClasseSala INNER JOIN Tb_TipoSala ON Tb_Sala.Id_TipoSala = Tb_TipoSala.Id_TipoSala WHERE (Tb_Sala.Id_Escola = @Id_Escola)" InsertCommand="AddVincEstudanteSala" InsertCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                                    <asp:QueryStringParameter Name="Id_Estudante" QueryStringField="Id" Type="Int32" />
                                    <asp:Parameter Name="Id_Sala" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvEscola" Name="Id_Escola" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
