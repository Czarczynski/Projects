using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace EventsAPI.Models
{
    public class EventModel
    {
        [Key]
        public int EventId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [MaxLength(700)]
        public string Description { get; set; }

        [Required]
        public DateTime StartDate { get; set; }

        [Required]
        public CityModel City { get; set; }

        [Required]
        public string Address { get; set; }

        [Required]
        public UserModel Host { get; set; }

        [Required]
        public CategoryModel Category { get; set; }

        [DefaultValue("")]
        public string PhotoPath { get; set; }

        public List<EventsTagsModel> Tags { get; set; }

        public List<EventsUsersModel> Users { get; set; }


    }
}
