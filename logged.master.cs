using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class preview_dotnet_templates_akshara_multi_master_akshara : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["desig"] == "std")
        {
            l1.HRef = "studentdashboard.aspx";
            l2.HRef = "studentdashboard.aspx";
        }
        else if (Session["desig"] == "cant")
        {
            l1.HRef = "canteendashboard.aspx";
            l2.HRef = "canteendashboard.aspx";
        }
        else if (Session["desig"] == "off")
        {
            l1.HRef = "officedashboard.aspx";
            l2.HRef = "officedashboard.aspx";
        }
        else
        {
            l1.HRef = "logout.aspx";
            l2.HRef = "logout.aspx";
        }

        SetCurrentPage();
    }
    private void SetCurrentPage()
    {
        var pageName = GetPageName();

        switch (pageName)
        {
            case "index.aspx":
                home.Attributes["class"] = "active";
                break;           
        }
    }
    private string GetPageName()
    {
        return Request.Url.ToString().Split('/').Last();
    }
}
