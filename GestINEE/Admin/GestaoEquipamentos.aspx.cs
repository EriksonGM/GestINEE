using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Admin
{
    public partial class GestaoEquipamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddTipo_Click(object sender, EventArgs e)
        {
            if(txtNewTipo.Text != "")
            {
                SqlDataSourceTipoEquipamento.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTipoEquipamento.Insert();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                txtNewTipo.Text = "";
                gvTipoEquipamento.SelectedIndex = -1;
            }
        }

        protected void fvEditTipoEquipamento_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if(e.CommandName == "Guardar")
            {
                SqlDataSourceTipoEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTipoEquipamento.UpdateParameters["TipoEquipamento"].DefaultValue = ((TextBox)fvEditTipoEquipamento.FindControl("txtEditTipo")).Text;
                SqlDataSourceTipoEquipamento.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                gvTipoEquipamento.SelectedIndex = -1;
            }
        }

        protected void btnAddMarca_Click(object sender, EventArgs e)
        {
            if(txtNewMarca.Text != "")
            {
                SqlDataSourceMarcaEquipamento.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceMarcaEquipamento.Insert();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                txtNewMarca.Text = "";
                gvMarcaEquipamento.SelectedIndex = -1;
            }
        }

        protected void fvEditMarcaEquipamento_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if(e.CommandName == "Guardar")
            {
                SqlDataSourceMarcaEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceMarcaEquipamento.UpdateParameters["MarcaEquipamento"].DefaultValue = ((TextBox)fvEditMarcaEquipamento.FindControl("txtEditMarca")).Text;
                SqlDataSourceMarcaEquipamento.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                gvMarcaEquipamento.SelectedIndex = -1;
            }
        }

        protected void btnAddModelo_Click(object sender, EventArgs e)
        {
            if(txtNewModelo.Text != "")
            {
                SqlDataSourceModeloEquipamento.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceModeloEquipamento.Insert();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                txtNewModelo.Text = "";
                gvModeloEquipamento.SelectedIndex = -1;
            }
        }

        protected void fvEditModeloEquipamento_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if(e.CommandName == "Guardar")
            {
                SqlDataSourceModeloEquipamento.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceModeloEquipamento.UpdateParameters["Id_TipoEquipamento"].DefaultValue = ((DropDownList)fvEditModeloEquipamento.FindControl("ddlEditTipo")).SelectedValue;
                SqlDataSourceModeloEquipamento.UpdateParameters["Id_MarcaEquipamento"].DefaultValue = ((DropDownList)fvEditModeloEquipamento.FindControl("ddlEditMarca")).SelectedValue;
                SqlDataSourceModeloEquipamento.UpdateParameters["ModeloEquipamento"].DefaultValue = ((TextBox)fvEditModeloEquipamento.FindControl("txtEditModelo")).Text;
                SqlDataSourceModeloEquipamento.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                gvModeloEquipamento.SelectedIndex = -1;
            }
        }
    }
}