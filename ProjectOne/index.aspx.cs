using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App.BAL.Master;
using App.CORE.Domain.Setup;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Text;
using App.BAL.Utility;
using App.CORE.Domain.Master;
using System.Net;
using System.Net.Mail;


namespace ProjectOne
{
    public partial class index : System.Web.UI.Page
    {

        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString3 = String.Empty, vString4 = String.Empty, vString5 = String.Empty, vString6 = String.Empty, vString7 = String.Empty, vString8 = String.Empty, vString9 = String.Empty, vString10 = String.Empty, vString11 = String.Empty, vString12 = String.Empty, vString14 = String.Empty, vString15 = String.Empty, vString16 = String.Empty, vString17 = String.Empty, vString18 = String.Empty, li = String.Empty;

        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
        DataTable dt5 = null;
        DataTable dt6 = null;
        DataTable dt7 = null;
        DataTable dt8 = null;
        DataTable dt9 = null;
        DataTable dt10 = null;
        DataTable dt11 = null;
        DataTable dt12 = null;
        DataTable dt13 = null;
        DataTable dt14 = null;
        DataTable dt55 = null;
        DataTable dt66 = null;
        DataTable dt60 = null;
        String user_key;
        String COUNT_VOTE;
        public static String errMsg1 = String.Empty;

        EntitySysUser oSysUser = null;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                dt3 = new DataTable();
                dt4 = new DataTable();
                dt5 = new DataTable();
                dt6 = new DataTable();
                dt7 = new DataTable();
                dt8 = new DataTable();
                dt9 = new DataTable();
                dt10 = new DataTable();
                dt11 = new DataTable();
                dt12 = new DataTable();
                dt13 = new DataTable();
                dt14 = new DataTable();

                using (BAHomeSettings oBMC = new BAHomeSettings())
                {
                    dt = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);

                }

                using (BADtlsTour oBMC = new BADtlsTour())
                {
                    dt1 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsPrefer oBMC = new BADtlsPrefer())
                {
                    dt2 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsGallery oBMC = new BADtlsGallery())
                {
                    dt3 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsClient oBMC = new BADtlsClient())
                {
                    dt4 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsDiary oBMC = new BADtlsDiary())
                {
                    dt5 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsRate oBMC = new BADtlsRate())
                {
                    dt7 = oBMC.Get("GET", 1, "0", ref errMsg, Convert.ToString(DateTime.Now), 1);
                    dt14 = oBMC.Get("GET", 1, "1", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BACalendar oBMC = new BACalendar())
                {
                    dt8 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsVoting oBMC = new BADtlsVoting())
                {
                    dt9 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsNews oBMC = new BADtlsNews())
                {
                    dt10 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsSelfie oBMC = new BADtlsSelfie())
                {
                    dt11 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BAHeadHomeBgSetting oBMC = new BAHeadHomeBgSetting())
                {
                    dt12 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                using (BADtlsForum oBMC = new BADtlsForum())
                {
                    dt13 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BADtlsQuickFacts oBME = new BADtlsQuickFacts())
                {
                    dt6 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

                //Page.ClientScript.RegisterStartupScript(GetType(), "err", "my_fun();", true);
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

                FillDdlMenu();
                if (!IsPostBack)
                {
                    if (Request.QueryString["ActivationCode"] != null)
                    {
                        EntitySubscribe oBMAST = null;
                        string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
                        errMsg = String.Empty;
                        oBMAST = new EntitySubscribe();
                        //oBMAST.USER_KEY = Convert.ToInt32(hf_USER_KEY.Value);

                        oBMAST.ACTIVATION_CODE = activationCode;
                        using (BASubscribe oBMC = new BASubscribe())
                        {
                            int vRef;
                            Int32 vKey = 0;
                            vRef = oBMC.SaveChanges<Object, Int32>("UPDATE_TAG", oBMAST, null, ref vKey, ref errMsg, "2019", 1);

                            if (vRef == 1)
                            {
                                //div_Activation_Msg.InnerHtml = "Activation successful.";
                                // ViewState["activation"] = "Activation successful.";
                                Response.Write("<script>alert('Activation successful')</script>");
                            }

                            else
                                //ViewState["activation"] = "Invalid Activation code.";
                                Response.Write("<script>alert('Invalid Activation code.')</script>");
                        }
                    }

                    StringBuilder bannerhtml = new StringBuilder();
                    string banner, bannerimage;
                    int count;
                    banner = dt.Rows[0]["BANNER_IMG"].ToString();


                    for (int i = 0; i < 3; i++)
                    {
                        if (banner != "")
                        {
                            if (i == 0)
                            {
                                bannerimage = banner.IndexOf("|").ToString();
                                count = Convert.ToInt32(bannerimage) + 1;
                                bannerimage = banner.Substring(0, Convert.ToInt32(bannerimage));
                                banner1.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BANNER"].ToString() + bannerimage) + "'  alt='Allykat' title='Allykat'>";

                                //banner_1.Style.Add("background-image", ResolveClientUrl(".." + ConfigurationManager.AppSettings["BANNER"].ToString() + bannerimage));
                                banner = banner.Remove(0, Convert.ToInt32(count));
                            }
                            if (i == 1)
                            {
                                bannerimage = banner.IndexOf("|").ToString();
                                count = Convert.ToInt32(bannerimage) + 1;
                                bannerimage = banner.Substring(0, Convert.ToInt32(bannerimage));
                                banner2.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BANNER"].ToString() + bannerimage) + "'  alt='Allykat' title='Allykat'>";
                                //banner_2.Style.Add("background-image", ResolveClientUrl(".." + ConfigurationManager.AppSettings["BANNER"].ToString() + bannerimage));
                                banner = banner.Remove(0, Convert.ToInt32(count));
                            }


                        }
                    }

                    offerimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_EXCITING_OFFER_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    //testimonial
                    if (dt4.Rows.Count > 0)
                    {
                        // vString = "<div class='testimonials-body'>";
                        for (int i = 0; i < dt4.Rows.Count; i++)
                        {
                            //vString += "<ul class='slides'>";
                            //vString1 += "<ul class='slides'>";
                            if (i == 0)
                            {
                                vString += "<li><blockquote class='blockquote-big' data-slide='" + i + "' style='display: block;'> " + dt4.Rows[i]["CLIENT_DESC"] + "</blockquote></li>";

                            }
                            else
                            {
                                vString += "<li><blockquote class='blockquote-big' data-slide='" + i + "'> " + dt4.Rows[i]["CLIENT_DESC"] + "</blockquote></li>";
                            }
                            vString1 += "<li class='testimonial'><div class='author-photo'><img src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["CLIENT"].ToString() + dt4.Rows[i]["CLIENT_IMG"]) + "' alt='Allykat' title='Allykat'></div>";
                            vString1 += "<div class='author-meta'><span class='bold highlight'>" + dt4.Rows[i]["CLIENT_NAME"] + "</span><br>" + dt4.Rows[i]["CLIENT_TYPE"] + "</div></li>";
                        }
                        //vString = "</ul>";
                        testimonial_desc.InnerHtml = vString;
                       // testimonialslider.InnerHtml = vString;
                        testimonial_desc1.InnerHtml = vString1;
                      //  testithumbcarousel.InnerHtml = vString1;
                    }
                    


                    //about
                    about_desc.InnerHtml = "<p>" + dt.Rows[0]["ABOUT_DESC"] + "</p>";
                    aboutimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_ABOUT_ME_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                   
                    //quickfact
                    quickfactimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_QUICK_FACTS_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    if (dt6.Rows.Count > 0)
                    {
                        vString2 = "<div class='row'><div class='col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6'>";
                        for (int i = 0; i <= 4; i++)
                        {
                            vString2 += "<div class='media bottommargin_30'><div class='media-left'><div class='service-media'></div></div><div class='media-body'>";
                            vString2 += "<h4 class='topmargin_0 bottommargin_5'><a>" + dt6.Rows[i]["QUICK_FACT_NAME"] + "</a></h4><p class='bottommargin_0'>" + dt6.Rows[i]["QUICK_FACT_DESC"] + "</p></div></div>";
                        }
                        vString2 += "</div>";

                        vString2 += "<div class='col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6'>";
                        for (int i = 5; i <= 8; i++)
                        {
                            vString2 += "<div class='media bottommargin_30'><div class='media-left'><div class='service-media'></div></div><div class='media-body'>";
                            vString2 += "<h4 class='topmargin_0 bottommargin_5'><a>" + dt6.Rows[i]["QUICK_FACT_NAME"] + "</a></h4><p class='bottommargin_0'>" + dt6.Rows[i]["QUICK_FACT_DESC"] + "</p></div></div>";

                        }
                        vString2 += "</div></div>";

                        quickfact_desc.InnerHtml = vString2;
                    }

                    //tour

                    tourimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_TOUR_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    if (dt1 != null && dt1.Rows.Count > 0)
                    {
                        vString3 += "<table class='table table-hover'><thead><tr><th scope ='col'>To</th><th scope='col'>From</th><th scope ='col'>Untill</th></tr></thead><tbody>";
                        for (int j = 0; j < dt1.Rows.Count; j++)
                        {
                            vString3 += "<tr><td>" + dt1.Rows[j]["TOUR_PLACE"] + "</td><td>" + dt1.Rows[j]["FROM_DATE"] + "</td><td>" + dt1.Rows[j]["TO_DATE"] + "</td></tr>";
                        }
                        if (vString3 != null)
                        {
                            vString3 += "</tbody></table>";
                            tour_desc.InnerHtml = vString3;
                        }
                    }

                    //diary

                    diaryimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_DAIRY_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    if (dt5.Rows.Count > 0)
                    {
                        vString4 = "<div class='intro-layer' data-animation='slideExpandUp'>";
                        for (int i = 0; i < dt5.Rows.Count; i++)
                        {
                            vString4 += "<div class='media bottommargin_30'><div class='media-body'><h4 class='topmargin_0 bottommargin_5'>";
                            vString4 += "<a href='" + ResolveClientUrl("~/diary-details/") + Encrypt.EncryptASCII(dt5.Rows[i]["DTLS_DIARY_KEY"].ToString()) + "/" + dt5.Rows[i]["DIARY_HEADING"].ToString().Replace(' ', '-') + "'>" + dt5.Rows[i]["DIARY_HEADING"] + "</a></h4>";
                            vString4 += "<p class='bottommargin_0'>" + dt5.Rows[i]["SHORT_DESC"] + "</p></div></div>";
                        }
                        vString4 += "</div>";
                    }
                    diary_desc.InnerHtml = vString4;

                    //availablity

                    availablityimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_AVAILABILITY_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    if (dt8.Rows.Count > 0)
                    {
                        vString5 = "<table class='table table-hover'><thead><tr><th scope='col'>Weekday</th><th scope='col'>From</th><th scope='col'>Untill</th></tr></thead><tbody>";
                        for (int i = 0; i < dt8.Rows.Count; i++)
                        {
                            vString5 += "<tr><td>" + dt8.Rows[i]["DAY_NAME"] + "</td><td>" + dt8.Rows[i]["START_TIME"] + "</td><td>" + dt8.Rows[i]["END_TIME"] + "</td></tr>";
                        }

                        vString5 += "</tbody></table>";
                    }
                    availability_desc.InnerHtml = vString5;

                    //forum
                    forumimg.InnerHtml += "<img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_FORUM_IMAGE"]) + "'  alt='Allykat' title='Allykat'>";
                    if (dt13.Rows.Count > 0)
                    {
                        vString6 = "<div class='intro-layer' data-animation='slideExpandUp'>";
                        for (int i = 0; i < dt13.Rows.Count; i++)
                        {
                            vString6 += "<div class='media bottommargin_30'><div class='media-body'><h4 class='topmargin_0 bottommargin_5'>";
                            vString6 += "<a href='" + ResolveClientUrl("~/forum-details/") + Encrypt.EncryptASCII(dt13.Rows[i]["DTLS_FORUM_KEY"].ToString()) + "/" + dt13.Rows[i]["FORUM_HEADING"].ToString().Replace(' ', '-') + "'>" + dt13.Rows[i]["FORUM_HEADING"] + "</a></h4>";
                            vString6 += "<p class='bottommargin_0'>" + dt13.Rows[i]["FORUM_DESC"].ToString() + "</p>";
                            vString6 += "<a href='" + ResolveClientUrl("~/forum-details/") + Encrypt.EncryptASCII(dt13.Rows[i]["DTLS_FORUM_KEY"].ToString()) + "/" + dt13.Rows[i]["FORUM_HEADING"].ToString().Replace(' ', '-') + "' class='theme_button color1 topmargin_20'>Read More</a></div></div>";
                        }
                        vString6 += "</div>";
                    }
                    forum_desc.InnerHtml = vString6;

                    //prefer
                    if (dt2.Rows.Count > 0)
                    {
                        vString7 = "<navlist><ul>";
                        for (int i = 0; i < dt2.Rows.Count; i++)
                        {
                            vString7 += " <li>" + dt2.Rows[i]["PREFER_NAME"] + "<i class='fa fa-paper-plane' aria-hidden='true'></i><span></span><span></span><span></span><span></span></li>";

                        }
                        vString7 += "</ul></navlist>";
                    }
                    prefer_desc.InnerHtml = vString7;

                    //calender
                    calender_img.Style.Add("background-image", ResolveClientUrl(".." + ConfigurationManager.AppSettings["BACKGROUND"].ToString() + dt12.Rows[0]["BG_CALENDER_IMAGE"]));

                    //voting
                    if (dt9.Rows.Count > 0)
                    {

                        for (int i = 0; i < dt9.Rows.Count; i++)
                        {
                            dt55 = new DataTable();
                            dt66 = new DataTable();

                            using (BADtlsVoting oBMG = new BADtlsVoting())
                            {
                                dt55 = oBMG.Get_COUNT("GET", "", dt9.Rows[i]["DTLS_VOTING_KEY"].ToString(), ref errMsg, "2019", 1);
                            }

                            if (dt55 != null && dt55.Rows.Count > 0)
                            {
                                COUNT_VOTE = dt55.Rows[0]["VOTE_COUNT"].ToString();

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
                                dt66 = oBMG.Get_COUNT("GET_USER", user_key, dt9.Rows[i]["DTLS_VOTING_KEY"].ToString(), ref errMsg, "2019", 1);
                            }
                            vString8 += "<div class='col-md-3 col-sm-6 col-sm-6 col-xs-6'><div class='product-grid2'>";
                            vString8 += " <div class='product-image2'><a class='vote_icon' href='' data-tip='Like'><i class='fa fa-thumbs-up' aria-hidden='true'></i><span>" + COUNT_VOTE + "</span></a>";
                            vString8 += "<a href=''><img class='pic-1' src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["VOTING"].ToString() + dt9.Rows[i]["VOTING_IMG"]) + "' alt='Allykat' title='Allykat'>";
                            vString8 += "<img class='pic-2' src='" + ResolveClientUrl(".." + ConfigurationManager.AppSettings["VOTING"].ToString() + dt9.Rows[i]["VOTING_IMG"]) + "' alt='Allykat' title='Allykat'></a>";
                            // vString8 += "<a class='add-to-cart' href=''>Vote Now</a></div></div></div>";
                            if (dt66 != null && dt66.Rows.Count > 0)
                            {
                                if (dt66.Rows[0]["VOTE_COUNT"].ToString() == "0")
                                {

                                    vString8 += "<a href='#' id='btn" + i + "' onclick='useranswer(this.id)' data-='" + dt9.Rows[i]["DTLS_VOTING_KEY"] + "' class='add-to-cart'>";
                                    vString8 += "Vote </a></div></div></div>";
                                }

                                else
                                {

                                    vString8 += "<a href='#' disabled='disabled' class='add-to-cart'>";
                                    vString8 += "Vote </a></div></div></div>";
                                }
                            }
                            else
                            {
                                vString8 += "<a href='#' id='btn" + i + "' onclick='useranswer(this.id)' data-='" + dt9.Rows[i]["DTLS_VOTING_KEY"] + "' class='add-to-cart'>";
                                vString8 += "Vote </a></div></div></div>";
                            }

                        }
                        voting_desc.InnerHtml = vString8;

                    }

                    //incallrates
                    if (dt7.Rows.Count > 0)
                    {
                        vString9 = "<table class='table table-hover'><thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead><tbody>";
                        for (int i = 0; i < dt7.Rows.Count; i++)
                        {
                            vString9 += "<tr><td>" + dt7.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt7.Rows[i]["PRICE"] + "</td><td>" + dt7.Rows[i]["ADD_HOURS"] + "</td></tr>";
                        }
                        vString9 += "</tbody></table>";

                        incallrate_desc.InnerHtml = vString9;

                    }

                    //outcallrates
                    if (dt14.Rows.Count > 0)
                    {
                        vString10 = "<table class='table table-hover'><thead><tr><th scope='col'>Hours</th><th scope='col'>Rate</th><th scope='col'>Additional Hours</th></tr></thead><tbody>";
                        for (int i = 0; i < dt14.Rows.Count; i++)
                        {
                            vString10 += "<tr><td>" + dt14.Rows[i]["HOURS"] + "</td><td> " + " $ " + dt14.Rows[i]["PRICE"] + "</td><td>" + dt14.Rows[i]["ADD_HOURS"] + "</td></tr>";
                        }
                        vString10 += "</tbody></table>";

                        outcallrate_desc.InnerHtml = vString10;

                    }

                    //selfie

                    if (dt11 != null && dt1.Rows.Count > 0)
                    {
                        vString11 += "<div class='isotope_container isotope row masonry-layout' data-filters='.isotope_filters'>";
                        for (int i = 0; i < dt11.Rows.Count; i++)
                        {
                            vString11 += "<div class='isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6'><div class='vertical-item gallery-item content-absolute text-center cs'><div class='item-media'>";
                            vString11 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["SELFIE"].ToString() + dt11.Rows[i]["SELFIE_IMG"]) + "' alt='Allykat' title='Allykat' style='height:270px; width:300px;'><div class='media-links'><div class='links-wrap'><a class='p-view prettyPhoto' title='' data-gal='prettyPhoto[gal]' href='" + ResolveClientUrl(ConfigurationManager.AppSettings["SELFIE"].ToString() + dt11.Rows[i]["SELFIE_IMG"]) + "' style='height:270px; width:300px;'></a></div>";
                            vString11 += "</div></div></div></div>";

                        }
                        vString11 += "</div>";
                        selfie_desc.InnerHtml = vString11;
                    }

                    //news
                    if (dt10.Rows.Count > 0)
                    {
                        vString12 = "<div class='newsannounce'><div class='owl-carousel blog-carousel theme-owl-carousel' data-margin='30' data-nav='false' data-dots='true' data-center='true' data-loop='true' data-items='5' data-autoplay='false' data-responsive-xs='1' data-responsive-sm='2' data-responsive-md='2' data-responsive-lg='3' data-responsive-xlg='5'>";
                        for (int i = 0; i < dt10.Rows.Count; i++)
                        {
                            vString12 += " <article class='vertical-item post format-standard text-center'><div class='item-media entry-thumbnail'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt10.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'>";
                            vString12 += "<div class='media-links'><a class='abs-link' title='' href='#'></a></div></div><div class='item-content entry-content'><h4 class='topmargin_0 bottommargin_20'>";
                            vString12 += "<a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt10.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt10.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt10.Rows[i]["NEWS_HEADING"] + "</a></h4>";
                            vString12 += " <span class='entry-meta text-uppercase fontsize_12'><span class='author'>Admin</span> |<time datetime='2016-09-03T15:05:23+00:00'>" + dt10.Rows[i]["NEWS_DATE"] + "</time></span></div></article>";
                        }
                        vString12 += "</div></div>";
                        news_desc.InnerHtml = vString12;
                    }

                    //gallery

                    if (dt3 != null && dt3.Rows.Count > 0)
                    {

                        for (int i = 0; i < dt3.Rows.Count; i++)
                        {
                            vString14 += "<div class='isotope-item col-lg-3 col-md-4 col-sm-6 col-xs-6'><div class='vertical-item content-absolute'><div class='item-media'>";
                            vString14 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt3.Rows[i]["GALLERY_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'></div></div>";
                            vString14 += "<div class='item-content text-center before_cover cs'><div class='links-wrap'>";
                            vString14 += "<a class='p-view prettyPhoto pull-right' title='' data-gal='prettyPhoto[gal]' href='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt3.Rows[i]["GALLERY_IMG"]) + "'></a>";
                            vString14 += "</div><div class='bg_overlay'></div></div></div></div>";
                        }

                        gallery_desc.InnerHtml = vString14;
                    }
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
        }


        [System.Web.Services.WebMethod]
        public static string GetEvent(string date1)
        {
            DataTable getevent1;
            String errMsg1 = String.Empty;
            getevent1 = new DataTable();
            if (date1 == "Date")
            {
                date1 = DateTime.UtcNow.ToLongDateString();
            }
            using (BADtlsEvent oBME = new BADtlsEvent())
            {

                getevent1 = oBME.Get("SRH_DTLS_DATE", 1, date1, ref errMsg1, "2020", 1);

            }

            if (getevent1.Rows.Count > 0)
            {
                return getevent1.Rows[0]["EVENTS_TITLE"].ToString();
            }
            else
            {
                return "Sorry, no events to selected date";
            }
        }
        private String FillDdlMenu()
        {
            try
            {
                errMsg = String.Empty;
                //hf_HEAD_MENU_KEY.Value = ddl_HEAD_MENU_KEY.SelectedValue;
                using (BAMastCity oBMC = new BAMastCity())
                {
                    oBMC.BindDdl(ref ddl_CITY, 1, ref errMsg, null, 1);
                    return errMsg;
                }

                //hf_HEAD_MENU_KEY.Value = ddl_HEAD_MENU_KEY.SelectedValue;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        protected void btn_Save_Menu_ServerClick(object sender, EventArgs e)
        {
            int vref;
            // int check = ddl_CITY.SelectedIndex;
            EntitySubscribe oBMAST = null;
            oBMAST = new EntitySubscribe();
            string code = Convert.ToString(Guid.NewGuid());
            oBMAST.ACTIVATION_CODE = code;
            oBMAST.MAST_CITY_KEY = Convert.ToInt32(ViewState["SELECTED_VALUE"]);
            oBMAST.EMAIL_ID = txt_EMAIL.Text;
            oBMAST.ENT_USER_KEY = 1;
            oBMAST.COMPANY_KEY = 1;



            using (BASubscribe oBMC = new BASubscribe())
            {

                dt60 = oBMC.Get<Int32>("GET_COUNT", 1, txt_EMAIL.Text, ref errMsg, "2019", 1);

                if (dt60 != null && dt60.Rows.Count > 0)

                {
                    if (dt60.Rows[0]["COUNT_TOUR"].ToString() != "0")
                    {
                        Response.Write("<script>alert('You have already subscribe')</script>");
                    }
                    else
                    {
                        vref = oBMC.SaveChanges("INSERT", oBMAST, "", ref errMsg, ref errMsg, Convert.ToString(DateTime.Now), 1);
                        if (vref == 1)
                        {
                            sendemail(code);
                            Response.Write("<script>alert('Please check your inbox')</script>");
                        }
                    }
                }
                else
                {
                    vref = oBMC.SaveChanges("INSERT", oBMAST, "", ref errMsg, ref errMsg, Convert.ToString(DateTime.Now), 1);
                    if (vref == 1)
                    {
                        sendemail(code);
                        Response.Write("<script>alert('Please check your inbox')</script>");
                    }
                }
            }

        }

        public int sendemail(string code)
        {
            int errMsg = 0;
            try
            {


                string form_username = ConfigurationManager.AppSettings["form_username"].ToString();
                string form_password = ConfigurationManager.AppSettings["form_password"].ToString();



                //string messages = otp + " is your OTP for Web4Escort registration.";

                using (MailMessage mm = new MailMessage(form_username, txt_EMAIL.Text))
                {
                    mm.Subject = "Web4Escort subscribe my tour";
                    string strBody = string.Empty;
                    strBody += "<html><head></head><body>";
                    strBody += Environment.NewLine;
                    strBody += "<a href='" + Request.Url.AbsoluteUri.Replace("index.aspx", "index.aspx?ActivationCode=" + code.ToString()) + "'>Click the following link to subscribe the tour.</a>";
                    strBody += "<br/>Thanks.</body></html>";

                    mm.Body = strBody.ToString();
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(form_username, Encrypt.Decryptdata(form_password)); //Encrypt.Decryptdata()
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }

                errMsg = 1;

                return errMsg;
            }
            catch (Exception ex)
            {
                return errMsg;
                ex.Message.ToString();
            }
        }
    }
}