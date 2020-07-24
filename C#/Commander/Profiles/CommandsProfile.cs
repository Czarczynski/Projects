using System;
using AutoMapper;
using Commander.DTOs;
using Commander.Models;

namespace Commanasdfsdfder.Profiles
{
    public class CommandsProfile : Profile
    {
        public CommandsProfile()
        {
            CreateMap<Command, CommandReadDTO>();
            CreateMap<CommandWriteDTO, Command>();
            CreateMap<Command, CommandWriteDTO>();
            CreateMap<Category, CategoryReadDTO>();
        }

    }
}

