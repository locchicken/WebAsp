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
    public partial class Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    loadData();
                    loadCateBook();
                    loadWriter();
                    loadPublisher();
                    loadTu();
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
                string query = "select * from BOOK order by ID asc";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    DataSet dt = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter app = new SqlDataAdapter(cmd);
                    app.Fill(dt);
                    tablebook.DataSource = dt.Tables[0];
                    tablebook.DataBind();
                    con.Close();
                }
            }
            catch(Exception e)
            {

            }
            
        }
        void loadCateBook()
        {
            string query = "select * from BOOK_CATEGORY";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                book.DataSource = dt.Tables[0];
                book.DataValueField = "Book_Cate_ID";
                book.DataTextField = "Book_Cate_Name";
                book.DataBind();
                con.Close();
            }
        }
        void loadTu()
        {
            string query = "select * from SHELF_BOOK";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tusach.DataSource = dt.Tables[0];
                tusach.DataValueField = "Shelf_ID";
                tusach.DataTextField = "Shelf_ID";
                tusach.DataBind();
                con.Close();
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
        void loadPublisher()
        {
            string query = "select * from PUBLISHER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                publisher.DataSource = dt.Tables[0];
                publisher.DataValueField = "Pub_ID";
                publisher.DataTextField = "Pub_Name";
                publisher.DataBind();
                con.Close();
            }
        }
        protected void functionAdd(object sender, EventArgs e)
        {
            string fileimage = uploadimage.FileName;
            if (txtcode.Text==""||txtday.Text==""||txtname.Text==""||txtyear.Text==""||fileimage==""||txtsoluong.Text==""||txtngan.Text=="")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            string checkcodebook = "select * from BOOK where ISBN='" + txtcode.Text + "'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(checkcodebook, con);
                SqlDataReader read = cmd.ExecuteReader();
                if (read.Read())
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "checkcode();", true);
                    return;
                }
            }
            try
            {
                string catebook = book.Items[book.SelectedIndex].Text;
                string catepub = publisher.Items[publisher.SelectedIndex].Text;
                string catewriter = writer.Items[writer.SelectedIndex].Text;
                string tu = tusach.Items[tusach.SelectedIndex].Text;
                string query = "EXECUTE sp_InsertBOOK '" + txtcode.Text + "', N'" + txtname.Text + "', N'" + catebook + "', N'" + catewriter + "', N'" + catepub + "', " + txtyear.Text + ", '" + txtday.Text + "','" + @"image/" + fileimage + "','"+tu+"','"+txtngan.Text+"','"+txtsoluong.Text+"'";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    if (uploadimage.FileName != "")
                    {
                        uploadimage.PostedFile.SaveAs(Server.MapPath("image") + @"\" + fileimage);
                        Image1.ImageUrl = "image/" + fileimage;
                    }
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "add();", true);
                }
            }
            catch { }
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }

        }

        protected void tablebook_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string delete = "Delete from BOOK where ID=@id";
            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(delete, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablebook.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Delete();", true);
                }
            }
            catch {}
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }
           
        }

        protected void tablebook_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tablebook.EditIndex = e.NewEditIndex;
            loadData();
        }

        protected void tablebook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            tablebook.EditIndex = -1;
            loadData();
        }

        protected void tablebook_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string update = "update BOOK set ";
                FileUpload image = (FileUpload)tablebook.Rows[e.RowIndex].Cells[8].FindControl("editimage");
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    if (image.FileName != "") update += "Book_Image=@hinhanh";
                    update += " where ID=@id";
                    SqlCommand cmd = new SqlCommand(update, con);
                    if (image.FileName != "")
                    {
                        cmd.Parameters.AddWithValue("@hinhanh", @"image/" + image.FileName);
                        image.PostedFile.SaveAs(Server.MapPath("image") + @"\" + image.FileName);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                        return;
                    }
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(tablebook.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    tablebook.EditIndex = -1;
                    loadData();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Update();", true);
                }
            }
            catch(Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Error();", true);
            }
            
        }
    }
}