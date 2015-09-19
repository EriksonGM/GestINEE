using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Funcionario
{
    public partial class ListaFuncionarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string EstadoPerfil(object Estado)
        {
            string Est = Estado.ToString();
            if (Est == "True")
            {
                return "Completo";
            }
            else
            {
                return "Incompleto";
            }
        }

        public Color ColorEstado(object Estado)
        {
            string Est = Estado.ToString();
            if (Est == "True")
            {
                return Color.Green;
            }
            else
            {
                return Color.Red;
            }
        }
    }
}