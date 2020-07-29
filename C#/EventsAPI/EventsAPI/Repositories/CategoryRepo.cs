using System;
using System.Collections.Generic;
using System.Linq;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace EventsAPI.Repositories
{
    public class CategoryRepo : ICategory
    {
        private readonly APIContext _context;

        public CategoryRepo(APIContext context)
        {
            _context = context;
        }

        public IEnumerable<CategoryModel> GetAllCategories()
        {
            return _context.Categories
                .Include(c => c.Events)
                .ThenInclude(e => e.Host)
                .ThenInclude(h => h.City)
                .ThenInclude(c => c.Voivodeship)
                .ToList();
        }

        public CategoryModel GetCategoryById(int id)
        {
            return GetAllCategories().FirstOrDefault(c => c.CategoryId == id);
        }
    }
}
