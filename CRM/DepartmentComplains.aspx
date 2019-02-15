<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="DepartmentComplains.aspx.cs" Inherits="CRM.Master.DepartmentComplains" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <section class="panel">
        <div class="panel-body">
            <div class="form-group col-lg-6">
                <label>Department </label>
                <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="form-group"></asp:DropDownList>
            </div>

            <asp:Literal runat="server" ID="lblMsg"></asp:Literal>

            <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search" />
        </div>
    </section>

    <section class="panel" style="background-color: lightgray; overflow: scroll;">

        <header class="panel-heading" style="font-size: 20px;">All Complains </header>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: left;">No.</th>
                    <%--<th style="text-align: left;">User Name</th>--%>
                    <th style="text-align: left;">Complain Type</th>
                    <th style="text-align: left;">Complain Number</th>
                    <th style="text-align: left;">Description</th>
                    <%--<th style="text-align: left;">Status</th>--%>
                    <th style="text-align: left;">Status</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repeaterComplains" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                           <%-- <td><%# Eval("UserName")%></td>--%>
                            <td><%# Eval("ComplainTypeName")%></td>
                            <td><%# Eval("ComplainNumber")%></td>
                            <td><%# Eval("Description")%></td>
                            <td><%# Eval("Status")%></td>
                            <td><%# Eval("ProductName")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <table class='table <%= repeaterComplains.Items.Count > 0 ? "hide" : "show" %>'>
            <tr>
                <td>No Complains found!</td>
            </tr>
        </table>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
