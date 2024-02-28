using MyWebFormApp.BO;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyWebformApp.Interface
{
    public interface IConsumedFoods : ICrud<ConsumedFoods>
    {
        IEnumerable<ConsumedFoods> GetFoodNutritionByID(int userID);

        IEnumerable<ConsumedFoods> GetFoodNutritionByIDandName(int userID, string foodName);

        void UpdateFoodQuantity(int log_id, decimal quantity);

        void DeleteFoodLog(int log_id);

    }
}
