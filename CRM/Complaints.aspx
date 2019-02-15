<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="CRM.Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="row">
        <h2>Add Complaints</h2>

        <asp:Literal runat="server" ID="lblTextMsg"></asp:Literal>

        <section>
            <div class="row">

                <div class="col-sm-8">
                    <div class="form-group">
                        <label>Complain Type </label>
                        <asp:DropDownList ID="ddlComplainType" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="ddlComplainType" ErrorMessage="please Select Complain Type" />
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label>Department </label>
                        <asp:DropDownList ID="ddlDepart" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="ddlDepart" ErrorMessage="please Select Department" />
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label>Product </label>
                        <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control input-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="ddlProducts" ErrorMessage="please Select Product" />
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label>Describe your Views/Suggestions </label>
                        <asp:TextBox TextMode="MultiLine" ID="txtDescription" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription" ErrorMessage="please enter Description" />
                    </div>
                </div>
            </div>

            <asp:Button Text="Submit" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </section>
    </div>
    <br />
    <section class="panel panel-back">

        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: left;">No.</th>
                    <th style="text-align: left;">ComplainNumber</th>
                    <th style="text-align: left;">Description</th>
                    <th style="text-align: left;">Status</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repeaterComplains" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("ComplainNumber")%></td>
                            <td><%# Eval("Description")%></td>
                            <td><%# Eval("Status")%></td>
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
