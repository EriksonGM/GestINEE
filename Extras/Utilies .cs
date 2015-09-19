 
 ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
 upModal.Update();
 
  ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
  
  <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>"></asp:SqlDataSource>
  
    <div class="inner-addon right-addon">
         <i class="glyphicon">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta a Especialidade." ControlToValidate="txtEspecialidade" Font-Bold="True" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </i>
         <asp:TextBox ID="txtEspecialidade" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="Especialidade" MaxLength="50" ></asp:TextBox>
    </div>
  
  <asp:Button ID="PrintPasse" runat="server" Text="Imprimir Cartão" CssClass="btn btn-primary form-control btnspace" data-toggle="modal" data-target="#myModalPri" />
  
     <div class="input-group">
        <span class="input-group-addon">Genero</span>
            <asp:DropDownList ID="ddl" runat="server" CssClass="form-control" >
            </asp:DropDownList>
     </div>
							
							
		<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h3 class="modal-title" style="font-weight:bold"><span class="fa fa-info"></span>&nbsp GestINEE</h3>
                            </div>
                            <div class="modal-body">
                                <h4>Operação completada com exito.</h4>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Fechar</button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
			</div>
		</div>
		
		
		<div class="input-group">
			<span class="input-group-addon">Emitido
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Data de Nascimento Invalida." Text="*" ControlToValidate="txtDataInicio" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{4}/[1-12]{1,2}/[1-31]{1,2}$" ValidationGroup="Doc"></asp:RegularExpressionValidator>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta a Data de Emissão" ControlToValidate="txtDataInicio" Font-Bold="True" ForeColor="Red" ValidationGroup="Doc">*</asp:RequiredFieldValidator>
			</span>
			<asp:TextBox ID="txtDataInicio" runat="server" CssClass="form-control" AutoCompleteType="Disabled" placeholder="AAAA/MM/DD" MaxLength="10" ValidationGroup="Doc" TextMode="Date"></asp:TextBox>
		</div>
		
		
		    <div class="row">
        <div class="col-md-9">
            <div>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="input-group">
                            <span class="input-group-addon">Nome da Instituição</span>
                            <asp:TextBox ID="txtNomeEscola" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Especialidade</span>
                                    <asp:TextBox ID="txtEspecialidade" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Tipo de Ensino</span>
                                    <asp:TextBox ID="ddlTipoEnsino" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <br />

                        <div class="input-group">
                            <span class="input-group-addon">Endereço</span>
                            <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <br />

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">Provincia Nascimento</span>
                                            <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSourceProvincia" DataTextField="Provincia" DataValueField="Id_Provincia">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSourceProvincia" runat="server" ConnectionString="<%$ ConnectionStrings:Conn %>" SelectCommand="SELECT * FROM [Tb_Provincia]"></asp:SqlDataSource>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">Municipio Nascimento</span>
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
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <div class="input-group">
                            <span class="input-group-addon">Email</span>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Telefone Principal

                                    </span>
                                    <asp:TextBox ID="txtTelfPri" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group">
                                    <span class="input-group-addon">Telefone Secundario</span>
                                    <asp:TextBox ID="txtTelfSec" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer" style="text-align: right">
                        <asp:Button ID="btnConfirm" runat="server" Text="Guardar" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModalConfirm" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModalConfirm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-info-circle"></span>&nbsp GestINEE</h3>
                        </div>
                        <div class="modal-body">
                            <h4><i class="fa fa-warning"></i>&nbsp Deseja efectuar o cadastramento?</h4>
                        </div>
                        <div class="modal-footer">

                            <button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            <asp:Button ID="btnGuardar" runat="server" Text="Confirmar" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
 
 
 
 
 
 
 
 <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading"></div>
                <div class="panel-body"></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading"></div>
                <div class="panel-body"></div>
            </div>
        </div>
    </div>
    <hr />
	
	
	<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" style="font-weight: bold"><span class="fa fa-2x fa-info-circle"></span>&nbsp GestINEE</h3>
                </div>
                <div class="modal-body">
                    <h4><b>Vincular Escola</b></h4>
                    <br />
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>