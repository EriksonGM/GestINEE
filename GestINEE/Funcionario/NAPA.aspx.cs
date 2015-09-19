using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE.Funcionario
{
    public partial class NAPA : System.Web.UI.Page
    {
        static DataTable dtT = new DataTable();
        static DataTable dtM = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Trabalhos e Missões
        //protected void btnAddT_Click(object sender, EventArgs e)
        //{
        //    if (dtT.Columns.Count == 0)
        //    {
        //        dtT.Columns.Add(new DataColumn("Id", typeof(int)));
        //        dtT.Columns.Add(new DataColumn("T", typeof(string)));

        //    }
        //    dtT.Rows.Add(dtT.Rows.Count, txtT.Text);
        //    lvT.DataSource = dtT;
        //    lvT.DataBind();
        //    txtT.Text = "";
        //}

        //protected void lvT_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Del")
        //    {
        //        //DataRowCollection rcol = dtT.Rows;

        //        foreach (DataRow dr in dtT.Rows)
        //        {
        //            if (dr["Id"].ToString() == e.CommandArgument.ToString())
        //            {
        //                dtT.Rows.Remove(dr);
        //                break;
        //            }
        //        }


        //        //dtT.Rows.Remove(dtT.Rows[dtT.Select(]);
        //        lvT.DataSource = dtT;
        //        lvT.DataBind();
        //    }
        //}

        //protected void btnAddM_Click(object sender, EventArgs e)
        //{
        //    if (dtM.Columns.Count == 0)
        //    {
        //        dtM.Columns.Add(new DataColumn("Id", typeof(int)));
        //        dtM.Columns.Add(new DataColumn("M", typeof(string)));

        //    }
        //    dtM.Rows.Add(dtM.Rows.Count, txtM.Text);
        //    lvM.DataSource = dtM;
        //    lvM.DataBind();
        //    txtM.Text = "";
        //}

        //protected void lvM_ItemCommand(object sender, ListViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Del")
        //    {
        //        //DataRowCollection rcol = dtT.Rows;

        //        foreach (DataRow dr in dtM.Rows)
        //        {
        //            if (dr["Id"].ToString() == e.CommandArgument.ToString())
        //            {
        //                dtM.Rows.Remove(dr);
        //                break;
        //            }
        //        }


        //        //dtT.Rows.Remove(dtT.Rows[dtT.Select(]);
        //        lvM.DataSource = dtM;
        //        lvM.DataBind();
        //    }
        //} 
        #endregion


    }
}