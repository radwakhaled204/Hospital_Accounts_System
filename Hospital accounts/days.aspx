<%@ Page Title="اليوميات" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="days.aspx.cs" Inherits="Hospital_accounts.days" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Import NameSpace="System.Data.SqlClient" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Web.UI.WebControls" %>
<%@ Import NameSpace="Hospital_accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>

<!-- تضمين Bootstrap JavaScript و jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- تضمين Bootstrap context menu -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-contextmenu/2.0.0/css/bootstrap-contextmenu.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-contextmenu/2.0.0/js/bootstrap-contextmenu.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
<script src="JavaScript.js"></script>
<style>
    .row {
        display: flex;
        flex-wrap: wrap;
        margin-right: -5px;
        margin-left: -5px;
    }
    .col-md-3 {
        flex: 0 0 25%; /* 3 columns, 25% width */
        max-width: 25%;
        padding-right: 5px;
        padding-left: 5px;
    }
    .form-group {
        margin-bottom: 0;
    }
    .label {
        text-align:center;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wrapper" style="  align-content:center;">
<div style="display: flex; flex-direction: column; margin-right:10px;">                 
  <div  style="text-align: center">             
       <asp:Label ID="Label7" runat="server" Text="ما قبله"></asp:Label>
      <asp:TextBox ID="before_txt" runat="server" CssClass="form-control" Width="150px"  ></asp:TextBox>
 </div>
             
  <div  style="text-align: center">             
       <asp:Label ID="Label2" runat="server" Text="مدين"></asp:Label>
      <asp:TextBox ID="madin_txt" runat="server" CssClass="form-control" Width="150px"  ></asp:TextBox>
 </div>
           
  <div  style="text-align: center">             
       <asp:Label ID="Label3" runat="server" Text="دائن"></asp:Label>
      <asp:TextBox ID="daen_txt" runat="server" CssClass="form-control" Width="150px"  ></asp:TextBox>
 </div>

  <div  style="text-align: center">             
       <asp:Label ID="Label1" runat="server" Text="رصيد"></asp:Label>
      <asp:TextBox ID="rased_txt" runat="server" CssClass="form-control" Width="150px"  ></asp:TextBox>
 </div>  
 <div  style="text-align: center;margin-top:10px">
       <asp:Button ID="btn_estdaa" runat="server" Text="استدعاء" class="h_button" Width="150px"   />              
 </div>  
 <div  style="text-align: center;margin-top:10px">
       <asp:Button ID="btn_new" runat="server" Text="جديد" class="h_button" Width="150px" onclick="first_new_click"  />              
 </div>  
      </div>

<div class="combo" style=" width:70%">
<!----------------------------------------------------------- group 1--------------------------------------------------------- -->
<div class="row" >
    <div class="col-md-2">
        <div class="form-group text-right">
<asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Width="170px" AutoPostBack="true" onchange="showDay()" TextMode="Date" DataFormatString="dd/MM/yyyy"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:TextBox ID="day" runat="server" CssClass="form-control" Width="130px" style="margin-right:10px; text-align:center;"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group text-right">
                 <asp:DropDownList ID="account_type" runat="server" CssClass="form-control"   AutoPostBack="true"   Width="130px"  style="text-align:center; margin-right:-20px;" OnSelectedIndexChanged="account_type_SelectedIndexChanged">
                     <asp:ListItem>مدين</asp:ListItem>
                     <asp:ListItem>دائن</asp:ListItem> 
                </asp:DropDownList>   
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:DropDownList ID="first_drop" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="drop_item_SelectedIndexChanged" Width="180px" style=" text-align:center; margin-right:-50px;">
                <asp:ListItem>يومية خزينة</asp:ListItem>
                <asp:ListItem>يومية عملاء</asp:ListItem>
                <asp:ListItem>يومية موردين</asp:ListItem>
                <asp:ListItem>يومية بنوك</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:DropDownList ID="second_drop" runat="server" CssClass="form-control" AutoPostBack="true" Width="200px" style="margin-right:-30px; text-align:center;" OnSelectedIndexChanged="second_drop_SelectedIndexChanged"></asp:DropDownList>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:TextBox ID="code_txt" runat="server" CssClass="form-control" Width="145px" ReadOnly="True" style="text-align:center; margin-right:10px;"></asp:TextBox>
        </div>
    </div>

</div>
<!----------------------------------------------------------- group 2--------------------------------------------------------- -->


 <div class="row">
     <div class="col-md-2">
          <div class="form-group ">
                 <asp:Label ID="Label5" runat="server" Text="التاريخ"></asp:Label>
               <asp:TextBox ID="date" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
              </div>
       </div>
    <div class="col-md-2">
        <div class="form-group ">
            <asp:Label ID="Label4" runat="server" Text="مستند"></asp:Label>
            <asp:TextBox ID="document" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group ">

            <asp:Label ID="Label6" runat="server" Text="المبلغ"></asp:Label>
            <asp:Label ID="lbl_type" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="amount" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group ">

            <asp:Label ID="Label8" runat="server" Text="الحساب"></asp:Label>
            <asp:Label ID="lbl_account" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="account" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group ">
            <asp:Label ID="lbl_statement" runat="server" Text="البيان"></asp:Label>
            <asp:TextBox ID="statement" runat="server" CssClass="form-control" Width="320px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
   </div>
<!----------------------------------------------------------- group 3--------------------------------------------------------- -->


 <div class="row">
    <div class="col-md-2">
        <div class="form-group ">
            <asp:Label class="label" ID="Label10" runat="server" Text="رقم الفاتورة" ></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group ">
            <asp:Label class="label"  ID="Label11" runat="server" Text="ت.الفاتورة" ></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group ">
            <asp:Label class="label" ID="Label12" runat="server" Text="رقم الشيك" ></asp:Label>

            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group ">
            <asp:Label  class="label" ID="Label14" runat="server" Text="ت.شيك" ></asp:Label >
            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Width="150px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group ">
            <asp:Label class="label" ID="Label16" runat="server" Text="البنك المسحوب عليه"></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Width="320px"  style="text-align:center; "></asp:TextBox>
        </div>
    </div>
   </div>
<!----------------------------------------------------------- group 4--------------------------------------------------------- -->
        <div class="label" >
                <asp:Label ID="lbl_message" runat="server" class="text-center" Font-Bold="True" ForeColor="black"  Font-Size="18px" ></asp:Label>
            </div>
        <div class="row">
             <div class="col-md-12 text-center">
                   <asp:Button ID="save_days" runat="server" Text="تخزين" class="h_button"  Width="90px" OnClick="save_days_Click"/>&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button4" runat="server" Text="جديد" class="h_button" Width="90px" onclick="second_new_click" />&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="ايصال ملغى "/>
             </div>
          </div>  

<!----------------------------------------------------------- grid--------------------------------------------------------- -->

 <div class="row" >
  <nav id="grid" width="100%">
<asp:GridView ID="acc_lev2" runat="server" AutoGenerateColumns="False" Style="text-align: center"  >
    <Columns>
        <asp:BoundField DataField="name" HeaderText="الحساب"  />
        <asp:BoundField DataField="code"  HeaderText="الكود"  />
        <asp:BoundField DataField="name1" HeaderText="م اول"   />
        <asp:BoundField DataField="code1" HeaderText="كود"   />
        <asp:BoundField DataField="name2" HeaderText="م ثانى"  />
        <asp:BoundField DataField="code2" HeaderText="كود"  />
        <asp:BoundField DataField="name3" HeaderText="م ثالث"  />
        <asp:BoundField DataField="code3" HeaderText="كود"  />
        <asp:BoundField DataField="name4" HeaderText="م رابع"   />
        <asp:BoundField DataField="code4" HeaderText="كود"  />
    </Columns>
</asp:GridView>
    </nav>
</div>
<!----------------------------------------------------------- finish--------------------------------------------------------- -->

</div>


<div style=" display: flex; flex-direction: column; Width:250px">
  <div style= " display: flex; flex-direction:row;" >   
    <asp:RadioButtonList ID="type" runat="server" RepeatDirection="Horizontal" Width="85%"  > 
        <asp:ListItem>&nbsp;الكل</asp:ListItem>
        <asp:ListItem>&nbsp;صرف</asp:ListItem>
        <asp:ListItem>&nbsp;استلام</asp:ListItem>
    </asp:RadioButtonList>
    </div>
                
  
      <div style= " display: flex; flex-direction:row;   margin-top:10px;" >  
            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Width="85%" AutoPostBack="true"  textmode="date" ></asp:TextBox>
    </div>


   <div style= " display: flex; flex-direction:row;   margin-top:10px; margin-bottom:10px;" >  
            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" Width="85%" AutoPostBack="true"  textmode="date" ></asp:TextBox>
        </div>
  
        
  <nav id="sidebar1"  style="max-height: calc(150vh - 710px);">
<asp:GridView ID="acc_lev" runat="server" AutoGenerateColumns="False" Style="text-align: center" Width="100%" OnRowCommand="acc_lev_RowCommand">
    <Columns>
        <asp:ButtonField Text="Button" DataTextField="name" HeaderText="الحساب"  CommandName="ShowAccount"/>
        <asp:BoundField DataField="code" HeaderText="الكود" Visible="False" />
        <asp:BoundField DataField="name1" HeaderText="م اول" Visible="False"  />
        <asp:BoundField DataField="code1" HeaderText="كود"  Visible="False" />
        <asp:BoundField DataField="name2" HeaderText="م ثانى" Visible="False" />
        <asp:BoundField DataField="code2" HeaderText="كود" Visible="False" />
        <asp:BoundField DataField="name3" HeaderText="م ثالث" Visible="False" />
        <asp:BoundField DataField="code3" HeaderText="كود" Visible="False" />
        <asp:BoundField DataField="name4" HeaderText="م رابع"  Visible="False" />
        <asp:BoundField DataField="code4" HeaderText="كود" Visible="False" />
    </Columns>
</asp:GridView>
    </nav>
</div>


</div>
  <script type="text/javascript">

      function showDay() {


          var today = new Date();
          var selectedDate = new Date(document.getElementById('<%= txtDate.ClientID %>').value);



            var selectedDate = document.getElementById('<%= txtDate.ClientID %>').value;
        var dateObject = new Date(selectedDate);

        var options = { weekday: 'long' };
        var formatter = new Intl.DateTimeFormat('ar', options);
        var formattedDay = formatter.format(dateObject);

    
        var textBox1 = document.getElementById('<%= day.ClientID %>');
        textBox1.value = formattedDay;
        textBox1.readOnly = true;

        }




  </script>
</asp:Content>
