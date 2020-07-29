using System;
namespace EventsAPI.Interfaces
{
    public interface IApp
    {
        IEvent EventRepo { get; }
        IUser UserRepo { get; }
        ICategory CategoryRepo { get; }
        bool SaveChanges();

    }
}
