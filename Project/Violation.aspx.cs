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
    public partial class Violation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
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
                string query = "select * From VIOLATION_CATEGORY";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    DataSet dt = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter app = new SqlDataAdapter(cmd);
                    app.Fill(dt);
                    tablevio.DataSource = dt.Tables[0];
                    tablevio.DataBind();
                    con.Close();
                }
            }
            catch (Exception e)
            {

            }

        }
        protected void functionAdd(object sender, EventArgs e)
        {
            if (txtvio.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            try
            {
                string query = "EXECUTE sp_InsertVIOLATION_CATEGORY N'"+txtvio.Text+"'";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Add();", true);
                }
            }
            catch { }
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }

        }

        protected void tablevio_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string delete = "Delete from VIOLATION_CATEGORY where VT_Cate_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablevio.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "dele();", true);

                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
        }

        protected void tablevio_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tablevio.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablevio_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                string update = "update VIOLATION_CATEGORY set VT_Cate_Name=@name where VT_Cate_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@name", (tablevio.Rows[e.RowIndex].FindControl("txtname") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablevio.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    tablevio.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
        }

        protected void tablevio_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tablevio.EditIndex = -1;
            loadData();
        }
    }
}