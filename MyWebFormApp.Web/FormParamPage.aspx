<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormParamPage.aspx.vb" Inherits="MyWebFormApp.Web.FormParamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- make a card container here --%>
    <div class="card">
        <div class="card-header">
            <h2>Form Parameter Page</h2>
        </div>
        <div class="card-body">
                <div class="form-group">
                    <label for="txtName">Name</label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>" InsertCommand="usp_AddFoodConsumptionByName" InsertCommandType="StoredProcedure" SelectCommand="GetConsumedFoodsToday" SelectCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                            <asp:FormParameter FormField="food_name" Name="food_name" Type="String" />
                            <asp:FormParameter FormField="quantity" Name="quantity" Type="Decimal" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                        </SelectParameters>

                    </asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="log_id" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover table-responsive ">
                        <Columns>
                            
                            <asp:BoundField DataField="log_id" HeaderText="log_id" ReadOnly="True" SortExpression="log_id" />
                            <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                            <asp:BoundField DataField="food_id" HeaderText="food_id" SortExpression="food_id" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:BoundField DataField="log_date" HeaderText="log_date" SortExpression="log_date" />
                            <asp:BoundField DataField="food_name" HeaderText="food_name" SortExpression="food_name" />
                            <asp:BoundField DataField="total_energy_kcal" HeaderText="total_energy_kcal" ReadOnly="True" SortExpression="total_energy_kcal" />
                            <asp:BoundField DataField="total_protein_g" HeaderText="total_protein_g" ReadOnly="True" SortExpression="total_protein_g" />
                            <asp:BoundField DataField="total_fat_g" HeaderText="total_fat_g" ReadOnly="True" SortExpression="total_fat_g" />
                            <asp:BoundField DataField="total_carbs_g" HeaderText="total_carbs_g" ReadOnly="True" SortExpression="total_carbs_g" />
                            <asp:BoundField DataField="total_fiber_g" HeaderText="total_fiber_g" ReadOnly="True" SortExpression="total_fiber_g" />
                            <asp:BoundField DataField="total_calcium_mg" HeaderText="total_calcium_mg" ReadOnly="True" SortExpression="total_calcium_mg" />
                            <asp:BoundField DataField="total_fe_mg" HeaderText="total_fe_mg" ReadOnly="True" SortExpression="total_fe_mg" />
                            <asp:BoundField DataField="total_natrium_mg" HeaderText="total_natrium_mg" ReadOnly="True" SortExpression="total_natrium_mg" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:Label id="lblResult" runat="server" />
                </div>
        </div>

    </div>

</asp:Content>
