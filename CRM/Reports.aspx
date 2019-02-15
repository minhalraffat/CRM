<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CRM.Master.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <style>
        .colorWhite {
            background-color: #FFF;
        }
    </style>
    <script>
       

        function showDiv() {


            $("#reportsComplains").show(1000);
            $("#button1").hide(1000);
            $("#button2").show(1000);
            return

          
        }


        function hideDiv() {
            $("#reportsComplains").hide();
            $("#button1").show(1000);
            $("#button2").hide(1000);
            return



        }
    </script>
    <img class="img-responsive" style="width: 8%; height: 76px; margin-left: 36%;" src="assets/images/m.png">
    <h3 style="text-align: center; font-weight: 800; font-style: oblique; margin-top: -4%;">Reports</h3><br />
  <%--  <button id="button1" onclick="showDiv();return false" style="width: 20%;" class="btn btn-primary"> Show Report Complains</button>
    <button id="button2" onclick="hideDiv();return false" style="width: 20%;" class="btn btn-primary">hide Report Complains</button>--%>
    <div id="reportsComplains">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
      
        <br />
   
        <div style="margin-left: 58%; margin-bottom: -6%;">
            <asp:Label ID="Label2" runat="server" style="font-weight: 600;" Text="Status"></asp:Label>
            <asp:DropDownList ID="ddlStatus" runat="server" OnSelectedIndexChanged="Countries_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1000" Style="margin-top: 31px" CssClass="colorWhite">
            <LocalReport ReportPath="Complains.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>


        




    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"></asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="CRM.ComplainsTableAdapters."></asp:ObjectDataSource>

</asp:Content>
