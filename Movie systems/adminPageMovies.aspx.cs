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
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("error.aspx");
                }
                setMovieDetails();
            }
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
                DropDownList1.DataSource= dt;
                DropDownList1.DataTextField = "Movie_Id";
                DropDownList1.DataValueField = "Movie_Id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "Select");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Response.Write(DropDownList1.SelectedItem.Value.ToString());
                if (DropDownList1.SelectedItem.Value.ToString() != "Select")
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("select * from Movie where Movie_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    reader.Close();
                    foreach (DataRow dr in dt.Rows)
                    {
                        mvname.Text = dr["Movie_Name"].ToString();
                        mvdir.Text = dr["Movie_Director"].ToString();
                        mvcert.Text = dr["Cbfc_Certificate"].ToString();
                        mvcast.Text = dr["Movie_Cast"].ToString();
                        mvlang.Text = dr["Movie_Language"].ToString();
                        mvdur.Text = dr["Movie_Duration"].ToString();
                    }
                    conn.Close();
                }
                else
                {
                    clearText();
                }
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        private void clearText()
        {
            mvname.Text = "";
            mvdir.Text = "";
            mvcert.Text = "";
            mvcast.Text = "";
            mvlang.Text = "";
            mvdur.Text = "";
        }

        protected void updateMovies_Click(object sender, EventArgs e)
        {
            string name, dir, cast, dur, cert, lang;
            name = mvname.Text;
            dir = mvdir.Text;
            dur = mvdur.Text;
            cert = mvcert.Text;
            lang = mvlang.Text;
            cast = mvcast.Text;

            if (name == "" || dir == "" || dur == "" || cert == "" || lang == "" || cast == "")
            {
                update.Visible = true;
                issuccess.Visible = false;
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("update Movie set Movie_Name='"+name+"',Movie_Director='"+dir+"',Movie_Duration="+dur+",Movie_Cast='"+cast+"',Cbfc_Certificate='"+cert+"',Movie_Language='"+lang+"' where Movie_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                int r= cmd.ExecuteNonQuery();
                if (r == 1)
                {
                    SqlCommand cmd2 = new SqlCommand("delete from Ticket where Show_Id in (select Show_Id from Show where Screen_Id in (select Screen_Id from Theatre_Screens where Movie_Id=" + DropDownList1.SelectedValue.ToString()+"))", conn);
                    cmd2.ExecuteNonQuery();
                    update.Visible=false;
                    issuccess.Visible = true;
                    clearText();
                    setMovieDetails();
                }
            }
        }
    }
}