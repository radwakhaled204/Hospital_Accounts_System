<%@ Page Title="الشجرة المحاسبية" Language="C#" MasterPageFile="~/Base_form.Master" AutoEventWireup="true" CodeBehind="tree.aspx.cs" Inherits="Hospital_accounts.tree" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Import NameSpace="System.Data.SqlClient" %>
<%@ Import NameSpace="System.Data" %>
<%@ Import NameSpace="System.Web.UI.WebControls" %>
<%@ Import NameSpace="Hospital_accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- تضمين Bootstrap CSS -->
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


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
       <div class="con"  >
    <div class="row" >
        <div style="display: flex; justify-content:center ; color: gray; font-size: 18px; float: right;">
            <asp:Button ID="insert_floor" runat="server" Text="مراكز التكللفة" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delete_f" runat="server" Text="الخزينة الفرعية" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="bank" runat="server" Text="البنك" class="h_button" onclick="bank_click"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="delete_r" runat="server" Text="الخزينة الرئيسية" class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="update_bed" runat="server" Text="عميل" class="h_button"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="مخزن" class="h_button"   AutoPostBack="true"   />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="عيادة" class="h_button"   AutoPostBack="true"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Text="جهات التعاقد " class="h_button" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="mored" runat="server" Text="مورد" class="h_button" onclick="mored_click" />&nbsp;&nbsp;&nbsp;

        </div>
    </div>

   
       </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<div class="wrapper" style="  align-content:center;">


<div style="display: flex; flex-direction: column;">
    <nav id="sidebar1">
   
        <asp:GridView ID="acc_typ" runat="server" AutoGenerateColumns="False" Style="text-align: center" Width="250px" OnRowCommand="acc_typ_RowCommand">
            <Columns>
                <asp:ButtonField Text="Button" HeaderText="بيان" DataTextField="fill" CommandName="ShowDetails" />
                <asp:BoundField DataField="name" HeaderText="الاسم" Visible="False" />
                <asp:BoundField DataField="code" HeaderText="الكود" Visible="False" />
            </Columns>
        </asp:GridView>
    </nav>

 
    <div style="margin-top: 15px; display: flex; flex-direction:row ;">
<asp:TextBox ID="search_acc_typ" runat="server" CssClass="form-control" Width="180px" OnTextChanged="search_acc_typ_TextChanged" ></asp:TextBox>
        <asp:Button ID="all_acc_typ" runat="server" Text="ALL"  CssClass="btn btn-primary" style="margin-right: 8px; background: gray;" OnClick="all_acc_typ_Click"/>
    </div>
</div>


<!--********************************************** content ********************************************************************-->

 <div class="combo">
  <div class="row">
              <div class="col-md-3">
                  <div class="form-group text-right">
                      <asp:Label ID="Label7" runat="server" Text="النوع" style="margin-left:-70px;"> </asp:Label>
                  </div>
              </div>
               <div class="col-md-3">
                  <div class="form-group text-right">
                      <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                      <asp:TextBox ID="name_head" runat="server" CssClass="form-control" Width="170px" ReadOnly="True" style="margin-right:-30px;  text-align:center;"></asp:TextBox>
                  </div>
            </div>
               <div class="col-md-3">
                  <div class="form-group text-right">
                      <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                      <asp:TextBox ID="fill_head" runat="server" CssClass="form-control" Width="190px" ReadOnly="True" style=" margin-right:75px; text-align:center;"></asp:TextBox>
                  </div>
            </div>
          </div>
<!----------------------------------------------------------- group 2--------------------------------------------------------- -->
<div class="row">
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <asp:Label ID="ro2l1" runat="server" Text="م اول" style="margin-left:15px;"></asp:Label>
        </div>
    </div>
    <div class="col-md-2"> 
        <div class="form-group text-right">
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="first_code" runat="server" CssClass="form-control" Width="120px" ReadOnly="True" onmousedown="showContextMenu(event, 'context-menu3')" style="margin-right:-50px; text-align:center;"></asp:TextBox>
            <div id="context-menu3" class="dropdown-menu" style="display: none;">
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option1', 'context-menu3')">الارصده</a>
            </div>
        </div>
    </div>
    <div class="col-md-2"> 
        <div class="form-group text-right">
            <asp:TextBox ID="first_txt" runat="server" CssClass="form-control" Width="190px" ReadOnly="True" style=" text-align:center; margin-right:-20px"></asp:TextBox> 
        </div>
    </div>
    <div class="col-md-2"> 
        <div class="form-group text-right">
            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            <asp:DropDownList ID="first_level" runat="server" CssClass="form-control" Width="230px" AutoPostBack="true" OnSelectedIndexChanged="first_level_SelectedIndexChanged" style="margin-right:75px;" ToolTip="اضغطF1 للكتابة"></asp:DropDownList>
            <asp:TextBox ID="textbox_input" runat="server" CssClass="form-control" Width="230px" style="margin-right:75px;display: none;"></asp:TextBox> 
        </div>
    </div>
</div>




<!----------------------------------------------------------- group 3--------------------------------------------------------- -->
        <div class="row">
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:CheckBox ID="CheckBox2" runat="server" />
                      <asp:Label ID="Label8" runat="server" Text="م ثانى" style="margin-left:15px;"></asp:Label>
                  </div>
                </div>
     <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                      <asp:TextBox ID="second_code" runat="server" CssClass="form-control" Width="120px" ReadOnly="True" style="margin-right:-50px; text-align:center;"></asp:TextBox>
                  </div>
            </div>
<div class="col-md-2">
<div class="form-group text-right">
            <asp:TextBox ID="second_txt" runat="server" CssClass="form-control" Width="190px" ReadOnly="True"  AutoPostBack="true"   onmousedown="showContextMenu(event, 'context-menu4')" style=" text-align:center; margin-right:-20px; " ToolTip="اضغطF1 للكتابة"></asp:TextBox> 
          <!--  <asp:TextBox ID="second2_txt" runat="server" CssClass="form-control" Width="190px" onmousedown="showContextMenu(event, 'context-menu4')"  style=" text-align:center; margin-right:-20px;display: none; " ToolTip="اضغطF1 للكتابة"></asp:TextBox> -->

<div id="context-menu4" class="dropdown-menu" style="display: none;">
<a class="dropdown-item" href="#" onclick="showSubContextMenu(event, 'sub-context-menu1')">
    سماحية الكتابة  &raquo;
</a>
 
    <div id="sub-context-menu1" class="sub-context-menu" style="display: none;">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="sub-dropdown-item" OnClick="Enable_Click" >Enable</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="sub-dropdown-item" OnClick="Disable_Click">Disable</asp:LinkButton>

        <a class="sub-dropdown-item" href="#" onclick="menuItemClicked('sub-option1', 'sub-context-menu1')"></a>
        <a class="sub-dropdown-item" href="#" onclick="menuItemClicked('sub-option2', 'sub-context-menu1')"></a>


    </div>
    <a class="dropdown-item" href="#" onclick="menuItemClicked('option2', 'context-menu4')">تخزين</a>
    <a class="dropdown-item" href="#" onclick="menuItemClicked('option3', 'context-menu4')">حذف</a>
</div> 





 </div>
    </div>
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                      <asp:DropDownList ID="second_level" runat="server" CssClass="form-control"   AutoPostBack="true" OnSelectedIndexChanged = "second_level_SelectedIndexChanged" Width="230px" style="margin-right:75px;"></asp:DropDownList>
                  </div>
            </div>
        
       </div>

<!----------------------------------------------------------- group 4--------------------------------------------------------- -->
        <div class="row">
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:CheckBox ID="CheckBox3" runat="server" />
                      <asp:Label ID="Label1" runat="server" Text="م ثالث" style="margin-left:15px;"></asp:Label>
                  </div>
            </div>
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                      <asp:TextBox ID="third_code" runat="server" CssClass="form-control" Width="120px" ReadOnly="True" style="margin-right:-50px; text-align:center;"></asp:TextBox>
                  </div>
            </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:TextBox ID="third_txt" runat="server" CssClass="form-control" Width="190px" ReadOnly="True" onmousedown="showContextMenu(event, 'context-menu6')" style=" text-align:center; margin-right:-20px"></asp:TextBox> 
            <div id="context-menu6" class="dropdown-menu" style="display: none;">
<a class="dropdown-item" href="#" onclick="showSubContextMenu(event, 'sub-context-menu2')">
    سماحية الكتابة  &raquo;
</a>
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option2', 'context-menu6')">تخزين</a>
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option3', 'context-menu6')">حذف</a>
            </div>       
            </div>
    </div>
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                      <asp:DropDownList ID="third_level" runat="server" CssClass="form-control"   AutoPostBack="true" OnSelectedIndexChanged = "third_level_SelectedIndexChanged"  Width="230px" style="margin-right:75px;"></asp:DropDownList>
                  </div>
            </div>
        </div>


<!----------------------------------------------------------- group 5--------------------------------------------------------- -->
        <div class="row">
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:CheckBox ID="CheckBox4" runat="server" />
                      <asp:Label ID="fourth_lev" runat="server" Text="م رابع" style="margin-left:15px;"></asp:Label>
                  </div>
            </div>
    <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                      <asp:TextBox ID="fourth_code" runat="server" CssClass="form-control" Width="120px" ReadOnly="True" style="margin-right:-50px; text-align:center;"></asp:TextBox>
                  </div>
            </div>
    <div class="col-md-2">
        <div class="form-group text-right">
            <asp:TextBox ID="fourth_txt" runat="server" CssClass="form-control" Width="190px" ReadOnly="True" onmousedown="showContextMenu(event, 'context-menu5')" style=" text-align:center; margin-right:-20px"></asp:TextBox> 
            <div id="context-menu5" class="dropdown-menu" style="display: none;">
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option1', 'context-menu5')">سماحية الكتابة</a>
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option2', 'context-menu5')">تخزين</a>
                <a class="dropdown-item" href="#" onclick="menuItemClicked('option3', 'context-menu5')">حذف</a>
            </div>       
            </div>
    </div>
     <div class="col-md-2">
                  <div class="form-group text-right">
                      <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                      <asp:DropDownList ID="fourth_level" runat="server" CssClass="form-control"   AutoPostBack="true" OnSelectedIndexChanged = "fourth_level_SelectedIndexChanged"  Width="230px" style="margin-right:75px;"></asp:DropDownList>
                  </div>
            </div>
        </div>
<!----------------------------------------------------------- group 6--------------------------------------------------------- -->
        <div class="row">
               <div class="col-md-3">
                  <div class="form-group text-right">
                      <asp:Label ID="name" runat="server" Text="الحساب"></asp:Label>
                  </div>
            </div>
               <div class="col-md-3">
                    <div class="form-group text-right">
                           <asp:Label ID="Label17" runat="server" Text=""></asp:Label>
                           <asp:TextBox ID="account_txt" runat="server" CssClass="form-control" Width="300px" oncontextmenu="showContextMenu(event, 'context-menu1')" Style="text-align: center"></asp:TextBox>
                          <div id="context-menu1" class="dropdown-menu" style="display: none;">
                               <a class="dropdown-item" href="#" onclick="menuItemClicked('option1', 'context-menu1')">كشف حساب</a>
                           </div>
                     </div>
                 </div>

        </div>
<!----------------------------------------------------------- group 7--------------------------------------------------------- -->
        <div class="label" >
                <asp:Label ID="lbl_message" runat="server" class="text-center" Font-Bold="True" ForeColor="black"  Font-Size="18px" ></asp:Label>
            </div>
        <div class="row">
             <div class="col-md-12 text-center">
                   <asp:Button ID="save_tree" runat="server" Text="تخزين" class="h_button"  Width="90px" OnClick="save_tree_Click"/>&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button4" runat="server" Text="طباعة" class="h_button" Width="90px" onclick="print"/>&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button1" runat="server" Text="طباعة شجره" class="h_button" oncontextmenu="showContextMenu(event, 'context-menu2')"/>&nbsp;&nbsp;&nbsp;
                    <div id="context-menu2" class="dropdown-menu" style="display: none;">        
                    <a class="dropdown-item" href="#" onclick="menuItemClicked('option2', 'context-menu2')">Visiable false</a>
                    <a class="dropdown-item" href="#" onclick="menuItemClicked('option3', 'context-menu2')">all</a>
               </div>          
             </div>
          </div>                     
<!----------------------------------------------------------- group 8--------------------------------------------------------- -->
        <div class="row">

               <div class="col-md-4" style="Width:80px">
                  <div class="form-group text-right">
                      <asp:CheckBox ID="CheckBox5" runat="server" />
                      <asp:Label ID="Label15" runat="server" Text="الفرع"></asp:Label>
                 </div>
            </div>
               <div class="col-md-4">
                  <div class="form-group text-right">
                      <asp:DropDownList ID="branch" runat="server" CssClass="form-control" DataValueField="1"  AutoPostBack="true"  Width="180px"  ClientIDMode="Static"></asp:DropDownList>
                  </div>
            </div>

        </div>
</div> 
<!--********************************************** content ********************************************************************-->   
  <div style="display: flex; flex-direction: column;">
    <!-- Sidebar  left-->
  <nav id="sidebar2">

      
<asp:GridView ID="acc_lev" runat="server" AutoGenerateColumns="False" Style="text-align: center" width="250px" OnRowCommand="acc_lev_RowCommand">
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
    <!-- Textbox and Button -->
    <div style="margin-top: 15px; display: flex; flex-direction:row ;">
        <asp:TextBox ID="search_acc_lev" runat="server" CssClass="form-control" Width="180px" OnTextChanged="search_acc_lev_TextChanged"></asp:TextBox>
        <asp:Button ID="all_acc_lev" runat="server" Text="ALL"  CssClass="btn btn-primary" style="margin-right: 8px; background: gray;" OnClick="all_acc_lev_Click"/>
    </div>
</div>
<!----------------------------------------------------------- finish -------------------------------------------------------- -->

<script type="text/javascript">

    document.addEventListener('contextmenu', function (event) {
     
        event.preventDefault();
    });

    function showContextMenu(event, contextMenuId) {
       
        if (event.target.tagName.toLowerCase() !== 'input') {
            event.preventDefault();
        }

        
        if (event.button === 2) {
            var contextMenu = document.getElementById(contextMenuId);

            contextMenu.style.display = 'block';
            contextMenu.style.position = 'fixed';
            contextMenu.style.left = event.clientX + 'px';
            contextMenu.style.top = event.clientY + 'px';

            var allContextMenus = document.querySelectorAll('.dropdown-menu');
            allContextMenus.forEach(function (menu) {
                if (menu.id !== contextMenuId) {
                    menu.style.display = 'none';
                }
            });

            document.addEventListener('click', function (event) {
                if (!contextMenu.contains(event.target)) {
                    contextMenu.style.display = 'none';
                }
            });

            event.stopPropagation();
        }
    }

    document.addEventListener('contextmenu', function (event) {
        event.preventDefault();
    });


    function menuItemClicked(option, menuId) {
        console.log('Clicked: ' + option);
        var menu = document.getElementById(menuId);
        menu.style.display = 'none';
    }

    function showSubContextMenu(event, subContextMenuId) {
        event.preventDefault();

        var subContextMenu = document.getElementById(subContextMenuId);

        subContextMenu.style.display = 'block';
        subContextMenu.style.position = 'fixed';
        subContextMenu.style.left = event.clientX + 'px';
        subContextMenu.style.top = event.clientY + 'px';

        document.addEventListener('click', function (event) {
            if (!subContextMenu.contains(event.target)) {
                subContextMenu.style.display = 'none';
            }
        });

        event.stopPropagation();
    }





    document.addEventListener('keydown', function (event) {
        if (event.key === 'F2') {
            var textbox = document.getElementById('<%=second_txt.ClientID%>');
            var dropdown = document.getElementById('<%=second2_txt.ClientID%>');

            if (textbox.style.display === 'none') {
                textbox.style.display = 'block';
                dropdown.style.display = 'none';
            } else {
                textbox.style.display = 'none';
                dropdown.style.display = 'block';
            }

            event.preventDefault();
        }

    });



    document.addEventListener('keydown', function (event) {
        if (event.key === 'F1') {
            var textbox = document.getElementById('<%=textbox_input.ClientID%>');
        var dropdown = document.getElementById('<%=first_level.ClientID%>');

        if (textbox.style.display === 'none') {
            textbox.style.display = 'block';
            dropdown.style.display = 'none';
        } else {
            textbox.style.display = 'none';
            dropdown.style.display = 'block';
        }

        event.preventDefault();
    }

 });





</script>
</div>

</asp:Content>
