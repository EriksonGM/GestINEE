using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class CadastrarEscola : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceEscola.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEscola.Insert();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalConfirm", "$('#myModalConfirm').modal();", true);
        }

        protected void SqlDataSourceEscola_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Command.Parameters["@Id_Escola"].Value.ToString() != "")
            {
                Response.Redirect("/Patrimonio/Escola.aspx?Id=" + e.Command.Parameters["@Id_Escola"].Value.ToString());
            }
        }
    }
}