using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Dtos.Categories
{
    public class CategoryDTO
    {
        public int CategoryId { get; set; }

        public string Category { get; set; }

        public string PhotoPath { get; set; }

        public List<EventDTO> Events { get; set; }
    }
}
