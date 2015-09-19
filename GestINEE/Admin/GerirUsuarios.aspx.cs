using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Admin
{
    public partial class GerirUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvUsuarios.SelectedDataKey != null)
            {

                Panel.Visible = true;

                //string User = ((TextBox)gvUsuarios.FindControl("txtEmail")).Text;


                chbCadastro.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Cadastro");
                chbEditor.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Editor");
                chbPatrimonio.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Patrimonio");
                chbFuncionario.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Funcionario");
                chbFormacoes.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Formacoes");
                chbEstatisticas.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Estatisticas");
                chbAdmin.Checked = Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Admin");
            }
            else
            {
                Panel.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (chbCadastro.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Cadastro"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Cadastro");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Cadastro"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Cadastro");
            }

            if (chbEditor.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Editor"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Editor");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Editor"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Editor");
            }
            if (chbPatrimonio.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Patrimonio"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Patrimonio");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Patrimonio"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Patrimonio");
            }

            if (chbFormacoes.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Formacoes"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Formacoes");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Formacoes"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Formacoes");
            }

            if (chbFuncionario.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Funcionario"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Funcionario");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Funcionario"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Funcionario");
            }

            if (chbEstatisticas.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Estatistica"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Estatistica");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Estatistica"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Estatistica");
            }

            if (chbAdmin.Checked)
            {
                if (!Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Admin"))
                    Roles.AddUserToRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Admin");
            }
            else
            {
                if (Roles.IsUserInRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Admin"))
                    Roles.RemoveUserFromRole(gvUsuarios.SelectedDataKey.Value.ToString(), "Admin");
            }

            lblModalBody.Text = "Permições guardadas com exito";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }


    }
}