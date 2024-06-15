<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Hospital_accounts.WebForm1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="600px" ProcessingMode="Local">
    <LocalReport ReportPath="C:\Users\dell\source\repos\Hospital accounts\Hospital accounts\SalesReport.rdlc\Report Project3\Report Project3\Report1.rdl" />
</rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>

