using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class balance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
        
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        try
        {
            Label1.Text = Session["name"].ToString();
            Label3.Text = Session["email"].ToString();
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

        if (Label3.Text != "office@kc.com" && Label3.Text != "canteen@kc.com")
        {
            SqlCommand cmd2 = new SqlCommand("select rfid from office where email='" + Session["email"].ToString() + "'", con);
            int r = Convert.ToInt32(cmd2.ExecuteScalar());
            TextBox1.Text = Convert.ToString(r);
        }
        else
        { 
        }             
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
            {
                SqlCommand cmd = new SqlCommand("select amount from office where rfid=" + TextBox1.Text + "", con);
                SqlCommand cmd1 = new SqlCommand("select status from office where rfid=" + TextBox1.Text + "", con);
                String st = Convert.ToString(cmd1.ExecuteScalar());

                if (st == "Blocked")
                {
                    Label2.Text=TextBox1.Text + " is Blocked";
                }
                else
                {
                    int bal = Convert.ToInt32(cmd.ExecuteScalar());
                    Label2.Text="Available Balance for RFID " + TextBox1.Text + " is: " + bal;
                }
            }
            catch (Exception e1)
            {
                Label1.Text=e1.Message;
            }
    }  
}
