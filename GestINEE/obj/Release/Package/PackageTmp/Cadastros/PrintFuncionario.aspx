<%@ Page Title="" Language="C#" MasterPageFile="~/LayOut.Master" AutoEventWireup="true" CodeBehind="PrintFuncionario.aspx.cs" Inherits="GestINEE.Cadastros.PrintFuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script src="/assets/js/html2canvas.js" type="text/javascript"></script>

    <style>
        #CartaoFuncionario {
            background-image: url('/assets/img/EmployeeCard.jpg');
            background-position: center;
            background-repeat: no-repeat;
            width: 944px;
            height: 590px;
        }

        .Contenido {
            float: left;
            width: 507px;
            /*border: 1px solid black;*/
            margin-top: 173px;
            margin-left: 68px;
            height: 334px;
        }

        #Foto {
            float: right;
            margin-right: 47px;
            margin-top: 80px;
        }
    </style>

    <script type="text/javascript">

        function Print() {
            var oldPage = document.body.innerHTML;

            window.html2canvas([document.getElementById('CartaoFuncionario')], {
                onrendered: function (canvas) {
                    var extra_canvas = document.createElement("canvas");
                    extra_canvas.setAttribute('width', 944);
                    extra_canvas.setAttribute('height', 590);
                    var ctx = extra_canvas.getContext('2d');
                    ctx.drawImage(canvas, 0, 0, canvas.width, canvas.height, 0, 0, 944, 590);
                    var dataURL = extra_canvas.toDataURL();
                    var img = $(document.createElement('img'));
                    img.attr('src', dataURL);
                    // insert the thumbnail at the top of the page

                    document.body.innerHTML = "<html><head><title></title></head><body></body>";

                    $('body').prepend(img);
                    //document.body.appendChild(img);

                    //Print Page
                    window.print();

                    //Restore orignal HTML
                    document.body.innerHTML = oldPage;

                    location.reload()
                }
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title" runat="server">
    Impressão de Cartão de Funcionario
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:FormView ID="fvCartao" runat="server" DataKeyNames="Id_Funcionario" DataSourceID="SqlDataSourceCartao" OnDataBound="fvCartao_DataBound">
                <ItemTemplate>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Cartão de Funcionario</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon">Entidade</span>
                                        <asp:DropDownList ID="ddlEntidade" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceEntidade" DataTextField="Entidade" DataValueField="Id_Entidade" OnSelectedIndexChanged="ddlEntidade_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceEntidade" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Entidade]"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">Nome</span>
                                        <asp:DropDownList ID="ddlNome" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceNome" DataTextField="NomeEntidade" DataValueField="Id_Entidade">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceNome" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="CardFiltrarNome" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlEntidade" Name="Id_Entidade" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon">Função</span>
                                        <asp:DropDownList ID="ddlFuncao" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceFuncao" DataTextField="CatLaboral" DataValueField="Id_CatLaboral">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSourceFuncao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="CardFiltrarFuncao" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlEntidade" Name="Id_Entidade" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlNome" Name="Id_Entidade2" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-primary form-control" OnClick="btnActualizar_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="CartaoFuncionario" class="hidden-xs">

                                <div class="Contenido">
                                    <b style="font-size: 20px; font-weight: 800">Nº de Agente:</b>
                                    <br />
                                    <asp:Label ID="Label4" runat="server" Font-Size="25px" Text='<%# Eval("NumAgente") %>'></asp:Label>
                                    <br />
                                    <b style="font-size: 20px; font-weight: 800;margin-right:150px;margin-top:20px">Nome:</b>
                                    <br />
                                    

                                    <asp:Label ID="NomeFuncionarioLabel" runat="server" Text='<%# Bind("NomeFuncionario") %>' Font-Size="35px" />
                                    <br />
                                    <b style="font-size: 20px; font-weight: 800">Area de Trabalho:</b><br />
                                    <asp:Label ID="Label1" runat="server" Font-Size="25px"></asp:Label><br />
                                    <br />
                                    <b style="font-size: 20px; font-weight: 800">Categoria ou Função: </b>
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Font-Size="25px"></asp:Label>
                                </div>


                                <asp:Image ID="Foto" runat="server" Height="317px" ImageUrl='<%# Eval("PathPic") %>' Width="270px" Style="margin-top: 69px; float: right; margin-right: 48px;" BorderColor="Black" BorderStyle="Solid" BorderWidth="2" />
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a id="Print" class="btn btn-primary" onclick="Print()">Imprimir</a>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SqlDataSourceCartao" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT Id_Funcionario, NomeFuncionario, PathPic, NumAgente FROM Tb_Funcionario WHERE (Id_Funcionario = @Id_Funcionario) AND (Completo = 1)" OnSelected="SqlDataSourceCartao_Selected">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id_Funcionario" QueryStringField="Id" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
