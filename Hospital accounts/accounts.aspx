<%@ Page Title="الحسابات" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="accounts.aspx.cs" Inherits="Hospital_accounts.accounts" %>
<%@ Import NameSpace="System.Data.SqlClient" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Web.UI.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!-- Sidebar  -->
    <nav id="sidebar" style="align-items:center;float: right;  max-height: calc(150vh - 630px)">
        

<asp:GridView ID="acc_typ" runat="server" AutoGenerateColumns="False" Style="text-align: center" Width="250px" >
    <Columns>
        <asp:BoundField DataField="name" HeaderText="الاسم" />
        <asp:BoundField DataField="code" HeaderText="الكود" />

    </Columns>
</asp:GridView>

    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="frm">
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="insert_floor" runat="server" Text="التعاقدات" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delete_f" runat="server" Text="العمليات" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="insert_room" runat="server" Text="الاطباء" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delete_r" runat="server" Text="العيادات" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="update_bed" runat="server" Text="العيادات الخارجية" class="h_button" Width="165px"  />&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="Button1" runat="server" Text=" الغرف" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="الخزينة الفرعية" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="الخزينة الرئيسية" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text=" تسجيل البواقى" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text=" تسجيل اسعار الخدمات" class="h_button" Width="165px"  />&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="Button6" runat="server" Text=" القيود" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button7" runat="server" Text="اشعارات البنك" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button8" runat="server" Text=" حركة الشبكات" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" Text="مراكز التكلفة" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button10" runat="server" Text="تعديل نسب الاطباء" class="h_button" Width="165px"  />&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="Button11" runat="server" Text=" اليوميات" class="h_button"   AutoPostBack="true" OnClick="days_click"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button12" runat="server" Text="الاصناف" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button13" runat="server" Text="صرف للمرضى" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button14" runat="server" Text="مبيعات للمرضى" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button15" runat="server" Text="فاتورة مريض خارجى" class="h_button" Width="165px"  />&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="Button16" runat="server" Text=" الاذون" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="tree_btn" runat="server" Text="تقارير مالية" class="h_button"   AutoPostBack="true" OnClick="tree_click"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button21" runat="server" Text="تقارير المخزون" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button18" runat="server" Text="القائمى بالصرف" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button25" runat="server" Text="اقفال اليومية" class="h_button" Width="165px"/>&nbsp;&nbsp;&nbsp;

        </div>
    </div>
    <div class="row">
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">

            <asp:Button ID="Button26" runat="server" Text="Request داخلى" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button20" runat="server" Text="تسجيل نسب التحمل للجهات" class="h_button" Width="185px"  />&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>

</asp:Content>