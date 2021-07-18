using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class addfooditems : System.Web.UI.Page
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
        String a = DropDownList1.SelectedItem.ToString();
         try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
            con.Open();
             SqlCommand cmd = new SqlCommand("SELECT CategoryID FROM Categories where CategoryName='"+a+"'", con);
            //int id=Convert.ToInt32(cmd1.ExecuteScalar());
             String chk = Convert.ToString(cmd.ExecuteScalar());

             SqlCommand cmd2 = new SqlCommand("INSERT INTO Products(ProductName,CategoryID,UnitPrice) values(@ProductName,@CategoryID,@UnitPrice)", con);

             cmd2.Parameters.AddWithValue("ProductName", TextBox1.Text);             
             cmd2.Parameters.AddWithValue("CategoryID", chk);
             cmd2.Parameters.AddWithValue("UnitPrice", TextBox2.Text);
             cmd2.ExecuteNonQuery();
             Label2.Text = "New Product Included";           
        }
        catch (Exception e1)
        {
            Label2.Text = e1.Message;
        }

    }
    
}