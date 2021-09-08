using Project.DAO;
using Project.GUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = RouteData.Values["id"].ToString();
            if (!IsPostBack)
            {
                if ((string)Session["username"] != null)
                {
                    try
                    {
                        StaffInfoDAO info = new StaffInfoDAO();
                        StaffInfo list = info.FindStaffInfo(id);
                        lbname.Text = list.getName();
                        lbbirth.Text = list.getNgaysinh();
                        lbemail.Text = list.getEmail();
                        lbphone.Text = list.getSdt();
                        lbsex.Text = list.getSex();
                        lbaddress.Text = list.getDiachi();

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

        protected void update_Click(object sender, EventArgs e)
        {

        }
    }
}