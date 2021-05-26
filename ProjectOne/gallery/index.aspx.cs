using App.BAL.Master;
using App.CORE.Domain.Setup;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectOne.gallery
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString3 = String.Empty, li = String.Empty, values = String.Empty;
        int count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt2 = null;
        DataTable dt3 = null;
        DataTable dt4 = null;
        DataTable dt10 = null;
        DataTable dt13 = null;


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
                dt10 = new DataTable();
                dt13 = new DataTable();
                using (BADtlsGallery oBMC = new BADtlsGallery())
                {
                    dt = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }
                DataView view = new DataView(dt);
                dt4 = view.ToTable(true, "TYPE_NAME");

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 53, "", ref errMsg, "2020", 1);
                    dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
                }
                       
                using (BAHeadHomeBgSetting oBMC = new BAHeadHomeBgSetting())
                {
                    dt13 = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
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
               
                if (dt != null && dt.Rows.Count > 0)
                {
                   
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        
                        //vString1 += "<div class='isotope-item col-lg-4 col-md-4 col-sm-6 col-xs-6>";
                        //vString1 += " <div class='vertical-item gallery-title-item content-absolute'><div class='item-media'>";
                        //vString1 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt.Rows[i]["GALLERY_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'><div class='links-wrap'>";
                        //vString1 += "<a class='p-view prettyPhoto' title='' data-gal='prettyPhoto[gal]' href='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt.Rows[i]["GALLERY_IMG"]) + "'></a>";
                        //vString1 += "</div></div></div></div></div>";
                        vString2 += "<div class='isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6'><div class='vertical-item gallery-item content-absolute text-center cs'><div class='item-media'>";
                        vString2 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt.Rows[i]["GALLERY_IMG"]) + "' alt='Allykat' title='Allykat'><div class='media-links'><div class='links-wrap'><a class='p-view prettyPhoto' title='' data-gal='prettyPhoto[gal]' href='" + ResolveClientUrl(ConfigurationManager.AppSettings["GALLERY"].ToString() + dt.Rows[i]["GALLERY_IMG"]) + "'></a></div>";
                        vString2 += "</div></div></div></div>";

                    }
                    if (vString2 != null)
                    {
                        
                        gallery_img.InnerHtml = vString2;
                        
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
    }
}