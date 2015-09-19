using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.User
{
    public partial class MudarSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            try
            {
                if (WebMatrix.WebData.WebSecurity.ChangePassword(WebMatrix.WebData.WebSecurity.CurrentUserName, txtOldPass.Text, txtNewPass1.Text) == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                }
                else
                {
                    Label1.Text = "Tente novamente.";
                    Label1.Visible = true;
                }

            }
            catch (Exception)
            {
                Label1.Text = "Aconteceu algum problema, tente novamente.";
                Label1.Visible = true;

            }
        }
    }
}