using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class CadastrarEncarregado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddEstudante_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceEncarregado.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEncarregado.Insert();
        }

        protected void SqlDataSourceEncarregado_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("~/Cadastros/CompletarEncarregado.aspx?Id=" + e.Command.Parameters["@Id_Encarregado"].Value.ToString());
        }
    }
}