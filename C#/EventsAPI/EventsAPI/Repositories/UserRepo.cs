using System;
using System.Collections.Generic;
using System.Linq;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace EventsAPI.Repositories
{
    public class UserRepo : IUser
    {
        private readonly APIContext _context;

        public UserRepo(APIContext context)
        {
            _context = context;

        }
        public UserModel DeleteUser(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<UserModel> GetAllUsers()
        {
            return _context.Users
                .Include(u => u.Events)
                .ThenInclude(u => u.Event)
                .ThenInclude(e=>e.Category)
                .Include(u => u.City)
                .ThenInclude(c => c.Voivodeship)
                .ToList();
        }

        public UserModel GetUserById(int id)
        {
            return GetAllUsers().FirstOrDefault(u => u.UserId == id);
        }

        public void PostUser(UserModel userModel)
        {
            _context.Users.Add(userModel);
        }
    }
}
