using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Commander.Models
{
    public class Category
    {

        [Required]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [JsonIgnore]
        public virtual ICollection<CommandsCategories> CommandsCategories { get; set; }


    }
}
