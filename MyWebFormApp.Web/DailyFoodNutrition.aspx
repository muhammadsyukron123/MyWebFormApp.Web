<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DailyFoodNutrition.aspx.vb" Inherits="MyWebFormApp.Web.DailyFoodNutrition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <div class="card shadow mb-4">
            <div class="card-header">
                <h6 class="m-0 font-weight-bold text-primary">Daily Food Nutrition</h6>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <asp:GridView CssClass="table table-responsive table-bordered table-hover" ID="gvDailyNutrition" runat="server" AutoGenerateColumns="False" OnRowCommand="gvDailyNutrition_RowCommand" OnRowDeleting="gvDailyNutrition_RowDeleting1" DataKeyNames="log_id">
                                <Columns>
                                    <asp:BoundField DataField="log_id" HeaderText="Log ID" ReadOnly="True" SortExpression="log_id" />
                                    <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="true" SortExpression="user_id" />
                                    <asp:BoundField DataField="food_name" HeaderText="Food Name" SortExpression="food_name" />
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity (gram)" SortExpression="quantity" />
                                    <asp:BoundField DataField="log_date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="log_date" />
                                    <asp:BoundField DataField="total_energy_kcal" HeaderText="Total Energy (Kcal)" ReadOnly="True" SortExpression="total_energy_kcal" DataFormatString="{0:0.00}" />
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />

                                    <asp:CommandField ButtonType="Button" ShowCancelButton="False" ShowDeleteButton="True" />

                                </Columns>

                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>" SelectCommand="GetConsumedFoodsToday" SelectCommandType="StoredProcedure" >
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="mb-3 mt-3">
                            <label for="txtFoodLogID" class="form-label">FoodLogID</label>
                            <asp:TextBox ID="tbFoodLogID" runat="server" CssClass="form-control" ReadOnly="true" />
                            <label for="txtFoodName" class="form-label">Food Name</label>
                            <asp:TextBox ID="tbFoodName" runat="server" CssClass="form-control" ReadOnly="true"/>
                            <label for="txtFoodQuantity" class="form-label">Quantity</label>
                            <asp:TextBox ID="tbQuantity" runat="server" CssClass="form-control" />
                        </div>
                        <asp:Button ID="EditButton" Text="Edit" runat="server" cssClass="btn btn-primary" OnClick="EditButton_Click"/>
                        <asp:Button Text="Add" runat="server" cssClass="btn btn-success"/>
                    </div>
                </div>


            </div>

        </div>

    </div>


</asp:Content>
