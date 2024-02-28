<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConsumedFoodsObjDS.aspx.vb" Inherits="MyWebFormApp.Web.ConsumedFoodsObjDS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <!-- Basic Card Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">About Page</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-3">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Food Name" />
                    </div>
                    <div class="col">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" />
                    </div>
                </div>

                <br />
                <asp:GridView ID="gvConsumedFoods" runat="server" AutoGenerateColumns="False" ItemType="MyWebFormApp.BLL.DTO.ConsumedFoodsDTO" SelectMethod="GetFoodNutritionByIDandName" UpdateMethod="UpdateFoodQuantity" DeleteMethod="DeleteFoodLogByID" CssClass="table table-responsive table-bordered" DataKeyNames="log_id,quantity">
                    <Columns>
                        <asp:BoundField DataField="log_id" HeaderText="log_id" SortExpression="log_id" ReadOnly="true" />
                        <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" ReadOnly="true" />
                        <asp:BoundField DataField="food_id" HeaderText="food_id" SortExpression="food_id" ReadOnly="true" />
                        <asp:TemplateField HeaderText="quantity" SortExpression="quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="log_date" HeaderText="log_date" SortExpression="log_date" ReadOnly="true" />
                        <asp:BoundField DataField="food_name" HeaderText="food_name" SortExpression="food_name" ReadOnly="true" />
                        <asp:BoundField DataField="total_energy_kcal" HeaderText="total_energy_kcal" SortExpression="total_energy_kcal" ReadOnly="true" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-warning btn-sm" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-danger btn-sm" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-outline-warning btn-sm" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-outline-danger btn-sm" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Apakah anda yakin untuk delete data ?')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Literal ID="ltMessage" runat="server" />
                <br />
            </div>
        </div>

    </div>

</asp:Content>
