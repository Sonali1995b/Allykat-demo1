using App.BAL.Master;
using App.BAL.Utility;
using App.CORE.Domain.Master;
using System;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Net;
using System.Net.Mail;

namespace ProjectOne.tour
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString7 = String.Empty, vString8 = String.Empty, vString15 = String.Empty;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
        DataTable dt7 = null;
        DataTable dt10 = null;
        DataTable dt14 = null;
        DataTable dt60 = null;
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                //Sidebar Content
                dt = new DataTable();
                dt1 = new DataTable();
                dt2 = new DataTable();
                dt3 = new DataTable();
                dt4 = new DataTable();
                dt7 = new DataTable();
                dt14 = new DataTable();
                dt10 = new DataTable();


                using (BADtlsTour oBME = new BADtlsTour())
                {
                    dt1 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }


                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt2 = oBME.GetPageSetting("SRH_HEAD_KEY", 87, "", ref errMsg, "2020", 1);
                    dt3 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                using (BAHeadHomeBgSetting oBME = new BAHeadHomeBgSetting())
                {

                    dt4 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
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
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "my_fun();", true);
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
                ViewState["SELECTED_VALUE"] = ddl_CITY.SelectedValue;
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
                }
                if (dt1 != null && dt1.Rows.Count > 0)
                {
                    vString1 += "<table class='table table-hover'><thead><tr><th scope ='col'>To</th><th scope='col'>From</th><th scope ='col'>Untill</th></tr></thead><tbody>";
                    for (int j = 0; j < dt1.Rows.Count; j++)
                    {
                        vString1 += "<tr><td>" + dt1.Rows[j]["TOUR_PLACE"] + "</td><td>" + dt1.Rows[j]["FROM_DATE"] + "</td><td>" + dt1.Rows[j]["TO_DATE"] + "</td></tr></tbody>";
                    }
                    if (vString1 != null)
                    {
                        vString1 += "</table>";
                        tour_list.InnerHtml = vString1;
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
                if (dt2 != null && dt2.Rows.Count > 0)
                {
                    Page.Title = dt2.Rows[0]["PAGE_TITLE"].ToString();
                    Page.MetaDescription = dt2.Rows[0]["META_DESCRIPTION"].ToString();
                    Page.MetaKeywords = dt2.Rows[0]["META_KEYWORD"].ToString();
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
                dt2 = null;
                dt3 = null;

                vString = String.Empty;
                vString1 = String.Empty;
                vString2 = String.Empty;
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