using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App.BAL.Master;
using System.Configuration;
using System.Data;
using System.Globalization;
using App.BAL.Utility;

namespace ProjectOne.forum
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
     
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
               

                using (BADtlsForum oBME = new BADtlsForum())
                {
                    dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 102, "", ref errMsg, "2020", 1);
                    
                }
              

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {
                    DateTime date1 = Convert.ToDateTime(dt.Rows[0]["FORUM_DATE"]);
                    vString = "<div class='row'><div class='col-lg-12 text-center'><h2><span class='big'>Forum</span></h2></div>";
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                        vString += "<div class='col-sm-12 col-md-6 col-lg-6'><article><div class='entry-thumbnail bottommargin_40'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["FORUM"].ToString() + dt.Rows[i]["FORUM_IMG"]) + "' alt='Allykat' title='Allykat'></div>";
                        vString += "<header class='entry-header'><div class='entry-meta item-meta'><span class='author greylinks'>By<a>Admin</a></span><span class='date'>";
                        vString += "<time datetime='2016-01-10T15:05:23+00:00' class='entry-date'>" + date1.ToLongDateString() + "</time></span></div><h1 class='entry-title'>";
                        vString += "<a href='" + ResolveClientUrl("~/forum-details/") + Encrypt.EncryptASCII(dt.Rows[i]["DTLS_FORUM_KEY"].ToString()) + "/" + dt.Rows[i]["FORUM_HEADING"].ToString().Replace(' ', '-') + "' rel='bookmark'>" + dt.Rows[i]["FORUM_HEADING"] + "</a></h1></header>";
                        vString += "<div class='entry-content'><p class='big-first-letter'>" + dt.Rows[i]["FORUM_DESC"].ToString() + "</p></div></article></div>";
                       
                    }
                    vString += "</div>";

                    forum_desc.InnerHtml = vString;
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}