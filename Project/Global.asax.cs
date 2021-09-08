using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;


namespace Project
{
    public class Global : System.Web.HttpApplication
    {
        void RegisterRoutes(RouteCollection routes)
        {
            
            routes.MapPageRoute("","","~/index.aspx");
            routes.MapPageRoute("", "nha-xuat-ban", "~/Publisher.aspx");
            routes.MapPageRoute("", "doc-gia", "~/Reader.aspx");
            routes.MapPageRoute("", "danh-sach-den", "~/Black-List.aspx");
            routes.MapPageRoute("", "ca-nhan/{id}", "~/Profile.aspx");
            routes.MapPageRoute("", "ca-nhan/{id}/cap-nhap-thong-tin", "~/Update-Profile.aspx");
            routes.MapPageRoute("", "danh-muc-sach", "~/Book-Cate.aspx");
            routes.MapPageRoute("", "sach", "~/Book.aspx");
            routes.MapPageRoute("", "muon-tra-sach", "~/Book_Borrowing.aspx");
            routes.MapPageRoute("", "ban-quyen", "~/Copyright.aspx");
            routes.MapPageRoute("", "doanh-thu", "~/Revenue.aspx");
            routes.MapPageRoute("", "thong-ke", "~/Statistic.aspx");
            routes.MapPageRoute("", "danh-muc-vi-pham", "~/Violation.aspx");
            routes.MapPageRoute("", "tac-gia", "~/Writer.aspx");
            routes.MapPageRoute("", "nhan-vien", "~/Staff.aspx");
            routes.MapPageRoute("", "dangnhap", "~/Login.aspx");
        }
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}