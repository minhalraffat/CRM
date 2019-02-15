<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="EmailUser.aspx.cs" Inherits="CRM.EmailUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <h2 style="text-align: center;">EMAIL</h2>
     <h5 style="text-align: center;">Enter Email Address and Name   </h5>
    <h5 style="text-align: center;">Please Enter your gmail Account  </h5>
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
            <td>Email Address</td>

            <td>
                <asp:TextBox ID="txtemail" TextMode="Email" runat ="server" style="border-style:Solid;width:65%"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="reqemail" ControlToValidate="txtemail" ErrorMessage="please enter email" />
            
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
            <td>Name</td>

            <td>
                <asp:TextBox ID="txtName"  runat="server" BorderStyle="Solid"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtName" ErrorMessage="please enter name" />
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
        <td> Your Email Address</td>

            <td>
                <asp:TextBox ID="TextBox1" TextMode="Email" runat ="server" style="border-style:Solid;width:65%"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="TextBox1" ErrorMessage="please enter email" />
            
            </td>

        </tr>
          <tr>
            <td>
                <br />
            </td>
        </tr>
           <tr>
        <td> Your Password</td>

            <td>
                <asp:TextBox ID="TextBox2" TextMode="Password" runat ="server" style="border-style:Solid;width:65%"></asp:TextBox>
              <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="TextBox2" ErrorMessage="please enter email" />
            
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
                <asp:TextBox ID="TextBox3" TextMode="MultiLine" Rows="10" Columns="100" runat="server" BorderStyle="Solid"></asp:TextBox></td>
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