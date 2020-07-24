using System;
using System.ComponentModel.DataAnnotations;

namespace Commander.Models
{
    public class CommandsCategories
    {
        [Required]
        public int CommandId { get; set; }

        [Required]
        public Command Command { get; set; }

        [Required]
        public int CategoryId{ get; set; }

        [Required]
        public Category Category { get; set; }
    }
}
