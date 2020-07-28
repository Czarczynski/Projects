
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Commander.Models;
using Newtonsoft.Json;

namespace Commander.DTOs
{
    public class CommandReadDTO
    {
        public int ComId { get; set; }

        public string HowTo { get; set; }

        public string Line { get; set; }

        public List<CategoriesDTO> Categories { get; set; }



    }
}
