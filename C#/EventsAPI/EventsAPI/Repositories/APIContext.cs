using System;
using EventsAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace EventsAPI.Repositories
{
    public class APIContext : DbContext
    {
        public APIContext(DbContextOptions<APIContext> opt) : base(opt) { }

        public DbSet<UserModel> Users { get; set; }
        public DbSet<EventModel> Events { get; set; }
        public DbSet<CityModel> Cities { get; set; }
        public DbSet<TagModel> Tags { get; set; }
        public DbSet<VoivodeshipModel> Voivodeships { get; set; }
        public DbSet<CategoryModel> Categories { get; set; }
        public DbSet<EventsTagsModel> EventsTags { get; set; }
        public DbSet<EventsUsersModel> EventsUsers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EventsTagsModel>()
                .HasKey(e => new { e.EventId, e.TagId });

            modelBuilder.Entity<EventsUsersModel>()
                .HasKey(e => new { e.EventId, e.UserId});
        }

    }
}
