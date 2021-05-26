using App.BAL.Master;
using App.BAL.Utility;
using App.CORE.Domain.Master;
using System;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;

namespace ProjectOne.voting
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString7 = String.Empty, vString8 = String.Empty, vString15 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt7 = null;
        DataTable dt14 = null;
        DataTable dt10 = null;
        DataTable dt5 = null;
        DataTable dt6 = null;
        String user_key;
        String COUNT_VOTE;
        public static String errMsg1 = String.Empty;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                dt3 = new DataTable();
                dt7 = new DataTable();
                dt14 = new DataTable();
                dt10 = new DataTable();

                using (BADtlsVoting oBME = new BADtlsVoting())
                {
                    dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 96, "", ref errMsg, "2020", 1);
                    dt3 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                using (BAHeadHomeBgSetting oBME = new BAHeadHomeBgSetting())
                {
                    dt2 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                using (BADtlsRate oBMC = new BADtlsRate())
                {
                    dt7 = oBMC.Get("GET", 1, "0", ref errMsg, Convert.ToString(DateTime.Now), 1);
                    dt14 = oBMC.Get("GET", 1, "1", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsNews oBMC = new BADtlsNews())
                {
                    dt10 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
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
                //voting
                if (dt != null && dt.Rows.Count > 0)
                {
                    vString = String.Empty;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        dt5 = new DataTable();
                        dt6 = new DataTable();

                        using (BADtlsVoting oBMG = new BADtlsVoting())
                        {
                            dt5 = oBMG.Get_COUNT("GET", "", dt.Rows[i]["DTLS_VOTING_KEY"].ToString(), ref errMsg, "2019", 1);
                        }

                        if (dt5 != null && dt5.Rows.Count > 0)
                        {
                            COUNT_VOTE = dt5.Rows[0]["VOTE_COUNT"].ToString();

                        }
                        else
                        {
                            COUNT_VOTE = "0";
                        }
                        ViewState["VOTE_COUNT"] = COUNT_VOTE;
                        HttpCookie cookie = Request.Cookies["__asd"];

                        if (cookie != null && HttpContext.Current.Session["ID"] != null)
                        {
                            user_key = Session["USERID"].ToString();
                        }
                        else
                        {
                            user_key = "0";
                        }
                        using (BADtlsVoting oBMG = new BADtlsVoting())
                        {
                            dt6 = oBMG.Get_COUNT("GET_USER", user_key, dt.Rows[i]["DTLS_VOTING_KEY"].ToString(), ref errMsg, "2019", 1);
                        }
                        vString += "<div class='col-md-3 col-sm-6 col-sm-6 col-xs-6'><div class='product-grid2'>";
                        vString += " <div class='product-image2'><a class='vote_icon' href='' data-tip='Like'><i class='fa fa-thumbs-up' aria-hidden='true'></i><span>" + COUNT_VOTE + "</span></a>";
                        vString += "<a href=''><img class='pic-1' src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["VOTING"].ToString() + dt.Rows[i]["VOTING_IMG"]) + "' alt='Allykat' title='Allykat'>";
                        vString += "<img class='pic-2' src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["VOTING"].ToString() + dt.Rows[i]["VOTING_IMG"]) + "' alt='Allykat' title='Allykat'></a>";
                       // vString += "<a class='add-to-cart' href=''>Vote Now</a></div></div></div>";
                        // vString += "";
                        if (dt6 != null && dt6.Rows.Count > 0)
                        {
                            if (dt6.Rows[0]["VOTE_COUNT"].ToString() == "0")
                            {

                                vString += "<a href='#' id='btn" + i + "' onclick='useranswer(this.id)' data-='" + dt.Rows[i]["DTLS_VOTING_KEY"] + "' class='add-to-cart'>";
                                vString += "Vote </a></div></div></div>";
                            }

                            else
                            {

                                vString += "<a href='#' disabled='disabled' class='add-to-cart'>";
                                vString += "Vote </a></div></div></div>";
                            }
                        }
                        else
                        {
                            vString += "<a href='#' id='btn" + i + "' onclick='useranswer(this.id)' data-='" + dt.Rows[i]["DTLS_VOTING_KEY"] + "' class='add-to-cart'>";
                            vString += "Vote </a></div></div></div>";
                        }

                    }
                    if (vString != null)
                    {

                        voting_list.InnerHtml = vString;
                    }
                }

                //in-call-rates(d)
                if (dt7 != null && dt7.Rows.Count > 0)
                {
                    vString7 += " <div class='ratesSubtitle'><h3>In-call</h3></div><table class='table table-hover'>";
                    vString7 += "<thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead>";
                    for (int i = 0; i < dt7.Rows.Count; i++)
                    {
                        // vString7 += "<tr><td> " + dt7.Rows[i]["HOURS"] + "</td >< td >" + dt7.Rows[i]["PRICE"] + "</ td >< td > " + dt7.Rows[i]["ADD_HOURS"] + " </ td ></ tr >";
                        vString7 += "<tbody><tr><td>" + dt7.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt7.Rows[i]["PRICE"] + "</td><td> " + dt7.Rows[i]["ADD_HOURS"] + "</td></tr></tbody>";
                    }


                    vString7 += "</table>";
                    incallrate_list.InnerHtml = vString7;
                }
                //out-calls-rates(d)
                if (dt14 != null && dt14.Rows.Count > 0)
                {
                    vString8 += "<div class='ratesSubtitle'><h4>Out-calls</h4></div><table class='table table-hover'>";
                    vString8 += "<thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead>";
                    for (int i = 0; i < dt14.Rows.Count; i++)
                    {
                        vString8 += "<tbody><tr><td>" + dt14.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt14.Rows[i]["PRICE"] + "</td><td> " + dt14.Rows[i]["ADD_HOURS"] + "</td></tr></tbody>";

                    }
                    vString8 += " </table>";
                    outcallrate_list.InnerHtml = vString8;
                }

                //news
                if (dt10 != null && dt10.Rows.Count > 0)
                {
                    //news_img.Src= ResolveClientUrl(".." + ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["NEWS_IMG"]);
                    for (int i = 0; i < dt10.Rows.Count; i++)
                    {

                        vString15 += "<article class='vertical-item post format-standard text-center'><div class='item-media entry-thumbnail'>";
                        vString15 += "<img src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["NEWS"].ToString() + dt10.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'><a class='abs-link' title='' href=''></a></div>";
                        vString15 += "</div><div class='item-content entry-content'><h4 class='topmargin_0 bottommargin_20'><a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt10.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt10.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt10.Rows[i]["NEWS_HEADING"] + "</a></h4><span class='entry-meta text-uppercase fontsize_12'>";
                        vString15 += " <span class='author'>Admin</span> |<time datetime = '2016-09-03T15:05:23+00:00' >" + dt10.Rows[i]["NEWS_DATE"] + "</time></span> ";
                        vString15 += "</div></article>";
                        //vString15 += "";
                        //vString15 += "";

                    }
                    if (vString15 != null)
                    {
                        news_list.InnerHtml = vString15;
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

        [System.Web.Services.WebMethod]
        public static string GetEvent(string date1)
        {
            String errMsg;
            EntityDtlsVoting oBMAST = null; byte vKey = 0;
            HttpCookie cookie = HttpContext.Current.Request.Cookies["__asd"];


            if (cookie != null && HttpContext.Current.Session["ID"] != null)
            {
                oBMAST = new EntityDtlsVoting();
                string s = HttpContext.Current.Session["USERID"].ToString();

                oBMAST.USER_KEY = s;
                oBMAST.IMAGE_KEY = date1;
                oBMAST.COMPANY_KEY = 1;
                using (BADtlsVoting oBME = new BADtlsVoting())
                {

                    vKey = oBME.SaveChanges_count("INSERT", oBMAST, errMsg1, "2019", 1);

                }


                return vKey.ToString();
            }

            else
            {
                return "0";
            }

        }
    }
}