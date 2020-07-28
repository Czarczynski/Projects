using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace Commander.Models
{
    public class Category
    {

        [Key]
        [JsonIgnore]
        public int CatId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [JsonIgnore]
        public virtual ICollection<CommandsCategories> Commands { get; set; }

        
    }
}
