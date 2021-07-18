using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class resolve : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = ListBox1.SelectedItem.ToString();
        TextBox2.Text = ListBox1.SelectedValue.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE query SET reply='" + TextBox3.Text + "' , status='Resolved' where reqid='" + TextBox1.Text + "'", con);
            cmd.ExecuteNonQuery();

        }
        catch (Exception e1)
        {
            Response.Write(e1.Message);
        }

    }
    
}