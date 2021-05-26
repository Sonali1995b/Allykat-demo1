using App.BAL.Master;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectOne.testimonials
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString3 = String.Empty;
        Int32 count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
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


                using (BADtlsTour oBME = new BADtlsTour())
                {
                    dt1 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }


                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt4 = oBME.GetPageSetting("SRH_HEAD_KEY", 87, "", ref errMsg, "2020", 1);
                    dt3 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                using (BADtlsClient oBME = new BADtlsClient())
                {

                    dt2 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "err", "alert('" + ex.Message + "');", true);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (dt2 != null && dt2.Rows.Count > 0)
            {
                count = 0;
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    //vString3 += "<div class='row mt-5'>";
                    vString3 += "<div class='carousel-item active carousel-item-left'><div class='d-flex'>";
                    if (i == 0 || i % 3 == 0)
                    {
                        vString3 += "<div class='col-lg-4 col-sm-12 col-12 d-flex flex-column'><a href = '#' class='introduce pb-3'><div class='flex-column-1'>";
                        vString3 += "<p class='pr-2 pl-3 pt-4'>" + dt2.Rows[i]["CLIENT_DESC"] + "</p></div ><div class='flex-column-2 d-flex'><div class='pic p1'>";
                        vString3 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["CLIENT"].ToString() + dt2.Rows[i]["CLIENT_IMG"]) + "' alt='Allykat' title='Allykat'></div><div class='information  flex-column pl-3 pt-2'><p>" + dt2.Rows[i]["CLIENT_NAME"] + "</p><p class='text-gray'>" + dt2.Rows[i]["CLIENT_TYPE"] + "</p>";
                        vString3 += "</div></div><span></span></a></div>";
                        //vString3 += "";
                    }
                    else if (i % 3 != 0 && i != 1)
                    {
                        //int k;
                        //k = i + 2;
                        if (count % 3 != 0 && count != 0)
                        {
                            vString3 += "<div class='col-lg-4 col-sm-12 col-12 d-flex flex-column'><a href = '#' class='introduce pb-3'><div class='flex-column-1'>";
                            vString3 += "<p class='pr-2 pl-3 pt-4'>" + dt2.Rows[i]["CLIENT_DESC"] + "</p></div ><div class='flex-column-2 d-flex'><div class='pic p1'>";
                            vString3 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["CLIENT"].ToString() + dt2.Rows[i]["CLIENT_IMG"]) + "' alt='Allykat' title='Allykat'></div><div class='information  flex-column pl-3 pt-2'><p>" + dt2.Rows[i]["CLIENT_NAME"] + "</p><p class='text-gray'>" + dt2.Rows[i]["CLIENT_TYPE"] + "</p>";
                            vString3 += "</div></div><span></span></a></div>";
                            count++;
                        }
                        else
                        {
                            vString3 += "<div class='col-lg-4 col-sm-12 col-12 d-flex flex-column'><a href = '#' class='introduce pb-3'><div class='flex-column-1'>";
                            vString3 += "<p class='pr-2 pl-3 pt-4'>" + dt2.Rows[i]["CLIENT_DESC"] + "</p></div ><div class='flex-column-2 d-flex'><div class='pic p1'>";
                            vString3 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["CLIENT"].ToString() + dt2.Rows[i]["CLIENT_IMG"]) + "' alt='Allykat' title='Allykat'></div><div class='information  flex-column pl-3 pt-2'><p>" + dt2.Rows[i]["CLIENT_NAME"] + "</p><p class='text-gray'>" + dt2.Rows[i]["CLIENT_TYPE"] + "</p>";
                            vString3 += "</div></div><span></span></a></div>";
                            count++;
                        }
                    }
                    else
                    {
                        vString3 += "<div class='col-lg-4 col-sm-12 col-12 d-flex flex-column'><a href = '#' class='introduce pb-3'><div class='flex-column-1'>";
                        vString3 += "<p class='pr-2 pl-3 pt-4'>" + dt2.Rows[i]["CLIENT_DESC"] + "</p></div ><div class='flex-column-2 d-flex'><div class='pic p1'>";
                        vString3 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["CLIENT"].ToString() + dt2.Rows[i]["CLIENT_IMG"]) + "' alt='Allykat' title='Allykat'></div><div class='information  flex-column pl-3 pt-2'><p>" + dt2.Rows[i]["CLIENT_NAME"] + "</p><p class='text-gray'>" + dt2.Rows[i]["CLIENT_TYPE"] + "</p>";
                        vString3 += "</div></div><span></span></a></div>";
                    }
                }
                vString3 += "</div></div>";
                testi_list.InnerHtml = vString3;
            }
        }
    }
}