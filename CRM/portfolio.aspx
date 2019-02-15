<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="portfolio.aspx.cs" Inherits="CRM.portfolio" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Portfolio</title>

    <%--bootstrap--%>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- CSS LIBRARY LINKS -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,700,300' rel='stylesheet' type='text/css' />
    <link href="assets/css/default.css" rel="stylesheet" />

    <%--Styles for Login Modal--%>
    <style>
        .modal-header, h3.modal-header .close {
            background-color: #5cb85c;
            color: white !important;
            text-align: center;
            font-size: 30px;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <div class="navbar-collapse collapse" id="bs-navbar">
                <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" style="background-color: black" data-toggle="modal" href="#LoginModal">Login</a>
                    </li>

                    <li>
                        <a class="page-scroll" style="background-color: black" data-toggle="modal" href="#RegisterModal">Join</a>
                    </li>
                </ul>
            </div>

        <section class="container-header clearfix">
	<div class="left">
		<img src="assets/images/m.png"/>
	</div>
	<div class="right">
		<div class="right-top">
            <a href="https://www.facebook.com/Mint-crm-252744885060876/?fref=ts"><img src="assets/images/fb.png"/></a>
            <a href="https://www.linkedin.com/nhome/?trk=hb_signin"><img src="assets/images/in.png"/></a>
            <a href="https://twitter.com/?lang=en"><img src="assets/images/twi.png"/></a>
		</div>
		<div class="right-bottom">
			<nav>
				<ul>	    
					
					<li><a href="whatwedo.aspx">What We Do</a></li>
					<li><a href="whoweare.aspx">Who We Are</a></li>
					<li><a href="howitworks.aspx">How It Works</a></li>
					<li><a href="pricing.aspx">Pricing</a></li>
					<li><a href="portfolio.aspx">Portfolio</a></li>
					<li><a href="connectwithus.aspx">Connect With Us</a></li>
					
				</ul>
			</nav>
		</div>
	</div>
</section>
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
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLoginId" ErrorMessage="please enter user name" />
                                </div>
                                <div class="form-group">
                                    <label for="lblPasswordLogin">Password</label>
                                    <asp:TextBox ID="txtPasswordLogin" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtPasswordLogin" ErrorMessage="please enter password" />
                                </div>
                                <div class="form-group">
                                    <label for="lblCategoryLogin">Category</label>
                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Text="Admin"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="User"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <asp:Button ID="btnLogin" runat="server" class="btn btn-lg btn-danger center-block" Text="Login" OnClick="btnLogin_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <p>Not a member? <a data-dismiss="modal" data-toggle="modal" href="#RegisterModal">Sign Up</a></p>
                            <%--<p>Forgot <a href="#ForgotModal" data-dismiss="modal" data-toggle="modal">Password?</a></p>--%>
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
                                            <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtUserRegister" ErrorMessage="please enter User id" /> --%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Password </label>
                                            <asp:TextBox ID="txtPasswordRegister" placeholder="Enter Password" TextMode="Password" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                             <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtPasswordRegister" ErrorMessage="please enter Password" /> --%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Name </label>
                                            <asp:TextBox ID="txtNameRegister" placeholder="Enter Your Name" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                             <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtNameRegister" ErrorMessage="please enter Name" /> --%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>User Type </label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="1" Text="Admin"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="User"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <asp:TextBox ID="txtAddressRegister" placeholder="Enter Complete Address" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                            <%-- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtAddressRegister" ErrorMessage="please enter Address" /> --%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Date of Birth</label>
                                            <asp:TextBox ID="txtDOBRegister" TextMode="Date" runat="server" MaxLength="150" CssClass="form-control input-sm date-picker"></asp:TextBox>
                                            <%-- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtDOBRegister" ErrorMessage="please enter DOB" /> --%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Contact Number </label>
                                            <asp:TextBox ID="txtContactRegister" TextMode="Phone" placeholder="Enter Contact Number" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                           <%--  <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtContactRegister" ErrorMessage="please enter Contact number" /> --%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Email Address</label>
                                            <asp:TextBox ID="txtEmailRegister" TextMode="Email" placeholder="Enter Email Address" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                                             <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtEmailRegister" ErrorMessage="please enter Email address" /> --%>
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
             </div>
<footer>
	<div class="footer-1 container-header">
		<ul class="footer-2">
			<li class="ft"><a href="Home.aspx">Home</a></li>
			<li class="ft"><a href="whatwedo.aspx">What we do</a></li>
			<li class="ft"><a href="whoweare.aspx">Who we are</a></li>
			<li class="ft"><a href="howitworks.aspx">How it works</a></li>
		</ul>
		<ul class="footer-3">
			<li class="ft"><a href="pricing.aspx">Pricing</a></li>
			<li class="ft"><a href="portfolio.aspx">Portfolio</a></li>
			<li class="ft"><a href="connectwithus.aspx">Connect with us</a></li>
			<li class="ft"><a href="faqs.aspx">FAQS</li>
		</ul>
		<ul class="footer-4">
			<li class="ft"><a href="testimonials.aspx">Testimonials</li>
			<li class="ft"><a href="privacypolicy.aspx">Privacy Policy</li>
			<li class="ft"><a href="termsandconditions.aspx">Terms & Conditions</li>
			<li class="ft"><a href="myaccount.aspx">My Account</li>
		</ul>
		<div class="boxRight">
			<a href="https://www.facebook.com/Mint-crm-252744885060876/?fref=ts"><img src="assets/images/fb.png"/></a>
            <a href="https://www.linkedin.com/nhome/?trk=hb_signin"><img src="assets/images/in.png"/></a>
            <a href="https://twitter.com/?lang=en"><img src="assets/images/twi.png"/></a>

			<img class="foot" src="assets/images/l6.png"/>
		</div>
		 <br/>
		 <div class="footer-8">
		&copy;Copyright,2016 Mint CRM,All Rights Reserved 
	</div>
	</div>
</footer>






    </form>
</body>
</html>
