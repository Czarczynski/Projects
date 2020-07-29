using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Interfaces
{
    public interface IEvent
    {
        public IEnumerable<EventModel> GetAllEvents();
        public EventModel GetEventById(int id);
        public void PostEvent(EventModel eventModel);
        public EventModel DeleteEvent(int id);
    }
}
