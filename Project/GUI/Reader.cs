using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.GUI
{
    public class Reader
    {
        private string id;
        public Reader()
        {

        }
        public Reader(String id)
        {
            this.id = id;
        }
        public String getId()
        {
            return id;
        }

        public void setId(String id)
        {
            this.id = id;
        }
    }
}