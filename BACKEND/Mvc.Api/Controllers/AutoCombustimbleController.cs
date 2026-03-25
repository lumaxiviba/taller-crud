using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DbModel.demoDb;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
namespace Mvc.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AutoCombustibleController : ControllerBase
    {
        private readonly _demoContext _context;

        public AutoCombustibleController(_demoContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var combustibles = await _context.AutoCombustible.ToListAsync();
            return Ok(combustibles);
        }
    }
}