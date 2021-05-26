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

namespace ProjectOne.offer
{
    public partial class index : System.Web.UI.Page
    {

        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                dt3 = new DataTable();


                using (BADtlsOffer oBME = new BADtlsOffer())
                {
                    dt = oBME.Get<Int32>("GET", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 21, "", ref errMsg, "2020", 1);
                    
                }
                using (BAHeadHomeBgSetting oBMC = new BAHeadHomeBgSetting())
                {
                    dt2 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsNews oBMC = new BADtlsNews())
                {
                    dt3 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            offer_img.Src = ResolveClientUrl(".." + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt2.Rows[0]["BG_EXCITING_OFFER_IMAGE"]);

            rate_bgimg.Style.Add("background-image", ResolveClientUrl(".." + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt2.Rows[0]["BG_RATE_IMAGE"]));

            //offer
            if (dt.Rows.Count>0)
            {
                vString = "<div class='row'>";
                for(int i=0;i<dt.Rows.Count;i++)
                {
                    vString += "<div class='col-sm-12 bottommargin_40'><div class='side-item event-item content-padding with_background'><div class='row'><div class='col-md-4'><div class='item-media'>";
                    vString += "<img src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["OFFER"].ToString() + dt.Rows[i]["OFFER_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'>";
                    vString += "<a class='abs-link' title='' href=''></a></div></div></div><div class='col-md-8'><div class='item-content'><h3 class='entry-title topmargin_0'>";
                    vString += "<a>" + dt.Rows[i]["OFFER_PER"] + " " + dt.Rows[i]["OFFER_NAME"] + "</a></h3><p>" + dt.Rows[i]["OFFER_NOTE"] + "</p></div></div></div></div></div>";
 
                }
                vString += "</div>";

                offer_desc.InnerHtml = vString;
            }

            //news
            if (dt3.Rows.Count > 0)
            {
                vString1 = "<div class='owl-carousel blog-carousel theme-owl-carousel' data-margin='30' data-nav='false' data-dots='true' data-center='true' data-loop='true' data-items='5' data-autoplay='false' data-responsive-xs='1' data-responsive-sm='2' data-responsive-md='2' data-responsive-lg='3' data-responsive-xlg='5'>";
                for (int i = 0; i < dt3.Rows.Count; i++)
                {
                    vString1 += " <article class='vertical-item post format-standard text-center'><div class='item-media entry-thumbnail'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt3.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'>";
                    vString1 += "<div class='media-links'><a class='abs-link' title='' href='#'></a></div></div><div class='item-content entry-content'><h4 class='topmargin_0 bottommargin_20'>";
                    vString1 += "<a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt3.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt3.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt3.Rows[i]["NEWS_HEADING"] + "</a></h4>";
                    vString1 += " <span class='entry-meta text-uppercase fontsize_12'><span class='author'>Admin</span> |<time datetime='2016-09-03T15:05:23+00:00'>" + dt3.Rows[i]["NEWS_DATE"] + "</time></span></div></article>";
                }
                vString1 += "</div>";
                news_desc.InnerHtml = vString1;
            }

        }
    }
}