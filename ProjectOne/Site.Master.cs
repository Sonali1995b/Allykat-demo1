using App.BAL.Master;
using App.BAL.Utility;
using System;
using System.Configuration;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web;
using System.IO;

namespace ProjectOne
{
    public partial class Site : System.Web.UI.MasterPage
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString3 = String.Empty, vString4 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
        DataTable dt10 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //Sidebar Content
                    dt = new DataTable();
                    dt1 = new DataTable();
                    dt2 = new DataTable();
                    dt3 = new DataTable();
                    dt4 = new DataTable();
                    dt10 = new DataTable();

                    using (BAHomeSettings oBME = new BAHomeSettings())
                    {
                        dt = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                    }

                    using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                    {
                        dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 1, "", ref errMsg, "2020", 1);
                        dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                    }


                    using (BAHeadHomeBgSetting oBME = new BAHeadHomeBgSetting())
                    {
                        dt4 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                    }



                    if (dt10 != null && dt10.Rows.Count > 0)
                    {
                        vString1 += "<span class='grey'>Phone:</span>" + dt10.Rows[0]["CONTACT_NO"] + "<br ><span class='grey'>Fax:</span> " + dt10.Rows[0]["CONTACT_NO"] + "";
                        phone_detail.InnerHtml = vString1;
                        add.InnerHtml = dt10.Rows[0]["ADDRESS"].ToString();
                        mail_address.InnerHtml = " <a href='mailto: " + dt10.Rows[0]["MAIL"] + "'>" + dt10.Rows[0]["MAIL"] + "</a>";
                        vString += "<a class='social-icon color-bg-icon soc-facebook' target='_blank' href='" + dt10.Rows[0]["FACEBOOK_LINK"] + "' title='Facebook'></a>";
                        vString += "<a class='social-icon color-bg-icon soc-twitter'  target='_blank' href='" + dt10.Rows[0]["TWITTER_LINK"] + "' title='Twitter'></a>";
                        vString += "<a class='social-icon color-bg-icon soc-instagram'  target='_blank' href='" + dt10.Rows[0]["LINKEDIN_LINK"] + "' title='Instagram'></a>";
                        social_links.InnerHtml = vString;
                        vString2 += "<a href='/' ><img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["HOME"].ToString() + dt10.Rows[0]["LOGO_NAME"]) + "' alt='Allykat' title='Allykat'></a>";
                        //moblogo.InnerHtml = vString2;
                        vString3 += "<a href='/index.aspx'><img src='" + ResolveClientUrl("~" + ConfigurationManager.AppSettings["HOME"].ToString() + dt10.Rows[0]["LOGO_NAME"]) + "' alt='Allykat' title='Allykat'></a>";
                        logo_img.InnerHtml = vString3;

                        // vString4 += "<li><a class='loginbtn' href='/user/login.aspx'>Login</a></li>";
                        mail_div.InnerHtml = "<li><a href='mailto: " + dt10.Rows[0]["MAIL"] + "'><i class='fa fa-envelope-o' aria-hidden='true'></i></a></li>";
                        phn_div.InnerHtml = "<li><a href='tel:" + dt10.Rows[0]["CONTACT_NO"] + "'><i class='fa fa-phone' aria-hidden='true'></i></a></li>";
                      
                    }

                    HttpCookie cookie = Request.Cookies["__asd"];

                    if (cookie != null && Session["ID"] != null)
                    {
                        //btn_login.Style.Add("display", "none");
                        ddl_menu.Style.Remove("display");
                        vString = "";
                        vString += "<a href='' data-toggle='dropdown'>" + Session["ID"].ToString() + "</a>";
                        vString += "<ul class='dropdown-menu logoutbtn'>";
                        vString += "<li><a href='/user/logout.aspx'>Logout</a></li></ul>";
                        ddl_menu.InnerHtml = vString;
                        logmenu.Visible = false;
                        regmenu.Visible = false;
                    }
                    else
                    {
                        ddl_menu.InnerHtml = "<a href='/user/login.aspx'>Login</a>";
                    }


                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
                }
            }
        }



        protected void btn_Submit_click(object sender, EventArgs e)
        {

            try
            {
                string to_username = ConfigurationManager.AppSettings["to_username"].ToString();
                //string to_username = txt_Email.Text;
                string form_username = ConfigurationManager.AppSettings["form_username"].ToString();
                string form_password = ConfigurationManager.AppSettings["form_password"].ToString();
                string smtpAddress = "smtp.gmail.com"; //103.21.58.247
                int portNumber = 587;
                bool enableSSL = true; //false


                using (MailMessage mail = new MailMessage())
                {
                    //StringBuilder body = new StringBuilder();
                    //body.Append("Name: " + txt_Name.Value + "<br/>");
                    //body.Append("Email Id: " + txt_Email.Text + "<br/>");
                    //// body.Append("Phone:" + txt_Phone.Value + "<br/>");
                    //body.Append("Message: " + txt_Message.Value + "<br/>");

                    //mail.From = new MailAddress(form_username);
                    //mail.To.Add(to_username);
                    ////mail.Subject = txt_Subject.Value;
                    //mail.Body = body.ToString();
                    //mail.IsBodyHtml = true;

                    string template = File.ReadAllText(Server.MapPath("~/main-assets/contactmail.html"));
                    template = template.Replace("FULLNAME", txt_Name.Value);
                    template = template.Replace("EMAILID", txt_Email.Text);
                    //template = template.Replace("SUBJECT", txt_Subject.Text);
                    template = template.Replace("MESSAGE", txt_Message.Value);

                    mail.From = new MailAddress(form_username);
                    mail.To.Add(to_username);
                    mail.Subject = "New appointment query from " + txt_Name.Value + " for Allykat";
                    mail.Body = template.ToString();
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(form_username, Encrypt.Decryptdata(form_password));
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                }

                using (MailMessage mail = new MailMessage())
                {

                    string template = File.ReadAllText(Server.MapPath("~/main-assets/contactreply.html"));
                    template = template.Replace("FULLNAME", txt_Name.Value);


                    mail.From = new MailAddress(form_username);
                    mail.To.Add(txt_Email.Text);
                    mail.Subject = "Thank you for contacting on Allykat";
                    mail.Body = template.ToString();
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(form_username, Encrypt.Decryptdata(form_password));
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                }
                Page.ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);
                txt_Name.Value = "";
                txt_Email.Text = "";
                txt_Message.Value = "";
                
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
            }

        }


        //protected void btn_Submit_click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        string toMail = ConfigurationManager.AppSettings["toMail"].ToString();
        //        string fromMail = ConfigurationManager.AppSettings["fromMail"].ToString();
        //        string mailUser = ConfigurationManager.AppSettings["mailUser"].ToString();
        //        string mailPassword = ConfigurationManager.AppSettings["mailPassword"].ToString();
        //        string smtpAddress = "smtp.sendgrid.net"; //smtp.gmail.com
        //        int portNumber = 25;
        //        bool enableSSL = true;


        //        using (MailMessage mail = new MailMessage())
        //        {
        //            StringBuilder body = new StringBuilder();
        //            body.Append("Name: " + txt_Name.Value + "<br/>");
        //            //body.Append("Phone No: " + .Value + "<br/>");
        //            body.Append("Email ID: " + txt_Email.Text + "<br/>");
        //            //body.Append("Rate: " + budget.Value + "<br/>");
        //            body.Append("Message: " + txt_Message.Value + "<br/>");

        //            mail.From = new MailAddress(fromMail);
        //            mail.To.Add(toMail);
        //            mail.Subject = "New Visitor at Parisknight.com.au";
        //            mail.Body = body.ToString();
        //            mail.IsBodyHtml = true;

        //            using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
        //            {
        //                smtp.UseDefaultCredentials = false;
        //                smtp.Credentials = new NetworkCredential(mailUser, Encrypt.Decryptdata(mailPassword));
        //                smtp.EnableSsl = enableSSL;
        //                smtp.Send(mail);
        //            }
        //            Page.ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);
        //            txt_Name.Value = "";
        //            txt_Email.Text = "";
        //            txt_Message.Value = "";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Page.ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);
        //    }

        //}
    }
}