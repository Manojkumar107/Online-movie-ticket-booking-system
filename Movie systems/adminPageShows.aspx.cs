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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("error.aspx");
                }
                setShowDetails();
            }
        }

        private void setShowDetails()
        {
            try
            {

                update.Visible = false;
                issuccess.Visible = false;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from Show", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);
                reader.Close();
                GridView2.DataSource = dt;
                GridView2.DataBind();
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "Show_Id";
                DropDownList1.DataValueField = "Show_Id";
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

                    SqlCommand cmd = new SqlCommand("select * from Show where Show_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    reader.Close();
                    foreach (DataRow dr in dt.Rows)
                    {
                        id.Text = dr["Screen_Id"].ToString();
                        day.Text = dr["show_day"].ToString();
                        time.Text = dr["show_time"].ToString();
                        cost.Text = dr["cost"].ToString();
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
            day.Text = "";
            time.Text = "";
            id.Text = "";
            cost.Text = "";
        }

        protected void updateShow_Click(object sender, EventArgs e)
        {
            string sid,d,t,c;
            sid = id.Text;
            d = day.Text;
            t = time.Text;
            c = cost.Text;

            if (sid == "" ||  d == "" || t == "" || c == "")
            {
                update.Visible = true;
                issuccess.Visible = false;
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("update Show set Screen_Id=" + sid + ",show_day='" + d + "',show_time='" + t + "',cost=" + c + " where Show_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                int r = cmd.ExecuteNonQuery();
                if (r == 1)
                {
                    SqlCommand cmd2 = new SqlCommand("delete from Ticket where Show_Id=" + DropDownList1.SelectedValue.ToString(), conn);
                    cmd2.ExecuteNonQuery();
                    update.Visible = false;
                    issuccess.Visible = true;
                    clearText();
                    setShowDetails();
                }
            }
        }
    }
}