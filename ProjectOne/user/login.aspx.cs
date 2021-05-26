using App.BAL;
using App.BAL.Master;
using App.BAL.Setup;
using App.BAL.Utility;
using App.CORE.Domain.Setup;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace ProjectOne.user
{
    public partial class login : System.Web.UI.Page
    {
        string user_key;
        String errMsg = String.Empty;
        String vString2 = String.Empty;
        String vString3 = String.Empty;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        EntitySysUser oSysUser = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                HttpCookie cookie = Request.Cookies["__asd"];
                if (cookie != null)
                {
                    string username = cookie["a"];
                    string password = cookie["p"];

                    DataTable dt = null;
                    Int32 vRef = 0;
                    using (BASysUser oBSU = new BASysUser())
                    {
                        dt = oBSU.Get<Int16>("TYPE_1", 0, Encrypt.Decryptdata(username), 1, ref errMsg, null, null);
                    }
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            if (password == Encrypt.EncryptASCII(Encrypt.Decryptdata(Convert.ToString(dr["USER_PASSWORD"]))))
                            {
                                setUserSession(dr);
                                vRef = 1;
                            }
                        }

                        if (vRef == 1)
                            Response.Redirect("~/index.aspx");
                    }
                }
            }
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

            login_img.Src = ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]);
        }
        private void MessageBox(String strMsg, String exMsg)
        {
            if (!(String.IsNullOrEmpty(exMsg)))
                exMsg = CommonOp.ModifyExceptionMessage(exMsg);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "OpenPopup('" + strMsg + "', '" + exMsg + "')", true);
        }
        private void setUserSession(DataRow dr)
        {
            oSysUser = new EntitySysUser();
            oSysUser.USER_KEY = Convert.ToInt16(dr["USER_KEY"]);
            oSysUser.USER_NAME = Convert.ToString(dr["USER_NAME"]);
            oSysUser.USER_TYPE_KEY = Convert.ToInt32(dr["USER_TYPE_KEY"]);
            oSysUser.USER_TYPE = Convert.ToString(dr["USER_TYPE"]);
            oSysUser.MAST_HRD_PERSONNEL_KEY = Convert.ToInt32(dr["MAST_HRD_PERSONNEL_KEY"]);
            oSysUser.USER_EMAIL = Convert.ToString(dr["USER_EMAIL"]);
            oSysUser.COMPANY_KEY = 1;

            Session["oSysUser"] = oSysUser;
            Session["ID"] = oSysUser.USER_NAME;
            Session["USERID"] = oSysUser.USER_KEY;
            Session["useremail"] = oSysUser.USER_EMAIL;
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DataTable dt = null;
                try
                {
                    Int32 vRef = 0;
                    using (BASysUser oBSU = new BASysUser())
                    {
                        dt = oBSU.Get<Int16>("TYPE_3", 0, txt_Email.Value, 1, ref errMsg, null, 1);
                    }
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            if (Encrypt.Encryptdata(txtPassword.Text) == Convert.ToString(dr["USER_PASSWORD"]))
                            {
                                setUserSession(dr);

                                user_key = Convert.ToString(dr["USER_KEY"]);

                                string hash = "f0xle@rn";

                                byte[] data = UTF8Encoding.UTF8.GetBytes(user_key);
                                using (System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider())
                                {
                                    byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash));
                                    using (System.Security.Cryptography.TripleDESCryptoServiceProvider tripDes = new System.Security.Cryptography.TripleDESCryptoServiceProvider() { Key = keys, Mode = System.Security.Cryptography.CipherMode.ECB, Padding = System.Security.Cryptography.PaddingMode.PKCS7 })
                                    {
                                        System.Security.Cryptography.ICryptoTransform transform = tripDes.CreateEncryptor();
                                        byte[] results = transform.TransformFinalBlock(data, 0, data.Length);
                                        user_key = Convert.ToBase64String(results, 0, results.Length);
                                        Session["user"] = user_key;
                                    }

                                }

                                HttpCookie objCookie = new HttpCookie("__asd");
                                objCookie["a"] = Encrypt.Encryptdata(txt_Email.Value).ToString();
                                objCookie["p"] = Encrypt.EncryptASCII(txtPassword.Text).ToString();
                                objCookie.Expires = DateTime.Now.AddDays(60);
                                Response.Cookies.Add(objCookie);
                                vRef = 1;
                            }

                        }




                        if (vRef == 1)
                        {


                            Response.Redirect("~/index.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();


                        }



                        else
                            //MessageBox(Message.msgErr401, errMsg);
                            ClientScript.RegisterStartupScript(GetType(), "popupinvaid", "popupinvaid();", true);
                    }
                    else
                        MessageBox(Message.msgErrPage, errMsg);
                }
                catch (Exception ex)
                {
                    MessageBox(Message.msgErrCommon, ex.Message);
                }
                finally
                {
                    if (oSysUser != null)
                        oSysUser = null;
                    if (dt != null)
                    {
                        dt.Dispose(); dt = null;
                    }
                }
            }
        }

        private void SendActivationEmail(String activationCode, String to_username)
        {
            try
            {
                string form_username = ConfigurationManager.AppSettings["form_username"].ToString();
                string form_password = ConfigurationManager.AppSettings["form_password"].ToString();
                string smtpAddress = "smtp.gmail.com";
                int portNumber = 587;
                bool enableSSL = true;

                using (MailMessage mail = new MailMessage())
                {
                    //string template = File.ReadAllText(Server.MapPath("~/main-assets/regmailtemplate.html"));

                    string body = "<br/><br/>successfully created. Please click on the below link to verify your account" +
                    " <br/><br/><a href='" + Request.Url.AbsoluteUri.Replace("login.aspx", "useractivation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a> ";

                    //string body = template.Replace("PLINK", Request.Url.AbsoluteUri.Replace("~/login/", "useractivation.aspx?ActivationCode=" + activationCode));

                    mail.From = new MailAddress(form_username);
                    mail.To.Add(to_username);
                    mail.Subject = "Account Activation";
                    mail.Body = body.ToString();
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(form_username, Encrypt.Decryptdata(form_password));
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                    //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your enquiry is submitted. Thank you for contacting us. ');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
            }
            //Session["key"] = dr["USER_KEY"];
        }
    }
}