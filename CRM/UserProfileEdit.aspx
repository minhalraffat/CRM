<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="UserProfileEdit.aspx.cs" Inherits="CRM.UserEdit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <label runat="server" id="lblMsg"></label>

    <div class="row">
        <div class="container">
            <h2>Profile Edit</h2>
         <%--   <hr />--%>
            <div class="col-md-10 personal-info" style="background-color: #AEB5B4; padding-top: 10px;">
            <%--    <h5>Personal info</h5>--%>
           <%--     <hr />--%>
                <div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Login ID:</label>
                        <div>
                            <asp:TextBox ID="txtUserId" Enabled="false" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                           
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Name:</label>
                        <div>
                            <asp:TextBox ID="txtName" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Date of Birth:</label>
                        <div>
                            <asp:TextBox ID="txtDOB" runat ="server" TextMode="Date"  MaxLength="12" CssClass="form-control input-sm date-picker"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB" ErrorMessage="Please enter your DOB"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Address:</label>
                        <div>
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="1000" CssClass="form-control input-sm"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter your Address"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Email Address:</label>
                        <div>
                            <asp:TextBox ID="txtEmail"  TextMode="Email" runat="server" MaxLength="150" CssClass="form-control input-sm" ></asp:TextBox>
                           <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your Email Address"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Contact Number:</label>
                        <div>
                            <asp:TextBox ID="txtContactNumber" TextMode="Number" runat="server" MaxLength="50" CssClass="form-control input-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Please enter your contact number"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-md-3 control-label">Old Password:</label>
                        <div>
                            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" MaxLength="50" CssClass="form-control input-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter your old Password"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">New Password:</label>
                        <div>
                            <asp:TextBox ID="txtnewPassword" TextMode="Password" runat="server" MaxLength="50" CssClass="form-control input-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnewPassword" ErrorMessage="Please enter your new Password"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                </div>
                <hr />
                <section >
                    <div class="panel-body bio-graph-info">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <a href="UserProfile.aspx" class="btn  btn-info">Back</a>
                                <asp:Button Text="Save" ID="btnSaveEditUser" OnClick="btnSaveEditUser_Click" runat="server" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
