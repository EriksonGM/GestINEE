using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebMatrix.WebData;

namespace GestINEE
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            WebSecurity.InitializeDatabaseConnection("Conn", "Tb_Usuario", "Id_Usuario", "Email", true);

            if (!Roles.RoleExists("Admin"))
            {
                Roles.CreateRole("Admin");
            }
            if (!Roles.RoleExists("Patrimonio"))
            {
                Roles.CreateRole("Patrimonio");
            }
            if (!Roles.RoleExists("Cadastro"))
            {
                Roles.CreateRole("Cadastro");
            }
            if (!Roles.RoleExists("Estatistica"))
            {
                Roles.CreateRole("Estatistica");
            }
            if (!Roles.RoleExists("Formacoes"))
            {
                Roles.CreateRole("Formacoes");
            }
            if (!Roles.RoleExists("Editor"))
            {
                Roles.CreateRole("Editor");
            }
            if (!Roles.RoleExists("Funcionario"))
            {
                Roles.CreateRole("Funcionario");
            }

            if (!WebSecurity.UserExists("admin@inee.gov.ao"))
            {
                WebSecurity.CreateUserAndAccount("admin@inee.gov.ao", "admin", new
                {
                    Nome = "Administrador de Sistema",
                    Telefone = "000000000"
                });

                Roles.AddUserToRole("admin@inee.gov.ao", "Admin");
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
           GestINEE.Reg.Registar(WebSecurity.CurrentUserId.ToString(), "DETECTADO ERRO NO SISTEMA.");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}