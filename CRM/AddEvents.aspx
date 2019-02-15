<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="AddEvents.aspx.cs" Inherits="CRM.AddEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="panel">
        <div class="panel-heading">
            Event

            <label runat="server" id="lblMsg"></label>
        </div>

        <div class="panel-body col-lg-6">
            <div class="row">
                <label>Name</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Enabled="false"></asp:TextBox>
            </div>
            <br />
            <div class="row">
                <label>Event Name</label>
                <asp:TextBox runat="server" ID="txtEventName" CssClass="form-control"></asp:TextBox>
            </div>

             <div class="row">
                <label>Date</label>
                <asp:TextBox runat="server" ID="txtDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="row">

                <label>Initial Time</label>
                <asp:TextBox runat="server" ID="txtTimeStart" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row">

                <label>End Time</label>
                <asp:TextBox runat="server" ID="txtEndTime" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row">

                <label>Location</label>
                <asp:TextBox runat="server" ID="txtLocation" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="row">

                <label>Description</label>
                <asp:TextBox runat="server" ID="txtDesc" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" />
                

            </div>
             
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
