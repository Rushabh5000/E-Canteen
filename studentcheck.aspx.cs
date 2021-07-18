using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

  public partial class studentcheck : Page
  {
    Decimal cost;
    protected void Page_Load(object sender, EventArgs e)
    {        
        try
        {           
            Label1.Text = Session["name"].ToString();
            Label7.Text = Session["bal"].ToString();
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
        if (Session["Cart"] == null)
            Response.Redirect("ShoppingCart.aspx");
        BindBasket();        
    }

    protected void RemoveProduct_Click(object sender, EventArgs e)
    {
      var cart = (List<string>)Session["Cart"];
      var removedProducts = Basket.Rows.Cast<GridViewRow>()
        .Where(row => ((CheckBox)row.FindControl("RemovedProducts")).Checked)
        .Select(row => Basket.DataKeys[row.RowIndex].Value.ToString()).ToList();
      cart.RemoveAll(removedProducts.Contains);
      BindBasket();
    }

    protected void BindBasket()
    {
      var sql = "SELECT ProductID, ProductName, UnitPrice FROM Products WHERE ProductID IN ({0})";
      var values = (List<string>)Session["Cart"];
      if (values.Count > 0)
      {
        var parms = values.Select((s, i) => "@p" + i.ToString()).ToArray();
        var inclause = string.Join(",", parms);
        BasketData.SelectCommand = string.Format(sql, inclause);
        BasketData.SelectParameters.Clear();
        for (var i = 0; i < parms.Length; i++)
        {
          BasketData.SelectParameters.Add(parms[i].Replace("@", ""), values[i]);
        }

        DataView view = (DataView)BasketData.Select(DataSourceSelectArguments.Empty);
        var costQuery = view.Cast<DataRowView>().Select(drv => drv.Row.Field<decimal>("UnitPrice"));
        cost = costQuery.Sum();
        Basket.DataSource = view;
        Basket.DataBind();
      }
    }

    protected void Basket_RowCreated(object sender, GridViewRowEventArgs e)
    {        
      if (e.Row.RowType == DataControlRowType.Footer)
      {
        Literal total = (Literal)e.Row.FindControl("TotalPrice");
        total.Text = cost.ToString("c");
      }
    }
     
    protected void ConfirmPurchase_Click(object sender, EventArgs e)
    {
        int a = Convert.ToInt32(Session["rfid"]);
        int bal = Convert.ToInt32(Session["bal"]);
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename= C:\Users\rusha\Desktop\nothemetables\App_Data\Database.mdf;Integrated Security=True;User Instance=True");            
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT amount FROM office WHERE rfid='" + a + "' AND amount>10", con);
            int test = Convert.ToInt32(cmd.ExecuteScalar());
            SqlCommand cmd1 = new SqlCommand("UPDATE office SET amount=" + (test - cost) + " WHERE rfid='" + a + "' AND amount>10", con);
            SqlCommand cmd2 = new SqlCommand("SELECT email FROM office WHERE rfid=" + Convert.ToInt32(Session["rfid"]),con);
            string c = Convert.ToString(cmd2.ExecuteScalar());
            SqlCommand cmd3 = new SqlCommand("INSERT INTO txn (email,rfid,summary,dept,amount,type) values('"+c+"',"+Convert.ToInt32(Session["rfid"])+", 'Food Item', 'Canteen', " + cost + ", 'Debit')", con);
            //SqlCommand cmd4 = new SqlCommand("INSERT INTO orders (rfid,email,summary,amount) values('" + Convert.ToInt32(Session["rfid"]) + "'," + c + ", 'Food Item', " + cost + ")", con);
            SqlCommand cmd4 = new SqlCommand("INSERT INTO orders (rfid,summary,amount) values(" + Convert.ToInt32(Session["rfid"]) + ",'Food Item', " + cost + ")", con);

            //SqlCommand cmd5 = new SqlCommand("SELECT orderid FROM orders WHERE rfid=" + Convert.ToInt32(Session["rfid"]) 
            SqlCommand cmd5 = new SqlCommand("SELECT TOP (1) orderid FROM orders where rfid=" + Convert.ToInt32(Session["rfid"])+" ORDER BY date DESC",con);

            //object date = DateTime.Now.Date;
            //int d = Convert.ToInt32(date);
            if (cost <= bal)
            {
                Label2.Text = "Old Value: " + test;
                int b = Convert.ToInt32(cmd1.ExecuteScalar());
                int test1 = Convert.ToInt32(cmd.ExecuteScalar());
                Label3.Text = "Updated Value: " + test1;
                cmd3.ExecuteScalar();
                cmd4.ExecuteScalar();
                
                string oi = Convert.ToString(cmd5.ExecuteScalar());
                Label9.Text = "Order ID : " + oi;
                Response.Write(@"<script language='javascript'>alert('Hello'+oi)</script>");
            }
            else
            {
                Label2.Text = "Total Price exceeds Balance available, unable to proceed";
            }
        }
        catch (Exception e1)
        {
            Label5.Text = e1.Message;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        List<string> cart = (List<string>)Session["Cart"];
        foreach (string a in cart)
        {
            Label5.Text += a;
        }
    }
}
