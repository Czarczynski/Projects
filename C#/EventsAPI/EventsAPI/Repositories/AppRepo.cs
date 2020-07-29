using System;
using EventsAPI.Interfaces;

namespace EventsAPI.Repositories
{
    public class AppRepo : IApp
    {
        private readonly APIContext _context;

        public AppRepo(APIContext context)
        {
            _context = context;
        }

        public IEvent EventRepo
        {
            get
            {
                return new EventRepo(_context);
            }
        }

        public IUser UserRepo
        {
            get
            {
                return new UserRepo(_context);
            }
        }
        public ICategory CategoryRepo
        {
            get
            {
                return new CategoryRepo(_context);
            }
        }

        public bool SaveChanges()
        {
            return _context.SaveChanges() >= 0;
        }
    }
}
