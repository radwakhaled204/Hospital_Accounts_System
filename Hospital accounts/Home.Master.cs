using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;
using System.Xml.Linq;

namespace Hospital_accounts
{
    public partial class Home : System.Web.UI.MasterPage
    {

        private string connectionString;
        public SqlDataReader r;
        public SqlCommand cmd;
        DataTable dt;
        string sql = "";



        public Home()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
       
        }


    }
}

