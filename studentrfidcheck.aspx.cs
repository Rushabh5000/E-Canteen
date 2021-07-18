using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class studentrfidcheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        
         try
        {
            Label1.Text = Session["name"].ToString();
            TextBox1.Text = Session["rfid"].ToString();
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
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["rfid"] = TextBox1.Text;
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT amount FROM office WHERE rfid='" + TextBox1.Text + "' and amount>10", con);
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            Session["bal"] = test;
            SqlCommand cmd2 = new SqlCommand("SELECT status FROM office WHERE rfid=" + TextBox1.Text + "", con);
            
            String st = Convert.ToString(cmd2.ExecuteScalar());
            if (st == "Blocked")
            {
                Label2.Text = TextBox1.Text + " is Blocked, unable to proceed";
            }
            else
            {
                Response.Redirect("studentshop.aspx");
            }
        }
        catch (Exception e1)
        {
            Label2.Text = e1.Message;
        }
    }    
}