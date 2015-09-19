using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class CadastrarEquipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            SqlDataSourceModeloEquipamento.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceModeloEquipamento.Insert();
        }

        protected void SqlDataSourceModeloEquipamento_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if(e.Command.Parameters["@Id_Equipamento"].Value.ToString() != "")
            {
                Response.Redirect("/Patrimonio/Equipamento.aspx?Id=" + e.Command.Parameters["@Id_Equipamento"].Value.ToString());
            }
        }


    }
}