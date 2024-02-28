Imports MyWebFormApp.BLL
Imports MyWebFormApp.BO
Imports MyWebFormApp.DAL

Public Class DailyFoodNutrition
    Inherits System.Web.UI.Page
    Dim consumedFoodsBLL As New ConsumedFoodsBLL()

    Sub LoadData()
        gvDailyNutrition.DataSource = consumedFoodsBLL.GetFoodNutritionByID(10)
        gvDailyNutrition.DataBind()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoadData()

    End Sub

    Protected Sub gvDailyNutrition_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        'get data key from the selected row in gridview
        If e.CommandName = "Select" Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim selectedRow As GridViewRow = gvDailyNutrition.Rows(index)
            Dim id As Integer = Convert.ToInt32(gvDailyNutrition.DataKeys(index).Value)
            Dim foodLogID As String = selectedRow.Cells(0).Text
            Dim foodName As String = selectedRow.Cells(2).Text
            Dim quantity As String = selectedRow.Cells(3).Text
            tbFoodLogID.Text = foodLogID
            tbFoodName.Text = foodName
            tbQuantity.Text = quantity
        End If

    End Sub

    Protected Sub Unnamed_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub EditButton_Click(sender As Object, e As EventArgs)
        Try
            'If String.IsNullOrEmpty(tbFoodLogID.Text) OrElse String.IsNullOrEmpty(tbQuantity.Text) Then

            'End If)
            consumedFoodsBLL.UpdateFoodQuantity(Convert.ToInt32(tbFoodLogID.Text), Convert.ToInt32(tbQuantity.Text))
            tbFoodLogID.Text = ""
            tbFoodName.Text = ""
            tbQuantity.Text = ""
            LoadData()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub gvDailyNutrition_RowDeleting1(sender As Object, e As GridViewDeleteEventArgs)
        'delete the selected row from the gridview by using the log_id column
        If e.RowIndex < gvDailyNutrition.DataKeys.Count Then
            Dim id As Integer = Convert.ToInt32(gvDailyNutrition.DataKeys(e.RowIndex).Value)
            consumedFoodsBLL.DeleteFoodLog(id)
            LoadData()
        Else
            'error message

        End If

    End Sub
End Class