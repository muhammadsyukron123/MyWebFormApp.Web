using MyWebFormApp.BLL.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyWebFormApp.BLL.Interfaces
{
    public interface IConsumedDateBLL
    {
        IEnumerable<ConsumptionDateDTO> consumptionDates(int userID);
    }
}
