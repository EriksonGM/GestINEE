using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class ListaInstituicoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void chbFiltrarProvincia_CheckedChanged(object sender, EventArgs e)
        {
            ddlProvincia.Enabled = chbFiltrarProvincia.Checked;
            chbFiltrarMunicipio.Checked = false;
            chbFiltrarMunicipio.Enabled = chbFiltrarProvincia.Checked;
            ddlMunicipio.Enabled = chbFiltrarProvincia.Checked;
        }
    }
}