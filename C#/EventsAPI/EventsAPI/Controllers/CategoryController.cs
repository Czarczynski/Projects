using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using EventsAPI.Dtos.Categories;
using EventsAPI.Interfaces;
using EventsAPI.Models;
using Microsoft.AspNetCore.Mvc;


namespace EventsAPI.Controllers
{
    [Route("api/categories")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly IApp _repository;
        private readonly IMapper _mapper;

        public CategoryController(IMapper mapper, IApp app)
        {
            _repository = app;
            _mapper = mapper;
        }

        // GET api/categories
        [HttpGet]
        public ActionResult<IEnumerable<CategoryModel>> GetAllEvents()
        {
            var categories = _repository.CategoryRepo.GetAllCategories();
            categories.Select(c => c.Events.Select(e => _mapper.Map<EventDTO>(e)));
            categories.Select(c => c.Events.Select(e=> _mapper.Map<UserDTO>(e.Host)));


            if (categories != null)
            {
                return Ok(_mapper.Map<IEnumerable<CategoryDTO>>(categories));
            }
            return NotFound();
        }
        // GET api/categories/5
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<CategoryModel>> GetCategoryById(int id)
        {
            var category = _repository.CategoryRepo.GetCategoryById(id);

            category.Events.Select(e => _mapper.Map<EventDTO>(e));
            category.Events.Select(e=> _mapper.Map<UserDTO>(e.Host));


            if (category != null)
            {
                return Ok(_mapper.Map<CategoryDTO>(category));
            }
            return NotFound();
        }


    }
}
