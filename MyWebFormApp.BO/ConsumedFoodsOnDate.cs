﻿using System;
using System.Collections.Generic;
using System.Text;

namespace MyWebFormApp.BO
{
    public class ConsumedFoodsOnDate
    {
        public int log_id { get; set; }
        public int user_id { get; set; }
        public string food_id { get; set; }
        public string food_name { get; set; }
        public decimal quantity { get; set; }
        public DateTime log_date { get; set; }
    }
}
