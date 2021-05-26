using App.BAL.Master;
using App.BAL.Utility;
using System;
using System.Configuration;
using System.Data;
using System.Globalization;
namespace ProjectOne.news
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
                dt10 = new DataTable();
                using (BADtlsNews oBME = new BADtlsNews())
                {
                    dt = oBME.Get("GET_ALL", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 94, "", ref errMsg, "2020", 1);
                    dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
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

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        vString += "<div class='isotope-item col-lg-4 col-md-6 col-sm-12'><article class='vertical-item mosaic-post post format-standard text-center muted_background'><div class='item-media entry-thumbnail'>";
                        vString += "<img src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["NEWS"].ToString() + dt.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'><a class='abs-link' title='' href=''></a></div></div>";
                        vString += " <div class='item-content entry-content'><header class='entry-header'><h3 class='entry-title'><a href = '" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "' rel='bookmark'>" + dt.Rows[i]["NEWS_HEADING"] + "</a></h3>";
                        vString += "<span class='date main_bg_color'><time datetime = '2016-01-10T15:05:23+00:00' class='entry-date'>" + dt.Rows[i]["NEWS_DATE"] + "</time></span></header>";
                        vString += "<p>" + dt.Rows[i]["SHORT_DESC"] + "</p></div></article></div> ";
                        //vString += "";
                        //vString += "";
                        //vString += "";
                        //vString += "";
                        //vString += "";
                    }
                    if (vString != null)
                    {
                        news_list.InnerHtml = vString;
                    }
                    
                }

                if (dt1 != null && dt1.Rows.Count > 0)
                {
                    Page.Title = dt1.Rows[0]["PAGE_TITLE"].ToString();
                    Page.MetaDescription = dt1.Rows[0]["META_DESCRIPTION"].ToString();
                    Page.MetaKeywords = dt1.Rows[0]["META_KEYWORD"].ToString();
                }
                
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
            finally
            {
                dt = null;
                dt1 = null;

                vString = String.Empty;
            }
        }
    }
}