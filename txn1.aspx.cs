using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class txn1 : System.Web.UI.Page
{
    public int a = 1;
    public int b = 1;
    public int c = 1;
    public int q = 1;
    public int total = 1;
    public int o=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox2.Text = "1";
        TextBox3.Text = "0";
        TextBox4.Text = "1";
        TextBox5.Text = "0";
        TextBox6.Text = "1";
        TextBox7.Text = "0";
        TextBox8.Text = "0";
           
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 1)
        {
            q = Convert.ToInt32(TextBox2.Text);
            int a = q * 15;
            TextBox3.Text = Convert.ToString(a);
          // int d = a;
        }
        else if (DropDownList1.SelectedIndex == 2)
        {
            q = Convert.ToInt32(TextBox2.Text);
            int a = q * 40;
            TextBox3.Text = Convert.ToString(a);
           // int d = a;
        }
        else if (DropDownList1.SelectedIndex == 3)
        {
            q = Convert.ToInt32(TextBox2.Text);
            int a = q * 60;
            TextBox3.Text = Convert.ToString(a);
           // int d = a;
         }
        
    }
    
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == 1)
        {
            //TextBox6.Text = "1";
            q = Convert.ToInt32(TextBox4.Text);
            int b = q * 15;
            TextBox5.Text = Convert.ToString(b);
        }
        else if (DropDownList2.SelectedIndex == 2)
        {
            q = Convert.ToInt32(TextBox4.Text);
            int b = q * 40;
            TextBox5.Text = Convert.ToString(b);
            
        }
        else if (DropDownList2.SelectedIndex == 3)
        {
            q = Convert.ToInt32(TextBox4.Text);
            int b = q * 60;
            TextBox5.Text = Convert.ToString(b);
            
        }        
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex == 1)
        {
            //TextBox6.Text = "1";
            q = Convert.ToInt32(TextBox6.Text);
            int c = q * 15;
            TextBox7.Text = Convert.ToString(c);
        }
        else if (DropDownList3.SelectedIndex == 2)
        {
            q = Convert.ToInt32(TextBox6.Text);
            int c = q * 40;
            TextBox7.Text = Convert.ToString(c);
        }
        else if (DropDownList3.SelectedIndex == 3)
        {
            q = Convert.ToInt32(TextBox6.Text);
            int c = q * 60;
            TextBox7.Text = Convert.ToString(c);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int ab = Convert.ToInt32(TextBox3.Text);
        int ab1 = Convert.ToInt32(TextBox5.Text);
        int ab2 = Convert.ToInt32(TextBox7.Text);
        int ot = Convert.ToInt32(TextBox8.Text);
        total = ab+ab1+ab2+ot;
       
        TextBox9.Text = Convert.ToString(total);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}