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

namespace ProjectOne.selfie
{
    public partial class index : System.Web.UI.Page
    {
        String errMsg = String.Empty, vString = String.Empty, vString1 = String.Empty, vString2 = String.Empty, vString3 = String.Empty, vString4 = String.Empty, vString5 = String.Empty, vString7 = String.Empty, vString8 = String.Empty, vString9 = String.Empty, vString10 = String.Empty, vString11 = String.Empty, vString12 = String.Empty, vString14 = String.Empty, vString15 = String.Empty, vString16 = String.Empty, vString17 = String.Empty, vString18 = String.Empty, vString20 = String.Empty, li = String.Empty;
        int count = 0;
        DataTable dt = null;
        DataTable dt1 = null;
        DataTable dt10 = null;
        EntitySysUser oSysUser = null;

        protected void Page_PreLoad(object sender, EventArgs e)
        {
            try
            {
                dt = new DataTable();
                dt1 = new DataTable();
                dt10 = new DataTable();

                using (BADtlsSelfie oBMC = new BADtlsSelfie())
                {
                    dt = oBMC.Get("GET", 1, "", ref errMsg, Convert.ToString(DateTime.Now), 1);
                }

                using (BAHeadSiteSetting oBME = new BAHeadSiteSetting())
                {
                    dt1 = oBME.GetPageSetting("SRH_HEAD_KEY", 92, "", ref errMsg, "2020", 1);
                    dt10 = oBME.Get("GET", 1, "", ref errMsg, "2020", 1);
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
                    vString2+= "<div class='isotope_container isotope row masonry-layout' data-filters='.isotope_filters'>";
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        vString2 += "<div class='isotope-item col-lg-2 col-md-4 col-sm-6 col-xs-6'><div class='vertical-item gallery-item content-absolute text-center cs'><div class='item-media'>";
                        vString2 += "<img src='" + ResolveClientUrl(ConfigurationManager.AppSettings["SELFIE"].ToString() + dt.Rows[i]["SELFIE_IMG"]) + "' alt='Allykat' title='Allykat' style='height:270px; width:300px;'><div class='media-links'><div class='links-wrap'><a class='p-view prettyPhoto' title='' data-gal='prettyPhoto[gal]' href='" + ResolveClientUrl(ConfigurationManager.AppSettings["SELFIE"].ToString() + dt.Rows[i]["SELFIE_IMG"]) + "' style='height:270px; width:300px;'></a></div>";
                        vString2 += "</div></div></div></div>";
                        
                    }
                    vString2 += "</div>";
                    selfie_list.InnerHtml = vString2;
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
                //dt1 = null;
                vString7 = String.Empty;
                vString1 = String.Empty;
                vString = String.Empty;
                vString = String.Empty;

            }
        }
    }
}