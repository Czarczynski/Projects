using System;
using EventsAPI.Models;

namespace EventsAPI.Dtos.Categories
{
    public class EventDTO
    {
        public int EventId { get; set; }

        public string Name { get; set; }

        public DateTime StartDate { get; set; }

        public CityModel City { get; set; }

        public UserDTO Host { get; set; }

        public string Address { get; set; }

        public string PhotoPath { get; set; }
    }
}
