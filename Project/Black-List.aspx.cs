using Project.DAO;
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
    public partial class Black_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    loadVio();
                    loadData();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
           
        }
        void loadData()
        {
            try
            {
                string query = "select * from READER_BLACKLIST";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    DataSet dt = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter app = new SqlDataAdapter(cmd);
                    app.Fill(dt);
                    tableblack.DataSource = dt.Tables[0];
                    tableblack.DataBind();
                    con.Close();
                }
            }
            catch (Exception e)
            {

            }

        }
        void loadVio()
        {
            string query = "select * from VIOLATION_CATEGORY";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                vio.DataSource = dt.Tables[0];
                vio.DataValueField = "VT_Cate_ID";
                vio.DataTextField = "VT_Cate_Name";
                vio.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
          
            if(txtid.Text=="")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
           
            try
            {
                string violation = vio.Items[vio.SelectedIndex].Text;
                string query = "EXECUTE sp_InsertREADER_BLACKLIST '" + txtid.Text + "', N'" + violation + "'";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "add();", true);
                }
            }
            catch { }
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "check();", true);
            }
        }

        protected void tableblack_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string delete = "Delete from READER_BLACKLIST where BLACKLIST_ID=@id";
            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tableblack.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Delete();", true);
                }
            }
            catch { }
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
        }
    }
}