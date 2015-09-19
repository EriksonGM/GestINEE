using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Formacoes
{
    public partial class CrearFormacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            SqlDataSourceTipoFormacao.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceTipoFormacao.Insert();
        }

        protected void SqlDataSourceTipoFormacao_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("/Formacoes/Formacao.aspx?Id="+e.Command.Parameters["@Id_Formacao"].Value);
        }
    }
}