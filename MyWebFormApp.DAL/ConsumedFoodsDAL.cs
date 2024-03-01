using Dapper;
using MyWebformApp.Interface;
using MyWebFormApp.BO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace MyWebFormApp.DAL
{
    public class ConsumedFoodsDAL : IConsumedFoods
    {

        private string GetConnectionString()
        {
            //return @"Data Source=BSINB23L011\BSISQLEXPRESS;Initial Catalog=NutriaryDatabase;Integrated Security=True;TrustServerCertificate=True";
            return ConfigurationManager.ConnectionStrings["NutriaryDatabaseConnectionString"].ConnectionString;
        }
        public void Create(ConsumedFoods obj)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public ConsumedFoods GetById(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<ConsumedFoods> GetFoodNutritionByID(int userID)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"GetConsumedFoodsToday";
                var param = new { user_id = userID};
                var results = conn.Query<ConsumedFoods>(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public void Update(ConsumedFoods obj)
        {
            throw new NotImplementedException();
        }

        IEnumerable<ConsumedFoods> ICrud<ConsumedFoods>.GetAll()
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"GetAllConsumedFoods";
                var results = conn.Query<ConsumedFoods>(sqlSP, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public void UpdateFoodQuantity(int log_id, decimal quantity)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"usp_UpdateFoodQuantity";
                var param = new { log_id = log_id, new_quantity = quantity };
                conn.Execute(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public void DeleteFoodLog(int log_id)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"usp_DeleteFoodLogByID";
                var param = new { log_id = log_id };
                conn.Execute(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);

            }
        }

        public IEnumerable<ConsumedFoods> GetFoodNutritionByIDandName(int userID, string foodName)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"GetConsumedFoodsToday";
                var param = new { user_id = userID, food_name = foodName };
                var results = conn.Query<ConsumedFoods>(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public IEnumerable<GetAllFood> GetAllFood()
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"usp_GetAllFood";
                var results = conn.Query<GetAllFood>(sqlSP, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public IEnumerable<ConsumptionDate> consumptionDates(int userID)
        {
            using(SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"GetConsumptionDatesForUser";
                var param = new { user_id = userID };
                var results = conn.Query<ConsumptionDate>(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public IEnumerable<ConsumedFoodsOnDate> consumedFoodsOnDates(int userID, DateTime date)
        {
            using(SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"GetConsumedFoodsOnDate";
                var param = new { user_id = userID, log_date = date };
                var results = conn.Query<ConsumedFoodsOnDate>(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
                return results;
            }
        }

        public void AddFoodConsumption(int userID, string foodName, decimal quantity)
        {
            using(SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                var sqlSP = @"usp_AddFoodConsumptionByName";
                var param = new { user_id = userID, food_name = foodName, quantity = quantity };
                conn.Execute(sqlSP, param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
