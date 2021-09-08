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
    public partial class Copyright : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    loadWriter();
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
                string query = "select * From COPYRIGHT_FEE";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    DataSet dt = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter app = new SqlDataAdapter(cmd);
                    app.Fill(dt);
                    tablecopy.DataSource = dt.Tables[0];
                    tablecopy.DataBind();
                    con.Close();
                }
            }
            catch (Exception e)
            {

            }

        }
        void loadWriter()
        {
            string query = "select * from WRITER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                writer.DataSource = dt.Tables[0];
                writer.DataValueField = "Writer_ID";
                writer.DataTextField = "Writer_Name";
                writer.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
            if (txtisbn.Text==""||txtprice.Text=="")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            try
            {
                string tacgia = writer.Items[writer.SelectedIndex].Value;
                string query = "exec sp_InsertCOPYRIGHT_FEE "+txtisbn.Text+", '"+tacgia+"', "+txtprice.Text+"";
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

        protected void tablecopy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string delete = "Delete from COPYRIGHT_FEE where CPR_Fee_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablecopy.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void tablecopy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tablecopy.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablecopy_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tablecopy.EditIndex = -1;
            loadData();
        }

        protected void tablecopy_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
   
                string update = "update COPYRIGHT_FEE set ISBN=@code, CPR_Fee=@price where CPR_Fee_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@code", (tablecopy.Rows[e.RowIndex].FindControl("maisbn") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@price", (tablecopy.Rows[e.RowIndex].FindControl("price") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablecopy.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    tablecopy.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
        }
    }
}