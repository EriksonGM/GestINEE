using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestINEE
{
    public partial class Teste2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            SaveImage(hfImage.Value);

        }

        public void SaveImage(string base64)
        {
            string Path = Server.MapPath("/Deposit/Pic/"+"ArquivoINEE_"+Request.QueryString["Id"].ToString()+".jpg");


            string M = base64.Remove(0, 23);

            //string M = base64.Remove(0, 22);

            using (MemoryStream ms = new MemoryStream(Convert.FromBase64String(M)))
            {
                using (Bitmap bm2 = new Bitmap(ms))
                {
                    bm2.Save(Path,System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
        }

    }
}