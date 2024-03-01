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

        public IEnumerable<ConsumedFoodsOnDateDTO> consumedFoodsOnDates(int userID, DateTime date)
        {
            try
            {
                List<ConsumedFoodsOnDateDTO> consumedFoodsOnDateDTOs = new List<ConsumedFoodsOnDateDTO>();
                var consumedFoodsOnDate = _consumedFoods.consumedFoodsOnDates(userID, date);
                foreach (var item in consumedFoodsOnDate)
                {
                    consumedFoodsOnDateDTOs.Add(new ConsumedFoodsOnDateDTO
                    {
                        log_id = item.log_id,
                        user_id = item.user_id,
                        food_id = item.food_id,
                        food_name = item.food_name,
                        quantity = item.quantity,
                        log_date = item.log_date
                    });
                }
                return consumedFoodsOnDateDTOs;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public IEnumerable<ConsumptionDateDTO> consumptionDates(int userID)
        //{
        //    try
        //    {
        //        List<ConsumptionDateDTO> consumptionDateDTOs = new List<ConsumptionDateDTO>();
        //        var consumptionDate = _consumedFoods.consumptionDates(userID);
        //        foreach (var item in consumptionDate)
        //        {
        //            consumptionDateDTOs.Add(new ConsumptionDateDTO
        //            {
        //                log_date = item.log_date
        //            });
        //        }
        //        return consumptionDateDTOs;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

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

        public IEnumerable<GetAllFoodDTO> GetAllFood()
        {
            List<GetAllFoodDTO> getAllFoodDTOs = new List<GetAllFoodDTO>();
            var getAllFood = _consumedFoods.GetAllFood();
            foreach (var item in getAllFood)
            {
                getAllFoodDTOs.Add(new GetAllFoodDTO
                {
                    food_id = item.food_id,
                    food_name = item.food_name,
                    energy_kal = item.energy_kal,
                    protein_g = item.protein_g,
                    fat_g = item.fat_g,
                    carbs_g = item.carbs_g,
                    fiber_g = item.fiber_g,
                    calcium_mg = item.calcium_mg,
                    fe_mg = item.fe_mg,
                    natrium_mg = item.natrium_mg
                });
            }
            return getAllFoodDTOs;
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

