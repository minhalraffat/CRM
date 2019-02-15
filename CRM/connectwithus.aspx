<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="connectwithus.aspx.cs" Inherits="CRM.connectwithus" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Connect with us</title>

    <%--bootstrap--%>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  
    <link href="assets/css/default.css" rel="stylesheet" />

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
    <form id="form1" runat="server" style="background:#FFF !important;">

       <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header" style="width: 46%;    display: inline;">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="    padding-left: 29px;">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                 
                </button>
      <a class="navbar-brand" style="margin-bottom: 41px;"><img  class="img-responsive" style="width:40%;height:90px" src="assets/images/m.png"/></a>
    </div>
      <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav" style="margin-top:35px;">
      
      <li><a href="Home.aspx">Home</a></li>
      <li><a href="About us.aspx">About Us</a></li>
      <li><a href="connectwithus.aspx">Connect With Us</a></li>
    </ul>
      <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
 <ul class="nav navbar-nav navbar-right" style="margin-top:35px;">
<%--      <li><a class="page-scroll" style="background-color: black" data-toggle="modal" href="#RegisterModal"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a class="page-scroll" style="background-color: black" data-toggle="modal" href="#LoginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>--%>
 <li>
     <a class="page-scroll" href="#Contact" style="display: table-header-group;"><img src="assets/images/fb.png" /></a>
     <a class="page-scroll" href="#Contact" style="display: table-header-group;"><img src="assets/images/yt.png" /></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#Contact" style="display: table-header-group;"><img src="assets/images/twi.png" /></a>
                        <a class="page-scroll" href="#Contact" style="display: table-header-group;"><img src="assets/images/m1.png" /></a>
                    </li>
    </ul>
          </div>
  </div>
</nav>     

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
                                    <%--<div class="col-sm-6">
                                        <div class="form-group">
                                            <label>User Type </label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="1" Text="Admin"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="User"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>--%>
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

            
  <br/>  <br/>  <br/>  <br/><br/>  <br/>  <br/>  <br/>
        <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h1 id="font1">HEAD OFFICE</h1>
                <p id="font2">Everyday is a new day for us and we work really hard to satisfy our customers everywhere.</p>
                
                        <p><span id="font4" class="glyphicon glyphicon-map-marker"></span><span id="font3">Mint<span id="font5">CRM</span></span><br /><span id="font6">Iqra University, Karachi</span></p>
                   
                        <p><span id="font4" class="glyphicon glyphicon-earphone"></span><span id="font7">111 222 333</span></p>
                        
                        <p><span id="font4" class="glyphicon glyphicon-envelope"></span><span id="font7">mintcrm1@gmail.com</span></p>
                   
                        <p><span id="font4" class="glyphicon glyphicon-time"></span><span id="font7">Mon - Sat 8:00 - 19:00</span></p>
                  
            </div>
          <%--  <div class="col-sm-6">
                <h1 id="font1">BRANCH OFFICE</h1>
                <p id="font2">Everyday is a new day for us and we work really hard to satisfy our customers everywhere.</p>
                
                        <p><span id="font4" class="glyphicon glyphicon-map-marker"></span><span id="font3">Security<span id="font5">Guard</span></span><br /><span id="font6">Kemp House, 160 City Road, London</span></p>
                    

                <p><span id="font4" class="glyphicon glyphicon-earphone"></span><span id="font7">0208 090 4747</span></p>

                <p><span id="font4" class="glyphicon glyphicon-envelope"></span><span id="font7">info@securityguard.com</span></p>

                <p><span id="font4" class="glyphicon glyphicon-time"></span><span id="font7">Mon - Sat 8:00 - 19:00</span></p>
            </div>
        </div>--%>
    </div><br /><br />
    <div class="container">
       
        <style>
            #gmap_canvas img {
                max-width: none !important;
                background: none !important;
            }
        </style></div>
       <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:440px;width:100%;'><div id='gmap_canvas' style='height:440px;width:100%;'></div><div><small><a href="http://embedgooglemaps.com">									embed google maps							</a></small></div><div><small><a href="https://disclaimergenerator.net">disclaimer generator</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type='text/javascript'>function init_map() { var myOptions = { zoom: 10, center: new google.maps.LatLng(24.8551146, 67.0898631), mapTypeId: google.maps.MapTypeId.ROADMAP }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions); marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(24.8551146, 67.0898631) }); infowindow = new google.maps.InfoWindow({ content: '<strong>Mint CRM</strong><br>Defence View, Shaheed-e-Millat Road  Karachi, Pakistan<br>' }); google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker); } google.maps.event.addDomListener(window, 'load', init_map);</script>
    </div><br /><br />
 <div class="container">
        <form class="form-horizontal" role="form">
            <div id="r" class="form-group">
                <h3 id="font18" class="h">Get in Touch</h3>
                <h3 id="font19"class="h">Contact Us</h3>
                
                <hr class="z"/>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="name" placeholder="Name" />
                    <input type="email" class="form-control" id="email" placeholder="Email" />
                    <input type="number" class="form-control" id="number" placeholder="Telephone" />
                </div>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="msg" placeholder="Message" />
                    <button type="button" id="btn" class="btn btn-primary">SEND</button>
                </div>
            </div>
        </form>
    </div>
        
            <div class="container-fluid">
            
                    <div class="row" style="text-align:center;">
                        <div class="col-sm-12">
                        <h1>What They Say</h1>
                        <p>Mint CRM met and exceed all my goals.I had a project with a very aggressive development timeline and their attention to detail, quick response to issues and technical knowledge lead to a timely delivery of a final project that was great.They had and used the best project management tools of any developer I have worked with.</p>
                        <h6>-John Doe,Kadhan</h6>
                        <hr />
                            </div>
                        </div>
                        <div class="row" style="text-align:center;">
                        <div class="col-sm-12">
                            <img class="inner9" src="/assets/images/l1.png" />
                            <img class="inner9" src="/assets/images/l2.png" />
                            <img class="inner9" src="/assets/images/l3.png" />
                            <img class="inner9" src="/assets/images/l4.png" />
                            <img class="inner9" src="/assets/images/l5.png" />
                        </div>
                    </div>
                           </div>

        <br /> <br /><br />
 <div class="panel panel-default">
        <div id="ft" class="panel-footer">
            <div class="container">
                <div id="f" class="col-sm-4">
                    <h4 id="font21" style="text-align:center;">Address</h4>
                    <p id="font22"style="text-align:center;">Iqra University Main Campus <br /> Karachi</p>
                </div>
                <div id="f" class="col-sm-4">
                    <h4 id="font21" style="text-align:center;">Contact info</h4>
                    <p id="font22" style="text-align:center;">111 222 333 <br /> mintcrm1@gmail.com</p>
                </div>
                <div id="f" class="col-sm-4">
                    <h4 id="font21" style="text-align:center;">Follow Us</h4>
                    <ul id="ul">
                        <li>
                            <a href="#"><img src="assets/images/msg1.png" /></a>
                            <a href="#"><img src="assets/images/f1.png" /></a>
                            <a href="#"><img src="assets/images/tw1.png" /></a>
                            <a href="#"><img src="assets/images/x.png" /></a>
                            <a href="#"><img src="assets/images/in1.png" /></a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div id="ft1" class="col-sm-8">
            <p id="font24">Copyright 2016 &nbsp;<span id="font25"><a id="font25" href="#">Mint CRM</a></span>&nbsp; - All Rights Reserved</p>&nbsp;&nbsp;


        </div>
        <div class="col-sm-2">
            <a id="font24" href="#">Privacy Policy</a>&nbsp;&nbsp;
        </div>
        <div class="col-sm-2">
            <a id="font24" href="#">Terms of Use</a>
        </div>
    </div>
    </form>
</body>
</html>

