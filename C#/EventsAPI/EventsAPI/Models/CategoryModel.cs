using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace EventsAPI.Models
{
    public class CategoryModel
    {
        [Key]
        public int CategoryId { get; set; }

        [Required]
        public string Category { get; set; }

        [DefaultValue("")]
        public string PhotoPath { get; set; }

        public List<EventModel> Events { get; set; }

    }
}