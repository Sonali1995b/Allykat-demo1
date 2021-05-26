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

namespace ProjectOne.forum_details
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                dt3 = new DataTable();

                if (Request.QueryString["forum"] != null)
                {
                    Session["forum"] = Convert.ToInt32(Encrypt.DecryptASCII(Request.QueryString["forum"]));
                    Int32 forumkey = Convert.ToInt32(Encrypt.DecryptASCII(Request.QueryString["forum"]));
                    using (BADtlsForum oBMG = new BADtlsForum())
                    {
                        dt = oBMG.Get<Int32>("SRH_DTLS", forumkey, "", ref errMsg, "2019", 1);
                    }
                }

                using (BADtlsForum oBME = new BADtlsForum())
                {
                    dt1 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt3 = oBME.GetPageSetting("SRH_HEAD_KEY", 106, "", ref errMsg, "2020", 1);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (dt.Rows.Count > 0)
                    {
                        DateTime date1 = Convert.ToDateTime(dt.Rows[0]["FORUM_DATE"]);

                        forum_img.InnerHtml = "<div class='entry-thumbnail bottommargin_40'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["FORUM"].ToString() + dt.Rows[0]["FORUM_IMG"]) + "'  alt='Allykat' title='Allykat'></div>";

                        vString = "<div class='entry-meta item-meta'><span class='author greylinks'>By<a>Admin</a></span><span class='date'>";
                        vString += "<time datetime='2016-01-10T15:05:23+00:00' class='entry-date'> " + date1.ToLongDateString() + "</time></span></div>";
                        vString += "<h1 class='entry-title'><a rel='bookmark'>" + dt.Rows[0]["FORUM_HEADING"] + "</a></h1>";
                        forum_desc.InnerHtml = "<p class='big-first-letter'>" + dt.Rows[0]["FORUM_DESC"] + "</p>";


                    }

                    forum_details.InnerHtml = vString;


                    if (dt1.Rows.Count > 0)
                    {
                        vString1 = "<ul class='media-list darklinks'>";

                        for (int i = 0; i < dt1.Rows.Count; i++)
                        {
                            vString1 += "<li class='media'><a class='media-left'><img class='media-object' src='" + ResolveClientUrl(ConfigurationManager.AppSettings["FORUM"].ToString() + dt1.Rows[i]["FORUM_IMG"]) + "'alt='Allykat' title='Allykat'></a><div class='media-body'>";
                            vString1 += "<p><a href='" + ResolveClientUrl("~/forum-details/") + Encrypt.EncryptASCII(dt1.Rows[i]["DTLS_FORUM_KEY"].ToString()) + "/" + dt1.Rows[i]["FORUM_HEADING"].ToString().Replace(' ', '-') + "'>" + dt1.Rows[i]["FORUM_HEADING"] + "</a></p></div></li>";
                        }
                        vString1 += "</ul>";

                        forum_desc1.InnerHtml = vString1;
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