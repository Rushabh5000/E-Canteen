using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string strpass = encryptpass(password1.Text);
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
      //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select COUNT(*)FROM reg WHERE email='" + email1.Text + "' and pwd='" + strpass + "'");
            SqlCommand cmd1 = new SqlCommand("select fname FROM reg WHERE email='" + email1.Text + "'");
            SqlCommand cmd2 = new SqlCommand("SELECT rfid FROM office WHERE email='" + email1.Text + "'");

            SqlCommand cmd3 = new SqlCommand("INSERT INTO failedattempts(email, pwd, ptpwd) values(@email,@pwd,@ptpwd)", con);

            cmd.Connection = con;
            cmd1.Connection = con;
            cmd2.Connection = con;
            cmd3.Connection = con;

            string n=Convert.ToString(cmd1.ExecuteScalar());
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            int rf = Convert.ToInt32(cmd2.ExecuteScalar());

            if (test > 0)
            {

                Session["email"] = email1.Text;
                Session["name"] = n;
                Session["rfid"] = rf;
                Session["desig"] = "std";
                Response.Redirect("studentdashboard.aspx");
            }
            else if (email1.Text == "canteen@kc.com" && password1.Text == "canteen")
            {
                Session["email"] = email1.Text;
                Session["name"] = n;
                Session["desig"] = "cant";
                Response.Redirect("canteendashboard.aspx");
            }
            else if (email1.Text == "office@kc.com" && password1.Text == "office")
            {
                Session["email"] = email1.Text;
                Session["name"] = n;
                Session["desig"] = "off";
                Response.Redirect("officedashboard.aspx");
            }
            else
            {
                cmd3.Parameters.AddWithValue("email", email1.Text);
                cmd3.Parameters.AddWithValue("pwd", strpass);
                cmd3.Parameters.AddWithValue("ptpwd", password1.Text);
                cmd3.ExecuteNonQuery();
                Label1.Text = "Invalid username or password";
                this.Label1.ForeColor = Color.Red;
            }
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
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