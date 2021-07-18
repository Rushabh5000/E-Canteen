using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class assign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Label4.Text = Session["name"].ToString();
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
    protected void Test_Click(object sender, EventArgs e)    
    {
       Response.Write(@"<script language='javascript'>alert('Details saved successfully')</script>");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT rfid FROM office WHERE email='" + TextBox1.Text + "'", con);
            int chk = Convert.ToInt32(cmd.ExecuteScalar());
            SqlCommand cmd3 = new SqlCommand("SELECT fname FROM reg WHERE email='" + TextBox1.Text + "'", con);
            String chk2 = Convert.ToString(cmd3.ExecuteScalar());            
            SqlCommand cmd1 = new SqlCommand("UPDATE office SET rfid=" + (Convert.ToInt32(TextBox2.Text)) + " WHERE email='" + TextBox1.Text + "'", con);
            SqlCommand cmd2 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept) values(@email,@rfid,'RFID Assigned','" + Session["name"].ToString() + "')", con);


            if (chk2 == "")
            {
                Label2.Text = "No User Found";
            }
            else
            {
                if (chk == 0)
                {
                    cmd1.ExecuteNonQuery();
                    cmd2.Parameters.AddWithValue("email", TextBox1.Text);
                    cmd2.Parameters.AddWithValue("rfid", TextBox2.Text);
                    cmd2.ExecuteNonQuery();
                    Label1.Text = "New RFID assigned";

                    ////////////////////////Email//////////////////////

                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("rufarfid@gmail.com");
                    msg.To.Add(TextBox1.Text);
                    msg.Subject = "RFID Assigned";
                    msg.Body = ("Your Username is:  " + TextBox1.Text + "<br/><br/>" + "Your RFID is:  " + TextBox2.Text);
                    msg.IsBodyHtml = true;

                    SmtpClient smt = new SmtpClient();
                    smt.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential ntwd = new NetworkCredential();
                    ntwd.UserName = "rufarfid@gmail.com"; //Your Email ID  
                    ntwd.Password = "shsarfid"; // Your Password  
                    smt.UseDefaultCredentials = true;
                    smt.Credentials = ntwd;
                    smt.Port = 587;
                    smt.EnableSsl = true;
                    smt.Send(msg);
                    Label3.Text = "<br/> RFID Sent Successfully";
                    Label3.ForeColor = System.Drawing.Color.ForestGreen;
                }
                else
                {
                    Label1.Text = "RFID Already assigned, unable to proceed further";
                }
            }
        }
        catch (Exception e1)
        {
            Label3.Text = e1.Message;
        }     
    }  
}