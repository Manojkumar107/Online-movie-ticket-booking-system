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
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("error.aspx");
                }
                setDetails();
            }
        }

        private void setDetails()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select a.Ticket_Id,a.Num_of_seats,a.Total_cost,d.Movie_Name,d.Movie_Language,d.Cbfc_Certificate,b.show_day,b.show_time from Ticket a inner join Show b on (a.Show_Id= b.Show_Id) inner join Theatre_Screens c on (b.Screen_Id=c.Screen_Id) inner join Movie d on (c.Movie_Id=d.Movie_Id)", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                
                if (!reader.HasRows)
                {
                    isticket.Visible = true;
                }
                else
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "Ticket_Id";
                    DropDownList1.DataValueField = "Ticket_Id";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, "Select");
                }
                reader.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select Num_of_seats,Show_Id from Ticket where Ticket_Id=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()), conn);
                int n = cmd1.ExecuteNonQuery();

                SqlDataReader reader = cmd1.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                int seats = 0, show = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    seats = Int32.Parse(dr["Num_of_seats"].ToString());
                    show = Int32.Parse(dr["Show_Id"].ToString());
                }
                Response.Write(seats + show);
                SqlCommand cmd2 = new SqlCommand("delete from Ticket where Ticket_Id=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()), conn);
                int r = cmd2.ExecuteNonQuery();

                //SqlCommand cmd3 = new SqlCommand("update Show set free_seats=free_seats+"+seats+",occupied_seats=occupied_seats-"+seats+" where Show_Id=" + show, conn);
                //int r=cmd3.ExecuteNonQuery();
                conn.Close();

            }
            catch (Exception ex)
            {
                //Response.Write("error" + ex.ToString());
            }
        }

        protected void updateMovies_Click(object sender, EventArgs e)
        {
            try
            {
                if(DropDownList1.SelectedValue.ToString() == "Select")
                {
                    delete.Visible = false;
                    Div1.Visible = true;
                }
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd2 = new SqlCommand("delete from Ticket where Ticket_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                int r = cmd2.ExecuteNonQuery();
                conn.Close();
                if (r == 1)
                {
                    delete.Visible = true;
                    Div1.Visible = false;
                    setDetails();
                }
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}