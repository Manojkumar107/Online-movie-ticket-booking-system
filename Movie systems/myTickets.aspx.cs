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
    public partial class WebForm7 : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("select a.Ticket_Id,a.Num_of_seats,a.Total_cost,d.Movie_Name,d.Movie_Language,d.Cbfc_Certificate,b.show_day,b.show_time from Ticket a inner join Show b on (a.Show_Id= b.Show_Id) inner join Theatre_Screens c on (b.Screen_Id=c.Screen_Id) inner join Movie d on (c.Movie_Id=d.Movie_Id) where a.User_Id=" + Session["user"], conn);
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
                }
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
                Response.Write(GridView1.DataKeys[e.RowIndex].Value.ToString());
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd1 = new SqlCommand("select Num_of_seats,Show_Id from Ticket where Ticket_Id=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()), conn);
                int n = cmd1.ExecuteNonQuery();

                SqlDataReader reader = cmd1.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);

                int seats=0,show=0;
                foreach(DataRow dr in dt.Rows)
                {
                    seats = Int32.Parse(dr["Num_of_seats"].ToString());
                    show = Int32.Parse(dr["Show_Id"].ToString());
                }
                Response.Write(seats+ show);
                SqlCommand cmd2 = new SqlCommand("delete from Ticket where Ticket_Id=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()), conn);
                int r=cmd2.ExecuteNonQuery();

                //SqlCommand cmd3 = new SqlCommand("update Show set free_seats=free_seats+"+seats+",occupied_seats=occupied_seats-"+seats+" where Show_Id=" + show, conn);
                //int r=cmd3.ExecuteNonQuery();
                if (r == 1)
                {
                    issuccess.Visible=true;
                    Response.Redirect("myTickets.aspx");
                }
                conn.Close();

            }
            catch (Exception ex)
            {
                //Response.Write("error" + ex.ToString());
            }
        }

        protected void booktickets_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }


        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Delete")
        //    {
        //        int rowIndex = Convert.ToInt32(e.CommandArgument);

        //        GridViewRow SelectedRow = GridView1.Rows[rowIndex];

        //        string id = SelectedRow.Cells[1].Text;

        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('id:')" + id, true);

        //        try
        //        {
        //            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //            conn.Open();

        //            SqlCommand cmd = new SqlCommand("delete from Ticket where Ticket_Id=" + id, conn);
        //            cmd.ExecuteNonQuery();

        //            SqlCommand cmd1 = new SqlCommand("selct Num_of_seats,Show_Id from Ticket where Ticket_Id=" + id, conn);
        //            int n = cmd1.ExecuteNonQuery();

        //            SqlDataReader reader = cmd.ExecuteReader();
        //            DataTable dt = new DataTable();
        //            dt.Load(reader);

        //            int seats = 0, show = 0;
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                seats = Int32.Parse(dr["Num_of_seats"].ToString());
        //                show = Int32.Parse(dr["Show_Id"].ToString());
        //            }

        //            SqlCommand cmd2 = new SqlCommand("delete from Ticket where Ticket_Id=" + id, conn);
        //            cmd2.ExecuteNonQuery();

        //            SqlCommand cmd3 = new SqlCommand("update Show set free_seats=free_seats+" + seats + ",occupied_seats=occupied_seats-" + seats + " where Show_Id=" + show, conn);
        //            int r = cmd3.ExecuteNonQuery();
        //            if (r == 1)
        //            {
        //                Response.Write("Success");
        //            }
        //            setDetails();
        //            conn.Close();

        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write("error" + ex.ToString());
        //        }
        //    }
        //}
    }
}