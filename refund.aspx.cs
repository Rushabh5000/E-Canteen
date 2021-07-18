using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

public partial class refund : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select amount from office where rfid='" + TextBox1.Text + "'", con);
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            SqlCommand cmd1 = new SqlCommand("update office SET amount=" + (Convert.ToInt32(TextBox2.Text) + test) + " WHERE rfid='" + TextBox1.Text + "'", con);

            SqlCommand cmd2 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept,amount,type) values((Select email from office where rfid='" + TextBox1.Text + "'),'" + TextBox1.Text + "','Refund','Office','" + TextBox2.Text + "','Credit')", con);
            SqlCommand cmd3 = new SqlCommand("SELECT status from office where rfid='" + TextBox1.Text + "'", con);
            String chk = Convert.ToString(cmd3.ExecuteScalar());
            SqlCommand em = new SqlCommand("SELECT rfid FROM office WHERE email='" + TextBox1.Text + "'", con);
            int rid = Convert.ToInt32(em.ExecuteScalar());
            SqlCommand txid = new SqlCommand("SELECT TOP (1) txnid FROM txn WHERE email='" + TextBox1.Text + "' ORDER BY date DESC", con);
            int tid = Convert.ToInt32(txid.ExecuteScalar());

            if(chk=="Active")
            {
                
                Label1.Text="Old Value: " + test;
                int b = Convert.ToInt32(cmd1.ExecuteScalar());
                int test1 = Convert.ToInt32(cmd.ExecuteScalar());
                Label2.Text="Updated Value: " + test1;

                cmd2.Parameters.AddWithValue("rfid", TextBox1.Text);
                cmd2.Parameters.AddWithValue("amount", TextBox2.Text);
                cmd2.ExecuteNonQuery();
                ////////////////////////Email//////////////////////
                try
                {
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("rufarfid@gmail.com");
                    msg.To.Add(TextBox1.Text);
                    msg.Subject = "Refund Successful";
                    msg.Body = ("The Refund of amount"+ TextBox2.Text +" is successful for RFID  " + rid + ".<br/><br/> Total Wallet Balance available is ₹"+test1+" Transaction id is " + tid);
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
            else
            {
                Label1.Text="Refund cannot be processed if the card is blocked, unable to proceed further";
            }           
        }
        catch (Exception e1)
        {
            Label1.Text=e1.Message;
        }
    }
}