using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.GUI
{
    public class AddCateBook
    {
        private string catebook;
        public AddCateBook()
        {
        }
        public AddCateBook(String cate)
        {
            catebook = cate;
        }

     

        public String getCateBook()
        {
            return catebook;
        }

        public void setCateBook(String cate)
        {
            catebook = cate;
        }
    }
}