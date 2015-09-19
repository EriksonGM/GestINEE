using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class ListaEquipamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // gvEquipamentos.DataBind();
        }

        protected void lvEquipamentos_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

            //if( ((Label)(e.Item.FindControl("EstadoEquipamentoLabel"))).Text == "")
            //{
            //    e.Item.Controls[""].
            //}

            //if (e.Row.Cells[2].Text == "Unconfirmed")
            //{
            //    e.Row.CssClass = "CautionRow";
            //}
        }

        public string Style(string Estado)
        {
            switch (Estado)
            {
                case "Funcional":
                    
                        return "success";

                case "Avariado":

                        return "warning";

                case "Fora de Uso":
                    
                        return "danger";

                case "Em Reparação":

                        return "info";


                default:

                        return "";

            }
        }

    }
}