using Project.DataHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["username"] != null)
            {
                DateTime dt = DateTime.Now;
                string month = dt.Month.ToString();
                string year = dt.Year.ToString();
                string day = dt.Day.ToString();
                lbday.Text = day + "-" + month + "-" + year;
                LoadData();
                load();
                count();
                dangmuon();
                datra();
                nhanvien();
                quanly();
                thuthu();
                sovipham();
                tongvipham();
                top();
                topmuon();
            }
            else
            {
                Response.Redirect("/dangnhap");
            }
        }
        void LoadData()
        {

            string query = "select * from STATISTIC";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbstatis.Text = rd["Revenue"].ToString() + " VNĐ";
                    lbchi.Text = rd["CPR_Fee"].ToString() + " VNĐ";
                    lbnhuan.Text = rd["Profit"].ToString() + " VNĐ";
                }
            }


        }
        void top()
        {
            string query = "select * from view_MOST_BORROWING";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tabletop.DataSource = dt.Tables[0];
                tabletop.DataBind();
                con.Close();
            }
        }
        void topmuon()
        {
            string query = "select Reader_ID,ISBN from view_BORROW_NOT_RETURN";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();
                DataSet dt = new DataSet();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter app = new SqlDataAdapter(cmd);
                app.Fill(dt);
                tabletopmuon.DataSource = dt.Tables[0];
                tabletopmuon.DataBind();
                con.Close();
            }
        }
        void load()
        {
          
            string query = "Select Sum(Gain) as tong From Revenue where Revenue_Date=Convert(Char(8), GETDATE(), 112)";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbthu.Text = rd["tong"].ToString() + " VNĐ";
                }
                else
                {
                    lbthu.Text = "Not Data";
                }
            }


        }
        void count()
        {

            string query = "select count(Reader_ID) as tong from READER";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbsum.Text = rd["tong"].ToString();
                }
            }


        }
        void dangmuon()
        {

            string query = "select count(Reader_ID) as muon from BOOK_BORROWING where Borrowing_Status='False'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbsach.Text = rd["muon"].ToString();
                }
            }

        }
        void datra()
        {

            string query = "select count(Reader_ID) as muon from BOOK_BORROWING where Borrowing_Status='True'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbtra.Text = rd["muon"].ToString();
                }
            }

        }
        void nhanvien()
        {
            string query = "select count(Staff_ID) as tong from STAFF";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbnhanvien.Text = rd["tong"].ToString();
                }
            }
        }
        void quanly()
        {
            string query = "select count(Staff_ID) as tong from STAFF where Designation=N'Quản Lý'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbquanly.Text = rd["tong"].ToString();
                }
            }
        }
        void thuthu()
        {
            string query = "select count(Staff_ID) as tong from STAFF where Designation=N'Thủ Thư'";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbthuthu.Text = rd["tong"].ToString();
                }
            }
        }
        void sovipham()
        {
            string query = "Select Count( Distinct Reader_ID) as tong From READER_BLACKLIST";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbtongvipham.Text = rd["tong"].ToString();
                }
            }
        }
        void tongvipham()
        {
            string query = "Select Count(VT_Cate_ID) as tong From READER_BLACKLIST";
            using (SqlConnection con = new SqlConnection(ConnectionData.connec))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    lbvipham.Text = rd["tong"].ToString();
                }
            }
        }
        protected void btnemail_Click(object sender, EventArgs e)
        {
            if (txtcontent.Text == "" || txtgo.Text == "" || txtmk.Text == "" || txttitle.Text == "" || txtto.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "warning();", true);
                return;
            }
            Thread t = new Thread(() =>
            {
                try
                {

                    MailMessage mail = new MailMessage(txtgo.Text, txtto.Text, txttitle.Text, txtcontent.Text);

                    SmtpClient smtp = new SmtpClient()
                    {
                        //Máy chủ smtp
                        Host = "smtp.gmail.com",
                        //Cổng gửi thư
                        Port = 587,
                        //Tài khoản Gmail
                        Credentials = new NetworkCredential(txtgo.Text, txtmk.Text),
                        EnableSsl = true
                    };

                    smtp.Send(mail);

                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "send();", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);
                }
            });
            t.IsBackground = true;
            t.Start();
        }

        protected void functionreader(object sender, EventArgs e)
        {
            
                Response.Redirect("/muon-tra-sach");
            
        }
        protected void functionrevenue(object sender, EventArgs e)
        {
            if ((string)Session["designation"] == "Thủ Thư")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "thuthu();", true);
                return;
            }
            else
            {
                Response.Redirect("/doanh-thu");
            }
        }
        protected void functionstatistic(object sender, EventArgs e)
        {
            if ((string)Session["designation"] == "Thủ Thư")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "thuthu();", true);
                return;
            }
            else
            {
                Response.Redirect("/thong-ke");
            }
        }
        protected void functionStaff(object sender, EventArgs e)
        {
            if ((string)Session["designation"] == "Thủ Thư")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "thuthu();", true);
                return;
            }
            else
            {
                Response.Redirect("/nhan-vien");
            }
        }
        protected void functionblack(object sender, EventArgs e)
        {
           
                Response.Redirect("/danh-sach-den");
            
        }
    }
}