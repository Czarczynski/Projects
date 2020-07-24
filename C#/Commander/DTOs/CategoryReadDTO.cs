using System;
using System.Collections.Generic;
using Commander.Models;

namespace Commander.DTOs
{
    public class CategoryReadDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public List<CommandsCategories> CommandsCategories { get; set; }
    }
}
