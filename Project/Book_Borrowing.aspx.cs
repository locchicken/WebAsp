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
    public partial class Book_Borrowing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    loadData();
                    loadReader();
                    loadBook();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }  
            }
        }
        void loadData()
        {
            string query = "select * from BOOK_BORROWING";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tableborrow.DataSource = dt.Tables[0];
                tableborrow.DataBind();
                con.Close();
            }
        }
        void loadReader()
        {
            string query = "select * from READER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                name.DataSource = dt.Tables[0];
                name.DataValueField = "Reader_ID";
                name.DataTextField = "Reader_Name";
                name.DataBind();
                con.Close();
            }
        }
        void loadBook()
        {
            string query = "select * from BOOK";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                book.DataSource = dt.Tables[0];
                book.DataValueField = "ISBN";
                book.DataTextField = "Book_Name";
                book.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
           
            string bookborrow = book.Items[book.SelectedIndex].Value;
            string readername = name.Items[name.SelectedIndex].Value;
            string query = "EXECUTE sp_InsertBOOK_BORROWING	"+readername+","+bookborrow+",	'"+txthsd.Text+"'";

            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.ExecuteNonQuery();
                loadData();
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "add();", true);
            }
        }

        protected void tableborrow_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string delete = "EXECUTE sp_UpdateCost @id";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tableborrow.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "payment();", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }
        }
    }
}