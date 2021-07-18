using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class canrefund : System.Web.UI.Page
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

            SqlCommand cmd2 = new SqlCommand("INSERT INTO txn(email,rfid,summary,dept,amount,type) values((Select email from office where rfid='" + TextBox1.Text + "'),'" + TextBox1.Text + "','Food Item','Canteen','" + TextBox2.Text + "','Credit')", con);
            SqlCommand cmd3 = new SqlCommand("SELECT status from office where rfid='" + TextBox1.Text + "'", con);
            String chk = Convert.ToString(cmd3.ExecuteScalar());

            if(chk=="Active")
            {
                
                Response.Write("Old Value: " + test);
                int b = Convert.ToInt32(cmd1.ExecuteScalar());
                int test1 = Convert.ToInt32(cmd.ExecuteScalar());
                Response.Write("Updated Value: " + test1);

                cmd2.Parameters.AddWithValue("rfid", TextBox1.Text);
                cmd2.Parameters.AddWithValue("amount", TextBox2.Text);
                cmd2.ExecuteNonQuery();
            }
            else
            {
                Response.Write("Refund cannot be processed if the card is blocked, unable to proceed further");
            }           
        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }
    }
}