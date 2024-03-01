using MyWebformApp.Interface;
using MyWebFormApp.BLL.DTO;
using MyWebFormApp.BLL.Interfaces;
using MyWebFormApp.DAL;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyWebFormApp.BLL
{
    public class ConsumptionDateBLL : IConsumedDateBLL
    {
        private readonly IConsumedFoods _consumedFoods;

        public ConsumptionDateBLL()
        {
            _consumedFoods = new ConsumedFoodsDAL();
        }

        public IEnumerable<ConsumptionDateDTO> consumptionDates(int userID)
        {
            try
            {
                List<ConsumptionDateDTO> consumptionDateDTOs = new List<ConsumptionDateDTO>();
                var consumptionDate = _consumedFoods.consumptionDates(userID);
                foreach (var item in consumptionDate)
                {
                    consumptionDateDTOs.Add(new ConsumptionDateDTO
                    {
                        log_date = item.log_date
                    });
                }
                return consumptionDateDTOs;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
