using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_accounts
{
    public partial class Base_form : System.Web.UI.MasterPage
    {
        private string connectionString;
        public SqlDataReader r;
        public SqlCommand cmd;
        DataTable dt;
        public int v_code = 1;
        string sql = "";
        public Base_form()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}