using Project.DataHelper;
using Project.GUI;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.DAO
{
    public class AccountDAO
    {
        public Account checkData(String user, String pass)
        {
            string sql = "select * from STAFF where STAFF_User='" + user + "' and Staff_Pass='" + pass + "'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader re = cmd.ExecuteReader();
                if (re.Read())
                {
                    Account acc = new Account();
                    acc.setID(re["Staff_ID"].ToString());
                    acc.setUsername(user);
                    acc.setPassword(pass);
                    acc.setAdmin(re["IsAdmin"].ToString());
                    acc.setDesignation(re["Designation"].ToString());
                    return acc;
                }
            }
            return null;
        }
    }
}