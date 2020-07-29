using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Dtos.Users
{
    public class UserDTO
    {
        public int UserId { get; set; }

        public string Email { get; set; }

        public string Name { get; set; }

        public string Surname { get; set; }

        public string PhotoPath { get; set; }

        public CityModel City { get; set; }

        public DateTime Birthday { get; set; }

        public List<EventsListDTO> Events{ get; set; }
    }
}
