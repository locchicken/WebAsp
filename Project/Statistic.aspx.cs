using Project.DataHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Statistic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null && (string)Session["Designation"] != "Thủ Thư")
                {

                    loadData();
                }
                else
                {
                    Response.Redirect("/dangnhap");
                }
            }
        }
        void loadData()
        {
            try
            {
                string query = "select * from STATISTIC";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    DataSet dt = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter app = new SqlDataAdapter(cmd);
                    app.Fill(dt);
                    tableStatistic.DataSource = dt.Tables[0];
                    tableStatistic.DataBind();
                    con.Close();
                }
            }
            catch (Exception e)
            {

            }

        }
    }
}