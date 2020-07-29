using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Dtos.Events
{
    public class UserDTO
    {
        public int UserId { get; set; }

        public string Email { get; set; }

        public string PhotoPath { get; set; }

    }
}
