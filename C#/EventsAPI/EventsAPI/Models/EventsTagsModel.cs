using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace EventsAPI.Models
{
    public class EventsTagsModel
    {
        [Key]
        [Column(Order = 1)]
        public int EventId { get; set; }
        [Key]
        [Column(Order = 2)]
        public int TagId { get; set; }

        public virtual EventModel Event{ get; set; }

        public virtual TagModel Tag { get; set; }


    }
}