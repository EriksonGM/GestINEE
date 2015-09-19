using System;
using System.Web.UI;
using WebMatrix.WebData;

namespace GestINEE
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //  lblModalTitle.Text = "Validation Errors List for HP7 Citation";
            // lblModalBody.Text = "This is modal body";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            // upModal.Update();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (WebSecurity.IsAuthenticated)
            {
                if (WebSecurity.Login(txtUsuario.Text, txtPass.Text, false))
                {
                    Usuario.Iniciar(WebSecurity.GetUserId(txtUsuario.Text));

                    Reg.Registar(WebSecurity.GetUserId(txtUsuario.Text).ToString(), "Tentativa de Inicio de Sessão a um nivel não autorizado.");

                    var returnUrl = Request.QueryString["ReturnUrl"];

                    if (string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        Response.Redirect(returnUrl);

                    }
                }
                else
                {
                    lblMsg.Text = "Nome de Usuario o Senha invalida, tente novamente.";
                    upModal.Update();
                }
            }
            else
            {
                if (WebSecurity.Login(txtUsuario.Text, txtPass.Text, false))
                {
                    Usuario.Iniciar(WebSecurity.GetUserId(txtUsuario.Text));

                    Usuario.RegLogIn();

                    var returnUrl = Request.QueryString["ReturnUrl"];

                    if (string.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        Response.Redirect(returnUrl);

                    }
                }
                else
                {
                    lblMsg.Text = "Nome de Usuario o Senha invalida, tente novamente.";
                    upModal.Update();
                }
            }
        }
    }
}