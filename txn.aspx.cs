using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class txn : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("Select amount from office where rfid='" + TextBox1.Text + "' and amount>10", con);
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            SqlCommand cmd1 = new SqlCommand("update office SET amount=" + (test - Convert.ToInt32(TextBox2.Text)) + " WHERE rfid='" + TextBox1.Text + "' and amount>10", con);
            SqlCommand cmd2 = new SqlCommand("select status from office where rfid=" + TextBox1.Text + "", con);
            SqlCommand cmd3 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept,amount,type) values((Select email from office where rfid='" + TextBox1.Text + "'),'" + TextBox1.Text + "','Food Item','Canteen','" + TextBox2.Text + "','Debit')", con);
            String st = Convert.ToString(cmd2.ExecuteScalar());

            if (st == "Blocked")
            {
                Response.Write(TextBox1.Text + " is Blocked, unable to proceed");
            }
            else
            {               
                Response.Write("Old Value: " + test);
                int b = Convert.ToInt32(cmd1.ExecuteScalar());
                int test1 = Convert.ToInt32(cmd.ExecuteScalar());
                Response.Write("Updated Value: " + test1);
                cmd3.ExecuteNonQuery();
            }          
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
    }
}