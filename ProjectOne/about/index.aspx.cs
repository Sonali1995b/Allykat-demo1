using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App.BAL.Master;
using System.Configuration;
using System.Data;
using App.BAL.Utility;

namespace ProjectOne.about
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString3 = String.Empty, vString4 = String.Empty;
        String vString5 = String.Empty, vString6 = String.Empty;

        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
        DataTable dt5 = null;
        DataTable dt6 = null;
        DataTable dt7 = null;

        protected void Page_PreLoad(object sender, EventArgs e)
        {

            dt = new DataTable();
            dt1 = new DataTable();
            dt2 = new DataTable();
            dt3 = new DataTable();
            dt4 = new DataTable();
            dt5 = new DataTable();
            dt6 = new DataTable();
            dt7 = new DataTable();

            using (BAHomeSettings oBME = new BAHomeSettings())
            {
                dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
            }

            using(BADtlsRate oBME= new BADtlsRate())
            {
                dt1 = oBME.Get("GET", 1, "0", ref errMsg, Convert.ToString(DateTime.Now), 1);
                dt2 = oBME.Get("GET", 1, "1", ref errMsg, Convert.ToString(DateTime.Now), 1);
            }

            using (BADtlsNews oBMC = new BADtlsNews())
            {
                dt3 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
            }

            using (BAHeadHomeBgSetting oBME = new BAHeadHomeBgSetting())
            {
                dt4 = oBME.Get("GET", 1, "", ref errMsg, null, 1);
            }

            using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
            {
                dt5= oBME.GetPageSetting("SRH_HEAD_KEY", 109, "", ref errMsg, "2020", 1);

                dt6 = oBME.Get("GET", 1, "", ref errMsg, null, 1);
            }

            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            rate_bgimg.Style.Add("background-image", ResolveClientUrl(".." + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt4.Rows[0]["BG_RATE_IMAGE"]));

            //about
            if (dt != null && dt.Rows.Count>0)
            {
                vString = "<h2 class='big topmargin_0 bottommargin_30'>About Ally Kat</h2><p>" + dt.Rows[0]["ABOUT_DESC"].ToString() + "</p>";
                about_img.InnerHtml = "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]) + "' alt='Allykat' title='Allykat'>";
            }

            about_desc.InnerHtml = vString;

            //incallrates
            if (dt1 != null && dt1.Rows.Count > 0)
            {
                vString1 = "<table class='table table-hover'><thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead><tbody>";
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    vString1 += "<tr><td>" + dt1.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt1.Rows[i]["PRICE"] + "</td><td>" + dt1.Rows[i]["ADD_HOURS"] + "</td></tr>";
                }
                vString1 += "</tbody></table>";

                incallrate_desc.InnerHtml = vString1;
                
            }

            //outcallrates
            if (dt2 != null && dt2.Rows.Count > 0)
            {
                vString2 = "<table class='table table-hover'><thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead><tbody>";
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    vString2 += "<tr><td>" + dt2.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt2.Rows[i]["PRICE"] + "</td><td>" + dt2.Rows[i]["ADD_HOURS"] + "</td></tr>";
                }
                vString2 += "</tbody></table>";

                outcallrate_desc.InnerHtml = vString2;

            }

            //news
            if(dt3 != null && dt3.Rows.Count > 0)
            {
                vString3 = "<div class='owl-carousel blog-carousel theme-owl-carousel' data-margin='30' data-nav='false' data-dots='true' data-center='true' data-loop='true' data-items='5' data-autoplay='false' data-responsive-xs='1' data-responsive-sm='2' data-responsive-md='2' data-responsive-lg='3' data-responsive-xlg='5'>";
                for(int i = 0; i < dt3.Rows.Count; i++)
                {
                    vString3 += " <article class='vertical-item post format-standard text-center'><div class='item-media entry-thumbnail'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt3.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'>";
                    vString3 += "<div class='media-links'><a class='abs-link' title='' href='#'></a></div></div><div class='item-content entry-content'><h4 class='topmargin_0 bottommargin_20'>";
                    vString3 += "<a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt3.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt3.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt3.Rows[i]["NEWS_HEADING"] + "</a></h4>";
                    vString3 += " <span class='entry-meta text-uppercase fontsize_12'><span class='author'>Admin</span> |<time datetime='2016-09-03T15:05:23+00:00'>" + dt3.Rows[i]["NEWS_DATE"] + "</time></span></div></article>";
                }
                vString3 += "</div>";
                news_desc.InnerHtml = vString3;
            }
            //contactdetails
            if (dt6 != null && dt6.Rows.Count > 0)
            {
                vString4 = "<ul class='list1 no-bullets'><li><i class='highlight rt-icon2-phone5'></i><span class='grey'>Phone:</span><a href='tel: " + dt6.Rows[0]["CONTACT_NO"] + "'>" + dt6.Rows[0]["CONTACT_NO"] + "</a></li> ";
                vString4 += "<li><i class='highlight rt-icon2-pen'></i><span class='grey'>Fax:</span>+1 232 3235 324</li></ul>";
            }
            phone_desc.InnerHtml = vString4;

            //emaildetails
            if (dt6 != null && dt6.Rows.Count > 0)
            {
                vString5 = "<ul class='list1 no-bullets'><li><i class='highlight rt-icon2-mail'></i><span class='grey'>Email:</span><a href='mailto: " + dt6.Rows[0]["MAIL"] + "'><em>" + dt6.Rows[0]["MAIL"] + "</em></a></li>";
                vString5 += "<li><i class='highlight rt-icon2-world'></i><span class='grey'>Website:</span><a href='allykat.com.au'><em>allykat.com.au</em></a></li></ul>";
            }
            email_desc.InnerHtml = vString5;

            //socialdetails

            if(dt6 != null && dt6.Rows.Count > 0)
            {
                vString6 = "<a class='social-icon color-bg-icon soc-facebook' target='_blank' href='" + dt6.Rows[0]["FACEBOOK_LINK"] + "' title='Facebook'></a>";
                vString6 += "<a class='social-icon color-bg-icon soc-twitter' target='_blank' href='" + dt6.Rows[0]["TWITTER_LINK"] + "'  title='Twitter'></a>";
                vString6 += "<a class='social-icon color-bg-icon soc-instagram' target='_blank' href='" + dt6.Rows[0]["LINKEDIN_LINK"] + "' title='instagram'></a>";
            }
            social_desc.InnerHtml = vString6;

            //page Setting
            if (dt5 != null && dt5.Rows.Count > 0)
            {
                Page.Title = dt5.Rows[0]["PAGE_TITLE"].ToString();
                Page.MetaDescription = dt5.Rows[0]["META_DESCRIPTION"].ToString();
                Page.MetaKeywords = dt5.Rows[0]["META_KEYWORD"].ToString();
            }
        }
    }
}