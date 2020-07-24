using System;
using System.Collections.Generic;
using Commander.Models;

namespace Commander.Data
{
    public interface ICommand
    {
        IEnumerable<Command> GetAllCommands();
        Command GetCommandById(int id);
        void PostCommand(Command command);
        void PutCommand(Command command);
        void DeleteCommand(Command command);
    }
}
