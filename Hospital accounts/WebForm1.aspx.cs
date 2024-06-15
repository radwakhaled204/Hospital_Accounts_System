using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;



namespace Hospital_accounts
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string connectionString;
        public SqlDataReader r;
        public SqlCommand cmd;
        DataTable dt;
        public int v_code = 1;
        string sql = "";
        public WebForm1()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    {
                        SqlDataAdapter da = new SqlDataAdapter("SELECT id,name,pas,admin_,cust_n,mang_n FROM user_", con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                        ReportViewer1.LocalReport.DataSources.Clear();
                        ReportViewer1.LocalReport.DataSources.Add(rds);
                    }
                }
            }
        }

    }
}








