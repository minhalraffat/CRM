<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CRM.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

    <%--original one --%>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/default.css" rel="stylesheet" />

    <%--Styles for Login Modal--%>


    <script>
        $(document).ready(function () {
            //called when key is pressed in textbox
            $("#txtContactRegister").keypress(function (e) {
                //if the letter is not digit then display error and don't type anything
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    //display error message
                    $("#contactNumber").html("Digits Only").show().fadeOut("slow");
                    return false;
                }
            });
        });



    </script>
    <style>
        .modal-header, h3.modal-header .close {
            background-color: #5cb85c;
            color: white !important;
            text-align: center;
            font-size: 30px;
        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 70%;
            margin: auto;
    </style>

</head>

<body>
    <form id="form1" runat="server" style="background: #FFF !important;">

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header" style="width: 46%; display: inline;">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="padding-left: 29px;">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>
                    <a class="navbar-brand" style="margin-bottom: 41px;">
                        <img class="img-responsive" style="width: 40%; height: 90px" src="assets/images/m.png" /></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav" style="margin-top: 35px;">

                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="Aboutus.aspx">About Us</a></li>
                        <li><a href="connectwithus.aspx">Connect With Us</a></li>
                    </ul>
                    <asp:Label ID="lblmessage" Style="color: #FFF" runat="server" Visible="false"></asp:Label>
                    <ul class="nav navbar-nav navbar-right" style="margin-top: 35px;">
                        <li><a class="page-scroll" style="background-color: black" data-toggle="modal" href="#RegisterModal"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                        <li><a class="page-scroll" style="background-color: black" data-toggle="modal" href="#LoginModal"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                        <li>
                            <a class="page-scroll" href="#Contact" style="display: table-header-group;">
                                <img src="assets/images/fb.png" /></a>
                            <a class="page-scroll" href="#Contact" style="display: table-header-group;">
                                <img src="assets/images/yt.png" /></a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Contact" style="display: table-header-group;">
                                <img src="assets/images/twi.png" /></a>
                            <a class="page-scroll" href="#Contact" style="display: table-header-group;">
                                <img src="assets/images/m1.png" /></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container">

            <%-- Login Form --%>
            <div id="LoginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" runat="server">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-color: gray">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="modal-header" style="background-color: black">
                            <h3>Login</h3>
                        </div>
                        <div class="modal-body">
                            <div class="login-wrap">
                                <div class="form-group">
                                    <label for="lblUserNameLogin">User Name</label>
                                    <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control" placeholder="Login ID"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLoginId" ErrorMessage="please enter user name" />
                                </div>
                                <div class="form-group">
                                    <label for="lblPasswordLogin">Password</label>
                                    <asp:TextBox ID="txtPasswordLogin" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPasswordLogin" ErrorMessage="please enter password" />
                                </div>
                                <div class="form-group">
                                    <label for="lblCategoryLogin">Category</label>
                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Admin"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="User"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Employee"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <asp:Button ID="btnLogin" runat="server" class="btn btn-lg btn-danger center-block" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <p>Not a member? <a data-dismiss="modal" data-toggle="modal" href="#RegisterModal">Sign Up</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Register Form --%>
            <div id="RegisterModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" runat="server">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-color: gray">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <div class="modal-header" style="background-color: black">
                            <h3>Register</h3>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>User Id </label>
                                            <asp:TextBox ID="txtUserRegister" placeholder="Enter User Name" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Password </label>
                                            <asp:TextBox ID="txtPasswordRegister" placeholder="Enter Password" TextMode="Password" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Name </label>
                                            <asp:TextBox ID="txtNameRegister" placeholder="Enter Your Name" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <asp:TextBox ID="txtAddressRegister" placeholder="Enter Complete Address" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <asp:TextBox ID="txtDOBRegister" TextMode="Date" runat="server" MaxLength="150" CssClass="form-control input-sm date-picker"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Contact Number </label>
                                            <asp:TextBox ID="txtContactRegister" TextMode="Phone" placeholder="Enter Contact Number" runat="server" MaxLength="11" CssClass="form-control input-sm"></asp:TextBox>
                                            <span id="contactNumber" runat="server"></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email Address</label>
                                            <asp:TextBox ID="txtEmailRegister" TextMode="Email" placeholder="Enter Email Address" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnRegister" OnClick="btnRegister_Click" Text="Register" class="btn btn-lg btn-danger center-block" runat="server" OnClientClick="register();"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>

                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">

                    <div class="item active">
                        <img src="assets/images/crm_banner.jpg" style="width: 100%; height: 450px;" class="img-responsive" alt="Chania" width="460" height="345" />
                        <div class="carousel-caption">
                            <h1>Mint CRM</h1>

                            <p>
                                Customer relationship management is a widely implemented strategy for managing company’s<br />
                                interaction with customers.It involves using technology to organize, automate and synchronize
                                <br />
                                business processes, customer services and technical support.
                            </p>

                        </div>
                    </div>

                    <div class="item">
                        <img src="assets/images/crm1.jpg" style="width: 100%; height: 450px;" class="img-responsive" alt="Chania" width="460" height="345" />
                        <div class="carousel-caption">
                            <h1>Mint CRM</h1>

                            <p>
                                Customer relationship management is a widely implemented strategy for managing company’s<br />
                                interaction with customers.It involves using technology to organize, automate and synchronize
                                <br />
                                business processes, customer services and technical support.
                            </p>

                        </div>
                    </div>

                    <div class="item">
                        <img src="assets/images/bg.png" style="width: 100%; height: 450px;" class="img-responsive" alt="Flower" width="460" height="345" />
                        <div class="carousel-caption">
                            <h1>Mint CRM</h1>

                            <p>
                                Customer relationship management is a widely implemented strategy for managing company’s<br />
                                interaction with customers.It involves using technology to organize, automate and synchronize
                                <br />
                                business processes, customer services and technical support.
                            </p>

                        </div>
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br />
            <br />
            <br />

            <div class="container-fluid">

                <div class="row">
                    <div class="col-sm-4" style="text-align: -webkit-center;">

                        <img src="/assets/images/like.png" />
                        <h2>TELL US WHAT YOU NEED</h2>
                        <p>Mint CRM has everything which a company needs for its customers.</p>
                        <p class="c">Read More</p>
                    </div>
                    <div class="col-sm-4" style="text-align: -webkit-center;">
                        <img src="/assets/images/mail.png" />
                        <h2>SUPPLY YOUR BRIEF</h2>
                        <p>Fill in our design brief.</p>
                        <p class="c">Read More</p>
                    </div>
                    <div class="col-sm-4" style="text-align: -webkit-center;">
                        <img src="/assets/images/done.png" />
                        <h2>GET PROJECT DONE</h2>
                        <p>Get your work done more efficiently and effectively.</p>
                        <p class="c">Read More</p>
                    </div>
                </div>

            </div>
            <br />
            <br />
            <br />
            <img class="bg img-responsive" src="/assets/images/images.jpg" style="width: 100%;" />
            <br />
            <br />
            <br />

            <div class="container-fluid" style="text-align: center;">

                <h1>Our Specialized Services</h1>
                <p class="mon">Mint CRM offers a wide range of services which it provides to its users.</p>

                <div class="row" style="text-align: center;">
                    <div class="col-sm-3">
                        <img src="/assets/images/sales.jpg" style="width: 100%;" />
                        <a href="#">Sales and Marketing</a>
                    </div>
                    <div class="col-sm-3">
                        <img src="/assets/images/support.gif" style="width: 100%; height: 347px;" />
                        <a href="#">Customer Support System</a>
                    </div>
                    <div class="col-sm-3">
                        <img src="/assets/images/chat.jpg" style="width: 100%; height: 347px;" />
                        <a href="#">Chat</a>
                    </div>
                    <div class="col-sm-3">
                        <img src="/assets/images/8.png" style="width: 100%; height: 347px;" />
                        <a href="https://www.facebook.com/Mint-crm-252744885060876/?fref=ts">Social Media</a>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <br />
            <div class="container-fluid">
                <h1 class="inn">A BETTER WAY TO GET STARTED</h1>
                <div class="row" style="text-align: center;">
                    <div class="col-sm-4">
                        <img src="/assets/images/l.png" />
                        <h2>Quality Over Quantity</h2>
                        <p>It prefers quality over quantity.</p>
                    </div>
                    <div class="col-sm-4">
                        <img src="/assets/images/clock.png" />
                        <h2>Fast and Affordable</h2>
                        <p>Save time and money by using Mint CRM.</p>
                    </div>
                    <div class="col-sm-4">
                        <img src="/assets/images/msg.png" />
                        <h2>Dedicated Support</h2>
                        <p>Mint CRM helps to get the results you are after.</p>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />

            <div class="container-fluid">

                <div class="row" style="text-align: center;">
                    <div class="col-sm-12">
                        <h1>What They Say</h1>
                        <p>Mint CRM met and exceed all my goals.I had a project with a very aggressive development timeline and their attention to detail, quick response to issues and technical knowledge lead to a timely delivery of a final project that was great.They had and used the best project management tools of any developer I have worked with.</p>
                        <h6>-John Doe,Kadhan</h6>
                        <hr />
                    </div>
                </div>
                <div class="row" style="text-align: center;">
                    <div class="col-sm-12">
                        <img class="inner9" src="/assets/images/l1.png" />
                        <img class="inner9" src="/assets/images/l2.png" />
                        <img class="inner9" src="/assets/images/l3.png" />
                        <img class="inner9" src="/assets/images/l4.png" />
                        <img class="inner9" src="/assets/images/l5.png" />
                    </div>
                </div>
            </div>

            <br />
            <br />
            <br />
            <div class="panel panel-default">
                <div id="ft" class="panel-footer">
                    <div class="container">
                        <div id="f" class="col-sm-4">
                            <h4 id="font21" style="text-align: center;">Address</h4>
                            <p id="font22" style="text-align: center;">
                                Iqra University Main Campus
                                <br />
                                Karachi
                            </p>
                        </div>
                        <div id="f" class="col-sm-4">
                            <h4 id="font21" style="text-align: center;">Contact info</h4>
                            <p id="font22" style="text-align: center;">
                                111 222 333
                                <br />
                                mintcrm1@gmail.com
                            </p>
                        </div>
                        <div id="f" class="col-sm-4">
                            <h4 id="font21" style="text-align: center;">Follow Us</h4>
                            <ul id="ul">
                                <li>
                                    <a href="#">
                                        <img src="assets/images/msg1.png" /></a>
                                    <a href="#">
                                        <img src="assets/images/f1.png" /></a>
                                    <a href="#">
                                        <img src="assets/images/tw1.png" /></a>
                                    <a href="#">
                                        <img src="assets/images/x.png" /></a>
                                    <a href="#">
                                        <img src="assets/images/in1.png" /></a>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div id="ft1" class="col-sm-8">
                    <p id="font24">Copyright 2016 &nbsp;<span id="font25"><a id="font25" href="#">Mint CRM</a></span>&nbsp; - All Rights Reserved</p>
                    &nbsp;&nbsp;


                </div>
                <div class="col-sm-2">
                    <a id="font24" href="#">Privacy Policy</a>&nbsp;&nbsp;
                </div>
                <div class="col-sm-2">
                    <a id="font24" href="#">Terms of Use</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
