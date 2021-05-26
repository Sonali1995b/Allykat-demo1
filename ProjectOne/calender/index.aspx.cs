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
using Newtonsoft.Json;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json.Linq;
using System.Collections;

namespace ProjectOne.calender
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty;

        DataTable dt = null;
        DataTable dt1 = null;

       

        protected void Page_PreLoad(object sender, EventArgs e)
        {

            dt = new DataTable();
            dt1 = new DataTable();

            using (BADtlsNews oBMC = new BADtlsNews())
            {
                dt = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
            }

          
            using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
            {
                dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 109, "", ref errMsg, "2020", 1);
            }

            Page.ClientScript.RegisterStartupScript(GetType(), "err", "my_fun();", true);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //news
            if (dt.Rows.Count > 0)
            {
                vString = "<div class='owl-carousel blog-carousel theme-owl-carousel' data-margin='30' data-nav='false' data-dots='true' data-center='true' data-loop='true' data-items='5' data-autoplay='false' data-responsive-xs='1' data-responsive-sm='2' data-responsive-md='2' data-responsive-lg='3' data-responsive-xlg='5'>";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    vString += " <article class='vertical-item post format-standard text-center'><div class='item-media entry-thumbnail'><img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["NEWS"].ToString() + dt.Rows[i]["NEWS_IMG"]) + "' alt='Allykat' title='Allykat'>";
                    vString += "<div class='media-links'><a class='abs-link' title='' href='#'></a></div></div><div class='item-content entry-content'><h4 class='topmargin_0 bottommargin_20'>";
                    vString += "<a href='" + ResolveClientUrl("~/news-details/") + Encrypt.EncryptASCII(dt.Rows[i]["DTLS_NEWS_KEY"].ToString()) + "/" + dt.Rows[i]["NEWS_HEADING"].ToString().Replace(' ', '-') + "'>" + dt.Rows[i]["NEWS_HEADING"] + "</a></h4>";
                    vString += " <span class='entry-meta text-uppercase fontsize_12'><span class='author'>Admin</span> |<time datetime='2016-09-03T15:05:23+00:00'>" + dt.Rows[i]["NEWS_DATE"] + "</time></span></div></article>";
                }
                vString += "</div>";
                news_desc.InnerHtml = vString;
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Byte vRef = 0; Int32 vKey = 0;
            EntityDtlsAppointment oBMAST = null;
            HttpCookie cookie = HttpContext.Current.Request.Cookies["__asd"];

            try
            {
                if (cookie != null && HttpContext.Current.Session["ID"] != null)
                {
                    errMsg = String.Empty;

                    oBMAST = new EntityDtlsAppointment();


                    oBMAST.TIME_SPAN = hf_checkbox.Value;
                    oBMAST.PRICE = Convert.ToDouble(hf_price.Value);
                    oBMAST.EVENT_DATE = hf_date.Value;
                    oBMAST.EVENT_DAY = hf_day.Value;
                    oBMAST.DESCRIPTION = txt_desc.Value;
                    oBMAST.TAG_STATUS = "0";
                    oBMAST.TAG_DELETE = 0;
                    oBMAST.COMPANY_KEY = 1;
                    oBMAST.ENT_USER_KEY = Convert.ToInt32(Session["USERID"]);
                    oBMAST.USER_EMAIL = Convert.ToString(Session["useremail"]);

                    using (BALDtlsAppointment oBMC = new BALDtlsAppointment())
                    {
                        vRef = oBMC.SaveChanges<Object, Int32>("INSERT", oBMAST, null, ref vKey, ref errMsg, "2019", 1);

                        if (vRef == 1)
                        {
                            //MessageBox(2, Message.msgSaveNew, "");
                            ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);
                            //Response.Redirect("/index.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();

                        }
                        else if (vRef == 2)
                            //MessageBox(2, Message.msgSaveDuplicate, errMsg);
                            ClientScript.RegisterStartupScript(GetType(), "popupduplicatedata", "popupduplicatedata();", true);
                        else
                            // MessageBox(2, Message.msgSaveErr, errMsg);
                            //Response.Write("<script>alert('Data Already Exits')</script>");
                            ClientScript.RegisterStartupScript(GetType(), "popupduplicatedata", "popupduplicatedata();", true);
                    }
                }
                else
                {
                    Response.Redirect("/user/login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                //MessageBox(2, Message.msgErrCommon, ex.Message);
            }
            finally
            {
                if (oBMAST != null)
                    oBMAST = null;
            }
        }



        [System.Web.Services.WebMethod]

        public static string GetEvent(string date1)
        {

            DataTable getevent1 = new DataTable();
            DataTable getprice = new DataTable();
            int datenum = 0;
            if (date1 != "undefined" && date1!="")
            {
                datenum = Convert.ToInt32( date1); 
            }

            String errMsg1 = String.Empty;
            List<EntityBookingTime> entbook = new List<EntityBookingTime>();
            EntityBookingTime eBKT = new EntityBookingTime();

            string json = "";
            if (date1 == "Date")
            {
                date1 = DateTime.UtcNow.ToLongDateString();
            }
            else
            {
                using (BABookingTime oBME = new BABookingTime())
                {
                    getevent1 = oBME.GetDay("GET_BY_DAY", 1, datenum, ref errMsg1, "2020", 9);
                    
                    if (getevent1.Rows.Count > 0)
                    {
                        foreach (DataRow row in getevent1.Rows)//or similar
                        {
                            EntityBookingTime book = new EntityBookingTime();
                            book.DTLS_TIMETABLE_KEY = Convert.ToInt32(row["DTLS_TIMETABLE_KEY"]);
                            book.START_TIME = Convert.ToString(row["START_TIME"]);
                            book.END_TIME = Convert.ToString(row["END_TIME"]);
                            book.PRICE = Convert.ToDouble(row["PRICE"]);
                            entbook.Add(book);
                        }
                        json = JsonConvert.SerializeObject(entbook);
                    }
                    //else
                    //{
                    //    var test = new
                    //    {
                    //        msg = "Please call",     
                    //        entered = DateTime.UtcNow
                    //    };

                    //    json = JsonConvert.SerializeObject(test);
                    //    Console.WriteLine(json); // single line JSON string

                    //    string jsonFormatted = JValue.Parse(json).ToString(Formatting.Indented);

                    //    Console.WriteLine(jsonFormatted);
                    //}

                }

            }
            return json;
        }

        [System.Web.Services.WebMethod]
        public static string GetAllEvent()
        {

            DataTable getall = new DataTable();
            DataTable getcal = new DataTable();

            String errMsg1 = String.Empty;
            List<EntityDtlsAppointment> entbook = new List<EntityDtlsAppointment>();


            string json = "";


            using (BALDtlsAppointment oBME = new BALDtlsAppointment())
            {
                getall = oBME.GetAllEvent("GET_APPROVED", 1, "Approved", ref errMsg1, "2020", 1);
                if (getall!=null && getall.Rows.Count > 0)
                {
                    foreach (DataRow row in getall.Rows)//or similar
                    {
                        EntityDtlsAppointment eNDA = new EntityDtlsAppointment();
                        eNDA.title = Convert.ToString(row["title"]);
                        eNDA.start = Convert.ToString(row["start"]);
                        eNDA.end = Convert.ToString(row["end"]);
                        entbook.Add(eNDA);
                    }
                    json = JsonConvert.SerializeObject(entbook);
                }
                else
                {
                    getcal = oBME.Get("GET_CALENDER", 1, "", ref errMsg1, "2020", 1);
                    if (getcal.Rows.Count > 0)
                    {
                        foreach (DataRow row1 in getcal.Rows)//or similar
                        {
                            EntityDtlsAppointment eNDAc = new EntityDtlsAppointment();
                            eNDAc.title = Convert.ToString(row1["title"]);
                            eNDAc.start = Convert.ToString(row1["start"]);
                            eNDAc.end = Convert.ToString(row1["end"]);
                            entbook.Add(eNDAc);
                        }
                        json = JsonConvert.SerializeObject(entbook);
                    }
                }

            }

            return json;
        }

        
    }
}