using Project.DAO;
using Project.GUI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login(object sender, EventArgs e)
        {
            AccountDAO acc = new AccountDAO();
            Account a = acc.checkData(txtuser.Text, txtpass.Text);

            if (a != null)
            {
                Session["username"] = a.getUsername();
                Session["id"] = a.getID();
                Session["admin"] = a.getAdmin();
                Session["designation"] = a.getDesignation();
                Response.Redirect("/");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "error();", true);

            }

        }
        protected void gmail(object sender, EventArgs e)
        {
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
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "success();", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "thatbai();", true);
                }
            });
            t.IsBackground = true;
            t.Start();

        }
    }
}