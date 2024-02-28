using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieSystem
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("error.aspx");
            }
            TextBox1.Text = Session["user"].ToString();
            
        }

        private void setDetails()
        {
            try
            {
                TextBox1.Text = Session["user"].ToString();
                string pwd = "";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from Customer where Mobile_Num="+Session["user"], conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                foreach(DataRow dr in dt.Rows)
                {
                    pwd=dr["Password"].ToString();
                }


                
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string pwd = "";
                SqlCommand cmd1 = new SqlCommand("select * from Customer where Mobile_Num=" + Session["user"], conn);
                SqlDataReader reader = cmd1.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                foreach (DataRow dr in dt.Rows)
                {
                    pwd = dr["Password"].ToString();
                }
                if (pwd != TextBox2.Text.ToString())
                {
                    invalidpwd.Visible = true;
                    success.Visible = false;
                }

                else
                {
                    string pass = TextBox3.Text;
                    SqlCommand cmd = new SqlCommand("update customer set Password='" + pass + "' where Mobile_Num=" + Session["user"], conn);
                    cmd.ExecuteNonQuery();
                    success.Visible = true;
                    invalidpwd.Visible = false;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}