<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CRM.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="row">
        <aside class="profile-nav col-lg-3">
            <section class="panel" style="height: 390px; background-color: #55565D;">
                <div class="user-heading round">
                    <a href="#" style="margin-left: 45px;">

                        <asp:Image ID="imgAdmin" runat="server" ImageUrl="~/assets/img/find_user.png" />
                    </a>
                    <h1 style="color: black; text-align: center;"><%= litName.Text%></h1>
                </div>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href='UserProfileEdit.aspx?Id=<%# "EditUserId" %>' style="font-size: 19px; font-family: serif;"><i class="icon-edit"></i>Edit profile</a></li>
                    <%--<li><asp:Button runat="server" ID="btnEdit" Text="Edit Profile" OnClick="btnEdit_Click" CssClass="btn btn-lg btn-link" /><i class="icon-edit"></i></li>--%>
                </ul>
            </section>
        </aside>

        <aside class="profile-info col-lg-9">
            <section class="panel">
                <header class="panel-heading text-info bg-lg">
                    <span class="auto-style1" style="font-size: 19px; font-family: serif; margin-left: 33%;">General Information</span>
                </header>
                <div class="panel-body bio-graph-info">
                    <div class="row">

                        <div class="bio-row" style="background-color: whitesmoke; width: 100%; padding-bottom: 1px; padding-left: 100px;">
                            <p>
                                <span style="font-weight: bolder">Name </span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="litName" runat="server"></asp:Literal>
                                
                            </p>
                        </div>
                        <br />
                        <div class="bio-row" style="background-color: whitesmoke; width: 100%; padding-bottom: 1px; padding-left: 100px;">
                            <p>
                                <span style="font-weight: bolder">Email </span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="litEmail" runat="server" Text=""></asp:Literal>
                            </p>
                        </div>
                        <br />

                        <div class="bio-row" style="background-color: whitesmoke; width: 100%; padding-bottom: 1px; padding-left: 100px;">
                            <p>
                                <span style="font-weight: bolder">Address </span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="litAddress" runat="server"></asp:Literal>
                            </p>
                        </div>
                        <br />
                        <div class="bio-row" style="background-color: whitesmoke; width: 100%; padding-bottom: 1px; padding-left: 100px;">
                            <p>
                                <span style="font-weight: bolder">Contact No </span>:&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="litContactNo" runat="server" Text=""></asp:Literal>
                            </p>
                        </div>
                        <br />

                    </div>
                </div>
            </section>
        </aside>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
