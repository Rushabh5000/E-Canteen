using System;
using System.Data.SqlClient;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {        
        try
        {
            string strpass = encryptpass(TextBox6.Text);
            string strcnfpass = encryptpass(TextBox7.Text);  
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into reg(email,fname,lname,mobile,gender,course,year,roll,pwd,cpwd) values(@email,@fname,@lname,@mobile,@gender,@course,@year,@roll,@pwd,@cpwd)", con);
            SqlCommand cmd1 = new SqlCommand("INSERT INTO office (email, course, year, roll) SELECT TOP (1) email, course, year, roll FROM reg ORDER BY date DESC", con);
            SqlCommand cmd2 = new SqlCommand("INSERT INTO login (email, pwd) SELECT TOP (1) email, pwd FROM reg ORDER BY date DESC", con);


            cmd.Parameters.AddWithValue("email", TextBox1.Text);
            cmd.Parameters.AddWithValue("fname", TextBox2.Text);
            cmd.Parameters.AddWithValue("lname", TextBox3.Text);
            cmd.Parameters.AddWithValue("mobile", TextBox4.Text);
            cmd.Parameters.AddWithValue("gender", RadioButtonList1.SelectedValue);
            cmd.Parameters.AddWithValue("course", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("year", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("roll", TextBox5.Text);
            cmd.Parameters.AddWithValue("pwd", strpass);
            cmd.Parameters.AddWithValue("cpwd", strcnfpass);

            Session["email"] = TextBox1.Text;
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();            
            Label1.Text = "Registration Successful";

        }
        catch (Exception e1)
        { 
            Label1.Text = e1.Message;
        }
        try
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("rufarfid@gmail.com");
            msg.To.Add(TextBox1.Text);
            msg.Subject = " Registration Successful";
            msg.Body = ("Your Username is:  " + TextBox1.Text + "<br/><br/>" + "Your Password is:  " + TextBox6.Text);
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
            Label3.Text = "<br/> Username and Password Sent Successfully";
            Label3.ForeColor = System.Drawing.Color.ForestGreen;
        }
        catch(Exception em)
        {
            Label3.Text = em.Message;
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
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con1 = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Documents\Visual Studio 2010\WebSites\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
        con1.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM reg WHERE email ='" + TextBox1.Text + "'",con1);
        int a= Convert.ToInt32(cmd2.ExecuteScalar());
        if(a==0)
        {
            Label2.Text = "Email id available";
        }
        else
        {
            Label2.Text = "Email id is already taken";
        }
    }
}