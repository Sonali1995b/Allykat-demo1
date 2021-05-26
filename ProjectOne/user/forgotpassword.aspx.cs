using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI.HtmlControls;
using App.BAL;
using App.BAL.Setup;
using App.BAL.Utility;
using App.CORE.Domain.Setup;
using System.Data;
using App.BAL.Master;

namespace ProjectOne.user
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        String errMsg = String.Empty;
        String vString2 = String.Empty;
        String vString3 = String.Empty;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        EntitySysUser oSysUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
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

            forgot_img.Src = ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]);
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            EntitySysUser oBMST = new EntitySysUser();
            String to_username = txt_User_Email.Text;
            DataTable dt = new DataTable();
            using (BASysUser BASU = new BASysUser())
            {
                dt = BASU.Get("TYPE_3", 0, to_username, ref errMsg, "2021", 1);
                oBMST.USER_NAME = dt.Rows[0]["USER_NAME"].ToString();
                oBMST.USER_EMAIL = dt.Rows[0]["USER_EMAIL"].ToString();
            }
            String txt_User_Name = oBMST.USER_NAME;
            Session["Email"] = oBMST.USER_EMAIL;
            
            String EmailAddress = Encrypt.Encryptdata(txt_User_Email.Text);
            if (SendPhoneVerification(txt_User_Email.Text))
            {
                Response.Redirect("/user/resetpassword.aspx");
            }
        }

        private bool SendPhoneVerification(String user_email)
        {
            String errMsg = String.Empty;
            DataTable dt = new DataTable();
            EntitySysUser oBMAST = new EntitySysUser();
            bool rt = false;

            using (BASysUser oBMC = new BASysUser())
            {
                if (txt_User_Email.Text != oBMAST.USER_EMAIL)
                {
                    dt = oBMC.Get<Int16>("TYPE_3", 0, txt_User_Email.Text, 1, ref errMsg, null, null);


                    if (dt.Rows.Count > 0)
                    {
                        rt = true;
                    }


                }
            }
            return rt;
        }

    }
}