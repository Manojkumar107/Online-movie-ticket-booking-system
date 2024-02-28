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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                Int64 num = Int64.Parse(TextBox1.Text);
                int age = Int32.Parse(TextBox2.Text);
                string name = TextBox4.Text;
                string email = TextBox5.Text;
                string pwd = TextBox3.Text;
                SqlCommand cmd1 = new SqlCommand("select * from Customer where Mobile_Num=" + num,conn);
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    duplicate.Visible = true;
                    issuccess.Visible = false;
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    SqlCommand cmd = new SqlCommand("insert into Customer values(" + num + "," + age + ",'" + pwd + "','" + name + "','" + email + "')", conn);
                    cmd.ExecuteNonQuery();
                    issuccess.Visible = true;
                    duplicate.Visible = false;
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
            Response.Redirect("Signin.aspx");
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //        conn.Open();
        //        SqlCommand cmd = new SqlCommand("select * from movie", conn);
        //        SqlDataReader dr = cmd.ExecuteReader();
        //        DataTable dt = new DataTable();
        //        dt.Load(dr);
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //        conn.Close();

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("error" + ex.ToString());
        //    }

        //}

        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    try
        //    {

        //        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //        conn.Open();
        //        string pwd = TextBox5.Text;
        //        SqlCommand cmd = new SqlCommand("update customer set Password='" + pwd + "' where Mobile_Num=9780970321", conn);
        //        cmd.ExecuteNonQuery();
        //        /*Response.Write("Password Changed Successfully");*/
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("error" + ex.ToString());
        //    }

        //}
    }
}