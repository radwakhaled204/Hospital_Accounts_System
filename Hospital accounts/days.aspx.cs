using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Hospital_accounts
{
    public partial class days : System.Web.UI.Page
    {
        private string connectionString;
        public SqlDataReader r;
        public SqlCommand cmd;
        public DataTable dt;
        public SqlConnection con;
        public GridViewRow grid_row;
        public LinkButton btn;
        public DataRow row;
        public int v_code = 1;
        string sql = "";
        int rowIndex = 0;
        public days()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyFunctions.load_acc_typ("  select * from acc_lev", acc_lev);
                MyFunctions.load_acc_typ("  select * from acc_lev", acc_lev2);
                date.Text = DateTime.Now.ToString("dd-MM-yyyy");
              //  txtDate.Text = DateTime.Now.ToString("dd MMMM yyyy");
            }
        }

         protected void acc_lev_RowCommand(object sender, GridViewCommandEventArgs e)
         {
             if (e.CommandName == "ShowAccount")
             {
                 rowIndex = Convert.ToInt32(e.CommandArgument);
                 grid_row = acc_lev.Rows[rowIndex];
                 btn = (LinkButton)grid_row.Cells[0].Controls[0];
                 statement.Text = btn.Text;
             }
         }



        protected void first_new_click(object sender, EventArgs e)
        {
            madin_txt.Text = "";
            daen_txt.Text = "";
            before_txt.Text = "";
            rased_txt.Text = "";

        }
        protected void second_new_click(object sender, EventArgs e)
        {
            document.Text = "";
            amount.Text = "";
            account.Text = "";
            statement.Text = "";

        }
        protected void account_type_SelectedIndexChanged(object sender, EventArgs e)
        {

            fill_lbl();
        }
        protected void fill_lbl()
        {
            string selectedvalue = account_type.SelectedValue.ToString();

            if (selectedvalue == "مدين")
            {
                lbl_type.Text = "(استلام)";
                lbl_account.Text = "(دائن)";
            }
            else if (selectedvalue == "دائن")
            {
                lbl_type.Text = "(صرف)";
                lbl_account.Text = "(مدين)";

            }

        }

        protected void drop_item_SelectedIndexChanged(object sender, EventArgs e)
        {
             fill_second_drop();
        }

        protected void fill_second_drop()
        {
             dt = new DataTable();
            using ( con = new SqlConnection(connectionString))
            {
                con.Open();
                string selectedvalue = first_drop.SelectedValue.ToString();
                
                if (selectedvalue == "يومية خزينة")
                {
                    cmd = new SqlCommand("SELECT name,code FROM acc_lev where code4=1020101", con);
                }
                else if (selectedvalue == "يومية عملاء")
                {
                    cmd = new SqlCommand("SELECT name,code FROM acc_lev where code4=1020301", con);

                }
                else if (selectedvalue == "يومية موردين")
                {
                    cmd = new SqlCommand("SELECT name,code FROM acc_lev where code4=2010101", con);
                }
                else
                {
                    cmd = new SqlCommand("SELECT name,code FROM acc_lev where code4=1020102", con);
                }

                cmd.Parameters.AddWithValue("@first_drop", first_drop.SelectedValue);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }

            if (dt.Rows.Count > 0)
            {
                second_drop.DataSource = dt;
                second_drop.DataTextField = "name";
                second_drop.DataValueField = "code";
                second_drop.DataBind();

            }
        }



        protected void second_drop_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCode = second_drop.SelectedValue;
            code_txt.Text = selectedCode;
        }
        protected void save_days_Click(object sender, EventArgs e)
        {

        }

        protected void acc_lev2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}