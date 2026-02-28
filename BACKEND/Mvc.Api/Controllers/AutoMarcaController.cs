using Microsoft.AspNetCore.Mvc;
using Mvc.Api.DbModel;
using Mvc.Bussnies;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mvc.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutoMarcaController : ControllerBase
    {
        private readonly IAutoMarcaBussnies _autoMarcaBussnies;

        public AutoMarcaController(IAutoMarcaBussnies autoMarcaBussnies)
        {
            _autoMarcaBussnies = autoMarcaBussnies;
        }

        // GET: api/AutoMarca
        [HttpGet]
        public async Task<ActionResult<List<AutoMarca>>> Get()
        {
            return await _autoMarcaBussnies.GetAllMarcas();
        }
    }
}