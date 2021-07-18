using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class managecategories : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("INSERT INTO Categories (CategoryName,Description) values(@name,@description)",con); 
            cmd.Parameters.AddWithValue("name", TextBox1.Text);
            cmd.Parameters.AddWithValue("description", TextBox1.Text);
            cmd.ExecuteNonQuery();
            Label2.Text = "New Category Included";
        }
        catch (Exception e1)
        {
            Label2.Text=e1.Message;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        String a = ListBox1.SelectedItem.ToString();
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryName='" + a + "'", con);            
            cmd.ExecuteNonQuery();
            Label2.Text = "Category Deleted";
        }
        catch (Exception e1)
        {
            Label2.Text = e1.Message;
        }
    }
}