using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_accounts
{
    public partial class tree : System.Web.UI.Page
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
        string selectedValue;
        string selectedCode;
        string searchtext;
         int rowIndex = 0;
        int lastCode = 0;
        string newCode;
        int ii = 0;
        public tree()
        {

            connectionString = ConfigurationManager.ConnectionStrings["ConData"].ConnectionString;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MyFunctions.fill_mang(branch);
                MyFunctions.fill_levels(first_level, "", "SELECT name, code FROM acc_lev1", "المستوى الاول");
                MyFunctions.load_acc_typ("select * from acc_typ", acc_typ );
                first_txt.Attributes.Add("oncontextmenu", "showContextMenu(event)");

            }
        }


        protected void Enable_Click(object sender, EventArgs e)
        {
            TextBox textbox = FindControlRecursive(Page, "second_txt") as TextBox;

            if (textbox != null)
            {
                textbox.ReadOnly = false;
                textbox.Enabled = true;
                textbox.Focus();
                second_code.Text = "";
                second_txt.Text = "";

            }
        }


        protected void Disable_Click(object sender, EventArgs e)
        {
            TextBox textbox = FindControlRecursive(Page, "second_txt") as TextBox;

            if (textbox != null)
            {
                textbox.ReadOnly = true;

            }
        }

        private Control FindControlRecursive(Control control, string id)
        {
            // هنتاكد ان العنصر بنفس ال id
            if (control.ID == id)
            {
                return control; // لو موجود رجعه
            }

            //  ابحث في العناصر الفرعية  
            foreach (Control childControl in control.Controls)
            {
                Control foundControl = FindControlRecursive(childControl, id); // هنكرر استدعائها عشان نبحث فى العناصر الفرعيه 
                if (foundControl != null)
                {
                    return foundControl; // لو موجود رجعه
                }
            }

            return null; //لو مش موجود رجع  null
        }





        protected void acc_typ_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowDetails")
            {
                rowIndex = Convert.ToInt32(e.CommandArgument);
                grid_row = acc_typ.Rows[rowIndex];
                btn = (LinkButton)grid_row.Cells[0].Controls[0];
                fill_head.Text = btn.Text;



                using (con = new SqlConnection(connectionString))
                {
                    sql = "SELECT name FROM acc_typ WHERE fill = @FillValue";
                    cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@FillValue", btn.Text);

                    try
                    {
                        con.Open();
                        r = cmd.ExecuteReader();
                        if (r.Read())
                        {
                            name_head.Text = r["name"].ToString();
                        }
                        r.Close();
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }



        protected void acc_lev_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowAccount")
            {
                rowIndex = Convert.ToInt32(e.CommandArgument);
                grid_row = acc_lev.Rows[rowIndex];
                btn = (LinkButton)grid_row.Cells[0].Controls[0];
                account_txt.Text = btn.Text;
                
            }
        }
        /*
        public DataTable load_acc_typ(string cond)
        {
            dt = new DataTable();

            using (con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(cond, con);
                    dt.Load(cmd.ExecuteReader());
                    acc_typ.DataSource = dt;
                    acc_typ.DataBind();
                }
                finally
                {
                    con.Close();
                }
            }

            return dt;
        }
        public DataTable load_acc_levl(string cond)
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
                        acc_lev.DataSource = dt;
                        acc_lev.DataBind();

                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }

            return dt;
        }*/
        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }
        protected void login_Click(object sender, EventArgs e)
        {

        }
        protected void internet_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void first_level_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedValue = first_level.SelectedItem.Text;
            first_txt.Text = selectedValue;
            selectedCode = first_level.SelectedValue;
            first_code.Text = selectedCode;
            ;
            MyFunctions.fill_levels(second_level, selectedCode, "SELECT name , code FROM acc_lev2 WHERE code1 = @SelectedValue", "المستوى الثانى");
            MyFunctions.load_acc_levl("  where  code1='" + selectedCode + "'", acc_lev);
           
        }
        protected void second_level_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedValue = second_level.SelectedItem.Text;
            second_txt.Text = selectedValue;
            selectedCode = second_level.SelectedValue;
            second_code.Text = selectedCode;

            MyFunctions.fill_levels(third_level, selectedCode, "SELECT name , code FROM acc_lev3 WHERE code2 = @SelectedValue", "المستوى الثالث");
            MyFunctions.load_acc_levl("  where  code2='" + selectedCode + "'", acc_lev);
        }
        protected void third_level_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedValue = third_level.SelectedItem.Text;
            third_txt.Text = selectedValue;
            selectedCode = third_level.SelectedValue;
            third_code.Text = selectedCode;
            MyFunctions.fill_levels(fourth_level, selectedCode, "SELECT name , code FROM acc_lev4 WHERE code3 = @SelectedValue", "المستوى الرابع");
            MyFunctions.load_acc_levl("  where  code3='" + selectedCode + "'", acc_lev);

        }
        protected void fourth_level_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedValue = fourth_level.SelectedItem.Text;
            fourth_txt.Text = selectedValue;
            selectedCode = fourth_level.SelectedValue;
            fourth_code.Text = selectedCode;
            MyFunctions.load_acc_levl("  where  code4='" + selectedCode + "'", acc_lev);

        }
        protected void mored_click(object sender, EventArgs e)
        {
            MyFunctions.load_acc_levl("  where  code4='2010101'", acc_lev);
            MyFunctions.load_acc_typ("select * from acc_typ where fill='مورد'", acc_typ);



            dt = new DataTable();

            {
                using (con = new SqlConnection(connectionString))
                {
                    cmd = new SqlCommand("select * from acc_lev4 where code = '2010101'", con);

                    try
                    {
                        con.Open();
                        dt.Load(cmd.ExecuteReader());
                        ii = 0;



                        while (ii < dt.Rows.Count)
                        {
                            row = dt.Rows[ii];
                            first_code.Text = row["code1"].ToString();
                            first_txt.Text = row["name1"].ToString();
                            second_code.Text = row["code2"].ToString();
                            second_txt.Text = row["name2"].ToString();
                            third_code.Text = row["code3"].ToString();
                            third_txt.Text = row["name3"].ToString();
                            fourth_code.Text = row["code"].ToString();
                            fourth_txt.Text = row["name"].ToString();
                            ii = +1;
                        }



                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
        protected void bank_click(object sender, EventArgs e)
        {
            MyFunctions.load_acc_levl("  where  code4='1020102'", acc_lev);
            MyFunctions.load_acc_typ("select * from acc_typ where fill='بنك' and name = 'اشعارات'", acc_typ);
            dt = new DataTable();

            {
                using (con = new SqlConnection(connectionString))
                {
                    cmd = new SqlCommand("select * from acc_lev4 where code = '1020102'", con);

                    try
                    {
                        con.Open();
                        dt.Load(cmd.ExecuteReader());
                        ii = 0;



                        while (ii < dt.Rows.Count)
                        {
                            row = dt.Rows[ii];
                            first_code.Text = row["code1"].ToString();
                            first_txt.Text = row["name1"].ToString();
                            second_code.Text = row["code2"].ToString();
                            second_txt.Text = row["name2"].ToString();
                            third_code.Text = row["code3"].ToString();
                            third_txt.Text = row["name3"].ToString();
                            fourth_code.Text = row["code"].ToString();
                            fourth_txt.Text = row["name"].ToString();
                            ii = +1;
                        }



                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
        protected void all_acc_typ_Click(object sender, EventArgs e)
        {
            MyFunctions.load_acc_typ("select * from acc_typ", acc_typ);

        }
        protected void search_acc_typ_TextChanged(object sender, EventArgs e)
        {
            searchtext = search_acc_typ.Text;

            MyFunctions.load_acc_typ("SELECT * FROM acc_typ WHERE fill LIKE '%" + searchtext + "%' ", acc_typ);
            search_acc_typ.Text = "";
        }
        protected void search_acc_lev_TextChanged(object sender, EventArgs e)
        {
            searchtext = search_acc_lev.Text;
            MyFunctions.load_acc_levl(" WHERE name LIKE '%" + searchtext + "%' ", acc_lev);
            search_acc_lev.Text = "";
        }
        protected void all_acc_lev_Click(object sender, EventArgs e)
        {
            MyFunctions.load_acc_levl("select * from acc_lev", acc_lev);
        }
        protected void print(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
        protected void save_tree_Click(object sender, EventArgs e)
        {

            using (con = new SqlConnection(connectionString))
            {/* CHECK*/


                string IfExist = "select count(*) from acc_lev where name = @account ";
                SqlCommand check = new SqlCommand(IfExist, con);
                check.Parameters.AddWithValue("@account", account_txt.Text);

                con.Open();
                int count = (int)check.ExecuteScalar();
                con.Close();

                if (count > 0)
                {

                    lbl_message.Text = "اسم الحساب موجود بالفعل";
                    return;
                }
                if (string.IsNullOrWhiteSpace(fill_head.ToString()) && string.IsNullOrWhiteSpace(name_head.ToString()))
                {
                    lbl_message.Text = "يجب اختيار نوع الحساب";
                    return;
                }






                sql = "SELECT ISNULL(MAX(code), 0) AS lastCode FROM acc_lev";
                cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    lastCode = (int)Convert.ToInt64(reader["lastCode"]);

                }
                reader.Close();


                lastCode++;
                newCode = lastCode.ToString("D3"); // تنسيق الرمز الجديد بحيث يكون ثلاثة أرقام


                Console.WriteLine("New code: " + newCode);
                con.Close();

                /*MAX  SICK_CODE


                sql = "select max(code) as code from acc_lev";
                cmd = new SqlCommand(sql, con);


                con.Open();
                r = cmd.ExecuteReader();
                r.Read();
                if (r.HasRows)
                {
                    if (r["sick_code"] != DBNull.Value)
                    {
                        v_code = Convert.ToInt32(r["code"]);
                        v_code = v_code + 1;
                    }
                }

                r.Close();
                con.Close();*/


                /*SAVE*/
                sql = "insert into acc_lev (name1,code1,name2,code2,name3,code3,name4,code4,name,code,fill,fill_name) values (@name1,@code1,@name2,@code2,@name3,@code3,@name4,@code4,@name,@code,@fill,@fill_name)";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", account_txt.Text);
                cmd.Parameters.AddWithValue("@code", newCode);
                cmd.Parameters.AddWithValue("@name1", first_level.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@code1", first_txt.Text);
                cmd.Parameters.AddWithValue("@name2", second_level.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@code2", second_txt.Text);
                cmd.Parameters.AddWithValue("@name3", third_level.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@code3", third_txt.Text);
                cmd.Parameters.AddWithValue("@name4", fourth_level.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@code4", fourth_txt.Text);
                cmd.Parameters.AddWithValue("@fill", fill_head.Text);
                cmd.Parameters.AddWithValue("@fill_name", name_head.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lbl_message.Text = "تم التخزين بنجاح";

                /*Session["sick_code"] = v_code;
                Session["n1"] = txtname.Text;
                Session["mob1"] = txtphone.Text;
                Session["p_ppass"] = txtpass.Text;*/







            }
        }


    }
}
