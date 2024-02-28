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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["user"] == null)
                //{
                //    Response.Redirect("error.aspx");
                //}
                setCustomerDetails();
            }
        }

        private void setCustomerDetails()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("select * from Customer", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (!reader.HasRows)
                {
                    hascustomer.Visible = true;
                }
                else
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "Mobile_Num";
                    DropDownList1.DataValueField = "Mobile_Num";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, "Select");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        protected void deleteCustomers_Click(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedValue.ToString() == "Select")
                {
                    delete.Visible = false;
                    Div1.Visible = true;
                }
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                SqlCommand cmd2 = new SqlCommand("delete from Customer where Mobile_Num=" + DropDownList1.SelectedValue.ToString(), conn);
                int r = cmd2.ExecuteNonQuery();
                conn.Close();
                if (r == 1)
                {
                    delete.Visible = true;
                    Div1.Visible = false;
                    clearText();
                    setCustomerDetails();
                }
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }

        private void clearText()
        {
            agetf.Text = "";
            nametf.Text = "";
            mailtf.Text = "";
        }

        protected void updateDetails_Click(object sender, EventArgs e)
        {
            string n,a,m;
            n = nametf.Text;
            m = mailtf.Text;
            a = agetf.Text;

            if (n == "" || m == "" || a == "")
            {
                update.Visible = true;
                issuccess.Visible = false;
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("update Customer set Age=" + a + ",Name='" + n + "',Email='" + m + "' where Mobile_Num=" + DropDownList1.SelectedValue.ToString(), conn);
                int r = cmd.ExecuteNonQuery();
                if (r == 1)
                {
                    SqlCommand cmd2 = new SqlCommand("delete from Ticket where Show_Id in (select Show_Id from Show where Screen_Id in (select Screen_Id from Theatre_Screens where Movie_Id=" + DropDownList1.SelectedValue.ToString() + "))", conn);
                    cmd2.ExecuteNonQuery();
                    update.Visible = false;
                    issuccess.Visible = true;
                    clearText();
                    setCustomerDetails();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (DropDownList1.SelectedItem.Value.ToString() != "Select")
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("select * from Customer where Mobile_Num=" + DropDownList1.SelectedValue.ToString(), conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    reader.Close();
                    foreach (DataRow dr in dt.Rows)
                    {
                        agetf.Text = dr["Age"].ToString();
                        nametf.Text = dr["Name"].ToString();
                        mailtf.Text = dr["Email"].ToString();
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
    }
}