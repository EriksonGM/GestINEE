using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class CompletarEncarregado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvEstudante_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceEstudante.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceEstudante.InsertParameters["Id_Estudante"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceEstudante.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}