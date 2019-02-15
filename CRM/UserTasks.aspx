<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="UserTasks.aspx.cs" Inherits="CRM.UserTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="panel">
        <div class="panel-heading">
            Task

            <label runat="server" id="lblMsg"></label>
        </div>

        <div class="panel-body col-lg-6">
            <div class="row">
                <label>Task Name</label>
                <asp:TextBox runat="server" ID="txtTaskName" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <div class="row">
                <label>Subject</label>
                <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control"></asp:TextBox>
            </div>

             <div class="row">
                <label>Due Date</label>
                <asp:TextBox runat="server" ID="txtDueDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="row">

                <label>Department Name</label>
                <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="row">

                <label>Description</label>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row">

                <label>Status</label>
                <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="row">

                <label>Priority</label>
                <asp:DropDownList   runat="server" ID="ddlPriority"  CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Text="Submit" />
                

            </div>
             
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
