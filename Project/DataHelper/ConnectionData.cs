using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Project.DataHelper
{
    public class ConnectionData
    {
        public static string connec = ConfigurationManager.ConnectionStrings["KetnoiCSDL"].ConnectionString.ToString();
    }
}