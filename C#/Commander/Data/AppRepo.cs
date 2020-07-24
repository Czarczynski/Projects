using System;
namespace Commander.Data
{
    public class AppRepo : IApp
    {
        private readonly CommanderContext _context;
        private ICommand _commandRepo;
        private ICategory _categoryRepo;

        public AppRepo(CommanderContext context)
        {
            _context = context;
        }

        public ICommand Command
        {
            get
            {
                return _commandRepo ?? new CommandRepo(_context);
            }
        }

        public ICategory Category
        {
            get
            {
                return _categoryRepo ?? new CategoryRepo(_context);
            }
        }

        public bool SaveChanges()
        {
            return _context.SaveChanges() >=0;
        }
    }
}
