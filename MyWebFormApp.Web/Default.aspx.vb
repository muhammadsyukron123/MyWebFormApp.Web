Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        'format the float on the gridview only showing 2 zeros

    End Sub

    Protected Sub btnAddFood_Click(sender As Object, e As EventArgs)
        'Insert data from the textbox
        Dim food As String = ddlSearchFood.SelectedItem.Text
        Dim quantity As Decimal = tbQuantity.Text

        'insert to insertparameter
        SqlDataSource1.InsertParameters("food_name").DefaultValue = food
        SqlDataSource1.InsertParameters("quantity").DefaultValue = quantity
        SqlDataSource1.Insert()
        GridView1.DataBind()
        'Add the food to the list

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
End Class