using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class studentshop : System.Web.UI.Page
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

    protected void AddToCart_Click(object sender, EventArgs e)
    {
        var selectedProducts = Products.Rows.Cast<GridViewRow>()
          .Where(row => ((CheckBox)row.FindControl("SelectedProducts")).Checked)
          .Select(row => Products.DataKeys[row.RowIndex].Value.ToString()).ToList();

        if (Session["Cart"] == null)
        {
            Session["Cart"] = selectedProducts;
        }
        else
        {
            var cart = (List<string>)Session["Cart"];
            foreach (var product in selectedProducts)
                cart.Add(product);
            Session["Cart"] = cart;
        }
        foreach (GridViewRow row in Products.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("SelectedProducts");
            if (cb.Checked)
                cb.Checked = false;
        }
    }

    protected void Checkout_Click(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
            Response.Redirect("studentcheck.aspx");
    }
}