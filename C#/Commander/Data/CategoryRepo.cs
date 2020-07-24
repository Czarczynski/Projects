using System;
using System.Collections.Generic;
using System.Linq;
using Commander.Models;
using Microsoft.EntityFrameworkCore;

namespace Commander.Data
{
    public class CategoryRepo : ICategory
    {
        private readonly CommanderContext _context;

        public CategoryRepo(CommanderContext context)
        {
            _context = context;
        }

        public IEnumerable<Category> GetAllCategories()
        {
            return _context.Categories.Include(e=>e.CommandsCategories).ToList();
        }

        public Category GetCategoryById(int id)
        {
            return _context.Categories.FirstOrDefault(i => i.Id == id);
        }
    }
}
