﻿using App.BAL;
using App.BAL.Master;
using App.BAL.Utility;
using App.CORE.Domain.Master;
using App.CORE.Domain.Setup;
using System;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProjectSix.admin.master
{
    public partial class events : System.Web.UI.Page
    {
        String errMsg = String.Empty;
        DataTable dt = null;
        EntitySysUser oSysUser = null;

        #region Main Grid
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (HttpContext.Current.Session["oSysUser"] != null)
                {
                    oSysUser = (EntitySysUser)Session["oSysUser"];
                    if (!IsPostBack)
                    {
                        oSysUser.TAG_PAGE_REFRESH = Server.UrlEncode(System.DateTime.Now.ToString());
                        errMsg = String.Empty;
                        if (Request.QueryString["type"] != null && Request.QueryString["type"].ToString() == "1")
                        {
                            // btn_Add_New_Click(null, null);
                        }
                        errMsg = FillNewsGrid();
                        if (!String.IsNullOrEmpty(errMsg))
                            MessageBox(1, "News " + Message.msgErrDdlPop, errMsg);

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
                        Response.Redirect("../index.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }

        private void MessageBox(Int16 pTabid, String strMsg, String exMsg)
        {
            string pType = strMsg == "print" ? "1" : "0";
            if (!(String.IsNullOrEmpty(exMsg)))
                exMsg = CommonOp.ModifyExceptionMessage(exMsg);
            if (pTabid == 1)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenTab1", "OpenTab1('" + strMsg + "','" + pTabid + "')", true);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenTab2", "OpenTab2('" + strMsg + "','" + pTabid + "')", true);
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                errMsg = String.Empty;
                //errMsg = SearchData(txt_SEARCH_DATE.Text.Trim());
                if (!String.IsNullOrEmpty(errMsg))
                    MessageBox(1, Message.msgErrCommon, errMsg);
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }

        protected void btn_refresh_Click(object sender, EventArgs e)
        {
            try
            {
                errMsg = String.Empty;
                errMsg = FillNewsGrid();
                if (!String.IsNullOrEmpty(errMsg))
                    MessageBox(1, Message.msgErrCommon, errMsg);
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                errMsg = String.Empty;
                hf_DTLS_NEWS_KEY.Value = "0";
                ClearControl();
                MessageBox(2, "", "");
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }

        private String FillNewsGrid()
        {
            try
            {
                errMsg = String.Empty;
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                dt = new DataTable();
                using (BADtlsEvent oBMC = new BADtlsEvent())
                {
                    dt = oBMC.Get<Int32>("SRH_KEY", 1, "", ref errMsg, "2019", 1);
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");
                }
                gvDtlsNews.DataSource = dt;
                gvDtlsNews.DataBind();
                MessageBox(1, "", "");
                return errMsg;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            try
            {
                errMsg = String.Empty;
                GridViewRow gvr = (GridViewRow)((HtmlAnchor)sender).NamingContainer;
                hf_DTLS_NEWS_KEY.Value = gvDtlsNews.DataKeys[gvr.RowIndex].Value.ToString();
                errMsg = FillNewsEdit(Convert.ToInt32(hf_DTLS_NEWS_KEY.Value));

                if (String.IsNullOrEmpty(errMsg))
                {
                    aPageName.InnerText = Message.modName21 + "(Edit)";
                    MessageBox(2, "", "");
                }
                else
                    MessageBox(1, Message.msgErrEditPop, errMsg);
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            Int32 vKey = 0; Byte vRef = 0; String vDelMsg = String.Empty;
            EntityDtlsEvent oBMAST = null;
            try
            {
                if (Page.IsValid)
                {
                    errMsg = String.Empty;
                    oBMAST = new EntityDtlsEvent();
                    GridViewRow gvr = (GridViewRow)((HtmlAnchor)sender).NamingContainer;
                    oBMAST.DTLS_EVENTS_KEY = Convert.ToInt32(gvDtlsNews.DataKeys[gvr.RowIndex].Values[0].ToString());
                    oBMAST.ENT_USER_KEY = Convert.ToInt16(oSysUser.USER_KEY);
                    oBMAST.EDIT_USER_KEY = Convert.ToInt16(oSysUser.USER_KEY);
                    oBMAST.TAG_DELETE = 0;

                    using (BADtlsEvent oBMC = new BADtlsEvent())
                    {
                        vRef = oBMC.SaveDelete<Object, Int32>("DELETE", oBMAST, null, ref vKey, ref errMsg, ref vDelMsg, "2019", 1);
                        if (vRef > 0)
                        {
                            if (vRef == 2)
                            {
                                MessageBox(1, "Data exists", errMsg);
                            }
                            else if (vRef == 1)
                            {
                                MessageBox(1, Message.msgSaveDelete, "");
                                FillNewsGrid();
                            }
                            else
                                MessageBox(1, Message.msgSaveErr, errMsg);
                        }
                    }
                }
                else
                    MessageBox(1, Message.msgPageInvalid, "");
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
            finally
            {
                if (oBMAST != null)
                    oBMAST = null;
            }
        }

        #endregion

        #region Save

        private void ClearControl()
        {
            txt_NEWS_HEADING.Text = "";
            txt_NEWS_DESC.Text = "";
            txt_NEWS_DATE.Text = "";
            hf_DTLS_NEWS_KEY.Value = "0";
        }

      

        protected void btn_Head_Save_Click(object sender, EventArgs e)
        {
            Byte vRef = 0; Int32 vKey = 0;
            String LABELS = String.Empty;
            EntityDtlsEvent oBMAST = null;
            try
            {
                if (Page.IsValid)
                {
                  
                    errMsg = String.Empty;
                    oBMAST = new EntityDtlsEvent();
                    oBMAST.EVENTS_TITLE = txt_NEWS_HEADING.Text;
                    oBMAST.DTLS_EVENTS_KEY = Convert.ToInt32( hf_DTLS_NEWS_KEY.Value);
                    oBMAST.EVENTS_DESC = txt_NEWS_DESC.Text;
                    DateTime dtNews_Date = Convert.ToDateTime(Request[txt_NEWS_DATE.UniqueID].Trim());
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                    oBMAST.EVENT_DATE = Convert.ToDateTime(dtNews_Date);
                    oBMAST.COMPANY_KEY = 1;

                    oBMAST.ENT_USER_KEY = oSysUser.USER_KEY;
                    oBMAST.EDIT_USER_KEY = oSysUser.USER_KEY;
                    oBMAST.TAG_ACTIVE = 1;
                    oBMAST.TAG_DELETE = 0;
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");

                    using (BADtlsEvent oBMC = new BADtlsEvent())
                    {
                        if (oBMAST.DTLS_EVENTS_KEY == 0)
                        {
                            vRef = oBMC.SaveChanges<Object, Int32>("INSERT", oBMAST, null, ref vKey, ref errMsg, "2019", 1);
                            if (vRef == 1)
                            {
                                MessageBox(2, Message.msgSaveNew, "");
                                ClearControl();
                            }
                            else if (vRef == 2)
                                MessageBox(1, Message.msgValidation, errMsg);
                            else
                                MessageBox(1, Message.msgSaveErr, errMsg);
                        }
                        else
                        {
                            
                                vRef = oBMC.SaveChanges<Object, Int32>("UPDATE", oBMAST, null, ref vKey, ref errMsg, "2019", 1);
                            
                            if (vRef == 1)
                            {
                                MessageBox(2, Message.msgSaveEdit, "");
                                hf_DTLS_NEWS_KEY.Value = Convert.ToString(vKey);
                                FillNewsEdit(Convert.ToInt32(hf_DTLS_NEWS_KEY.Value));
                            }
                            else if (vRef == 2)
                                MessageBox(1, Message.msgSaveDuplicate, errMsg);
                            else
                                MessageBox(1, Message.msgSaveErr, errMsg);
                        }
                    }
                    oSysUser.TAG_PAGE_REFRESH = Server.UrlEncode(System.DateTime.Now.ToString());
                }
                else
                    MessageBox(1, Message.msgPageInvalid, "");
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
            finally
            {
                if (oBMAST != null)
                    oBMAST = null;
            }
        }

        private String FillNewsEdit(Int32 pMAST_PRODUCT_LABELS_KEY)
        {
            try
            {
                errMsg = String.Empty;
                dt = new DataTable();
                EntityDtlsEvent oBMAST = new EntityDtlsEvent();
                oBMAST.COMPANY_KEY = 1;
                using (BADtlsEvent oBMG = new BADtlsEvent())
                {
                    dt = oBMG.Get<Int32>("SRH_DTLS", pMAST_PRODUCT_LABELS_KEY, "", ref errMsg, "2019", 1);
                }
                if (dt != null && dt.Rows.Count > 0)
                {
                    txt_NEWS_HEADING.Text = Convert.ToString(dt.Rows[0]["EVENTS_TITLE"]);
                    txt_NEWS_DESC.Text= Convert.ToString(dt.Rows[0]["EVENTS_DESC"]);
                    txt_NEWS_DATE.Text = Convert.ToDateTime(dt.Rows[0]["EVENT_DATE"]).ToString("d");
                }
                return errMsg;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            finally
            {
                dt = null;
            }
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            try
            {
                hf_DTLS_NEWS_KEY.Value = "0";
                aPageName.InnerText = Message.modName24;
                ClearControl();
                errMsg = FillNewsGrid();
                MessageBox(1, "", "");
            }
            catch (Exception ex)
            {
                MessageBox(1, Message.msgErrCommon, ex.Message);
            }
        }
        #endregion
    }
}