<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="ReportsEmployees.aspx.cs" Inherits="CRM.Master.ReportsEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
       <style>
        .colorWhite {
            background-color: #FFF;
        }
    </style>
     <img class="img-responsive" style="width: 8%; height: 76px; margin-left: 36%;" src="assets/images/m.png">
    <h3 style="text-align: center; font-weight: 800; font-style: oblique; margin-top: -4%;">Reports</h3><br />
    <div id="reportsEmployess">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      
        
        <br />
        
        <div style="margin-left: 58%; margin-bottom: -6%;">
            <asp:Label ID="Label1" runat="server" style="font-weight: 600;" Text="Login Name"></asp:Label>
            <asp:DropDownList ID="ddlEmployees" runat="server" OnSelectedIndexChanged="Employees_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1000px" Style="margin-top: 31px" CssClass="colorWhite" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Employees.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource4" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        
    </div>
  
</asp:Content>

