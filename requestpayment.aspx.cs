using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class requestpayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
        con.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT SUM(amount) FROM txn WHERE (type = 'debit') AND (dept = 'canteen')", con);
        int amt = Convert.ToInt32(cmd3.ExecuteScalar());
        TextBox2.Text = Convert.ToString(amt);

        try
        {
            Label1.Text = Session["name"].ToString();
        }
        catch
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["email"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
        }
        TextBox1.Text = Session["email"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {            
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO query(email,message) values(@email,@message)", con);
            SqlCommand cmd2 = new SqlCommand("SELECT reqid FROM query WHERE email= '" + Session["email"].ToString() + "' ORDER BY date DESC", con);
            try
            {
                SqlCommand cmd3 = new SqlCommand("INSERT INTO txn(email,summary,dept,amount) values('" + Session["email"].ToString() + "','Payment Request','Canteen','" + TextBox2.Text + "')", con);
            }
            catch (Exception c)
            {
                Label3.Text = c.Message; 
            }

            cmd.Parameters.AddWithValue("email", Session["email"].ToString());
            cmd.Parameters.AddWithValue("message", "Payment Request from Canteen: " + TextBox2.Text);
            cmd.ExecuteNonQuery();

            int id = Convert.ToInt32(cmd2.ExecuteScalar());
            Label2.Text = "Request has been submitted, Your request id is " + id;

        }
        catch (Exception e1)
        {
            Label3.Text = e1.Message;
        }

    }
}