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

namespace ProjectOne.user
{
    public partial class resetpassword : System.Web.UI.Page
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


            reset_img.Src = ResolveClientUrl(ConfigurationManager.AppSettings["BANNER"].ToString() + dt.Rows[0]["ABOUT_IMG"]);
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
            txt_NPassword.Text = "";
            txt_CPassword.Text = "";
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Byte vRef = 0; Int32 vKey = 0;
            EntitySysUser oBMAST = null;
            EntitySysUser oSysUser = new EntitySysUser();
            try
            {
                if (Page.IsValid)
                {
                    errMsg = String.Empty;
                    oBMAST = new EntitySysUser();
                    if (Session["Email"] != null)
                    {
                        hf_USER_EMAIL.Value = Convert.ToString(Session["Email"]);
                    }

                    oBMAST.USER_KEY = Convert.ToInt32(hf_USER_KEY.Value);
                    oBMAST.USER_EMAIL = hf_USER_EMAIL.Value;
                    oBMAST.USER_PASSWORD = Encrypt.Encryptdata(txt_NPassword.Text);
                    oBMAST.USER_PASSWORD = Encrypt.Encryptdata(txt_CPassword.Text);
                    oBMAST.COMPANY_KEY = 1;

                    oBMAST.TAG_DELETE = 0;
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");

                    using (BASysUser oBMC = new BASysUser())
                    {
                        if (txt_NPassword.Text != null && txt_CPassword.Text == txt_NPassword.Text)
                        {
                            vRef = oBMC.SaveChanges<Object, Int32>("UPDATE_PASS", oBMAST, null, ref vKey, ref errMsg, "2019", 1);
                        }

                        if (vRef == 1)
                        {
                            ClearControl();
                            ClientScript.RegisterStartupScript(GetType(), "popup", "popup();", true);

                        }
                    }

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "popupservererror", "popupservererror(); console.log('" + ex.Message + "');", true);

            }
        }
    }
}