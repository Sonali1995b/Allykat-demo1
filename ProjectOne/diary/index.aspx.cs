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

namespace ProjectOne.diary
{
    public partial class index : System.Web.UI.Page
    {

        String errMsg = String.Empty, vString = String.Empty;
        Int32 count = 0, count1 = 0;
        DataTable dt = null;
        DataTable dt1 = null;
       
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
                
                using (BADtlsDiary oBME = new BADtlsDiary())
                {
                    dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 23, "", ref errMsg, "2020", 1);
                    
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(dt.Rows.Count>0)
            {
                vString= "<div class='row'>";
                for (int i=0;i<dt.Rows.Count;i++)
                {
                    vString += "<div class='col-sm-12 bottommargin_40'><div class='side-item event-item content-padding with_background'><div class='row'><div class='col-md-4'><div class='item-media'>";
                    vString += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["DIARY"].ToString() + dt.Rows[i]["DIARY_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'>";
                    vString += "<a class='abs-link' title='' href=''></a></div></div></div><div class='col-md-8'><div class='item-content'><h3 class='entry-title topmargin_0'>";
                    vString += "<a href='" + ResolveClientUrl("~/diary-details/") + Encrypt.EncryptASCII(dt.Rows[i]["DTLS_DIARY_KEY"].ToString()) + "/" + dt.Rows[i]["DIARY_HEADING"].ToString().Replace(' ', '-') + "'>" + dt.Rows[i]["DIARY_HEADING"] + "</a></h3>";
                    vString += "<p>" + dt.Rows[i]["SHORT_DESC"] + "</p><p class='item-meta grey'><i class='rt-icon2-calendar4 highlight'></i> " + dt.Rows[i]["DIARY_DATE"] + "<i class='rt-icon2-world highlight'></i> Conference Hall, LA</p></div></div></div></div></div>";
                }
                vString += "</div>";

                diary_desc.InnerHtml = vString;
                    
            }

            if (dt1 != null && dt1.Rows.Count > 0)
            {
                Page.Title = dt1.Rows[0]["PAGE_TITLE"].ToString();
                Page.MetaDescription = dt1.Rows[0]["META_DESCRIPTION"].ToString();
                Page.MetaKeywords = dt1.Rows[0]["META_KEYWORD"].ToString();
            }

        }
    }
}