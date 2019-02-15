<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CRMMaster.Master" AutoEventWireup="true" CodeBehind="Chats.aspx.cs" Inherits="CRM.Chats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
            <label runat="server" id="lblError"></label>
        </div>

    <div class="form-group col-lg-9">
        <table>
            <tr>
                <td>
                    <div id="divMessages" style="background-color: gray; border-color: Black; border-width: 1px; border-style: solid; height: 300px; overflow-y: scroll; font-size: 11px; padding: 4px 4px 4px 4px;" onresize="SetScrollPosition()">
                        <asp:TextBox runat="server" id="lblMessages" TextMode="MultiLine" Width="655" Height="285" Enabled="false"></asp:TextBox>
                    </div>
                </td>                
            </tr>
            <tr>
                <td colspan="3">
                    <asp:TextBox ID="txtMessage" onkeyup="ReplaceChars()" onclick="FocusMe()" onfocus="SetToEnd(this)" runat="server" MaxLength="100" Width="500px" />
                    <asp:Button ID="btnSend" runat="server" Text="Send" OnClientClick="SetScrollPosition()" OnClick="BtnSend_Click" />
                    <asp:Button ID="btnClear" Text="Clear" runat="server" OnClick="btnClear_Click" />
                    <asp:Button ID="btnLogOut" Text="Log Out" runat="server" OnClick="BtnLogOut_Click" />

                </td>
            </tr>
        </table>
    </div>
</asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script type="text/javascript">
        function SetScrollPosition() {
            var div = document.getElementById('divMessages');
            div.scrollTop = 100000000000;
        }

        function SetToEnd(txtMessage) {
            if (txtMessage.createTextRange) {
                var fieldRange = txtMessage.createTextRange();
                fieldRange.moveStart('character', txtMessage.value.length);
                fieldRange.collapse();
                fieldRange.select();
            }
        }

        function ReplaceChars() {
            var txt = document.getElementById('txtMessage').value;
            var out = "<"; // replace this
            var add = ""; // with this
            var temp = "" + txt; // temporary holder

            while (temp.indexOf(out) > -1) {
                pos = temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add +
                temp.substring((pos + out.length), temp.length));
            }

            document.getElementById('txtMessage').value = temp;
        }

        function LogOutUser(result, context) {
            // don't do anything here
        }

        function LogMeOut() {
            LogOutUserCallBack('LogOut');
        }

        function FocusThisWindow(result, context) {
            // don't do anything here
        }

        function FocusMe() {
            FocusThisWindowCallBack('FocusThisWindow');
        }
    </script>
</asp:Content>
