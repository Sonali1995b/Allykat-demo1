using App.BAL.Master;
using App.BAL.Utility;
using System;
using System.Configuration;
using System.Data;
using System.Globalization;


namespace ProjectOne.news_details
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt10 = null;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //Sidebar Content
                    dt = new DataTable();
                    dt1 = new DataTable();
                    dt2 = new DataTable();
                    dt10 = new DataTable();

                    if (Request.QueryString["news"] != null)
                    {
                        Session["news"] = Convert.ToInt32(Encrypt.DecryptASCII(Request.QueryString["news"]));
                        Int32 forumkey = Convert.ToInt32(Encrypt.DecryptASCII(Request.QueryString["news"]));
                        using (BADtlsNews oBMG = new BADtlsNews())
                        {
                            dt = oBMG.Get<Int32>("SRH_DTLS", forumkey, "", ref errMsg, "2019", 1);
                        }
                    }
                    using (BADtlsNews oBME = new BADtlsNews())
                    {
                        dt1 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                    }

                    using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                    {
                        dt2 = oBME.GetPageSetting("SRH_HEAD_KEY", 101, "", ref errMsg, "2020", 1);
                        dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                    }

                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (dt.Rows.Count > 0 && dt2.Rows.Count > 0)
                    {
                        DateTime date1 = Convert.ToDateTime(dt.Rows[0]["NEWS_DATE"]);


                        news_img.InnerHtml = "<div class='entry-thumbnail bottommargin_40'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt.Rows[0]["NEWS_IMG"]) + "'  alt='Allykat' title='Allykat'></div>";

                        vString = "<div class='entry-meta item-meta'><span class='author greylinks'>By <a>Admin,</a></span><span class='date'>";
                        vString += "<time datetime='2016-01-10T15:05:23+00:00' class='entry-date'>  " + date1.ToLongDateString() + "</time></span></div>";
                        vString += "<h1 class='entry-title'><a rel='bookmark'>" + dt.Rows[0]["NEWS_HEADING"] + "</a></h1>";
                        news_desc.InnerHtml= "<p class='big-first-letter'>" + dt.Rows[0]["NEWS_DESC"] + "</p>";

                    }
                    news_details.InnerHtml = vString;

                    if (dt1.Rows.Count > 0)
                    {
                        vString1 = "<ul class='media-list darklinks'>";

                        for (int i = 0; i < dt1.Rows.Count; i++)
                        {
                            vString1 += "<li class='media'><a class='media-left'><img class='media-object' src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt1.Rows[i]["NEWS_IMG"]) + "'alt='Allykat' title='Allykat'></a><div class='media-body'>";
                            vString1 += "<p><a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt1.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt1.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt1.Rows[i]["NEWS_HEADING"] + "</a></p></div></li>";
                        }
                        vString1 += "</ul>";

                        news_desc1.InnerHtml = vString1;
                    }
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
                }
            }
        }
    }
}