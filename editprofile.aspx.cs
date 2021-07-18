using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class editprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        try
        {
            Label1.Text = Session["name"].ToString();
            TextBox1.Text = Session["email"].ToString();
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
            string strpass = encryptpass(TextBox6.Text);
            string strcnfpass = encryptpass(TextBox7.Text);  
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            
            SqlCommand cmd = new SqlCommand("UPDATE REG set fname= @fname, lname= @lname, mobile= @mobile, pwd= @pwd, cpwd= @cpwd where email='" + TextBox1.Text + "'", con);            

            cmd.Parameters.AddWithValue("email", TextBox1.Text);
            cmd.Parameters.AddWithValue("fname", TextBox2.Text);
            cmd.Parameters.AddWithValue("lname", TextBox3.Text);
            cmd.Parameters.AddWithValue("mobile", TextBox4.Text);
            cmd.Parameters.AddWithValue("pwd", strpass);
            cmd.Parameters.AddWithValue("cpwd", strcnfpass);

            Session["email"] = TextBox1.Text;
            cmd.ExecuteNonQuery();
            Label2.Text ="Profile Updated Succesfully";

            try
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("rufarfid@gmail.com");
                msg.To.Add(TextBox1.Text);
                msg.Subject = "Profile Updated Succesfully";
                msg.Body = ("Your Profile has been Updated successfully.<br/><br/>" + "If this is not Initiated by you, report to the Office immediately");
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
            }
            catch (Exception em1)
            {
                Label3.Text = em1.Message;
            }
        }
        catch (Exception e1)
        {
            Label2.Text = e1.Message;           
        }
    }
    public string encryptpass(string password)
    {
        string msg = "";
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        msg = Convert.ToBase64String(encode);      
        return msg;
    }  
}