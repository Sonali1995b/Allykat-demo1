using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using App.CORE.Domain.Setup;
using App.CORE.Repositories.Setup;
using App.DAL;

namespace App.BAL.Setup
{
    public class BASysUser : ISysUser
    {
        Int16 vCount = 0;
        DataTable dt = null;
        SqlParameter[] para = null;

        public DataTable Get<T>(String pMode, T pKey, String pSEARCH_TEXT, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            try
            {
                vCount = 0;
                para = new SqlParameter[4];
                para[vCount] = new SqlParameter("@GET_REC_TYPE", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@SEARCH_KEY", SqlDbType.Int);
                para[vCount++].Value = pKey;
                para[vCount] = new SqlParameter("@SEARCH_TEXT", SqlDbType.VarChar, 50);
                para[vCount++].Value = pSEARCH_TEXT;
                para[vCount] = new SqlParameter("@COMPANY_KEY", SqlDbType.SmallInt);
                para[vCount++].Value = pCompany_key ?? 0;

                using (DBContext oDBC = new DBContext("SP_GET_SYS_USER", CommandType.StoredProcedure))
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

        public DataTable Get<T>(String pMode, T pKey, String pSEARCH_TEXT, Int16 pCompanyKey, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            try
            {
                vCount = 0;
                para = new SqlParameter[5];
                para[vCount] = new SqlParameter("@GET_REC_TYPE", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@SEARCH_KEY", SqlDbType.Int);
                para[vCount++].Value = pKey;
                para[vCount] = new SqlParameter("@SEARCH_TEXT", SqlDbType.VarChar, 50);
                para[vCount++].Value = pSEARCH_TEXT;
                para[vCount] = new SqlParameter("@COMPANY_KEY", SqlDbType.SmallInt);
                para[vCount++].Value = pCompanyKey;
                para[vCount] = new SqlParameter("@COMPANY_DB_NAME", SqlDbType.VarChar, 50);
                para[vCount++].Value = "";

                using (DBContext oDBC = new DBContext("SP_GET_SYS_USER", CommandType.StoredProcedure))
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

        public Byte SaveChanges<T1, T2>(String pMode, EntitySysUser oEntity, T1 pValue, ref T2 pKey, ref String pMsg, String pAccYr, Int16? pCompany_key)
        {
            Byte vRef = 0;
            try
            {
                vCount = 0;
                para = new SqlParameter[17];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@RETURN_KEY", SqlDbType.TinyInt);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = 0;
                para[vCount] = new SqlParameter("@USER_KEY", SqlDbType.Int);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = oEntity.USER_KEY;
                para[vCount] = new SqlParameter("@USER_NAME", SqlDbType.VarChar, 50);
                para[vCount++].Value = oEntity.USER_NAME;
                para[vCount] = new SqlParameter("@USER_EMAIL", SqlDbType.VarChar, 50);
                para[vCount++].Value = oEntity.USER_EMAIL;
                para[vCount] = new SqlParameter("@PHONE_CODE", SqlDbType.VarChar, 50);
                para[vCount++].Value = oEntity.PHONE_CODE;
                para[vCount] = new SqlParameter("@USER_PASSWORD", SqlDbType.VarChar, 50);
                para[vCount++].Value = oEntity.USER_PASSWORD;
                para[vCount] = new SqlParameter("@ACTIVATION_CODE", SqlDbType.VarChar, 100);
                para[vCount++].Value = oEntity.ACTIVATION_CODE;
                para[vCount] = new SqlParameter("@TAG_ACTIVATION", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_ACTIVATION;
                para[vCount] = new SqlParameter("@USER_TYPE_KEY", SqlDbType.Int);
                para[vCount++].Value = 2;
                para[vCount] = new SqlParameter("@MAST_HRD_PERSONNEL_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.MAST_HRD_PERSONNEL_KEY;
                para[vCount] = new SqlParameter("@TAG_COMPANY_ACCESS", SqlDbType.VarChar, 50);
                para[vCount++].Value = oEntity.TAG_COMPANY_ACCESS;

                para[vCount] = new SqlParameter("@ENT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.ENT_USER_KEY;
                para[vCount] = new SqlParameter("@EDIT_USER_KEY", SqlDbType.Int);
                para[vCount++].Value = oEntity.EDIT_USER_KEY;
                para[vCount] = new SqlParameter("@TAG_ACTIVE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_ACTIVE;
                para[vCount] = new SqlParameter("@TAG_DELETE", SqlDbType.TinyInt);
                para[vCount++].Value = oEntity.TAG_DELETE;
                para[vCount] = new SqlParameter("@COMPANY_KEY", SqlDbType.SmallInt);
                para[vCount++].Value = oEntity.COMPANY_KEY;

                using (DBContext oDBC = new DBContext("SP_SAVE_SYS_USER", CommandType.StoredProcedure))
                {
                    oDBC.ExecuteNonQuery(pAccYr, pCompany_key, para, ref pMsg);
                    vRef = Convert.ToByte(oDBC.GetParameterValue("@RETURN_KEY", ref pMsg));
                    pKey = (T2)Convert.ChangeType(oDBC.GetParameterValue("@USER_KEY", ref pMsg), typeof(T2));
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return vRef;
        }

        public byte Delete<T>(String pMode, T pValue, ref T pKey, ref String pMsg, Int32 pUser, String pAccYr, Int16? pCompany_key)
        {
            byte retKey = 0;
            try
            {
                vCount = 0;
                para = new SqlParameter[4];
                para[vCount] = new SqlParameter("@SELECT_ACTION", SqlDbType.VarChar, 20);
                para[vCount++].Value = pMode;
                para[vCount] = new SqlParameter("@RETURN_KEY", SqlDbType.TinyInt);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = 0;
                para[vCount] = new SqlParameter("@USER_KEY", SqlDbType.Int);
                para[vCount].Direction = ParameterDirection.InputOutput;
                para[vCount++].Value = pValue;
                para[vCount] = new SqlParameter("@EDIT_USER_KEY", SqlDbType.SmallInt);
                para[vCount++].Value = pUser;

                using (DBContext oDBC = new DBContext("SP_DELETE_SYS_USER", CommandType.StoredProcedure))
                {
                    oDBC.ExecuteNonQuery(pAccYr, pCompany_key, para, ref pMsg);
                    retKey = Convert.ToByte(oDBC.GetParameterValue("@RETURN_KEY", ref pMsg));
                }
            }
            catch (Exception ex)
            {
                pMsg = ex.Message;
            }
            return retKey;
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
