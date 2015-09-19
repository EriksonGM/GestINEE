using DotNet.Highcharts.Enums;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Patrimonio
{
    public partial class Escola : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // Graficos();
        }

        protected void Graficos()
        {
            DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart")

            .InitChart(new Chart { Type = ChartTypes.Heatmap})

            .SetXAxis(new XAxis
            {
                Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
            })
            .SetSeries(new Series
            {
                Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 })
            });

            //ltrChart.Text = chart.ToHtmlString();
        }
        protected void btnAddSala_Click(object sender, EventArgs e)
        {
            SqlDataSourceClasseSala.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceClasseSala.Insert();
            txtNomeSala.Text = "";
            lvSalas.DataBind();
            //Response.Redirect(Request.RawUrl);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalOk", "$('#myModalOk').modal();", true);
            //upSalas.Update();
        }

        protected void lvSalas_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Info")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myEstudaneSala", "$('#myEstudanteSala').modal();", true);
                SqlDataSourceEstudantesSala.SelectParameters["Id_Sala"].DefaultValue = e.CommandArgument.ToString();
                //lvEstudantesSala.DataBind();
                upModalEstudanteSala.Update();

            }
        }
    }
}