using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Formacoes
{
    public partial class Participantes : System.Web.UI.Page
    {
        //static string Text;

        protected void Page_Load(object sender, EventArgs e)
        {
            Texto();
        }

        public string Texto()
        {
            var Id = Request.QueryString["Id"];

            if (!string.IsNullOrEmpty(Id))
            {
                try
                {

                    using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
                    {
                        SqlCommand cmdT = new SqlCommand("Select QuantParticipantes from Tb_Formacao where Id_Formacao =" + Id.ToString(), SQLconn);
                        cmdT.CommandType = CommandType.Text;

                        SqlCommand cmdC = new SqlCommand("Select Count(Id_Convidado) from Tb_ConvidadoFormacao where Id_Formacao =" + Id.ToString(), SQLconn);
                        cmdC.CommandType = CommandType.Text;

                        SQLconn.Open();
                        int T = (int)cmdT.ExecuteScalar();
                        int C = (int)cmdC.ExecuteScalar();
                        SQLconn.Close();
                        SQLconn.Dispose();

                        if ((C) >= (T))
                        {
                            lvParticipantes.Visible = false;
                            Msg.Visible = true;
                            txtNomeFuncionario.Enabled = false;

                        }
                        else
                        {
                            lvParticipantes.Visible = true;
                            Msg.Visible = false;
                            txtNomeFuncionario.Enabled = true;
                        }

                        return C.ToString() + "/" + T.ToString();
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                Response.Redirect("/Login.aspx");
                return "";
            }
        }

        
        protected void lvParticipantes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                SqlDataSourceConvidados.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceConvidados.InsertParameters["Id_Funcionario"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceConvidados.Insert();
                lvConvidados.DataBind();
                lvParticipantes.DataBind();
                Texto();
            }
        }

        protected void lvConvidados_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName =="Del")
            {
                SqlDataSourceConvidados.DeleteParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceConvidados.DeleteParameters["Id_Convidado"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSourceConvidados.Delete();
                lvConvidados.DataBind();
                lvParticipantes.DataBind();
                Texto();
            }
        }
    }
}