using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EventsAPI.Dtos;
using EventsAPI.Dtos.Events;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace EventsAPI.Controllers
{
    [Route("api/events")]
    [ApiController]
    public class EventController : ControllerBase
    {

        private readonly IApp _repository;
        private readonly IMapper _mapper;

        public EventController(IApp app, IMapper mapper)
        {
            _repository = app;
            _mapper = mapper;
        }

        // GET api/events
        [HttpGet]
        public ActionResult<IEnumerable<EventModel>> GetAllEvents()
        {
            var events = _repository.EventRepo.GetAllEvents();
            events.Select(e => e.Users.Select(u => _mapper.Map<UserDTO>(u.User)));
            events.Select(e => _mapper.Map<UsersListDTO>(e.Users));
            events.Select(e => e.Tags.Select(t => _mapper.Map<TagDTO>(t.Tag)));
            events.Select(e => _mapper.Map<TagsListDTO>(e.Tags));
            events.Select(e => _mapper.Map<UserDTO>(e.Host));
            events.Select(e => _mapper.Map<CategoryDTO>(e.Category));


            if (events != null)
            {
                return Ok(_mapper.Map<IEnumerable<EventDTO>>(events));
            }
            return NotFound();
        }

        // GET api/events/5
        [HttpGet("{id}")]
        public ActionResult<UserModel> GetEventById(int id)
        {
            var events = _repository.EventRepo.GetEventById(id);

            events.Users.Select(u => _mapper.Map<UserDTO>(u.User));
            events.Users.Select(e => _mapper.Map<UsersListDTO>(e));
            events.Tags.Select(t => _mapper.Map<TagDTO>(t.Tag));
            events.Tags.Select(e => _mapper.Map<TagsListDTO>(e));
            _mapper.Map<UserDTO>(events.Host);
            _mapper.Map<CategoryDTO>(events.Category);


            if (events != null)
            {
                return Ok(_mapper.Map<EventDTO>(events));
            }
            return NotFound();
        }
    }
}