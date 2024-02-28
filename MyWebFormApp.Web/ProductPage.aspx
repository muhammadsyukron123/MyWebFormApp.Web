<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProductPage.aspx.vb" Inherits="MyWebFormApp.Web.ProductPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- add basic card --%>
    <div class="card">
        <div class="card-header">
            <h2>Product Details</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlProducts" runat="server"></asp:DropDownList>
                </div>
                <%-- make a label to display selected  product after pressing submit button--%>
                <div class="col-md-4">
                    <asp:Label ID="lblSelectedProduct" runat="server" Text="Selected Product"></asp:Label>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btSubmit" Text="Submit" runat="server" OnClick="btSubmit_Click"/>
                </div>
            </div>
        </div>
</asp:Content>
