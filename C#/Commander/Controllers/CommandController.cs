using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Commander.Data;
using Commander.DTOs;
using Commander.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;



namespace Commander.Controllers
{
    [Route("api/commands")] // or api/[controller]
    [ApiController]
    public class CommandsController : ControllerBase
    {
        private readonly IApp _repository;
        private readonly IMapper _mapper;

        public CommandsController(IApp repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        //GET api/commands
        [HttpGet]
        public ActionResult<IEnumerable<CommandReadDTO>> GetAllCommands()
        {
            var commandItems = _repository.Command.GetAllCommands();

            commandItems.Select(i => _mapper.Map<CategoriesDTO>(i.Categories));
            if (commandItems != null)
                return Ok(_mapper.Map<IEnumerable<CommandReadDTO>>(commandItems));

            return NotFound();
        }

        //GET api/commands/{id}
        [HttpGet("{id}", Name = "GetCommandById")]
        public ActionResult<CommandReadDTO> GetCommandById(int id)
        {
            var commandItem = _repository.Command.GetCommandById(id);

            if (commandItem != null)
                return Ok(_mapper.Map<CommandReadDTO>(commandItem));

            return NotFound();
        }

        //POST api/command
        [HttpPost]
        public ActionResult<CommandReadDTO> PostCommand(CommandWriteDTO commandDTO)
        {
            var command = _mapper.Map<Command>(commandDTO);
            _repository.Command.PostCommand(command);
            if (_repository.SaveChanges())
                return CreatedAtRoute(nameof(GetCommandById), new { command.ComId }, _mapper.Map<CommandReadDTO>(command));
            return NotFound();
        }

        //PUT api/commands/{id}
        [HttpPut("{id}")]
        public ActionResult PutCommand(int id, CommandWriteDTO commandDTO)
        {
            var commandModelFromRepo = _repository.Command.GetCommandById(id);
            if (commandModelFromRepo == null)
                return NotFound();

            _mapper.Map(commandDTO, commandModelFromRepo);
            if (_repository.SaveChanges())
            {
                return NoContent();
            }
            return NotFound();


        }

        //PATCH api/commands/{id}
        [HttpPatch("{id}")]
        public ActionResult PatchCommand(int id, JsonPatchDocument<CommandWriteDTO> commandDTO)
        {
            var commandModelFromRepo = _repository.Command.GetCommandById(id);

            if (commandModelFromRepo == null)
            {
                return NotFound();
            }
            var commandToPatch = _mapper.Map<CommandWriteDTO>(commandModelFromRepo);

            commandDTO.ApplyTo(commandToPatch, ModelState);

            if (!TryValidateModel(commandToPatch))
            {
                return ValidationProblem(ModelState);
            }

            _mapper.Map(commandToPatch, commandModelFromRepo);
            if (_repository.SaveChanges())
            {
                return NoContent();
            }
            return NotFound();
        }
        //DELETE api/commands/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteCommand(int id)
        {
            var commandModelFromRepo = _repository.Command.GetCommandById(id);

            if (commandModelFromRepo == null)
            {
                return NotFound();
            }
            _repository.Command.DeleteCommand(commandModelFromRepo);


            if (_repository.SaveChanges())
            {
                return NoContent();
            }

            return NotFound();

        }

    }
}
