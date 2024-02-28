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
    public partial class WebForm4 : System.Web.UI.Page
    {

        public String movie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("error.aspx");
            }
            movie = (string)Session["Movie"];
            setDetails();
        }

        private void setDetails()
        {
            Image1.ImageUrl = "~/images/" + movie + ".jpg";
            Response.Write("~/images/" + movie + ".jpg");
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from Movie where Movie_Name='" + movie+"'", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookTickets.aspx");
        }
    }
}