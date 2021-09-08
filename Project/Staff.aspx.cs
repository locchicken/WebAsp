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
    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if ((string)Session["username"] != null && (string)Session["Designation"]!="Thủ Thư")
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
            string query = "select * from view_STAFF_INFO";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tablestaff.DataSource = dt.Tables[0];
                tablestaff.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
            string s = sex.Items[sex.SelectedIndex].Text;
            string diavi = chucvu.Items[chucvu.SelectedIndex].Text;
            if (txtuser.Text == "" || txtpass.Text == "" || txtadmin.Text == ""||txtphone.Text==""||txtday.Text==""||txtemail.Text==""||txtngaylam.Text==""||txtname.Text==""||txtaddress.Text==""|| diavi != "Quản Lý" && diavi != "Thủ Thư")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            string checkuser = "select * from STAFF where Staff_User=N'" + txtuser.Text + "'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(checkuser, con);
                SqlDataReader read = cmd.ExecuteReader();
                if(read.Read())
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "checkuser();", true);
                    return;
                }  
            }
            string query = "EXECUTE sp_InsertSTAFF N'"+txtuser.Text+"', N'"+txtpass.Text+"', '"+txtadmin.Text+"', N'"+diavi+"', N'"+txtname.Text+"', N'"+s+"', '"+txtday.Text+"', '"+txtphone.Text+"', N'"+txtaddress.Text+"', '"+txtemail.Text+"', '"+txtngaylam.Text+"'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();
                loadData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "add();", true);
            }
        }

        protected void tablestaff_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tablestaff.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablestaff_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tablestaff.EditIndex = -1;
            loadData();
        }

        protected void tablestaff_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string check = (tablestaff.Rows[e.RowIndex].FindControl("txtchucvu") as TextBox).Text;
            if (check != "Quản Lý" && check != "Thủ Thư")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "check();", true);
                return;
            }
            string update = "Update STAFF_INFO Set Staff_Name=@name,Sex=@sex,Date_Of_Birth=@birth,Phone_Number=@sdt,Staff_Address=@address,Staff_Email=@email,In_Date=@ngaylam Where Staff_ID=@id";
            string update1 = "Update STAFF set Staff_User=@user,Staff_Pass=@pass,Designation=@chucvu where Staff_ID=@id";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {

                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    SqlCommand cmd1 = new SqlCommand(update1, con);
                    cmd1.Parameters.AddWithValue("@user", (tablestaff.Rows[e.RowIndex].FindControl("txtTK") as TextBox).Text);
                    cmd1.Parameters.AddWithValue("@pass", (tablestaff.Rows[e.RowIndex].FindControl("txtMK") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@name", (tablestaff.Rows[e.RowIndex].FindControl("txtten") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@sex", (tablestaff.Rows[e.RowIndex].FindControl("txtGT") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@birth", (tablestaff.Rows[e.RowIndex].FindControl("txtbirth") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@sdt", (tablestaff.Rows[e.RowIndex].FindControl("txtsdt") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@address", (tablestaff.Rows[e.RowIndex].FindControl("txtdiachi") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@email", (tablestaff.Rows[e.RowIndex].FindControl("txtmail") as TextBox).Text);
                    cmd1.Parameters.AddWithValue("@chucvu", (tablestaff.Rows[e.RowIndex].FindControl("txtchucvu") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@ngaylam", (tablestaff.Rows[e.RowIndex].FindControl("txtngayvaolam") as TextBox).Text);
                    cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(tablestaff.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablestaff.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    tablestaff.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
           
            
        }

        protected void tablestaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (txtngaynghi.Text=="")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            try
            {
                string delete = "Update STAFF_INFO Set Out_Date=@ngaynghi where Staff_ID=@id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@ngaynghi", txtngaynghi.Text);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablestaff.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Delete();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
            
        }

        protected void tablestaff_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            tablestaff.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablestaff_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            tablestaff.EditIndex = -1;
            loadData();
        }

       
    }
}