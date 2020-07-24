using System;
namespace Commander.Data
{
    public interface IApp
    {
        ICommand Command { get; }
        ICategory Category { get; }
        bool SaveChanges();
    }
}
