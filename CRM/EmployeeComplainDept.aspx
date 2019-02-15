<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeComplainDept.aspx.cs" Inherits="CRM.EmployeeComplainDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section class="panel">
        <div class="panel-body">
           <%-- <div class="form-group col-lg-6">
                <label>Complain Type</label>
                <asp:DropDownList runat="server" ID="ddlComplainType" CssClass="form-group"></asp:DropDownList>
            </div>--%>

            <asp:Literal runat="server" ID="lblMsg"></asp:Literal>

            <div class="form-group col-lg-6">
                <label>Complain Number</label>
                <asp:TextBox runat="server" ID="txtComplainNo" CssClass="form-group"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search" />
        </div>
    </section>

    <section class="panel" style="background-color: lightgray; overflow: auto;height: 700px;">
        <header class="panel-heading" style="font-size: 20px;">All Complains</header>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: left;">No.</th>
                    <th style="text-align: left;">Complain Type</th>
                    <th style="text-align: left;">Complain Number</th>
                    <th style="text-align: left;">Description</th>
                    <th style="text-align: left;">Status</th>
                    <th style="text-align: left;">Product</th>
                      <th style="text-align: left;">Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repeaterComplains" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("ComplainTypeName")%></td>
                            <td><%# Eval("ComplainNumber")%></td>
                            <td><%# Eval("Description")%></td>
                            <td><%# Eval("Status")%></td>
                            <td><%# Eval("ProductName")%></td>
                            <td><asp:LinkButton ID="lnkedit" PostBackUrl='<%# "~/EmployeeComplainDept.aspx?ID="+Eval("Id") %>' Text="Edit" CssClass="btn btn-danger btn-xs" runat="server" OnClick="OnEdit" OnClientClick="return confirm('Do you want to update status of this row?');" />
                                <asp:LinkButton ID="lnkDelete" PostBackUrl='<%# "~/EmployeeComplainDept.aspx?ID="+Eval("Id") %>' Text="Delete" CssClass="btn btn-danger btn-xs" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                            </td>
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
