using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MovieSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                Int64 num = Int64.Parse(TextBox1.Text);
                string pwd = TextBox2.Text;
                if (num == 9999999999 && pwd == "admin")
                {
                    Session["user"] = "admin";
                    Response.Redirect("adminPageCustomers.aspx");
                }
                SqlCommand cmd1 = new SqlCommand("select * from Customer where Mobile_Num=" + num, conn);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (!dr.HasRows)
                {
                    nouser.Visible = true;
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    SqlCommand cmd = new SqlCommand("select Password from Customer where Mobile_Num=" + num, conn);
                    string mainpwd = cmd.ExecuteScalar().ToString();

                    if (mainpwd == pwd)
                    {
                        Session["user"] = Int64.Parse(TextBox1.Text);
                        //Response.Write("<script>alert('Data inserted successfully')</script>");
                        Response.Redirect("dashboard.aspx", true);
                    }
                }
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Register.aspx", true);
        }
    }
}