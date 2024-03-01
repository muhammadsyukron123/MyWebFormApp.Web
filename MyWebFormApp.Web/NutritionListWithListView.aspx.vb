Imports System.Web.ModelBinding
Imports MyWebFormApp.BLL
Imports MyWebFormApp.BLL.DTO

Public Class NutritionListWithListView
    Inherits System.Web.UI.Page

    Dim consumedFoodsBLL As New ConsumedFoodsBLL()
    Dim consumptionDateBLL As New ConsumptionDateBLL()

    Public Function GetConsumptionDate() As List(Of ConsumptionDateDTO)
        Return consumptionDateBLL.consumptionDates(10)
    End Function

    Public Function GetConsumedFoodsOnDate(<Control("lvConsumptionDate")> logDate As Nullable(Of DateTime)) As List(Of ConsumedFoodsOnDateDTO)
        If logDate.HasValue Then
            Return consumedFoodsBLL.consumedFoodsOnDates(10, logDate.Value)
        Else
            lblConsumptionDate.Text = "No date selected"

        End If
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Protected Sub lvConsumptionDate_ItemCommand(sender As Object, e As ListViewCommandEventArgs)
        If e.CommandName = "Select" Then
            'Dim lnkSelect = CType(e.Item.FindControl("lnkSelect"), LinkButton)
            Dim consumptionDate = e.CommandArgument.ToString()
            lblConsumptionDate.Text = ""
        End If
    End Sub

    Protected Sub lvFoodDetail_ItemCommand(sender As Object, e As ListViewCommandEventArgs)

    End Sub
End Class