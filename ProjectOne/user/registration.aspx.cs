using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using App.BAL;
using App.BAL.Master;
using App.BAL.Setup;
using App.BAL.Utility;
using App.CORE.Domain.Master;
using App.CORE.Domain.Setup;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace ProjectOne.user
{
    public partial class registration : System.Web.UI.Page
    {
        String errMsg = String.Empty;
        String vString2 = String.Empty;
        String vString3=String.Empty;
        DataTable dt = null;
        DataTable dt2 = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        EntitySysUser oSysUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DDLCountry();
                using (BAHomeSettings oBME = new BAHomeSettings())
                {
                    dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 1, "", ref errMsg, "2020", 1);
                    dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                vString2 += "<a href='/' ><img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["HOME"].ToString() + dt10.Rows[0]["LOGO_NAME"]) + "' alt='Allykat' title='Allykat'></a>";
                //moblogo.InnerHtml = vString2;
                vString3 += "<a href='/index.aspx'><img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["HOME"].ToString() + dt10.Rows[0]["LOGO_NAME"]) + "' alt='Allykat' title='Allykat'></a>";
                logo_img.InnerHtml = vString3;
                regis_img.Src = ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]);
                try
                {
                    if (HttpContext.Current.Session["oSysUser"] != null)
                    {
                        oSysUser = (EntitySysUser)Session["oSysUser"];
                        if (!IsPostBack)
                        {
                            oSysUser.TAG_PAGE_REFRESH = Server.UrlEncode(System.DateTime.Now.ToString());
                            errMsg = String.Empty;

                        }
                    }
                    else
                    {
                        if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "1")
                        {
                            Response.Write("<script>window.close();</" + "script>");
                            Response.End();
                        }
                        else
                        {
                            // Response.Redirect("../index.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox(1, Message.msgErrCommon, ex.Message);
                }
            }
           
        }

        private void MessageBox(Int16 pTabid, String strMsg, String exMsg)
        {
            string pType = strMsg == "print" ? "1" : "0";
            if (!(String.IsNullOrEmpty(exMsg)))
                exMsg = CommonOp.ModifyExceptionMessage(exMsg);
            if (pTabid == 1)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenTab1", "OpenTab1('" + strMsg + "')", true);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenTab2", "OpenTab2('" + strMsg + "')", true);
        }

        private void ClearControl()
        {
            txt_User_Name.Value = "";
            txt_Phone.Value = "";
            txtPassword.Text = "";
        }

        private void DDLCountry()
        {
            DataTable dt4 = new DataTable();
            String country = String.Empty;
            using (BACountry oBMC = new BACountry())
            {
                dt4 = oBMC.GetData("GET", "", ref errMsg, null, null);
            }
            if (dt4.Rows.Count > 0)
            {
                ddlcountry.DataSource = dt4;

                ddlcountry.DataTextField = "COUNTRYCODE";
                ddlcountry.DataValueField = "PHONECODE";
                ddlcountry.DataBind();
            }
            country = Convert.ToString(dt4.Rows[12]["PHONECODE"]);
            ListItem listItem = ddlcountry.Items.FindByValue(country);

            if (listItem != null)
            {

                listItem.Selected = true;
            }
        }
        protected void btn_signup_Click(object sender, EventArgs e)
        {

            Byte vRef = 0; Int32 vKey = 0;
            EntitySysUser oBMAST = null;
            EntitySysUser oSysUser = new EntitySysUser();

            try
            {
                if (Page.IsValid)
                {
                    Random r = new Random();
                    string OTP = r.Next(100000, 999999).ToString();

                    errMsg = String.Empty;
                    oBMAST = new EntitySysUser();
                    oBMAST.USER_KEY = Convert.ToInt32(hf_USER_KEY.Value);
                    oBMAST.USER_NAME = txt_User_Name.Value;
                    oBMAST.USER_EMAIL = txt_Phone.Value;
                    oBMAST.USER_PASSWORD = Encrypt.Encryptdata(txtPassword.Text);
                    oBMAST.PHONE_CODE = Convert.ToString(ddlcountry.SelectedValue);
                    string phonenumber = Convert.ToString(oBMAST.PHONE_CODE + oBMAST.USER_EMAIL);
                    //oBMAST.ENT_USER_KEY = oSysUser.USER_KEY;
                    //  oBMAST.EDIT_USER_KEY = oSysUser.USER_KEY;
                    //oBMAST.ACTIVATION_CODE = Convert.ToString(Guid.NewGuid());
                    oBMAST.ACTIVATION_CODE = OTP;
                    oBMAST.TAG_DELETE = 0;
                    oBMAST.COMPANY_KEY = 1;

                    Session["OTP"] = OTP;
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");

                    using (BASysUser oBMC = new BASysUser())
                    {
                        if (oBMAST.USER_KEY == 0)
                        {
                            if (txtPassword.Text != null)
                            {
                                if (SendPhoneVerification(txt_Phone.Value))
                                {
                                    vRef = oBMC.SaveChanges<Object, Int32>("INSERT", oBMAST, null, ref vKey, ref errMsg, "2019", 1);
                                    using (BASysUser oBME = new BASysUser())
                                    {
                                        dt2 = oBME.Get("GET_USER_KEY", 1, oBMAST.ACTIVATION_CODE, ref errMsg, "2020", 1);
                                    }
                                    Session["User_Key"] = dt2.Rows[0]["USER_KEY"];
                                }

                                if (vRef == 1)
                                {

                                    sendsms(phonenumber, oBMAST.ACTIVATION_CODE);
                                    ClearControl();
                                    //ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);
                                    //MessageBox(2, Message.msgSaveNew, "");
                                    Response.Redirect("/user/useractivation.aspx", false);
                                    Context.ApplicationInstance.CompleteRequest();

                                }
                                else if (vRef == 2)
                                   // MessageBox(2, Message.msgSaveDuplicate, errMsg);
                                    ClientScript.RegisterStartupScript(GetType(), "popupduplicatedata", "popupduplicatedata();", true);
                                else
                                    // MessageBox(2, Message.msgSaveErr, errMsg);
                                   // Response.Write("<script>alert('Data Already Exits')</script>");
                                ClientScript.RegisterStartupScript(GetType(), "popupduplicatedata", "popupduplicatedata();", true);
                            }
                            else
                            {
                                MessageBox(2, "Both the password not matched", errMsg);
                                ClientScript.RegisterStartupScript(GetType(), "popuppasswordmatch", "popuppasswordmatch();", true);
                            }
                        }
                        oSysUser.TAG_PAGE_REFRESH = Server.UrlEncode(System.DateTime.Now.ToString());




                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox(2, Message.msgErrCommon, ex.Message);
            }
            finally
            {
                if (oBMAST != null)
                    oBMAST = null;
            }
        }

        private bool SendPhoneVerification(String user_email)
        {

            DataTable dt = new DataTable();
            EntitySysUser oBMAST = new EntitySysUser();
            oBMAST.COMPANY_KEY = 1;
            bool rt = true;

            using (BASysUser oBMC = new BASysUser())
            {
                if (txt_Phone.Value != oBMAST.USER_EMAIL)
                {
                    dt = oBMC.Get<Int16>("TYPE_3", 0, txt_Phone.Value, 1, ref errMsg, null, null);


                    if (dt.Rows.Count > 0)
                    {
                        rt = false;
                       // MessageBox(2, "Data Already Exist", errMsg);
                        ClientScript.RegisterStartupScript(GetType(), "popupduplicatedata", "popupduplicatedata();", true);
                    }


                }
            }
            return rt;
        }

        private String sendsms(String to_username, string code)
        {
            EntitySysUser oBMST = new EntitySysUser();

            //String emailId = txt_User_Email.Text;
            String EmailAddress = Encrypt.Encryptdata(txt_Phone.Value);
            try
            {
                string tophone, msg;
                String api_key = ConfigurationManager.AppSettings["api_key"].ToString();
                String api_id = ConfigurationManager.AppSettings["api_id"].ToString();


                WebClient client = new WebClient();

                tophone = to_username;
                msg = "OTP is " + code;
                //string baseUrl = "https://platform.clickatell.com/messages/http/send?apiKey=" + api_key + "&to=" + to + "&content=" + msg + "";
                var request = HttpContext.Current.Request;
                var appUrl = ConfigurationManager.AppSettings["appUrl"].ToString();
                //StringBuilder sb = new StringBuilder(appUrl);
                if (appUrl != null)
                {
                    StringBuilder sb = new StringBuilder(appUrl);

                    sb.Replace("{unique}", api_key);
                    sb.Replace("{phone}", tophone);
                    sb.Replace("{activationcode}", msg);

                    string CURL = sb.ToString();
                    var baseUrl = CURL;
                    string url = new WebClient().DownloadString(baseUrl);
                }
                return "success";
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
                return "fail";
            }

        }

        //private String sendsms(String to_username, string code)
        //{
        //    EntitySysUser oBMST = new EntitySysUser();
        //    to_username = txt_Phone.Value;
        //    //String emailId = txt_User_Email.Text;
        //    String EmailAddress = Encrypt.Encryptdata(txt_Phone.Value);
        //    try
        //    {



        //        String api_key = "ZjuaKTwASVGbiqABIAv6WA==";
        //        String api_id = "2c9af8af7908efdf0179133622fe138f";



        //        WebClient client = new WebClient();
        //        string to, msg;
        //        to = txt_Phone.Value;
        //        msg = "OTP is " + Session["OTP"];
        //        string baseurl = "https://platform.clickatell.com/messages/http/send?apiKey=" + api_key + "&to=" + to + "&content=" + msg + "";
        //        string url = new WebClient().DownloadString(baseurl);



        //        return "success";



        //    }
        //    catch (Exception ex)
        //    {
        //        ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
        //        return "fail";
        //    }

        //}

        //private String sendmail(String to_username, string code)
        //{
        //    EntitySysUser oBMST = new EntitySysUser();
        //    to_username = txt_Phone.Value;
        //    //String emailId = txt_Phone.Text;
        //    String EmailAddress = Encrypt.Encryptdata(txt_Phone.Value);
        //    try
        //    {


        //        // string to_username = ConfigurationManager.AppSettings["to_username"].ToString();
        //        string form_username = ConfigurationManager.AppSettings["form_username"].ToString();
        //        string form_password = ConfigurationManager.AppSettings["form_password"].ToString();
        //        string smtpAddress = "smtp.gmail.com";
        //        int portNumber = 587;
        //        bool enableSSL = true; //false


        //        using (MailMessage mail = new MailMessage())
        //        {
        //            // StringBuilder body = new StringBuilder();

        //            //string strBody = string.Empty;
        //            //strBody += "<html><head></head><body>";
        //            //strBody += Environment.NewLine;
        //            //strBody += "<a href='" + Request.Url.AbsoluteUri.Replace("registration.aspx", "useractivation.aspx?ActivationCode=" + code.ToString()) + "'>Click the following link to activate your account.</a>";
        //            //strBody += "<br/>Thanks.</body></html>";

        //            //mail.From = new MailAddress(form_username);
        //            //mail.To.Add(to_username);
        //            //mail.Subject = "User Activation Mail";
        //            //mail.Body = strBody.ToString();
        //            //mail.IsBodyHtml = true;

        //            string template = File.ReadAllText(Server.MapPath("~/main-assets/useractivation.html"));
        //            template = template.Replace("FULLNAME", txt_User_Name.Value);
        //            template = template.Replace("EMAILID", txt_Phone.Value);
        //            template = template.Replace("PASSWORD", txtPassword.Text);
        //            string body = template.Replace("To activate your account please click here", " <a href = '" + Request.Url.AbsoluteUri.Replace("registration.aspx", "useractivation.aspx?ActivationCode=" + code.ToString()) + "' > To activate your account please click here.</a> ");

        //            mail.From = new MailAddress(form_username);
        //            mail.To.Add(to_username);
        //            mail.Subject = "New registration from " + txt_User_Name.Value;
        //            mail.Body = body.ToString();
        //            mail.IsBodyHtml = true;

        //            using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
        //            {
        //                smtp.UseDefaultCredentials = false;
        //                smtp.Credentials = new NetworkCredential(form_username, Encrypt.Decryptdata(form_password));
        //                smtp.EnableSsl = enableSSL;
        //                smtp.Send(mail);
        //            }

        //            ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);
        //            return "Success";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
        //        return "fail";
        //    }

        //}


    }
}