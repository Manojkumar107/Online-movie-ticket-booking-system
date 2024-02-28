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
    public partial class WebForm6 : System.Web.UI.Page
    {
        int freeseats;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("error.aspx");
            }
            getSeatCount();
            
        }

        

        private void getSeatCount()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("select free_seats from Show where Show_Id=" + Session["show"], conn);
                string free = cmd.ExecuteScalar().ToString();
                freeseats= int.Parse(free);
                TextBox4.Text = free;

                cmd = new SqlCommand("select Cost from Show where Show_Id=" + Session["show"], conn);
                string cost = cmd.ExecuteScalar().ToString();
                TextBox1.Text = cost;
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            findCost();
            int num = int.Parse(TextBox2.Text);
            int cost = int.Parse(TextBox3.Text);
            if (num <= 0)
            {
                div1.Visible = true;
            }
            else
            {
                freeseats -= num;
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("insert into Ticket (Num_of_seats,Show_Id,Total_cost,User_Id) values(" + num + "," + Session["show"] + "," + cost + "," + Session["user"] + ")", conn);
                    int r=cmd.ExecuteNonQuery();


                    //cmd = new SqlCommand("update Show set free_seats=" + freeseats + ",occupied_seats=" + num + " where Show_Id=" + Session["show"], conn);
                    //int r = cmd.ExecuteNonQuery();
                    if (r == 1)
                    {
                        Response.Redirect("successPage.aspx");
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("error" + ex.ToString());
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            findCost();
        }

        private void findCost()
        {
            int perseat = int.Parse(TextBox2.Text);
            int count = int.Parse(TextBox1.Text);
            int total = perseat * count;
            TextBox3.Text = total.ToString();
        }
    }
}