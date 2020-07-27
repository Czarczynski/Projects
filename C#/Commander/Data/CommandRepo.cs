using System;
using System.Collections.Generic;
using System.Linq;
using Commander.Models;
using Microsoft.EntityFrameworkCore;

namespace Commander.Data
{
    public class CommandRepo : ICommand
    {
        private readonly CommanderContext _context;

        public CommandRepo(CommanderContext context)
        {
            _context = context;
        }

        public void DeleteCommand(Command command)
        {
            if (command == null) {
                throw new ArgumentNullException();
            }
            _context.Commands.Remove(command);
        }

        public IEnumerable<Command> GetAllCommands()
        {
            return _context.Commands.Include( i => i.CommandsCategories).ToList();
        }

        public Command GetCommandById(int id)
        {
            return _context.Commands
                .FirstOrDefault(p => p.Id == id);
        }

        public void PostCommand(Command command)
        {
            if(command == null)
            {
                throw new ArgumentNullException(nameof(command));
            }

            _context.Commands.Add(command);
        }

        public void PutCommand(Command command)
        {
            //nothing
        }

    }
}
