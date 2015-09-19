using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class CompletarFuncionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var returnUrl = Request.QueryString["Id"];

            if (string.IsNullOrEmpty(returnUrl))
            {
                GestINEE.Reg.Registar(WebMatrix.WebData.WebSecurity.CurrentUserId.ToString(), "ALERTA, TENTATIVA DE ATAQUE AO SISTEMA.");
                Response.Redirect("~/Inicio.aspx");
                WebMatrix.WebData.WebSecurity.Logout();
            }

            
        }

        #region Pic        
        protected void UpdatePic_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalFoto", "$('#myModalFoto').modal();", true);
            //upModalFoto.Update();
        }

        public string SavePic()
        {
            if (fuPic.HasFile)
            {
                // Se verifica que la extensión sea de un formato válido
                string ext = fuPic.PostedFile.FileName;
                ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                string[] formatos =
                    new string[] { "jpg", "jpeg", "png" };
                if (Array.IndexOf(formatos, ext) < 0)
                {
                    Response.Write("<script> alert('Formato de imagen inválido.') </script>");
                    // Response.Write("<script>window.alert('"+GuardarArchivo(fuPic.PostedFile) +"');</script>");
                    return "";
                }
                else
                    return GuardarPic(fuPic.PostedFile,ext);
            }
            else
            {
                return "anomimo.jpg";
            }

        }
        private string GuardarPic(HttpPostedFile file,string ext)
        {
            // Se carga la ruta física de la carpeta temp del sitio
            string ruta = Server.MapPath("~/Deposit/Pic");

            string Nome = "ArquivoGestINEE" + TimeToName() + "." + ext;
            // Si el directorio no existe, crearlo
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);

            string archivo = String.Format("{0}\\{1}", ruta, Nome);

            file.SaveAs(archivo);

            return "/Deposit/Pic/"+ Nome;

        }
        private string TimeToName()
        {
            DateTime dt = DateTime.Now;

            string Nome = dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() + dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString() + dt.Millisecond.ToString();

            return Nome;
        }
        protected void btnUpdatePic_Click(object sender, EventArgs e)
        {
            SqlDataSourceUpdateFoto.UpdateParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceUpdateFoto.UpdateParameters["PathPic"].DefaultValue = SavePic();
            if (SqlDataSourceUpdateFoto.UpdateParameters["PathPic"].DefaultValue != "")
            {
                SqlDataSourceUpdateFoto.Update();
            }

            Response.Redirect(Request.RawUrl);

        }

        #endregion
        protected void fvInfoPessoal_DataBound(object sender, EventArgs e)
        {
            if (((Image)fvInfoPessoal.FindControl("Image1")).ImageUrl != "\\Deposit\\Pic\\anonimo.jpg")
            {
              //  UpdatePic.Visible = false;
            }
        }

        #region Documento

        protected void VincularDoc_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalFoto", "$('#myModalFoto').modal();", true);
        }

        public string SaveDoc()
        {
            if (fuDoc.HasFile)
            {
                // Se verifica que la extensión sea de un formato válido
                string ext = fuDoc.PostedFile.FileName;
                ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                string[] formatos =
                    new string[] { "jpg", "jpeg", "png", "pdf" };
                if (Array.IndexOf(formatos, ext) < 0)
                {
                    Response.Write("<script> alert('Formato de imagen inválido.') </script>");
                    // Response.Write("<script>window.alert('"+GuardarArchivo(fuPic.PostedFile) +"');</script>");
                    return "";
                }
                else
                    return GuardarDoc(fuDoc.PostedFile,ext);
            }
            else
            {
                return "";
            }

        }
        private string GuardarDoc(HttpPostedFile file, string ext)
        {
            // Se carga la ruta física de la carpeta temp del sitio
            string ruta = Server.MapPath("~/Deposit/Doc");

            string Nome = "ArquivoGestINEE"+TimeToName()+"." + ext;
            // Si el directorio no existe, crearlo
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);

            string archivo = String.Format("{0}\\{1}", ruta, Nome);

            file.SaveAs(archivo);

            return Nome;

        }
        protected void btnSaveDoc_Click(object sender, EventArgs e)
        {
            Page.Validate("Doc");
            if (Page.IsValid)
            {
                SqlDataSourceTipoDoc.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTipoDoc.InsertParameters["PathDoc"].DefaultValue = SaveDoc();
                SqlDataSourceTipoDoc.Insert();
                Response.Redirect(Request.RawUrl); 
            }
        }
        #endregion

        protected void btnVincularDef_Click(object sender, EventArgs e)
        {
            SqlDataSourceDef.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceDef.Insert();
            Response.Redirect(Request.RawUrl);
        }

        protected void SqlDataSourceInfoPessoal_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if(e.AffectedRows == 0)
            {
                GestINEE.Reg.Registar(WebMatrix.WebData.WebSecurity.CurrentUserId.ToString(), "ALERTA, TENTATIVA DE ATAQUE AO SISTEMA [IDENTIFICADOR DE FUNCIONARIO INVALIDO].");
                WebMatrix.WebData.WebSecurity.Logout();
                Response.Redirect("~/Inicio.aspx");
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlDataSourceInfoPessoal.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();          
            SqlDataSourceInfoPessoal.Insert();
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalFim", "$('#myModalFim').modal();", true);
            Response.Redirect("~/Cadastros/PrintFuncionario.aspx?Id="+Request.QueryString["Id"].ToString());
        }

        protected void SqlDataSourceInfoPessoal_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalFim", "$('#myModalFim').modal();", true);
        }

        protected void btnGuardarNiv_Click(object sender, EventArgs e)
        {
            SqlDataSourceNivelAcademico.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceNivelAcademico.Insert();
            Response.Redirect(Request.RawUrl);
        }

        protected void gvInstituicao_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Vincular")
            {
                SqlDataSourceInstituicao.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceInstituicao.InsertParameters["Id_Instituicao"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceInstituicao.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void gvEscola_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Vincular")
            {
                SqlDataSourceEscola.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceEscola.InsertParameters["Id_Escola"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceEscola.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
        protected void ddlTipoLaboral_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlGrupoLaboral.DataBind();
            ddlCatLaboral.DataBind();
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
            string Path = Server.MapPath("/Deposit/Pic/" + "ArquivoINEE_Funcionario_" + Request.QueryString["Id"].ToString() + ".jpg");


            string M = base64.Remove(0, 23);

            //string M = base64.Remove(0, 22);

            using (MemoryStream ms = new MemoryStream(Convert.FromBase64String(M)))
            {
                using (System.Drawing.Bitmap bm2 = new System.Drawing.Bitmap(ms))
                {
                    bm2.Save(Path, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }

            return "/Deposit/Pic/" + "ArquivoINEE_Funcionario_" + Request.QueryString["Id"].ToString() + ".jpg";

            //Response.Redirect(Request.RawUrl);
        }
    }
}