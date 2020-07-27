using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;


namespace Commander.Models
{
    public class CommandsCategories
    {
        [Key]
        [Column(Order = 1)]
        public int CommandId { get; set; }
        [Key]
        [Column(Order = 2)]
        public int CategoryId { get; set; }

        public virtual Command Command { get; set; }
        public virtual Category Category { get; set; }
    }
}
