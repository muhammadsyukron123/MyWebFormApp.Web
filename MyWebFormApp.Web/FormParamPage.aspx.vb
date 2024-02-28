Public Class FormParamPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Form("action") IsNot Nothing Then
            SqlDataSource1.Insert()
            lblResult.Text = "Record inserted successfully"
        End If



    End Sub

End Class