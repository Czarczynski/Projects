using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace EventsAPI.Models
{
    public class TagModel
    {

        [Key]
        public int TagId { get; set; }

        [Required]
        public string Tag { get; set; }

        public virtual ICollection<EventsTagsModel> Events { get; set; }
    }
}