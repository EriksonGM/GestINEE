using System;
using System.Web.Security;
using System.Web.UI;

namespace GestINEE
{
    public partial class LayOut : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin.Visible = Roles.IsUserInRole("Admin");
            Estatisticas.Visible = Roles.IsUserInRole("Estatistica");
            Formacoes.Visible = Roles.IsUserInRole("Formacoes");
            Patrimonio.Visible = Roles.IsUserInRole("Patrimonio");
            Funcionario.Visible = Roles.IsUserInRole("Funcionario");
            Editor.Visible = Roles.IsUserInRole("Editor");
            Cadastros.Visible = Roles.IsUserInRole("Cadastro");
            Usuario.Visible = WebMatrix.WebData.WebSecurity.IsAuthenticated;
            //if (!Page.IsPostBack & !Usuario.Activo & WebMatrix.WebData.WebSecurity.IsAuthenticated)
            //{
            //    Usuario.Iniciar(WebMatrix.WebData.WebSecurity.CurrentUserId);
            //}
        }

        public void Mostrar()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
        }
    }

}
