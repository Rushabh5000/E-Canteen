<%@ Page Title="" Language="C#" MasterPageFile="akshara.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Carousel -->
    <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target='#carousel-example-generic' data-slide-to='0' class='active'>
                <asp:Image ID="Image1" runat="server" ImageUrl="img/12.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
            <li data-target='#carousel-example-generic' data-slide-to='1'>
                <asp:Image ID="Image2" runat="server" ImageUrl="img/13.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
          
            <li data-target='#carousel-example-generic' data-slide-to='2'>
                <asp:Image ID="Image3" runat="server" ImageUrl="img/14.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active one">
                <!-- <img src="#" alt="" /> -->
                <div class="main-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h1>
                            Kishindchand Chellaram College<br /> <span class="yellow"></span></h1>
                        <div class="">
                           
                            <asp:Button ID="Button1" runat="server" Text="Login" 
                                CssClass="btn btn-clear btn-sm btn-min-block" onclick="Button1_Click"/>
                                <asp:Button ID="Button2" runat="server" Text="Registration" 
                                CssClass="btn btn-clear btn-sm btn-min-block" onclick="Button2_Click"/>
                            
                        </div>
                    </div>
                </div>
            </div>
           
            
        </div>
       
    </div>
    <!-- Carousel -->
    <!-- Service Section -->
    <section id="services" class="padding100">
        <div class="container">
            <div class="row">
                <h2 class="background double animated wow fadeInUp" data-wow-delay="0.2s"><span><strong>F</strong>eatures</span></h2>
            </div>
            <!-- ./ end row -->
            <div class="row">
                <div class="col-md-4">
                    <i class="fa fa-laptop animated wow fadeInDown"></i>
                    <div class="sc-inner">
                        <h4>
                            Responsive Design</h4>
                        <p>
                            <%--Want more Bootstrap themes & templates? Subscribe to our mailing list to receive
                            an update when new items arrive!--%></p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <i class="fa fa-support animated wow fadeInDown" data-wow-delay="0.2s"></i>
                    <div class="sc-inner">
                        <h4>
                            Quick Support</h4>
                        <p>
                            <%--Want more Bootstrap themes & templates? Subscribe to our mailing list to receive
                            an update when new items arrive!--%></p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <i class="fa fa-pie-chart animated wow fadeInUp" data-wow-delay="0.6s"></i>
                    <div class="sc-inner">
                        <h4>
                            Awesome Stats</h4>
                        <p>
                            <%--Want more Bootstrap themes & templates? Subscribe to our mailing list to receive
                            an update when new items arrive!--%></p>
                    </div>
                </div>
                <!-- ./ end service box -->  
    </section>
    <!-- ./ End Service Section -->
    <!-- Page Content -->
    
    </asp:Content>