using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class Instituicao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditarInfo_Click(object sender, EventArgs e)
        {
          //  fvInstituicao.ChangeMode(FormViewMode.Edit);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Page.Validate("Info");
            if(Page.IsValid)
            {
                SqlDataSourceInfo.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceInfo.UpdateParameters["NomeInstituicao"].DefaultValue = ((TextBox)fvUpdateInst.FindControl("txtNomeInstituicao")).Text;
                SqlDataSourceInfo.UpdateParameters["Endereco"].DefaultValue = ((TextBox)fvUpdateInst.FindControl("txtEndereco")).Text;
                SqlDataSourceInfo.UpdateParameters["Email"].DefaultValue = ((TextBox)fvUpdateInst.FindControl("txtEmail")).Text;
                SqlDataSourceInfo.UpdateParameters["TelfPrincipal"].DefaultValue = ((TextBox)fvUpdateInst.FindControl("txtTelfPrim")).Text;
                SqlDataSourceInfo.UpdateParameters["TelfSecundario"].DefaultValue = ((TextBox)fvUpdateInst.FindControl("txtTelfSecu")).Text;
                SqlDataSourceInfo.Update();
                Response.Redirect(Request.RawUrl);
            }
        }

    }
}