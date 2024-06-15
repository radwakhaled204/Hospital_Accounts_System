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
    public partial class accounts : System.Web.UI.Page
    {
        private string connectionString;
        public SqlDataReader r;
        public SqlCommand cmd;
        public DataTable dt;
        public SqlConnection con;
        public int v_code = 1;
        string sql = "";



        public accounts()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            load_data();
        }
        public DataTable load_data()
        {
             dt = new DataTable();

            {
                using ( con = new SqlConnection(connectionString))
                {
                     cmd = new SqlCommand("SELECT name, code  FROM acc_typ ", con);


                    try
                    {
                        con.Open();
                        dt.Load(cmd.ExecuteReader());
                        acc_typ.DataSource = dt;
                        acc_typ.DataBind();
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }

            return dt;
        }
        protected void tree_click(object sender, EventArgs e)
        {
            Response.Redirect("tree.aspx");
        }
        protected void days_click(object sender, EventArgs e)
        {
            Response.Redirect("days.aspx");
        }
    }
}