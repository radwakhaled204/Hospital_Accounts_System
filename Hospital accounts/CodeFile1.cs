using System; 
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Hospital_accounts
{
    public static class MyFunctions
    {
        private static string connectionString;
        public static SqlDataReader r;
        public static SqlCommand cmd;
        public static DataTable dt;
        public static int v_code = 1;
        public static string sql = "";
        public static SqlConnection con;
        public static GridViewRow grid_row;
        public static LinkButton btn;
        public static DataRow row;
        public static SqlDataAdapter da;

        static MyFunctions()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }


/*تعديل*//*
        public static void grid_search(string search_term, DataTable datatable, string col, GridView grid_name)
        {
            DataTable filterdt = new DataTable();
            filterdt.Columns.Add(col, typeof(string));

            foreach (DataRow row in datatable.Rows)
            {
                if (row[col].ToString().Contains(search_term))
                {
                    filterdt.ImportRow(row);
                }
            }

            grid_name.DataSource = filterdt;
            grid_name.DataBind();
        }
        */


        public static void fill_mang(DropDownList branch)
        {
            dt = new DataTable();
            using ( con = new SqlConnection(connectionString))
            {
                cmd = new SqlCommand("SELECT name_ FROM  mang ", con);
                da = new SqlDataAdapter(cmd);
                con.Open();  
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    branch.DataSource = dt;
                    branch.DataTextField = "name_";
                    branch.DataValueField = "name_";
                    branch.DataBind();
                    branch.Items.Insert(0, new ListItem("--  اختار فرع  --", "0"));
                }
            }
        }

        public static void fill_levels(DropDownList level, string selectedCode, string condition , string lev)
        {

             dt = new DataTable();
            using ( con = new SqlConnection(connectionString))
            {              
                cmd = new SqlCommand(condition, con); 
                cmd.Parameters.AddWithValue("@SelectedValue", selectedCode);
                da = new SqlDataAdapter(cmd);
                con.Open();
                da.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {
                    level.DataSource = dt;
                    level.DataTextField = "name";
                    level.DataValueField = "code";
                    level.DataBind();
                    level.Items.Insert(0, new ListItem("-----  "+lev+" -----", "0"));
                }
            }
        }


        public static DataTable load_acc_typ (string cond , GridView grid)
        {
            dt = new DataTable();

            using (con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    cmd = new SqlCommand(cond, con);
                    dt.Load(cmd.ExecuteReader());
                    grid.DataSource = dt;
                    grid.DataBind();
                }
                finally
                {
                    con.Close();
                }
            }
            return dt;
      
        }

        public static DataTable load_acc_levl(string cond , GridView grid)
        {
            dt = new DataTable();

            {
                using (con = new SqlConnection(connectionString))
                {
                    cmd = new SqlCommand("SELECT name , code , name1, code1 ,name2, code2 , name3, code3,name4, code4  FROM acc_lev " + cond, con);


                    try
                    {
                        con.Open();
                        dt.Load(cmd.ExecuteReader());
                        grid.DataSource = dt;
                        grid.DataBind();

                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }

            return dt;
        }


    }
}



