using System;
using System.Collections.Generic;
using Commander.Models;

namespace Commander.Data
{
    public interface ICategory
    {

        IEnumerable<Category> GetAllCategories();
        Category GetCategoryById(int id);
    }
}
