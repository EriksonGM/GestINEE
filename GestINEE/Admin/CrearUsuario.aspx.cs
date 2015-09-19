using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace GestINEE.Admin
{
    public partial class CrearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    WebSecurity.CreateUserAndAccount(txtEmail.Text, txtPass1.Text, new
                    {
                        Nome = txtNome.Text,
                        Telefone = txtTelf.Text,
                        // DataNascimento = Convert.ToDateTime(txtDataNascimento.Text)
                    });

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                    Response.Redirect("~/Admin/GerirUsuarios.aspx");
                }
                catch (InvalidOperationException)
                {
                    
                }
            }
        }
    }
}