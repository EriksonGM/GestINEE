using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Formacoes
{
    public partial class Formacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarTema_Click(object sender, EventArgs e)
        {
            SqlDataSourceTema.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceTema.Insert();

            txtHorasTema.Text = "1";
            txtTema.Text = "";

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
        }

        protected void lvTemas_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "Del")
            {
                SqlDataSourceTema.DeleteParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTema.DeleteParameters["Id_TemaFormacao"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceTema.Delete();
                lvTemas.DataBind();
            }
        }

        protected void btnAddFormador_Click(object sender, EventArgs e)
        {
            SqlDataSourceFormadores.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceFormadores.Insert();

            txtFormador.Text = "";

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);

            fvInfo.DataBind();

        }

        protected void lvFormadores_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                SqlDataSourceFormadores.DeleteParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceFormadores.DeleteParameters["Id_Formador"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceFormadores.Delete();
                lvFormadores.DataBind();
            }
        }
    }
}