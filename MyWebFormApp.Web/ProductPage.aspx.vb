Public Class ProductPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'make a list
        Dim products As New List(Of String)
        products.Add("Product 1")
        products.Add("Product 2")
        products.Add("Product 3")
        products.Add("Product 4")
        products.Add("Product 5")

        ddlProducts.DataSource = products
        ddlProducts.DataBind()

    End Sub

    Protected Sub btSubmit_Click(sender As Object, e As EventArgs)
        'get the selected value
        Dim selectedProduct As String = ddlProducts.SelectedValue
        lblSelectedProduct.Text = "You selected: " & selectedProduct
    End Sub
End Class