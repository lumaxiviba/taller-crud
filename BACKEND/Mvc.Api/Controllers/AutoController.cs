using Microsoft.AspNetCore.Mvc;
using Mvc.Api.DbModel; 
using Mvc.Bussnies; 
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutoController : ControllerBase
    {
        private readonly IAutoBussnies _autoBussnies;

        public AutoController(IAutoBussnies autoBussnies)
        {
            _autoBussnies = autoBussnies;
        }

        // GET: api/Auto
        [HttpGet]
        public async Task<ActionResult<List<Auto>>> Get()
        {
            return await _autoBussnies.GetAllAutos();
        }

        // GET: api/Auto/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Auto>> Get(int id)
        {
            return await _autoBussnies.GetAutoById(id);
        }

        // POST: api/Auto
        [HttpPost]
        public async Task<ActionResult<int>> Post([FromBody] Auto auto)
        {
            return await _autoBussnies.InsertAuto(auto);
        }

        // PUT: api/Auto
        [HttpPut]
        public async Task<ActionResult<bool>> Put([FromBody] Auto auto)
        {
            return await _autoBussnies.UpdateAuto(auto);
        }

        // DELETE: api/Auto/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<bool>> Delete(int id)
        {
            return await _autoBussnies.DeleteAuto(id);
        }
    }
}