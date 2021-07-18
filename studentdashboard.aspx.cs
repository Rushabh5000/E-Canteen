using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class studentdashboard : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Label1.Text = Session["email"].ToString(); 
        try
        {
            Label1.Text = Session["name"].ToString(); 
        }
        catch
        {
            Response.Redirect("login.aspx");
        }

        //Label1.Text = Session["name"].ToString(); 
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("balance.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("stdhist.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("support.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ticket.aspx");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("editprofile.aspx");
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        
        Response.Redirect("studentrfidcheck.aspx");
       
    }
}