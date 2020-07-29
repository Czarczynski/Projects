using System;
using AutoMapper;
using EventsAPI.Dtos;
using EventsAPI.Models;

namespace EventsAPI.Profiles
{
    public class ProjectProfile : Profile
    {
        public ProjectProfile()
        {
            CreateMap<CategoryModel, CategoryDTO>();

            CreateMap<EventsUsersModel, Dtos.Users.EventsListDTO>();
            CreateMap<EventModel, Dtos.Users.EventDTO>();
            CreateMap<UserModel, Dtos.Users.UserDTO>();

            CreateMap<EventsUsersModel, Dtos.Events.UsersListDTO>();
            CreateMap<EventModel, Dtos.Events.EventDTO>();
            CreateMap<UserModel, Dtos.Events.UserDTO>();
            CreateMap<TagModel, Dtos.Events.TagDTO>();
            CreateMap<EventsTagsModel, Dtos.Events.TagsListDTO>();

            CreateMap<CategoryModel, Dtos.Categories.CategoryDTO>();
            CreateMap<EventModel, Dtos.Categories.EventDTO>();
            CreateMap<UserModel, Dtos.Categories.UserDTO>();

        }
    }
}
