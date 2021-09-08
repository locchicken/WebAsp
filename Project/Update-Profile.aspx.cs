using Project.DAO;
using Project.DataHelper;
using Project.GUI;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Update_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    try
                    {
                        StaffInfoDAO info = new StaffInfoDAO();
                        StaffInfo list = info.FindStaffInfo((string)Session["id"]);
                        txtname.Text = list.getName();
                        txtday.Text = list.getNgaysinh();
                        txtemail.Text = list.getEmail();
                        txtsdt.Text = list.getSdt();
                        txtsex.Text = list.getSex();
                        txtaddress.Text = list.getDiachi();

                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
                    Response.Redirect("/dangnhap");
                }
            }
        }
        protected void functionupdate(object sender, EventArgs e)
        {
            if (txtaddress.Text == "" || txtday.Text == "" || txtemail.Text == "" || txtname.Text == "" || txtsdt.Text == "" || txtsex.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            try
            {
                string update = "Update STAFF_INFO Set Staff_Name=N'" + txtname.Text + "',Sex='" + txtsex.Text + "',Date_Of_Birth='" + txtday.Text + "',Phone_Number='" + txtsdt.Text + "',Staff_Address='" + txtaddress.Text + "',Staff_Email='" + txtemail.Text + "' Where Staff_ID='" + (string)Session["id"] + "'";
                using (SqlConnection con = new SqlConnection(ConnectionData.connec))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(update, con);
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "update();", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
            }

        }

    
    }
}