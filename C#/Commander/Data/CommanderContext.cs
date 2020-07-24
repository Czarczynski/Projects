using System;
using Commander.Models;
using Microsoft.EntityFrameworkCore;

namespace Commander.Data
{
    public class CommanderContext : DbContext
    {
        public CommanderContext(DbContextOptions<CommanderContext> opt) : base(opt)
        {

        }

        public DbSet<Command> Commands{ get; set; }
        public DbSet<Category> Categories{ get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Command>()
                .HasKey(x => x.Id);

            modelBuilder.Entity<Category>()
                .HasKey(x => x.Id);

            modelBuilder.Entity<CommandsCategories>()
                .HasKey(x => new { x.CommandId, x.CategoryId });
            modelBuilder.Entity<CommandsCategories>()
                .HasOne(x => x.Command)
                .WithMany(m => m.CommandsCategories)
                .HasForeignKey(x => x.CommandId);
            modelBuilder.Entity<CommandsCategories>()
                .HasOne(x => x.Category)
                .WithMany(e => e.CommandsCategories)
                .HasForeignKey(x => x.CategoryId);
        }

    }
}
