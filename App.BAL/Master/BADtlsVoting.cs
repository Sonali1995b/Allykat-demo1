using System;
using App.CORE.Domain.Master;
using App.CORE.Repositories.Master;
using App.DAL;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using App.CORE.Repositories;

namespace App.BAL.Master
{
    public class BADtlsVoting : IDtlsVoting
    {
        Int16 vCount = 0;
        DataTable dt = null;
        SqlParameter[] para = null;

        public void BindDdl(ref DropDownList ddl, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            try
            {
                vCount = 0;
                para = new SqlParameter[1];
                para[vCount] = new SqlParameter("@GET_REC_TYPE", SqlDbType.VarChar, 20);
                para[vCount++].Value = "DDL";

                using (CommonOp oCommonOp = new CommonOp())
                {
                    oCommonOp.BindDropDownList("SP_GET_DTLS_VOTING", ref ddl, "DTLS_VOTING_KEY", "VOTING_DESC", ref pMsg, pAccYr, pCompany_key, para);
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
        }

        public DataTable Get<T>(String pMode, T pKey, String pSEARCH_TEXT, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            try
            {
                vCount = 0;
                para = new SqlParameter[3];
                para[vCount] = new SqlParameter("@GET_REC_TYPE", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@SEARCH_KEY", SqlDbType.Int);
                para[vCount++].Value = pKey;
                para[vCount] = new SqlParameter("@SEARCH_TEXT", SqlDbType.VarChar, 50);
                para[vCount++].Value = pSEARCH_TEXT;

                using (DBContext oDBC = new DBContext("SP_GET_DTLS_VOTING", CommandType.StoredProcedure))
                {
                    dt = oDBC.GetDataTable(pAccYr, pCompany_key, para, ref pMsg);
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return dt;
        }

        public DataTable Get_COUNT(String pMode, String pSEARCH_KEY, String pSEARCH_TEXT, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            try
            {
                vCount = 0;
                para = new SqlParameter[3];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@SEARCH_KEY", SqlDbType.VarChar, 300);
                para[vCount++].Value = pSEARCH_KEY;
                para[vCount] = new SqlParameter("@SEARCH_TEXT", SqlDbType.VarChar, 300);
                para[vCount++].Value = pSEARCH_TEXT;

                using (DBContext oDBC = new DBContext("SP_GET_DTLS_VOTING_COUNT", CommandType.StoredProcedure))
                {
                    dt = oDBC.GetDataTable(pAccYr, pCompany_key, para, ref pMsg);
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return dt;
        }

        public byte SaveChanges<T1, T2>(String pMode, EntityDtlsVoting oEntity, T1 pValue, ref T2 pKey, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            Byte vRef = 0;
            try
            {
                vCount = 0;
                para = new SqlParameter[12];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@RETURN_KEY", SqlDbType.TinyInt);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = 0;
                para[vCount] = new SqlParameter("@DTLS_VOTING_KEY", SqlDbType.Int);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = oEntity.DTLS_VOTING_KEY;
                para[vCount] = new SqlParameter("@VOTING_HEADING", SqlDbType.VarChar, 300);
                para[vCount++].Value = oEntity.VOTING_HEADING;
                para[vCount] = new SqlParameter("@VOTING_DESC", SqlDbType.VarChar, 9000);
                para[vCount++].Value = oEntity.VOTING_DESC;
                para[vCount] = new SqlParameter("@VOTING_DATE", SqlDbType.DateTime);
                para[vCount++].Value = oEntity.VOTING_DATE;
                para[vCount] = new SqlParameter("@VOTING_IMG", SqlDbType.VarChar, 100);
                para[vCount++].Value = oEntity.VOTING_IMG;
                para[vCount] = new SqlParameter("@COMPANY_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.COMPANY_KEY;

                para[vCount] = new SqlParameter("@ENT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.ENT_USER_KEY;
                para[vCount] = new SqlParameter("@EDIT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.EDIT_USER_KEY;
                para[vCount] = new SqlParameter("@TAG_ACTIVE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_ACTIVE;
                para[vCount] = new SqlParameter("@TAG_DELETE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_DELETE;
                
                using (DBContext oDBC = new DBContext("SP_SAVE_DTLS_VOTING", CommandType.StoredProcedure))
                {
                    oDBC.ExecuteNonQuery(pAccYr, pCompany_key, para, ref pMsg);
                    vRef = Convert.ToByte(oDBC.GetParameterValue("@RETURN_KEY", ref pMsg));
                    pKey = (T2)Convert.ChangeType(oDBC.GetParameterValue("@DTLS_VOTING_KEY", ref pMsg), typeof(T2));
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return vRef;
        }

        public byte SaveChanges_count(String pMode, EntityDtlsVoting oEntity, String pMsg, String pAccYr, Int16? pCompany_key)
        {
            Byte vRef = 0;
            try
            {
                vCount = 0;
                para = new SqlParameter[10];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@RETURN_KEY", SqlDbType.TinyInt);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = 0;
                para[vCount] = new SqlParameter("@DTLS_VOTING_KEY", SqlDbType.Int);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = oEntity.DTLS_VOTING_KEY;
                para[vCount] = new SqlParameter("@USER_KEY", SqlDbType.VarChar, 300);
                para[vCount++].Value = oEntity.USER_KEY;
                para[vCount] = new SqlParameter("@IMAGE_KEY", SqlDbType.VarChar, 300);
                para[vCount++].Value = oEntity.IMAGE_KEY;

                para[vCount] = new SqlParameter("@COMPANY_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.COMPANY_KEY;

                para[vCount] = new SqlParameter("@ENT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.ENT_USER_KEY;
                para[vCount] = new SqlParameter("@EDIT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.EDIT_USER_KEY;
                para[vCount] = new SqlParameter("@TAG_ACTIVE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_ACTIVE;
                para[vCount] = new SqlParameter("@TAG_DELETE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_DELETE;

                using (DBContext oDBC = new DBContext("SP_SAVE_DTLS_VOTING_COUNT", CommandType.StoredProcedure))
                {
                    oDBC.ExecuteNonQuery(pAccYr, pCompany_key, para, ref pMsg);
                    vRef = Convert.ToByte(oDBC.GetParameterValue("@RETURN_KEY", ref pMsg));
                    // pKey = (T2)Convert.ChangeType(oDBC.GetParameterValue("@DTLS_VOTING_KEY", ref pMsg), typeof(T2));
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return vRef;
        }



        public Byte SaveDelete<T1, T2>(String pMode, EntityDtlsVoting oEntity, T1 pValue, ref T2 pKey, ref String pMsg, ref String pDelMsg, String pAccYr, Int16? pCompany_key)
        {
            Byte vRef = 0;
            try
            {
                vCount = 0;
                para = new SqlParameter[4];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 30);
                para[vCount++].Value = "DELETE";
                para[vCount] = new SqlParameter("@RETURN_KEY", SqlDbType.TinyInt);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = 0;
                para[vCount] = new SqlParameter("@DTLS_VOTING_KEY", SqlDbType.Int);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = oEntity.DTLS_VOTING_KEY;

                para[vCount] = new SqlParameter("@EDIT_USER_KEY", SqlDbType.SmallInt);
                para[vCount++].Value = oEntity.ENT_USER_KEY;

                using (DBContext oDBC = new DBContext("SP_DELETE_DTLS_VOTING", CommandType.StoredProcedure))
                {
                    oDBC.ExecuteNonQuery(pAccYr, pCompany_key, para, ref pMsg);
                    vRef = Convert.ToByte(oDBC.GetParameterValue("@RETURN_KEY", ref pMsg));
                    pKey = (T2)Convert.ChangeType(oDBC.GetParameterValue("@DTLS_VOTING_KEY", ref pMsg), typeof(T2));
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return vRef;
        }

        public void Dispose()
        {
            if (dt != null)
            {
                dt.Dispose(); dt = null;
            }
            if (para != null)
                para = null;
        }
    }
}
