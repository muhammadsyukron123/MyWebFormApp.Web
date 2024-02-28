using System;
using System.Collections.Generic;
using System.Text;
using MyWebFormApp.BO;

namespace MyWebformApp.Interface
{
    public interface ICrud<T>
    {
        void Create(T obj);
        void Update(T obj);
        void Delete(int id);
        T GetById(int id);
        IEnumerable<T> GetAll();
    }
}
