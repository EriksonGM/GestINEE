using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Admin
{
    public partial class GestaoDeficiencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
        }

        protected void btnAddDef_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNewDef.Text != "")
                {
                    SqlDataSourceDef.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                    SqlDataSourceDef.Insert();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                    txtNewDef.Text = ""; 
                }

            }
            catch (Exception)
            {
                
                //throw;
            }
        }

        protected void fvDef_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if(e.CommandName == "Guardar")
            {
                SqlDataSourceDef.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceDef.UpdateParameters["Def"].DefaultValue = ((TextBox)fvDef.FindControl("txtDef")).Text;
                SqlDataSourceDef.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                gvDef.DataBind();
                gvDef.SelectedIndex = -1;
                gvClasifDef.DataBind();
            }
        }

        protected void btnAddClasifDef_Click(object sender, EventArgs e)
        {
            if (txtClasifDef.Text != "")
            {
                SqlDataSourceClasifDef.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceClasifDef.Insert();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                txtClasifDef.Text = ""; 
            }
        }

        protected void fvClasifDef_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if(e.CommandName == "Guardar")
            {
                SqlDataSourceClasifDef.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceClasifDef.UpdateParameters["Id_Def"].DefaultValue = ((DropDownList)fvClasifDef.FindControl("ddlDef")).SelectedValue.ToString();
                SqlDataSourceClasifDef.UpdateParameters["ClasifDef"].DefaultValue = ((TextBox)fvClasifDef.FindControl("txtClasifDef")).Text;
                SqlDataSourceClasifDef.Update();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
                gvClasifDef.DataBind();
                gvClasifDef.SelectedIndex = -1;
            }
        }
    }
}