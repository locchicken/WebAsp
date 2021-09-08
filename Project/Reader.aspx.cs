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
    public partial class Reader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            string query = "select * from READER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tablereader.DataSource = dt.Tables[0];
                tablereader.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
            string check = sex.Items[sex.SelectedIndex].Text;
            if (txtaddress.Text==""||txtday.Text==""||txtemail.Text==""||txtname.Text==""||txtphone.Text==""||txtregister.Text==""||check!="Nam"&&check!="Nữ")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
            }
            try
            {
                string s = sex.Items[sex.SelectedIndex].Text;
                string query = "EXECUTE sp_InsertREADER N'" + txtname.Text + "', N'" + s + "', '" + txtday.Text + "', '" + txtphone.Text + "', N'" + txtphone.Text + "', N'" + txtaddress.Text + "', '" + txtregister.Text + "'";
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
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
           
        }

        protected void tablereader_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tablereader.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablereader_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string update = "update READER set Reader_Name=@name, Sex=@sex,Date_Of_Birth=@day,Phone_Number=@phone,Reader_Email=@email,Reader_Address=@address,Register_Date=@register where Reader_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@name", (tablereader.Rows[e.RowIndex].FindControl("txtname") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@sex", (tablereader.Rows[e.RowIndex].FindControl("txtsex") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@day", (tablereader.Rows[e.RowIndex].FindControl("txtbirth") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@phone", (tablereader.Rows[e.RowIndex].FindControl("txtphone") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@email", (tablereader.Rows[e.RowIndex].FindControl("txtemail") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@address", (tablereader.Rows[e.RowIndex].FindControl("txtaddress") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@register", (tablereader.Rows[e.RowIndex].FindControl("txtregister") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablereader.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    tablereader.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
           
        }

        protected void tablereader_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string delete = "Delete from READER where READER_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablereader.DataKeys[e.RowIndex].Value.ToString()));
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

        protected void tablereader_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tablereader.EditIndex = -1;
            loadData();
        }
    }
}