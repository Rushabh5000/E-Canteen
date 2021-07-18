using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class block : System.Web.UI.Page
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
            SqlCommand cmd1 = new SqlCommand("select status from office where email='" + TextBox1.Text + "'", con);
            SqlCommand cmd2 = new SqlCommand("update office SET status='Blocked' WHERE email='" + TextBox1.Text + "'", con);

            SqlCommand em = new SqlCommand("SELECT rfid FROM office WHERE email='" + TextBox1.Text + "'", con);
            int rid = Convert.ToInt32(em.ExecuteScalar());

            int test1 = Convert.ToInt32(cmd.ExecuteScalar());
            Label1.Text="RFID: " + test1;
            String st= Convert.ToString(cmd1.ExecuteScalar());
           // Response.Write("Old Status " + st);
            if (st == "Blocked")
            {
                Label1.Text=" is already Blocked";
            }
            else
            {
                cmd2.ExecuteNonQuery();
                Label1.Text=" RFID "+test1+" has been Blocked";
                ////////////////////////Email//////////////////////
                try
                {
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("rufarfid@gmail.com");
                    msg.To.Add(TextBox1.Text);
                    msg.Subject = "RFID Blocked Successfully";
                    msg.Body = ("Your RFID  " + TextBox1.Text + "  has been Blocked successfully.<br/><br/>" + "Reason for Blocking:  " + TextBox2.Text);
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
                    Label3.Text = "<br/> Notification Sent Successfully";
                    Label3.ForeColor = System.Drawing.Color.ForestGreen;
                }
                catch (Exception em1)
                {
                    Label3.Text = em1.Message;
                }
            }
            SqlCommand cmd3 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept) values('"+TextBox1.Text+"',(Select rfid from office where email='" + TextBox1.Text + "'),'RFID Blocked: "+TextBox2.Text+"','Office')", con);
            cmd3.Parameters.AddWithValue("email", TextBox1.Text);
            cmd3.Parameters.AddWithValue("reason", TextBox2.Text);
            cmd3.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            Label1.Text = e1.Message;
        }
    }
}