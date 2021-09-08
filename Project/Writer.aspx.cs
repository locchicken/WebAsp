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
    public partial class Writer : System.Web.UI.Page
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
            string query = "select * from WRITER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tableWriter.DataSource = dt.Tables[0];
                tableWriter.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
            string s = sex.Items[sex.SelectedIndex].Text;
            if (txtaddress.Text == "" || txtday.Text == "" || txtemail.Text == "" || txtname.Text == "" || txtphone.Text == "" ||s!="Nam" && s!="Nữ")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            try
            {
                string query = "EXECUTE sp_InsertWRITER N'" + txtname.Text + "', N'" + s.ToString() + "','"+txtday.Text+"', '" + txtphone.Text + "', N'" + txtemail.Text + "', N'" + txtaddress.Text + "'";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "add();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }
           
        }
        protected void functionEdit(object sender, EventArgs e)
        {
            Response.Write("Hello World!!!");
        }
        protected void functionDel(object sender, EventArgs e)
        {
            string s=sex.Items[sex.SelectedIndex].Text;
            Response.Write(s);
        }

        protected void tableWriter_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void tableWriter_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tableWriter.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tableWriter_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tableWriter.EditIndex = -1;
            loadData();
        }

        protected void tableWriter_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string update = "update WRITER set Writer_Name=@name, Sex=@sex,Date_Of_Birth=@day,Phone_Number=@phone,Writer_Email=@email,Writer_Address=@address where Writer_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.Parameters.AddWithValue("@name", (tableWriter.Rows[e.RowIndex].FindControl("txt_name") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@sex", (tableWriter.Rows[e.RowIndex].FindControl("txt_sex") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@day", (tableWriter.Rows[e.RowIndex].FindControl("txtday") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@phone", (tableWriter.Rows[e.RowIndex].FindControl("txtphone") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@email", (tableWriter.Rows[e.RowIndex].FindControl("txtemail") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@address", (tableWriter.Rows[e.RowIndex].FindControl("txtaddress") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tableWriter.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    tableWriter.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }
           
        }

        protected void tableWriter_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string delete = "Delete from WRITER where Writer_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tableWriter.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Delete();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }
           
        }
    }
}