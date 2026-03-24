using DbModel.demoDb;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Mvc.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AutoTipoController : ControllerBase
    {
        private readonly _demoContext _context;

        public AutoTipoController(_demoContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            // Traemos la lista completa de Tipos de Auto (Sedán, SUV, etc.)
            var tipos = await _context.AutoTipo.ToListAsync();
            return Ok(tipos);
        }
    }
}