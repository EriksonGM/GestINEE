using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Cadastros
{
    public partial class CadastrarFuncionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddFuncionario_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceFuncionario.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceFuncionario.InsertParameters["NomeFuncionario"].DefaultValue = Mayuscula(txtNomeFuncionario.Text);
            SqlDataSourceFuncionario.Insert();

        }

        public static string Mayuscula(string strWord)
        {
            try
            {
                string[] arrWords = strWord.Split(' ');
                string strTemp2 = string.Empty;

                if (arrWords.Length > 1) //Existe mas de una palabra, Ej ANA MARIA
                {
                    foreach (string strTemp in arrWords)
                    {
                        strTemp2 += strTemp.Substring(0, 1).ToUpper() + strTemp.Substring(1).ToLower() + " ";
                    }
                }
                else
                    strTemp2 = arrWords[0].Substring(0, 1).ToUpper() + arrWords[0].Substring(1).ToLower() + " ";

                return strTemp2.Substring(0, strTemp2.Length - 1);
            }
            catch (Exception ex)
            {
                string strError = ex.Message;
                return strWord;
            }

        }

        protected void SqlDataSourceFuncionario_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            
        }

        protected void SqlDataSourceFuncionario_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
            Response.Redirect("~/Cadastros/CompletarFuncionario.aspx?Id=" + e.Command.Parameters["@Id_Funcionario"].Value.ToString());
        }
    }
}