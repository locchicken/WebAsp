using Project.DataHelper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.DAO
{
    public class ReaderDAO
    {
        public GUI.Reader FindId()
        {
            String query = "select * from READER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    GUI.Reader s = new GUI.Reader();
                    s.setId(rd["Reader_ID"].ToString());
                    return s;
                }
                return null;
            }

        }
    }
}