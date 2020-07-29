using System;
using System.Collections.Generic;
using System.Linq;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace EventsAPI.Repositories
{
    public class EventRepo : IEvent
    {
        private readonly APIContext _context;

        public EventRepo(APIContext context)
        {
            _context = context;
        }
        public EventModel DeleteEvent(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<EventModel> GetAllEvents()
        {
            return _context.Events
                .Include(e => e.Category)
                .Include(e => e.Tags)
                .ThenInclude(t => t.Tag)
                .Include(e => e.Users)
                .ThenInclude(u => u.User)
                .ToList();
        }

        public EventModel GetEventById(int id)
        {
            return GetAllEvents().FirstOrDefault(e => e.EventId == id);
        }

        public void PostEvent(EventModel eventModel)
        {
            throw new NotImplementedException();
        }
    }
}
