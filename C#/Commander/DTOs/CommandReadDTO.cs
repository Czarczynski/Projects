
using System.Collections.Generic;
using Commander.Models;

namespace Commander.DTOs
{
    public class CommandReadDTO
    {
        public int Id { get; set; }

        public string HowTo { get; set; }

        public string Line { get; set; }

        public List<CommandsCategories> CommandsCategories { get; set; }

    }
}
