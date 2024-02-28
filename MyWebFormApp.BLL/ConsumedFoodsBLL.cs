using MyWebformApp.Interface;
using MyWebFormApp.BLL.DTO;
using MyWebFormApp.BLL.Interfaces;
using MyWebFormApp.BO;
using MyWebFormApp.DAL;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyWebFormApp.BLL
{
    public class ConsumedFoodsBLL : IConsumedFoodsBLL
    {
        private readonly IConsumedFoods _consumedFoods;

        public ConsumedFoodsBLL()
        {
            _consumedFoods = new ConsumedFoodsDAL();
        }

        public void DeleteFoodLog(int log_id)
        {
            try
            {
                _consumedFoods.DeleteFoodLog(log_id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<ConsumedFoodsDTO> GetFoodNutritionByID(int userID)
        {
            List<ConsumedFoodsDTO> consumedFoodsDTOs = new List<ConsumedFoodsDTO>();
            var consumedFoods = _consumedFoods.GetFoodNutritionByID(userID);
            foreach (var item in consumedFoods)
            {
                consumedFoodsDTOs.Add(new ConsumedFoodsDTO
                {
                    log_id = item.log_id,
                    user_id = item.user_id,
                    food_id = item.food_id,
                    quantity = item.quantity,
                    log_date = item.log_date,
                    food_name = item.food_name,
                    total_energy_kcal = item.total_energy_kcal
                });
            }
            return consumedFoodsDTOs;
        }

        public IEnumerable<ConsumedFoodsDTO> GetFoodNutritionByIDandName(int userID, string foodName)
        {
            List<ConsumedFoodsDTO> consumedFoodsDTOs = new List<ConsumedFoodsDTO>();
            var consumedFoods = _consumedFoods.GetFoodNutritionByIDandName(userID,foodName);
            foreach (var item in consumedFoods)
            {
                consumedFoodsDTOs.Add(new ConsumedFoodsDTO
                {
                    log_id = item.log_id,
                    user_id = item.user_id,
                    food_id = item.food_id,
                    quantity = item.quantity,
                    log_date = item.log_date,
                    food_name = item.food_name,
                    total_energy_kcal = item.total_energy_kcal
                });
            }
            return consumedFoodsDTOs;
        }

        public void UpdateFoodQuantity(int log_id, decimal quantity)
        {
            try
            {
                _consumedFoods.UpdateFoodQuantity(log_id, quantity);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

