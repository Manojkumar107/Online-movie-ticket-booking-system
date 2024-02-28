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
    public partial class WebForm5 : System.Web.UI.Page
    {
        public string movie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("error.aspx");
                }
                movie = (string)Session["Movie"];
                setDetails();

            }
        }

        private void setDetails()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                int id;
                if (movie == "The Batman")
                {
                    id = 1;
                }
                else if (movie == "KGF Chapter 2")
                {
                    id = 2;
                }
                else
                {
                    id = 3;
                }
                SqlCommand cmd = new SqlCommand("select Show_Id,occupied_seats, free_seats, show_day, show_time from Show where Screen_Id=(select screen_id from Theatre_Screens where Movie_Id=" + id + ")", conn);   
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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] =
                    this.Page.ClientScript.
                   GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
            }
        }


        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow SelectedRow = GridView1.SelectedRow;
            string row = SelectedRow.Cells[0].Text;
            Response.Write(row);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                GridViewRow SelectedRow = GridView1.Rows[rowIndex];

                //string show = (GridView1.SelectedRow.FindControl("label8") as Label).Text;

                //string available = (GridView1.SelectedRow.FindControl("label2") as Label).Text;
                int show = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value.ToString());
                string available =(GridView1.Rows[rowIndex].FindControl("label2") as Label).Text.Trim();
                if (available == "0")
                {
                    seatavailable.Visible = true;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('show:')" + show, true);
                    Response.Write(show);
                    Session["show"] = show;
                    Response.Redirect("selectSeats.aspx");
                }
            }
        }
    }
}