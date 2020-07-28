using System;
using System.Collections.Generic;
using Commander.Models;
using Newtonsoft.Json;

namespace Commander.DTOs
{
    public class CategoryReadDTO
    {
        public int CatId { get; set; }

        public string Name { get; set; }

        public List<CommandsDTO> Commands { get; set; }
    }
}
