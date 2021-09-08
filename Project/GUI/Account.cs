using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.GUI
{
    public class Account
    {
        private String id,user, pass,admin,designation;
        public Account(String Id,String Username, String Password,String Admin,String Designation)
        {
            id = Id;
            user = Username;
            pass = Password;
            admin = Admin;
            designation = Designation;
        }

        public Account()
        {
        }
        public String getID()
        {
            return id;
        }

        public void setID(String Id)
        {
            id = Id;
        }
        public String getUsername()
        {
            return user;
        }

        public void setUsername(String Username)
        {
            user = Username;
        }

        public String getPassword()
        {
            return pass;
        }

        public void setPassword(String Password)
        {
            pass = Password;
        }

        public String getAdmin()
        {
            return admin;
        }

        public void setAdmin(String Admin)
        {
            admin = Admin;
        }

        public String getDesignation()
        {
            return designation;
        }

        public void setDesignation(String Designation)
        {
            designation = Designation;
        }
    }
}