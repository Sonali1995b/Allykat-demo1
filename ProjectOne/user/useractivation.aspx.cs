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
using System.Net;
using System.Text;

namespace ProjectOne.user
{
    public partial class useractivation : System.Web.UI.Page
    {
        Byte vRef = 0; Int32 vKey = 0;
        String errMsg = String.Empty;
        String vString2 = String.Empty;
        String vString3 = String.Empty;
        DataTable dt = null;
        DataTable dt2 = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        EntitySysUser oBMAST = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            btnlogin.Visible = false;
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
            active_img.Src = ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]);
            
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("/user/login.aspx");
        }
        protected void btn_verify_Click(object sender, EventArgs e)
        {
            oBMAST = new EntitySysUser();
            oBMAST.USER_KEY = Convert.ToInt32(Session["User_Key"]);
            //oBMAST.USER_EMAIL = hf_USER_EMAIL.Value;
            oBMAST.COMPANY_KEY = 1;
            oBMAST.ACTIVATION_CODE = Convert.ToString(Session["OTP"]);


            using (BASysUser BASU = new BASysUser())
            {
                dt2 = BASU.Get("CHECK_OTP", oBMAST.USER_KEY, "", ref errMsg, "", 1);
            }
            oBMAST.ACTIVATION_CODE = Convert.ToString(dt2.Rows[0]["ACTIVATION_CODE"]);
            if (oBMAST.ACTIVATION_CODE == txt_OTP.Value)
            {
                using (BASysUser oBMC = new BASysUser())
                {
                    vRef = oBMC.SaveChanges<Object, Int32>("UPDATE_TAG", oBMAST, null, ref vKey, ref errMsg, "2019", 1);
                }
                div_Activation_Msg.InnerText = "Activation successful.";
                btnlogin.Visible = true;
                otp_div.Visible = false;
            }
            else
            {
                div_Activation_Msg.InnerText = "Invalid OTP.";
                txt_OTP.Value = "";
            }
        }

        protected void btn_resend_Click(object sender, EventArgs e)
        {
            oBMAST = new EntitySysUser();
            oBMAST.USER_KEY = Convert.ToInt32(Session["User_Key"]);
            //oBMAST.USER_EMAIL = hf_USER_EMAIL.Value;
            oBMAST.COMPANY_KEY = 1;
            oBMAST.ACTIVATION_CODE = Convert.ToString(Session["OTP"]);
            
            div_Activation_Msg.InnerText = "OTP resend successfully.";
            
            using (BASysUser BASU = new BASysUser())
            {
                dt2 = BASU.Get("CHECK_OTP", oBMAST.USER_KEY, "", ref errMsg, "", 1);
            }
            oBMAST.USER_EMAIL = Convert.ToString(Convert.ToString(dt2.Rows[0]["PHONE_CODE"]) + Convert.ToString(dt2.Rows[0]["USER_EMAIL"]));
            String activationcode = Convert.ToString(dt2.Rows[0]["ACTIVATION_CODE"]);
            Session["mail"] = oBMAST.USER_EMAIL;
            if (oBMAST.ACTIVATION_CODE == activationcode)
            {
                sendsms(oBMAST.USER_EMAIL, oBMAST.ACTIVATION_CODE);

                otp_div.Visible = true;
                txt_OTP.Value = "";
            }

        }
        private String sendsms(String to_username, string code)
        {
            EntitySysUser oBMST = new EntitySysUser();

            //String emailId = txt_User_Email.Text;
           
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
    }
}