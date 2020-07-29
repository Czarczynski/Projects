using System;
using System.Collections.Generic;
using EventsAPI.Models;

namespace EventsAPI.Interfaces
{
    public interface IUser
    {
        public IEnumerable<UserModel> GetAllUsers();
        public UserModel GetUserById(int id);
        public void PostUser(UserModel userModel);
        public UserModel DeleteUser(int id);

    }
}
