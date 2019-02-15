<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="CRM.AddEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    <%--<script>
        $(document).ready(function () {
            $("#NewEmployee").hide();
        });

        $("#btnSave").click(function () {
            $("#NewEmployee").hide(1000);
        });

        function showDiv() {
            $("#NewEmployee").show(1000);
            return
        }
    </script>--%>

    <asp:Label runat="server" ID="lblMsg" CssClass="alert-success"></asp:Label>

    <section class="panel" style="background-color: lightgray">
        <header class="panel-heading text-center" style="font-size: 26px;"><u>All Employees</u> </header>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: left;">#</th>
                    <th style="text-align: left;">Name</th>
                    <th style="text-align: left;">Address</th>
                    <th style="text-align: left;">Contact Number</th>
                    <th style="text-align: left;">Designation</th>
                    <th style="text-align: left;">Salary</th>
                    <th style="text-align: left;">Edit</th>
                    <th style="text-align: left;">Delete</th>

                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repeaterEmployee" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("Name")%></td>
                            <td><%# Eval("Address")%></td>
                            <td><%# Eval("CellNo")%></td>
                            <td><%# Eval("DesignationName")%></td>
                            <td><%# Eval("SalaryName")%></td>

                            <td><a class="btn btn-danger btn-xs" href='AddEmployee.aspx?ID=<%#Eval("Id")%>'><i class="fa fa-edit"></i></a></td>
                            <td>
                                <asp:LinkButton ID="Delete" CssClass="btn btn-danger btn-xs" runat="server" Text="Delete" CommandArgument='<%#Eval("Id")%>' OnClick="Delete_Click" OnClientClick="return confirm ('Are you sure you want to Delete this Employee?');"></asp:LinkButton></td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <table class='table <%= repeaterEmployee.Items.Count > 0 ? "hide" : "show" %>'>
            <tr>
                <td>No Employee found!</td>
            </tr>
        </table>
    </section>
    <div>
        <button id="Button1" style="width: 20%;" onclick="showDiv();  return false;" class="btn btn-primary">Add/Edit Employee</button>
    </div>
    <br />

    <div id="NewEmployee">
        <section class="panel" style="background-color: lightgray">
            <header class="panel-heading text-center" style="font-size: 26px;">
                <u>Add New Employee </u>
            </header>
            <div class="panel-body">
                <div class="form-group">
                    <label>Name </label>
                    <asp:TextBox ID="txtEmpName" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmpName" ErrorMessage="Please enter Name"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Address </label>
                    <asp:TextBox ID="txtEmpAddress" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmpAddress" ErrorMessage="Please enter address"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Date of Birth</label>
                    <asp:TextBox ID="txtEmpDOB" TextMode="Date" runat="server" CssClass="form-control input-sm date-picker"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmpDOB" ErrorMessage="Please enter DOB"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Contact Number </label>
                    <asp:TextBox ID="txtEmpContact" TextMode="Phone" runat="server" MaxLength="11" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmpContact" ErrorMessage="Please enter Contact Number"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmpEmail" TextMode="Email" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmpEmail" ErrorMessage="Please enter Email"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Login Id</label>
                    <asp:TextBox ID="txtloginId"  runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtloginId" ErrorMessage="Please enter Login Id"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter Password"></asp:RequiredFieldValidator>
                </div>


                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Panel ID="pnlControls" runat="server">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <label>Designation</label>
                                <asp:DropDownList ID="ddlDesgination" OnSelectedIndexChanged="ddlDesgination_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Salary</label>
                                <asp:DropDownList ID="ddlSalary" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Department</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <asp:Button Text="Submit" ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server"></asp:Button>
                    </div>
                </div>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
