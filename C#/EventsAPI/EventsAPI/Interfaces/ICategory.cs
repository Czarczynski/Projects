using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Interfaces
{
    public interface ICategory
    {
        public IEnumerable<CategoryModel> GetAllCategories();
        public CategoryModel GetCategoryById(int id);
    }
}
