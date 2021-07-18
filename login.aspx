<%@ Page Title="" Language="C#" MasterPageFile="akshara.master"
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Sign In</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                        </div>
                        <div id="loginform" class="form-horizontal" role="form">
                        <div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox runat="server" ID="email1" CssClass="form-control" placeholder="Email" required=""></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="email1" ErrorMessage="Enter Email" ForeColor="#990000"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Enter Valid Email" ControlToValidate="email1" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ForeColor="#990000"></asp:RegularExpressionValidator> <br />
                            </div>
                             <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox runat="server" ID="password1" CssClass="form-control" placeholder="password"
                                    TextMode="Password"></asp:TextBox></div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  
        ErrorMessage="Enter Password" ControlToValidate="password1" 
        ForeColor="#990000"></asp:RequiredFieldValidator>
                          <%--  </div>--%>
                            <div style="margin-top: 10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success" 
                                        onclick="Button1_Click" />
                                &nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                </div>
                            </div>
                            <%--<div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="padding-top: 15px; font-size: 85%">
                                        Don't have an account! <a href="#" onclick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here </a>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>



 <%--           <div id="signupbox" style="display: none; margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Sign Up</div>
                        <div style="float: right; font-size: 85%; position: relative; top: -10px">
                        </div>
                    </div>
                    <div class="panel-body">
                    

<div id="signupform" class="form-horizontal">
<div class="form-group">  <br />
<label for="email" class="col-md-3 control-label"> Email</label>
<div class="col-md-8">
<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ErrorMessage="Enter Valid Email" ControlToValidate="TextBox1" 
        ValidationExpression="\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)*" 
        ForeColor="#990000"></asp:RegularExpressionValidator> 
    
    <br />
</div>
</div>
--%>
<%--<div class="form-group">
                                <label for="firstname" class="col-md-3 control-label"> First Name</label>
                                <div class="col-md-8">
                                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="*" ControlToValidate="TextBox2" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
        ControlToValidate="TextBox2" ErrorMessage="Enter Valid First Name" 
        ForeColor="#990000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="col-md-3 control-label">
                                    Last Name</label>
                                <div class="col-md-8">
                                    <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ErrorMessage="*" ControlToValidate="TextBox3" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
        ControlToValidate="TextBox3" ErrorMessage="Enter Valid Last Name" 
        ForeColor="#990000" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:RegularExpressionValidator>
                                    
                                </div>
                            </div>

--%>
<%--<div class="form-group">
<label for="Gender" class="col-md-3 control-label">Gender </label>
<div class="col-md-8">
<asp:RadioButtonList ID="RadioButtonList1" runat="server">                            
<asp:ListItem>Male</asp:ListItem>  
<asp:ListItem>Female</asp:ListItem> 
</asp:RadioButtonList> 
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  
        ErrorMessage="Select the gender" ControlToValidate="RadioButtonList1" 
        ForeColor="#990000"></asp:RequiredFieldValidator>
</div>
</div>

<div class="form-group">
                                <label for="Mobile" class="col-md-3 control-label">
                                    Mobile </label>
<div class="col-md-8">
<asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" placeholder="Mobile"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="*" ControlToValidate="TextBox4" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
        ErrorMessage="Enter a valid mobile number" ControlToValidate="TextBox4" 
        ForeColor="#990000" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
    
</div>
</div>

<div class="form-group">
<label for="Course" class="col-md-3 control-label">
                                    Course</label>
                                <div class="col-md-8">
<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" placeholder="course">  
<asp:ListItem></asp:ListItem>  
                            <asp:ListItem Text="B.Sc.IT" Value="B.Sc.IT"></asp:ListItem>  
                            <asp:ListItem Text="CS" Value="CS"></asp:ListItem>  
                            <asp:ListItem Text="BMM" Value="BMM"></asp:ListItem>  
                        </asp:DropDownList>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  
        ErrorMessage="Select the Course" 
        ForeColor="#990000" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>


                            <div class="form-group">
<label for="Year" class="col-md-3 control-label">
                                    Year </label>
                                <div class="col-md-8">
<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" placeholder="Year"> 
 <asp:ListItem></asp:ListItem>  
                            <asp:ListItem Text="FY" Value="FY"></asp:ListItem>  
                            <asp:ListItem Text="SY" Value="SY"></asp:ListItem>  
                            <asp:ListItem Text="TY" Value="TY"></asp:ListItem>  
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  
        ErrorMessage="Select the Year" 
        ForeColor="#990000" ControlToValidate="DropDownList2"></asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>


                             <div class="form-group">
                                <label for="Roll" class="col-md-3 control-label">
                                    Roll No.</label>
                                <div class="col-md-8">
                                    <asp:TextBox runat="server" ID="TextBox5" CssClass="form-control" placeholder="Roll"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ErrorMessage="*" ControlToValidate="TextBox5" ForeColor="#990000"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
        ErrorMessage="Enter a valid Roll No" ControlToValidate="TextBox5" 
        ForeColor="#990000" ValidationExpression="[0-9]{2}"></asp:RegularExpressionValidator>
                                    
                                </div>
                                </div>

                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label">
                                    Password</label>
                                <div class="col-md-8">
                                    <asp:TextBox runat="server" ID="TextBox6" CssClass="form-control" placeholder="Password" TextMode="Password">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                        ErrorMessage="*" ControlToValidate="TextBox6" ForeColor="#990000"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
        ErrorMessage="Enter a valid password" ControlToValidate="TextBox6" 
        ForeColor="#990000" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,20}$"></asp:RegularExpressionValidator>
                                    
                                </div>
                                </div>

                                
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label">
                                    Confirm Password</label>
                                <div class="col-md-8">
                          <asp:TextBox runat="server" ID="TextBox7" CssClass="form-control" placeholder="Confirm Password" TextMode="Password">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                        ErrorMessage="*" ControlToValidate="TextBox7" ForeColor="#990000"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="Passwords do not match" ControlToCompare="TextBox6" 
                                        ControlToValidate="TextBox7" ForeColor="#990000"></asp:CompareValidator>
                                    
                                </div>
                                </div>                           
                   <div class="form-group">
<div class="col-md-offset-3 col-md-9">
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Sign Up" class="btn btn-info"/>
<i class="icon-hand-right"></i>
</div>
</div>


</div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>