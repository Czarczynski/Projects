using System;
using System.ComponentModel.DataAnnotations;

namespace Commander.DTOs
{
    public class CommandUpdateDTO
    {
        [MaxLength(250)]
        public string HowTo { get; set; }

        public string Line { get; set; }

        public string Platform { get; set; }
    }
}
