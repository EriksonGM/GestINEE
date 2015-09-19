using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class CompletarEstudante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string P = SaveImage(hfImage.Value);
            SqlDataSourceUpdateFoto.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceUpdateFoto.UpdateParameters["PathPic"].DefaultValue = P;
            if (SqlDataSourceUpdateFoto.UpdateParameters["PathPic"].DefaultValue != "")
            {
                SqlDataSourceUpdateFoto.Update();
            }

            Response.Redirect(Request.RawUrl);
        }

        public string SaveImage(string base64)
        {
            string Path = Server.MapPath("/Deposit/Pic/" + "ArquivoINEE_Estudante_" + Request.QueryString["Id"].ToString() + ".jpg");

            string M = base64.Remove(0, 23);

            //string M = base64.Remove(0, 22);

            using (MemoryStream ms = new MemoryStream(Convert.FromBase64String(M)))
            {
                using (System.Drawing.Bitmap bm2 = new System.Drawing.Bitmap(ms))
                {
                    bm2.Save(Path, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }

            return "/Deposit/Pic/" + "ArquivoINEE_Estudante_" + Request.QueryString["Id"].ToString() + ".jpg";

            //Response.Redirect(Request.RawUrl);
        }

        protected void btnVincularDef_Click(object sender, EventArgs e)
        {
            SqlDataSourceDef.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceDef.Insert();
            Response.Redirect(Request.RawUrl);
        }

        protected void gvSalas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceSalas.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceSalas.InsertParameters["Id_Sala"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceSalas.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceEstudante.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEstudante.Update();
            Response.Redirect("/Cadastros/CadastrarEstudante.aspx");
        }

        protected void lvEnca_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlDataSourceEnca.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceEnca.InsertParameters["Id_Encarregado"].DefaultValue = e.CommandArgument.ToString();
            SqlDataSourceEnca.Insert();
            Response.Redirect(Request.RawUrl);

        }
    }
}