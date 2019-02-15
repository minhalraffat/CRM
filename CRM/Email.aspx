<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="CRM.Email" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <h2 style="text-align: center;">EMAIL</h2>
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
    <table>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>


         <%--<tr>
            <td>Sender Email Address</td>

            <td>
                <asp:TextBox ID="TextBox1" TextMode="Email" runat ="server" style="border-style:Solid;width:65%"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtemail" ErrorMessage="please enter email" />
            
            </td>
            
        </tr>--%>
        <%--<tr>
            <td>
                <br />
            </td>
        </tr>--%>
        <%-- <tr>
            <td>Password</td>

            <td>
                <asp:TextBox ID="TextBox2" TextMode="Password" runat ="server" style="border-style:Solid;width:65%"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="TextBox2" ErrorMessage="please enter Passworr" />
            
            </td>
            
        </tr>--%>
        <tr>
            <td>
                <br />
            </td>
        </tr>
      

        <tr>
            <td>
                <br />
            </td>
        </tr>

        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>Select</td>

            <td>
               <asp:DropDownList runat="server" ID="ddlFrequency">

                   <asp:ListItem Value="1">All Employees</asp:ListItem>
                   <asp:ListItem Value="2">All Users</asp:ListItem>

               </asp:DropDownList>
             </td>   
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>Query</td>

            <td>
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="10" Columns="100" runat="server" BorderStyle="Solid"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Send" OnClick="Button1_Click" />
                <label id="message" runat="server"></label>

            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
    </table>





</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>