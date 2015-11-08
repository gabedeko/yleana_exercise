<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yleana Exercise</title>
    <link rel="stylesheet" type="text/css" href="~/Content/normalize.css" />
    <link rel="stylesheet" type="text/css" href="~/Content/bootstrap.css" />
    
    <style type="text/css">
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 145px;
        }
    </style>
</head>
<body>
   <nav class="navbar navbar-default">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
      
      </button>
      <a class="navbar-brand">Yleana Leadership Academy</a>
    </div>
    </div>
    </nav>
    <form id="form1" runat="server">
     
    
        
    <div style="height: 622px" />
     
        <p>Welcome to my web app excercise. The first utility is a button for viewing a table which contains customers and information about them.</p>
        <p>The second utility is a form for entering a new customer with their information and uploading it to the database</p>            
        
        <br />
      
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Display Customers" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Hide Customers" class="hidden" />
        <br />
        <br />
        <br />
        
        <table id="customer_table" class="table1">
                    <thead>
                        <tr>
                            <td>Customer ID</td>
                            <td>Customer Name</td>
                            <td>Contant Name</td>
                            <td>Address</td>
                            <td>City</td>
                            <td>Postal Code</td>
                            <td>Country</td>
                        </tr>
                    </thead>
                <tbody>
                </tbody>
            </table>
            
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ylena_exerciseConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        Add a new person to database below
        <br />
        <table  class="auto-style3" >
            <tr>
                <td class="auto-style4">Customer ID</td>
                <td>
                    <asp:TextBox ID="txtid" runat="server" Width="133px" data-bind="value: customer_id, valueUpdate: 'afterkeydown'" class="numbersOnly" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Customer Name</td>
                <td>
                    <asp:TextBox ID="txtcustomer" runat="server" Width="133px" data-bind="value: customer_name, valueUpdate: 'afterkeydown'" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Contact Name</td>
                <td>
                    <asp:TextBox ID="txtcontact" runat="server" Width="133px" data-bind="value: contact_name, valueUpdate: 'afterkeydown'" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Address</td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server" Width="133px" data-bind="value: address, valueUpdate: 'afterkeydown'"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">City</td>
                <td>
                    <asp:TextBox ID="txtcity" runat="server" Width="133px" data-bind="value: city, valueUpdate: 'afterkeydown'"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Postal Code</td>
                <td>
                    <asp:TextBox ID="numpostcode" runat="server" Width="133px" data-bind="value: postal_code, valueUpdate: 'afterkeydown'"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-Country">Country</td>
                <td>
                    <asp:TextBox ID="txtcountry" runat="server" Width="133px" data-bind="value: country, valueUpdate: 'afterkeydown'"></asp:TextBox>
                </td>
            </tr>
        </table>
        
      <a class="navbar-brand">
        <asp:Button ID="AddBtn" runat="server" OnClick="AddBtn_Click" style="text-align: center" Text="Submit" data-bind='click: submit' Width="150px" />
        </a>
        <br />
      <a class="navbar-brand">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        
        </a>
        
       
        <style>
            .footer {
                /* Footer CSS */
                  position: absolute;
                  bottom: 13px;
                  width: 100%;
                  height: 91px;
                  background-color: #f5f5f5;
                top: 795px;
                left: 3px;
                margin-top: 0px;
            }
            .text-muted {
                top: 20px;
                height: 22px;
            }
            #customer_table {        /*for hiding on page load*/
                display: none;
            }
            #Button2 {           /*for hiding on page load*/
                display: none;
            }
            .table1 tr td {
                text-align: center;
                border: 1px solid black;
            }
            .auto-style3 tr, td {
                text-align: center;
                border: 0px;
            }
        </style>
        <!--End Footer Css-->
      <a class="navbar-brand">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ylena_exerciseConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        </a>
    </form>
    
        <footer class="footer">
      <div class="container">
          <p class="text-muted">&nbsp;</p>
          <p class="text-muted">Developed by Gabriel Dekoladenu</p>
      </div>
    </footer>
    <script src='<%= ResolveUrl("~/Scripts/knockout-3.3.0.js") %>'></script>
    <script src='<%= ResolveUrl("~/Scripts/knockout.validate.js") %>'></script>
    <script src='<%= ResolveUrl("~/Scripts/knockout.mapping-2.4.1.js") %>'></script>
    <script src='<%= ResolveUrl("~/Scripts/jquery-2.1.4.js") %>'></script>
    <script src='<%= ResolveUrl("~/Scripts/script.js") %>'></script>
    </body>
    
</html>
