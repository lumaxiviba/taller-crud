using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;

namespace Mvc.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ErrorTestController : ControllerBase
    {
        [HttpGet("forzar")]
        public IActionResult ForzarError()
        {
            throw new Exception("¡Este es un error forzado para probar el Middleware de Xtreme Performance!");
        }
    }
}