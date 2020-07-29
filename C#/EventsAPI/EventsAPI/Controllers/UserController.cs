using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EventsAPI.Dtos.Users;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EventsAPI.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IApp _repository;
        private readonly IMapper _mapper;

        public UserController(IApp app, IMapper mapper)
        {
            _repository = app;
            _mapper = mapper;
        }

        // GET api/users
        [HttpGet]
        public ActionResult<IEnumerable<UserModel>> GetAllUsers()
        {
            var users = _repository.UserRepo.GetAllUsers();
            users.Select(u=>u.Events.Select(e => _mapper.Map<EventDTO>(e.Event)));
            users.Select(u => _mapper.Map<EventsListDTO>(u.Events));
            if (users != null)
            {
                return Ok(_mapper.Map<IEnumerable<UserDTO>>(users));
            }
            return NotFound();
        }

        // GET api/users/5
        [HttpGet("{id}")]
        public ActionResult<UserModel> GetUserById(int id)
        {
            var user = _repository.UserRepo.GetUserById(id);
            user.Events.Select(e => _mapper.Map<EventDTO>(e.Event));
            user.Events.Select(e => _mapper.Map<EventsListDTO>(e));

            if (user != null)
            {
                return Ok(_mapper.Map<UserDTO>(user));
            }
            return NotFound();
        }

    }
}