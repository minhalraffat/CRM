<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="AddComplains.aspx.cs" Inherits="CRM.AddComplains" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    <fieldset style="width: 45%">
        <h2>Welcome Admin  </h2>
        <asp:Label ID="labelerror" runat="server"></asp:Label>
        <table>
            <tr>
                <td>
                    <label for="lblUserNameLogin">Enter Name</label>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btnserach" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnserach_Click" />
                    <asp:Label runat="server" ID="lbl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="10">
                    <asp:GridView ID="grdmoviedetail" runat="server" AutoGenerateColumns="False" CellPadding="8" ForeColor="#333333" GridLines="None" Width="157%" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="LoginId" HeaderText="LoginId">
                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name">
                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address">
                                <ItemStyle HorizontalAlign="Center" Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ID" HeaderText="ID">
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ContactNo" HeaderText="ContactNo">
                                <ItemStyle HorizontalAlign="Center" Width="70%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email">
                                <ItemStyle HorizontalAlign="Center" Width="70%" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>

            <tr>
                <td>
                    <h2>Online User Complains </h2>
                </td>
            </tr>

            <tr>
                <td>
                    <label for="User Id">Enter Id</label><br />
                    <asp:TextBox ID="txtUserId" runat="server" TextMode="Number"></asp:TextBox></td>
            </tr>

             <tr>
                <td>
                    <label for="User Id">Complain Type</label><br />
                    <asp:DropDownList ID="ddlComplainType" runat="server"></asp:DropDownList></td>
            </tr>

            <tr>
                <td>
                    <br />
                    <label for="ComplainDes">Enter Complain Description</label><br />
                    <asp:TextBox TextMode="MultiLine" ID="txtDescription" runat="server" MaxLength="150" CssClass="form-control input-sm"></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Go" OnClick="btnSubmit_Click" />
                    <br />
                    <asp:Literal runat="server" ID="lblTextMsg"></asp:Literal>
                </td>
            </tr>
        </table>
    </fieldset>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
</asp:Content>
