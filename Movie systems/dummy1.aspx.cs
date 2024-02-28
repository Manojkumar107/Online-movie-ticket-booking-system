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
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setMovieDetails();
        }
        private void setMovieDetails()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from Movie", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();
                GridView2.DataSource = dt;
                GridView2.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView2.EditIndex = e.NewEditIndex;
            setMovieDetails();
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView2.EditIndex = -1;
            setMovieDetails();
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string query = @"UPDATE Movie SET Movie_Name=@Mname where Movie_Id=@mid";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Mname", (GridView2.Rows[e.RowIndex].FindControl("mvname") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@mid", Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString()));
                //cmd.Parameters.AddWithValue("@Emp_Email", (GridView2.Rows[e.RowIndex].FindControl("txtEmpEmail") as TextBox).Text.Trim());
                //cmd.Parameters.AddWithValue("@Emp_Id", Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString()));
                int n = cmd.ExecuteNonQuery();
                GridView2.EditIndex = -1;
                Console.WriteLine(n);
                setMovieDetails();
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }



    }
}