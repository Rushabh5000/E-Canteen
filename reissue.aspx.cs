using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class reissue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select rfid from office where email='" + TextBox1.Text + "'", con);
            SqlCommand cmd1 = new SqlCommand("UPDATE office SET rfid=" + (Convert.ToInt32(TextBox2.Text)) + " , status='Active' WHERE email='" + TextBox1.Text + "'", con);
            SqlCommand cmd2 = new SqlCommand("select status from office where email='" + TextBox1.Text + "'", con);
            SqlCommand cmd3 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept) values('" + TextBox1.Text + "',(Select rfid from office where email='" + TextBox1.Text + "'),'RFID Re-Assigned " + TextBox2.Text + "','Office')", con);
            //int b = Convert.ToInt32(cmd1.ExecuteNonQuery());

            int test1 = Convert.ToInt32(cmd.ExecuteScalar());
            String st = Convert.ToString(cmd2.ExecuteScalar());

            if (st == "Blocked") 
            {
                if (test1 != Convert.ToInt32(TextBox2.Text))
                {
                    Label1.Text = "Old RFID: " + test1;
                    cmd1.ExecuteNonQuery();
                    Label2.Text = "<br /> New RFID: " + TextBox2.Text;
                    cmd3.Parameters.AddWithValue("email", TextBox1.Text);
                    cmd3.Parameters.AddWithValue("reason", TextBox2.Text);
                    cmd3.ExecuteNonQuery();
                }
                else
                { 
                    Label1.Text="Old RFID cannot be Assigned again";
                }               
            }
            else
            {
                Label1.Text=test1 + " is Unblocked, Block "+test1+" before re-issuing.";
            }
            
            
        }
        catch (Exception e1)
        {
            Label1.Text=e1.Message;
        }
    }
}