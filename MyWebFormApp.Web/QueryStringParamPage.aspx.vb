Public Class QueryStringParamPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "Select" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim selectedRow As GridViewRow = GridView1.Rows(index)
            Dim id As String = selectedRow.Cells(0).Text
            lblResult.Text = "You selected " & id
        End If

    End Sub
End Class