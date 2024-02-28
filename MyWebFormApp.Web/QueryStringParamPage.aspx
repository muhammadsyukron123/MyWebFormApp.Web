<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="QueryStringParamPage.aspx.vb" Inherits="MyWebFormApp.Web.QueryStringParamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card">
        <div class="card-header">
            <h2>Query String Parameter Page</h2>
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" CacheDuration="3600" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>"
                    SelectCommand="GetConsumedFoodsToday" SelectCommandType="StoredProcedure" UpdateCommand="usp_UpdateFoodQuantity" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                    </SelectParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="log_id" Type="Int32" />
                        <asp:Parameter Name="new_quantity" Type="Decimal" />
                    </UpdateParameters>

                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>" SelectCommand="usp_GetFoodDetailsByLogId" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="log_id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="log_id" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover table-responsive " OnRowCommand="GridView1_RowCommand">
                    <Columns>

                        <asp:BoundField DataField="log_id" HeaderText="log_id" ReadOnly="True" SortExpression="log_id" />
                        <asp:BoundField DataField="food_id" HeaderText="food_id" SortExpression="food_id" ReadOnly="True" />
                        <asp:HyperLinkField DataNavigateUrlFields="log_id"  DataNavigateUrlFormatString="GetQueryStringParamPage.aspx?id={0}"
                            DataTextField="food_name"
                            HeaderText="FoodName" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="log_date" HeaderText="log_date" SortExpression="log_date" ReadOnly="True" DataFormatString="{0:d}" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>


                <br />

                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="log_id" CssClass="table table-bordered table-hover table-responsive " DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="log_id" HeaderText="log_id" ReadOnly="True" SortExpression="log_id" InsertVisible="False" />
                        <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                        <asp:BoundField DataField="food_id" HeaderText="food_id" SortExpression="food_id" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="log_date" HeaderText="log_date" SortExpression="log_date" />
                        <asp:BoundField DataField="food_name" HeaderText="food_name" SortExpression="food_name" />
                        <asp:BoundField DataField="total_energy_kcal" HeaderText="total_energy_kcal" SortExpression="total_energy_kcal" />
                        <asp:BoundField DataField="total_protein_g" HeaderText="total_protein_g" SortExpression="total_protein_g" />
                        <asp:BoundField DataField="total_fat_g" HeaderText="total_fat_g" SortExpression="total_fat_g" />
                        <asp:BoundField DataField="total_carbs_g" HeaderText="total_carbs_g" SortExpression="total_carbs_g" />
                        <asp:BoundField DataField="total_fiber_g" HeaderText="total_fiber_g" SortExpression="total_fiber_g" />
                        <asp:BoundField DataField="total_calcium_mg" HeaderText="total_calcium_mg" SortExpression="total_calcium_mg" />
                        <asp:BoundField DataField="total_iron_mg" HeaderText="total_iron_mg" SortExpression="total_iron_mg" />
                        <asp:BoundField DataField="total_natrium_mg" HeaderText="total_natrium_mg" SortExpression="total_natrium_mg" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblResult" runat="server" />
            </div>
        </div>

    </div>

</asp:Content>
