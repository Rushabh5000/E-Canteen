using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class load : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("Select amount from office where rfid='" + TextBox1.Text + "' and amount>10", con);
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            SqlCommand cmd1 = new SqlCommand("update office SET amount=" + (Convert.ToInt32(TextBox2.Text) + test) + " WHERE rfid='" + TextBox1.Text + "'", con);
            SqlCommand cmd2 = new SqlCommand("select status from office where rfid=" + TextBox1.Text + "", con);
            SqlCommand cmd3 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept,amount,type) values((Select email from office where rfid='" + TextBox1.Text + "'),@rfid,'Load Amount','Office',@amount,'Credit')", con);
            SqlCommand em = new SqlCommand("SELECT email FROM office WHERE rfid=" + TextBox1.Text + "", con);
            String eid = Convert.ToString(em.ExecuteScalar());
            SqlCommand txid = new SqlCommand("SELECT TOP (1) txnid FROM txn WHERE email='" + TextBox1.Text + "' ORDER BY date DESC", con);
            int tid = Convert.ToInt32(txid.ExecuteScalar());
            cmd3.Parameters.AddWithValue("rfid", TextBox1.Text);
            cmd3.Parameters.AddWithValue("amount", TextBox2.Text);
            cmd3.ExecuteNonQuery();
           
            
            String st = Convert.ToString(cmd2.ExecuteScalar());
            if (st == "Blocked")
            {
                Label1.Text=TextBox1.Text + " is Blocked, unable to proceed";
            }
            else
            {
                Label1.Text="Old Value: " + test;
                int b = Convert.ToInt32(cmd1.ExecuteScalar());
                int test1 = Convert.ToInt32(cmd.ExecuteScalar());
                Label2.Text="Updated Value: " + test1;

                ////////////////////////Email//////////////////////
                try
                {
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("rufarfid@gmail.com");
                    msg.To.Add(eid);
                    msg.Subject = "Load Amount Successful";
                    msg.Body = ("Your RFID  " + TextBox1.Text + "  is succesfully loaded.<br/><br/>" + "Amount Loaded:  " + TextBox2.Text + "<br/><br/> Total Wallet Balance is  " + test1+ "Transaction id is " + tid);
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
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }

    }
}