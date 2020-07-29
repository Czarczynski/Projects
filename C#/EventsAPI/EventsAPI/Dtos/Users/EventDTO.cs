using System;
using EventsAPI.Models;

namespace EventsAPI.Dtos.Users
{
    public class EventDTO
    {
        public int EventId { get; set; }

        public string Name { get; set; }

        public DateTime StartDate { get; set; }

        public CityModel City { get; set; }

        public string Address { get; set; }

        public CategoryDTO Category { get; set; }

        public string PhotoPath { get; set; }

    }
}
