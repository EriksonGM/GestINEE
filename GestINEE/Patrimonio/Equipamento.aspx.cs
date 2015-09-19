using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class Equipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var returnUrl = Request.QueryString["Id"];

            //if (string.IsNullOrEmpty(returnUrl))
            //{
            //    GestINEE.Reg.Registar(WebMatrix.WebData.WebSecurity.CurrentUserId.ToString(), "ALERTA, TENTATIVA DE ATAQUE AO SISTEMA.");
            //    Response.Redirect("~/Inicio.aspx");
            //    WebMatrix.WebData.WebSecurity.Logout();
            //}



        }

        protected void lkbFuncional_Click(object sender, EventArgs e)
        {
            SqlDataSourceEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEquipamento.UpdateParameters["Id_Estado"].DefaultValue = "1";
            SqlDataSourceEquipamento.Update();
            Response.Redirect(Request.RawUrl);
        }

        protected void lkbAvariado_Click(object sender, EventArgs e)
        {
            SqlDataSourceEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEquipamento.UpdateParameters["Id_Estado"].DefaultValue = "2";
            SqlDataSourceEquipamento.Update();
            Response.Redirect(Request.RawUrl);
        }

        protected void LkbEmReparacao_Click(object sender, EventArgs e)
        {
            SqlDataSourceEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEquipamento.UpdateParameters["Id_Estado"].DefaultValue = "4";
            SqlDataSourceEquipamento.Update();
            Response.Redirect(Request.RawUrl);
        }

        protected void lkbForaDeUso_Click(object sender, EventArgs e)
        {
            SqlDataSourceEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEquipamento.UpdateParameters["Id_Estado"].DefaultValue = "3";
            SqlDataSourceEquipamento.Update();
            Response.Redirect(Request.RawUrl);
        }

        protected void fvEquipamento_DataBound(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceEquipamento_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void lvEscola_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceEscola.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceEscola.InsertParameters["Id_Escola"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceEscola.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void SqlDataSourceOps_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows != 0)
            {
                Estudante.Visible = false;
                Funcionario.Visible = false;
                Escola.Visible = false;
                Instituicao.Visible = false;
                lbDesvincular.Visible = true;
            }
            else
            {
                lbDesvincular.Visible = false;
            }
        }



        protected void lvEstudante_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceEstudante.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceEstudante.InsertParameters["Id_Estudante"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceEstudante.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
        
        
        protected void lbDesvincular_Click(object sender, EventArgs e)
        {
            SqlDataSourceOps.DeleteParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceOps.Delete();
            Response.Redirect(Request.RawUrl);
        }

        protected void lvFuncionario_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceFuncionario.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceFuncionario.InsertParameters["Id_Funcionario"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceFuncionario.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}