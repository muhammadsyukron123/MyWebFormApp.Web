Imports System.Web.ModelBinding
Imports MyWebFormApp.BLL
Imports MyWebFormApp.BLL.DTO

Public Class ConsumedFoodsObjDS
    Inherits System.Web.UI.Page

    Public Function GetFoodNutritionByID() As List(Of ConsumedFoodsDTO)
        Dim consumedFoodsBLL As New ConsumedFoodsBLL()
        Console.WriteLine(consumedFoodsBLL.GetFoodNutritionByID(10))
        Return consumedFoodsBLL.GetFoodNutritionByID(10)

    End Function

    Public Function GetFoodNutritionByIDandName(<Control("txtSearch")> foodName As String) As List(Of ConsumedFoodsDTO)
        Dim consumedFoodsBLL As New ConsumedFoodsBLL()
        Console.WriteLine(consumedFoodsBLL.GetFoodNutritionByIDandName(10, foodName))
        Return consumedFoodsBLL.GetFoodNutritionByIDandName(10, foodName)
    End Function



    Public Function UpdateFoodQuantity(log_id As Integer, quantity As Decimal)
        Try
            Dim consumedFoodsBLL As New ConsumedFoodsBLL()
            consumedFoodsBLL.UpdateFoodQuantity(log_id, quantity)
            GetFoodNutritionByID()
            ltMessage.Text = "<span class='alert alert-success'>Category updated successfully</span>"
        Catch ex As Exception
            ltMessage.Text = "<span class='alert alert-danger'>Error: " & ex.Message & "</span>"
        End Try
    End Function

    Public Function DeleteFoodLogByID(log_id As Integer)
        Try
            Dim consumedFoodsBLL As New ConsumedFoodsBLL()
            consumedFoodsBLL.DeleteFoodLog(log_id)
            GetFoodNutritionByID()
            ltMessage.Text = "<span class='alert alert-success'>Category deleted successfully</span>"
        Catch ex As Exception
            ltMessage.Text = "<span class='alert alert-danger'>Error: " & ex.Message & "</span>"
        End Try
    End Function

    Public Function Update(logId As Integer, quantity As Decimal)

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class