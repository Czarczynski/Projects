using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Commander.Models
{
    public class Command
    {

        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(250)]
        public string HowTo { get; set; }

        [Required]
        public string Line { get; set; }

        [Required]
        public string Platform { get; set; }

        [Required]
        [JsonIgnore]
        public List<CommandsCategories> CommandsCategories { get; set; }
    }
}
