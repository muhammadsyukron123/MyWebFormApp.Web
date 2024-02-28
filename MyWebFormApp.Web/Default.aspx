<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="MyWebFormApp.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <div class="card">
            <h5 class="card-header">Daily Consumed Foods</h5>
            <div class="card-body">
                <p class="card-text">This is a list of foods that you have consumed today.</p>
                <div class="table-responsive">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>"
                        SelectCommand="GetConsumedFoodsToday" SelectCommandType="StoredProcedure" 
                        InsertCommand="usp_AddFoodConsumptionByName" InsertCommandType="StoredProcedure" DeleteCommand="usp_DeleteFoodLog" DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="log_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                            <asp:Parameter Name="food_name" Type="String" />
                            <asp:Parameter Name="quantity" Type="Decimal" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="user_id" Type="Int32" />
                        </SelectParameters>

                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NutriaryDatabaseConnectionString3 %>" SelectCommand="usp_GetFoodNames" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                    <div class="form-group">
                        <label>Insert Food Consumption</label>
                        <asp:DropDownList runat="server" ID="ddlSearchFood" placeholder="Pilih makanan" DataSourceID="SqlDataSource2" DataTextField="food_name" DataValueField="food_name" Width="248px" AutoPostBack="true"></asp:DropDownList>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="tbQuantity" runat="server" placeholder="Masukkan kuantitas (dalam gram)" Width="309px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnAddFood" runat="server" Text="Add Food" OnClick="btnAddFood_Click" />
                    </div>



                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        CssClass="table table-bordered table-hover table-responsive"
                        AutoGenerateColumns="False"
                        DataKeyNames="log_id"
                        DataSourceID="SqlDataSource1"
                        AllowPaging="True"
                        PageSize="3"
                        AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="log_id" HeaderText="log_id" ReadOnly="True" SortExpression="log_id" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" DataFormatString="{0:0.00}"/>
                            <asp:BoundField DataField="log_date" HeaderText="log_date" SortExpression="log_date" />
                            <asp:BoundField DataField="food_name" HeaderText="food_name" SortExpression="food_name" />
                            <asp:BoundField DataField="total_energy_kcal" HeaderText="total_energy_kcal" ReadOnly="True" SortExpression="total_energy_kcal" DataFormatString="{0:0.00}"/>
                            <asp:BoundField DataField="total_protein_g" HeaderText="total_protein_g" ReadOnly="True" SortExpression="total_protein_g" DataFormatString="{0:0.00}"/>
                            <asp:BoundField DataField="total_fat_g" HeaderText="total_fat_g" ReadOnly="True" SortExpression="total_fat_g" DataFormatString="{0:0.00}" />
                            <asp:BoundField DataField="total_carbs_g" HeaderText="total_carbs_g" ReadOnly="True" SortExpression="total_carbs_g" DataFormatString="{0:0.00}" />
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="https://img.icons8.com/ios-glyphs/30/FF00000/filled-trash.png"/>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </main>

</asp:Content>
