using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class PrintFuncionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlEntidade_SelectedIndexChanged(object sender, EventArgs e)
        {
            fvCartao.FindControl("ddlFuncao").DataBind();
            fvCartao.FindControl("ddlNome").DataBind();
            //((Label)fvCartao.FindControl("Label1")).Text = ((DropDownList)fvCartao.FindControl("ddlNome")).Text;
            //((Label)fvCartao.FindControl("Label2")).Text = ((DropDownList)fvCartao.FindControl("ddlFuncao")).Text;
        }

        protected void fvCartao_DataBound(object sender, EventArgs e)
        {
            //((Label)fvCartao.FindControl("Label1")).Text = ((DropDownList)fvCartao.FindControl("ddlNome")).Text;
            //((Label)fvCartao.FindControl("Label2")).Text = ((DropDownList)fvCartao.FindControl("ddlFuncao")).Text;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            ((Label)fvCartao.FindControl("Label1")).Text = ((DropDownList)fvCartao.FindControl("ddlNome")).SelectedItem.Text;
            ((Label)fvCartao.FindControl("Label2")).Text = ((DropDownList)fvCartao.FindControl("ddlFuncao")).SelectedItem.Text;
        }

        protected void SqlDataSourceCartao_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows == 0)
            {
                GestINEE.Reg.Registar(WebMatrix.WebData.WebSecurity.CurrentUserId.ToString(), "ALERTA, TENTATIVA DE ATAQUE AO SISTEMA [IDENTIFICADOR DE FUNCIONARIO INVALIDO].");
                WebMatrix.WebData.WebSecurity.Logout();
                Response.Redirect("~/Inicio.aspx");
            }
        }
    }
}