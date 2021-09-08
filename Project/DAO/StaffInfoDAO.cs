using Project.DataHelper;
using Project.GUI;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project.DAO
{
    public class StaffInfoDAO
    {
        public StaffInfo FindStaffInfo(string id)
        {
            String query="select * from STAFF_INFO where Staff_ID='"+id+"'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
              
                while (rd.Read())
                {
                    StaffInfo s = new StaffInfo();
                    s.setName(rd["Staff_Name"].ToString());
                    s.setSex(rd["Sex"].ToString());
                    s.setNgaysinh(rd["Date_Of_Birth"].ToString());
                    s.setSdt(rd["Phone_Number"].ToString());
                    s.setDiachi(rd["Staff_Address"].ToString());
                    s.setEmail(rd["Staff_Email"].ToString());
                    s.setNgaylam(rd["In_Date"].ToString());
                    s.setNgaynghi(rd["Out_Date"].ToString());
                    return s;
                }
                return null;
            }
  
        }
    }
}