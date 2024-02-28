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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string[] movies= new string[3];
        protected void Page_Load(object sender, EventArgs e)
        {
            getMovies();
            if (!Page.IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("error.aspx");
                }

                slideshow();
                loadImages();
            }
            
        }

        private void getMovies()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select Movie_Name from Movie", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();
                int i = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    movies[i] = dr["Movie_Name"].ToString();
                    i++;
                }
                reader.Close();
                conn.Close();
        }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        private void loadImages()
        {
            Image2.ImageUrl = "~/images/"+movies[0]+"1.jpg";
            Image3.ImageUrl = "~/images/"+movies[1]+"1.jpg";
            Image4.ImageUrl = "~/images/"+movies[2]+"1.jpg";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            slideshow();
        }

        private void slideshow()
        {
            Random rnd = new Random();
            int a = rnd.Next(1, 4);
            String s = movies[a - 1];
            Image1.ImageUrl = "~/images/slide" + s + a.ToString() + ".jpg";
            //Image1.ImageUrl = "~/images/slide" +a.ToString() + ".jpg";
        }

        

        protected void screen2_Click(object sender, EventArgs e)
        {
            Session["Movie"] = movies[1];
            Response.Redirect("movieDetails.aspx");
        }

        protected void screen3_Click(object sender, EventArgs e)
        {
            Session["Movie"] = movies[2];
            Response.Redirect("movieDetails.aspx");
        }

        protected void screen1_Click(object sender, EventArgs e)
        {
            Session["Movie"] = movies[0];
            Response.Redirect("movieDetails.aspx");
        }
    }
}