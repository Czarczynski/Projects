using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Commander.Models;

namespace Commander.DTOs
{
    public class CommandWriteDTO
    {
        [MaxLength(250)]
        [Required]
        public string HowTo { get; set; }
        [Required]
        public string Line { get; set; }
        [Required]
        public string  Platform { get; set; }

        public List<Category> Categories { get; set; }

        public List<string> CatNames { get; set; }
    }
}
