<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NutritionListWithListView.aspx.vb" Inherits="MyWebFormApp.Web.NutritionListWithListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">About</h1>
        </div>

        <div class="col-lg-12">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Nutrition List</h6>
                </div>
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <asp:ListView ID="lvConsumptionDate" runat="server" ItemType="MyWebFormApp.BLL.DTO.ConsumptionDateDTO" SelectMethod="GetConsumptionDate" DataKeyNames="log_date" OnItemCommand="lvConsumptionDate_ItemCommand">
                                <ItemTemplate>
                                    <%--want to display consumption_date as a card list inside the listview--%>
                                    <div class="col-2 mb-3">
                                        <asp:LinkButton ID="btConsumpDate" Text='<%# Eval("log_date", "{0:d}") %>' CommandArgument='<%# Eval("log_date", "{0:d}") %>' runat="server" CssClass="btn btn-outline-primary " CommandName="Select" />
                                        <br />
                                    </div>
                                </ItemTemplate>
                                <SelectedItemTemplate>
                                    <div class="col-2 mb-3">
                                        <asp:LinkButton ID="btConsumpDate" Text='<%# Eval("log_date", "{0:d}") %>' runat="server" CssClass="btn btn-primary btn_sm " CommandName="Select" />
                                        <br />
                                    </div>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:Label ID="lblConsumptionDate" runat="server" />
                        </div>
                    </div>

                    <table class="table table-hover">
                        <asp:ListView ID="lvConsumedFood" ItemType="MyWebFormApp.BLL.DTO.ConsumedFoodsOnDateDTO"
                            SelectMethod="GetConsumedFoodsOnDate" runat="server">
                            <LayoutTemplate>
                                <thead>
                                    <tr>
                                        <th>Log ID</th>
                                        <th>Food Name</th>
                                        <th>Quantity</th>
                                        <th>Log Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </tbody>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("log_id") %></td>
                                    <td><%# Eval("food_name") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td><%# Eval("log_date", "{0:d}") %></td>

                                </tr>
                            </ItemTemplate>
                            <EmptyItemTemplate>
                                <tr>
                                    <td colspan="7">No records found</td>
                                </tr>
                            </EmptyItemTemplate>
                        </asp:ListView>

                    </table>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
