using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Commander.Models
{
    public class Command
    {

        [Key]
        [JsonIgnore]
        public int ComId { get; set; }

        [Required]
        [MaxLength(250)]
        public string HowTo { get; set; }

        [Required]
        public string Line { get; set; }

        [Required]
        [JsonIgnore]
        public string Platform { get; set; }

        [JsonIgnore]
        public virtual ICollection<CommandsCategories> Categories { get; set; }


    }
}
