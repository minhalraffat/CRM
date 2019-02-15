<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="CRM.Aboutus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

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
        }
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
                        <li><a href="About us.aspx">About Us</a></li>
                        <li><a href="connectwithus.aspx">Connect With Us</a></li>
                    </ul>
                    <asp:Label ID="lblmessage" runat="server" Visible="false"></asp:Label>
                    <ul class="nav navbar-nav navbar-right" style="margin-top: 35px;">
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
                                        <asp:TextBox ID="txtContactRegister" TextMode="Phone" placeholder="Enter Contact Number" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
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
        <div class="container">
            <div id="row" class="row">
                <div class="col-sm-6">
                    <h2 id="font1">Unique Features Reliability & Commitment</h2>
                    <p id="p">
                        Our approach to clients is different and sets us apart from other companies.We firstly stabilise improve and
    then challenge and innovate. In today's fast-moving world, we cannot stand still so we utilise the best technology to
    support our customers and security teams to provide a leaner, smarter and more connected organisation.
                    </p>
                    <p id="p">
                        Our people drive our success and we want our people to achieve great things and be rewarded for their efforts and a job
    well done.
                    </p>
                    <p id="p">
                    </p>
                </div>
                <div class="col-sm-6">
                    <img src="assets/images/images.jpg" style="height: 170px; margin-bottom: 20px;" class="img-responsive" />
                    <p id="p1">
                        We have the experience, entrepreneurial spirit and capability to move faster and stay closer to your business and deliver
    through passionate people.              
                    </p>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="container">
            <div id="i" class="row">
                <div class="col-sm-4">
                    <img src="assets/images/camera.jpg" class="img-responsive" style="width: 100%;" />
                    <h5 id="font3">24/7 CONSTANT SUPPORT</h5>
                    <p id="font2">
                        Everything we do is focused on our clients. We are all about service excellence and mark our progress as much by client 
        satisfaction and retention rates as by our own financial performance.We are working
         hard to make sure that our track record in all sectors, for all client contracts, reaches those same high standards.
        Mint CRM clients stay with us because we prove our value.
                    </p>


                    <p id="font5">
                        Then, as the client experiences the value we bring to the business, the relationship evolves into a bundle of services or a fully integrated contract which sees us deliver a raft of different services under a single agreement.

            In addition to initiatives such as the Key Accounts programme – which although part of our People strategy also delivers tangible benefits to clients – we strive to create a culture that always puts client focus at the heart of how we work.

            In the complex outsourcing marketplace, it is clear that one size will never fit all. So we treat each client as unique; as an opportunity to create a tailored service – or a bundle of services – that meet their needs with pinpoint precision.

            Client focus means creating a clear simple message that resonates for one client and one client alone. This is uniquely tailored and demonstrates a real understanding of where they are, the pressures they are under and how the services we provide can be linked together in ways that unlock potential and deliver new benefits.
                    </p>

                </div>
                <div class="col-sm-4">
                    <img src="assets/images/man1jpg.jpg" class="img-responsive" style="width: 100%;" />
                    <h5 id="font3">ONLY PROFESSIONALS</h5>
                    <p id="font2">
                        We get to know our clients’ strategy and what they need from their people and their property, so we can help them to achieve their goals
            We use our extensive knowledge and experience of our clients on the best way forward. 
            We apply fresh thinking to create innovative ways to live and work,allowing a client to focus on their core objectives.
                    </p>

                    <p id="font6">
                        Our ethos of share ownership makes us different.
            We make sure that our people have the right technology and systems do their job properly. To manage and deliver services, we analyse and act on our own and our clients’ data to provide the best service and most efficient solutions.
            We provide a service that helps our clients run their organisations more efficiently. In return we are able to deliver sustainable profit that creates value for our shareholders.
                    </p>

                </div>
                <div class="col-sm-4">
                    <img src="assets/images/camera1.jpg" class="img-responsive" style="width: 100%;" />
                    <h5 id="font3">ONLY THE LATEST EQUIPMENT</h5>
                    <p id="font2">
                        Helping clients operate more efficiently is our core skill. It is why clients choose to work with us and why we have grown so consistently. However, we know that there is always a better way of working – a better way to deliver operational excellence and the best way to stay ahead of the competition. Management information, data and technology is an increasingly critical part of our service offering, and we continue to invest in this area.
                    </p>

                    <p id="font4">Our team continually seeks out new and better ways of working. That means concentrating on what matters most to customers, listening to feedback and being innovative to meet ever-increasing expectations.</p>

                </div>
            </div>
        </div>
        <div class="container">
            <form class="form-horizontal" role="form">
                <div id="r" class="form-group">
                    <h3 id="font18" class="h">Get in Touch</h3>
                    <h3 id="font19" class="h">Contact Us</h3>

                    <hr class="z" />
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
    </form>
</body>
</html>
