using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class raise : System.Web.UI.Page
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
            SqlCommand em = new SqlCommand("SELECT rfid FROM office WHERE email='" + TextBox1.Text + "'", con);
            int rid = Convert.ToInt32(em.ExecuteScalar());
            cmd.Parameters.AddWithValue("email", Session["email"].ToString());
            cmd.Parameters.AddWithValue("message", TextBox2.Text);
            cmd.ExecuteNonQuery();

            int id = Convert.ToInt32(cmd2.ExecuteScalar());
            Label2.Text="Request has been submitted, Your request id is " + id;
            ////////////////////////Email//////////////////////
            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("rufarfid@gmail.com");
                msg.To.Add(TextBox1.Text);
                msg.Subject = "Support Ticket Raised Successfully";
                msg.Body = ("The support ticket has been raised for RFID  " + rid + ", your Ticket id is "+ id +"<br/><br/>" + "Query: " + TextBox2.Text);
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
        catch (Exception e1)
        {
            Label2.Text=e1.Message;
        }

    }
}