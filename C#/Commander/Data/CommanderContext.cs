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

        public DbSet<Command> Commands { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CommandsCategories> CommandsCategories { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<CommandsCategories>()
                .HasKey(e => new { e.CommandId, e.CategoryId });


            //protected override void OnModelCreating(ModelBuilder modelBuilder)
            //{
            //modelBuilder.Entity<Command>()
            //    .HasKey(x => x.ComId);

            //modelBuilder.Entity<Category>()
            //    .HasKey(x => x.CatId);
            //modelBuilder.Entity<CommandsCategories>()
            //    .HasKey(x => new { x.CommandId, x.CategoryId });
            //modelBuilder.Entity<CommandsCategories>()
            //    .HasOne(x => x.Command)
            //    .WithMany(m => m.Categories)
            //    .HasForeignKey(x => x.CommandId);
            //modelBuilder.Entity<CommandsCategories>()
            //    .HasOne(x => x.Category)
            //    .WithMany(e => e.Commands)
            //    .HasForeignKey(x => x.CategoryId);
        }
        //}

    }
}